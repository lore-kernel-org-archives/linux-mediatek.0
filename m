Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F64FC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 08:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5751B60EE5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 08:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5751B60EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/5iDq2UWgZvJzgCLFJ2EPiBHfEUCWYl+rpWJ6oL6rk=; b=b/bzPrXzemYZxB
	ThbYJRltCokvN/2EWOby54ZQ/C/n1oaFrwzpa0/y+Q846jVrWfUjRTMx5f6svRDxH/3impFCCcMRe
	sAoPjlMz/5u/hekPuask2p4OOKrZMQ/RUHkoNk0krHOfE1OvsNtphXF25cwKOerTF1hndfPXT+mlT
	VhW7tmENHaRU3NEC6Mz2LdwEIpFfK1qdbIbVIkNJ8MMjZSIegv4876vndKq9EZ2L7sb+4JnDQlqg2
	3UNalmIPdFoW5qGXeAbN9nCPPfAOkczZkKX5jzibVmYXfOrqgPszXcXCT37PvgPMvxt3KDZtXbjO/
	SKYR1812DXIk3gvX7fEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBBzn-0055qG-DI; Wed, 04 Aug 2021 08:11:23 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBBzj-0055p1-UM; Wed, 04 Aug 2021 08:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1628064669;
 bh=YvEcXrHPBfYzp2tdYOHNvNnbANlyDTHvf2AxPW3et7M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Fy/Egp/3GARYqkIFltMKbJNDvxrQxAdZPd/FG+EPOeOPvcj5lDTc+2cyPjQ+rPcAh
 F+DRAdGc3p50UCEcZ84vi68k7TA2saYSj0wA0jf/pWtxOHfcLED1ILm3LKUvFlHQe+
 sJoNVLOemd4yH7Qax7tBT/ryvWmflmFxrIgLH+8s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.17] ([217.61.147.17]) by web-mail.gmx.net
 (3c-app-gmx-bap67.server.lan [172.19.172.67]) (via HTTP); Wed, 4 Aug 2021
 10:11:08 +0200
MIME-Version: 1.0
Message-ID: <trinity-8910c659-6e4e-4979-a6d0-eaf5b8bee213-1628064668849@3c-app-gmx-bap67>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-mediatek@lists.infradead.org, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re:  [PATCH 0/2] Add MUSB for MT7623
Date: Wed, 4 Aug 2021 10:11:08 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <f3607979-ea50-fc1c-0afe-a55881aa24f0@gorani.run>
References: <20210803151320.71531-1-mans0n@gorani.run>
 <trinity-0f9449b8-5114-46e5-9a4f-00b62155a938-1628010948338@3c-app-gmx-bs54>
 <f3607979-ea50-fc1c-0afe-a55881aa24f0@gorani.run>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:KDWodkr75906Bt6g62XmHQa9PoCrBrWNqNZQVvojYAf8r83q+NlJOQdWStEWgAwcp5Xsk
 UBrdYAoLIWiKBUNCkshM22OkDenDDKkXTdCGpNPHsRpT4Wx7NpCSfylBw3DGvsJI4iQBxUx3rFzg
 r5tr9NAliXV9Oz3JwDUN075FmTSILzA/ad/BSHs/OMYst7FzkqUB276NgPqNvZN4UtUbsXp71uhR
 cUGSp3BaI8LIYuB9lmspvlNrBFy6dCjcxg7VSUEUz63oilokVa9noH32eIIZ0jjs7CTnsx8PUGhj
 hY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:2BPuurnNY30=:oEguZKWjzcVKUemXYbFOBL
 qPt7dgNXyh4CiAnPe58jGKgbqpjJHmKk28h6ywQZiTkGw/2ijp0pXmY3Pd9BWnsNcODMOGcmW
 0+rkY3QRC7its2+Zh50j7bTrpvK5vu+mbqy334oM/S1rx9s/SMqRqkTFs16GwwSyAcaz17Ev1
 6K8Jkcy69W4GP/r7n9QtSinrHqqIY40ybdeVRYQVAa7w0qh+H7wwx9FEtd6X7+yUcGC6TryrX
 3qYLxMwyEz2svfG73RII2ks1B+7du3W8H+/66i50EBWSq3PJRaWoxSrh3Kqphpeduby2MfWqt
 7DiEDvbOKEQTzkqVLchJ3Aywuh1PPhLjTEMwAeTdsK4tjAM3NQqakUYWYITPpLTE2jfh5rR8e
 ovZmTOANBXXjFgFrJdLJznQvEaQ9rf4SmDel2dqrz57ODup77jFvX+F0BrxuU0wqANp2MYv5y
 ZtyzuyYRcGBkMCA0CfNSJ2xxDQRGEJ3chwGKAkNLVcs+HnfldVerRPecgj+RWQRptCoSsIWGD
 d5s2llHpqJrhGqrQM/Aq5jSihhW/6iARd/AwdW3tanMQQ6xksGpZIBqU8Aem/0B/dNOg5JuAF
 Nk64jvRBiF0/njrbEZsohO5rqb7nxWqX7bTV3+WMmfv7cxTElsURxCnLhpQ+tigo47vvKEbkW
 ATKEkpKzvu2k9ldzczf36Myc97SZVe07nMa6FoCnUSG4V/BQVfIQvTFSsAewqF7e2qWTQl3EX
 cROVamWwDr/Gt7pSJf7OdssHxUhfahXxi8Fy04IkvtkOvY5Rz8MAhRz/TnBhmZjLlvSo5zyVe
 o9TO4Xg4FX/pEc/f4+YrT/mtN36ZvBZFv3SqVaLjQrRUNjmp8k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_011120_325540_6CFE466C 
