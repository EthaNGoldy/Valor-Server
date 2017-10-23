package kabam.rotmg.sorForge {
import kabam.rotmg.raidLauncher.*;

import com.company.assembleegameclient.game.AGameSprite;
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.MouseEvent;
import kabam.lib.net.api.MessageProvider;
import kabam.lib.net.impl.SocketServer;
import kabam.rotmg.chat.model.ChatMessage;
import kabam.rotmg.dialogs.control.CloseDialogsSignal;
import kabam.rotmg.dialogs.control.OpenDialogNoModalSignal;
import kabam.rotmg.game.signals.AddTextLineSignal;
import kabam.rotmg.messaging.impl.GameServerConnection;
import kabam.rotmg.messaging.impl.outgoing.LaunchRaid;
import kabam.rotmg.questrewards.components.ModalItemSlot;
import org.swiftsuspenders.Injector;
import kabam.rotmg.messaging.impl.data.SlotObjectData;
import robotlegs.bender.bundles.mvcs.Mediator;

public class SorForgeMediator extends Mediator {


    [Inject]
    public var injector:Injector;
    [Inject]
    public var closeDialogs:CloseDialogsSignal;
    [Inject]
    public var socketServer:SocketServer;
    [Inject]
    public var messages:MessageProvider;
    [Inject]
    public var view:RaidLauncherModal;
    [Inject]
    public var gameSprite:AGameSprite;
    [Inject]
    public var openNoModalDialog:OpenDialogNoModalSignal;
    [Inject]
    public var addTextLine:AddTextLineSignal;



    override public function initialize():void {
        this.view.launchButton.addEventListener(MouseEvent.CLICK, this.onButtonLaunch);
    }

    override public function destroy():void {
        super.destroy();
    }

    protected function onButtonLaunch(_arg_1:MouseEvent):void {
        var _local_1:LaunchRaid;
        _local_1 = (this.messages.require(GameServerConnection.LAUNCH_RAID) as LaunchRaid);
        _local_1.raidId_ = 1;
        _local_1.ultra_ = this.view.ultraCheckbox.isChecked();
        this.socketServer.sendMessage(_local_1);
    }


}
}//package kabam.rotmg.pets.view.components