X-CRM114-Status: GOOD (  23.20  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Mittwoch, 04. August 2021 um 02:14 Uhr
> Von: "Sungbo Eo" <mans0n@gorani.run>

> > thanks for working on it. do both otg-roles (host/client) work on your device?
>
> Yes, I tested it with host mode and device mode.
> I also tried manual role-switch via sysfs and it worked with some prior setup.
> Note that my device has a USB Type-A connector and not micro B, so I can't help with id pin stuff...

> > but usb-stick is not powered (led of the stick is off) and of course i see no mass-storage device.
>
> I observed the same symptom (but different error log).
>
> [    2.722253] musb-hdrc musb-hdrc.1.auto: VBUS_ERROR in a_idle (80, <SessEnd), retry #0, port1 00000104
>
> In my case adding `regulator-always-on;` in the regulator node solved the problem temporarily.
> But after that I switched to relying on pinctrl.

i've found out that usb-stick is powered if i first connect otg-cable and then the stick to the cable...regulator always on does not change anything for me (only supporess "disabling vusb" message on boot). traceback on poweroff is still there.

role switch happen on inserting stick into cable, not before (insert cable into r2) as i expected.

need to figure out which CONFIG options i need to get USB-Stick as mass storage working.

i wonder why it works on your board without the vusb/connector subnodes

> +&pio {
> +       musb_pins: musb {
> +               pins-musb {
> +                       pinmux = <MT7623_PIN_237_EXT_SDIO2_FUNC_DRV_VBUS>;
> +               };
> +       };
> +};

imho it's the same gpio used for regulator, right? whats the difference?
i tried this instead of the regulator-node => not powered (cable first, then stick).

> +&usb3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&musb_pins>;
> +       status = "okay";
> +
> +       dr_mode = "host";
> +
> +       connector {
> +               compatible = "usb-a-connector";
> +       };
> +};
>
> root@OpenWrt:~# lsusb -t
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=, Driver=usb-storage, 480M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-mtk/1p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-mtk/1p, 480M
>
> I tested device mode with legacy CDC composite device module.
> You can also take more complicated configfs approach, though.
> https://elinux.org/images/e/ef/USB_Gadget_Configfs_API_0.pdf
>
> +       dr_mode = "host";
> -       dr_mode = "peripheral";
>
> root@OpenWrt:/# insmod g_cdc
> [   64.565254] using random self ethernet address
> [   64.569711] using random host ethernet address
> [   64.575966] usb0: HOST MAC 26:36:2d:e5:8f:6f
> [   64.580501] usb0: MAC 92:d7:f9:c7:88:01
> [   64.584409] g_cdc gadget: CDC Composite Gadget, version: King Kamehameha Day 2008
> [   64.592454] g_cdc gadget: g_cdc ready
>
> I also tried usb-role-switch,
>
> -       dr_mode = "host";
> +       usb-role-switch;
>
> After boot the initial mode of musb is "none", and it did not turn vbus on even if I set it to host mode.
> Later I found out that I need to load any gadget driver before setting it to host mode.
>
> # echo peripheral > /sys/devices/platform/11200000.usb/musb-hdrc.1.auto/mode
> # insmod g_cdc
> # echo host > /sys/devices/platform/11200000.usb/musb-hdrc.1.auto/mode
>
> That's all I know. Please let me know if I skipped some details.
> Thanks.
>
> >
> > and now i'm back on the traceback on power down i've reported Author of musb driver some time ago
> >
> > [  156.785185] WARNING: CPU: 0 PID: 1 at drivers/power/reset/mt6323-poweroff.c:4
> > [  156.795156] Unable to power off system
> >
> > [  156.884496] [<c0cca1ec>] (warn_slowpath_fmt) from [<c090562c>] (mt6323_do_pw)
> > [  156.893203]  r8:c3296d40 r7:00000024 r6:0ccccb60 r5:c10fe3d8 r4:00000000
> > [  156.900030] [<c09054b0>] (mt6323_do_pwroff) from [<c010ba68>] (machine_power)
> > [  156.908558]  r8:fee1dead r7:c1312590 r6:92f61d00 r5:00000000 r4:4321fedc
> > [  156.915385] [<c010ba34>] (machine_power_off) from [<c01524bc>] (kernel_power)
> >
> > i guess it's related to the usb_vbus.
> >
> > regards Frank
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
