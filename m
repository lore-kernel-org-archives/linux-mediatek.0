Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CFFC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 17:16:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E6160230
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 17:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11E6160230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkeOdT/jEPnBl058ug7cxWdc9b7KbPPc40upVbjx1l8=; b=TmOY8ZIUaxrcBY
	SJD3gAJBXGLcVLxi13idKN0Q5cxB8Q6ATtOocAklZusSOJnejf7weVEZ8ziMi0h/o68bcbBA1Kx8j
	Ubk81uN/V0WgRe7WiIu8es8vgykuCGvjQaZkxGnb8rWhmBJS55TwTr9VkWQNbl6JF9JDQtib5wAV1
	pgcL5DIeXQySn0ciliAB8DOXaNyXkngE5Vv2WyLCkNQWVDHwWKp3o9945xH16fgfUQFiLbYK1sqUb
	RbZeQwbh4veULV+GkJbVvjhyQ+zAmB0N947KxLnfNp+Hf4NlKYaGEFoDgh8KHaMG1M0LMgOfVBecZ
	hSDr3bXaN5ZW8i0IqYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAy1L-003nIz-CE; Tue, 03 Aug 2021 17:16:03 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAy1I-003nHc-8c; Tue, 03 Aug 2021 17:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1628010948;
 bh=dCJAv9vYWkTYWaiwSK/+b0SL2G2WQhBtdtJ5pV7ILXA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FdJ3+lq26JPK4sjOBdkQbQcMGS/IA0JWMonWIDr2iDhxqQjpZnzJmyB85za40bFA9
 WVtTmYE1Iqdy9xsvjurI7bj4sEnjg6p//hSY8M1jWF/0SLqlABJN2pCkkP0veZ0CMG
 2pJbespqfcCKuy1JV9rf7OfwcnpCFOfqC6d9KFN4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.158.209] ([217.61.158.209]) by web-mail.gmx.net
 (3c-app-gmx-bs54.server.lan [172.19.170.138]) (via HTTP); Tue, 3 Aug 2021
 19:15:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-0f9449b8-5114-46e5-9a4f-00b62155a938-1628010948338@3c-app-gmx-bs54>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-mediatek@lists.infradead.org, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sungbo
 Eo <mans0n@gorani.run>
Subject: Aw: [PATCH 0/2] Add MUSB for MT7623
Date: Tue, 3 Aug 2021 19:15:48 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210803151320.71531-1-mans0n@gorani.run>
References: <20210803151320.71531-1-mans0n@gorani.run>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+x7Po+to3M3ZmemoEJPeIaz/yToRmM77Y8roaUamiJB5bHZ9lcF8YCvW8QPjr6E1Y8xb1
 pvYshKflbK9f/JSMfAzqalhvzJBDx+Hex7cOF8IDdH1Py6xfEtzZRJqJZDd/qFW+YmkPUjwtE6OM
 5XVinLUdJkG8zB59VzQFU0Zt/gwYN1UuKBt2Vhm1+eX0ekpdLUdwb8+9drpdk0CpOSj5PNg7+dgW
 /st6ZkIeppKKLJxkDFZ7ToE/dKhlTE0Acc9UlhKNlAE+8+UF0e6Rl9HNSQpQQbNxm5h3U5Mffvdt
 1g=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fu8vFzkOtVI=:L1rPZNcoU/50dnRWKL4Wzt
 Hq6raVPuRSDGLAWdfqbq9DhWTYl5AZG/6lYejiG+K6oM/LnGrkICKDjDYVD5/+SZGUPvCEx6X
 wvwxccElGNQ0IMiCwc0N+0rrkCauPQn/ExFbSrAGAG1+glfN2Oegjgna/Riowq1DdPMpRwNYE
 v13UoIpvXXyI8Yz3udFp/Ac9DycAT1CekTnAXqp1b6SecrJ7RO9TFvMtgzAU3za1ZgeZ+gPl5
 lMDvbzDBxy9uG7g9JhdrLnZzc+Kg2bQ8wWms2xuiJu7/0YpG90xHr7hK2Xol3kmPeOk7VNcYU
 p+n8v3eXKDwGJ5+jwd2C6tF166Md03V1ef+a4t5tcjqHSCRSeuyvSUstvU5pOh9whdd5yAlYy
 nsYJZfQxBaIbsRjpwuX+palyzkGWlsE0w6M/iU0sK243wOQBvkDtaLxyLhlUTIJ4WBLDMN/uQ
 ItsJP7VGfk4t96OXRIbYld8hHC+lrWf8o/4Y2vRT0IxpURCFdkYNxGjNriO6DC53IbAwBlOAG
 hGQoNabU5xvgCNfc4xx6KbrGmE6ZWbUTXyIq0cO3SeezQhJUpK30dobkFx4B1MvM2kRtZH8FU
 RjaR+B2z7Qt+QvEC8KrCavWzWD2sBZRGUNFP03+1BflP9BFuQKBvncGbg7erLmVWuWfXmdGXY
 I7+HaVskRzPPRmSYic5ZW4+TszYEAGinlQzigTiXC4uqdZ82u9MGO6QUrLzaJpuXNsLomuOBb
 n8u8VOdQEcc7V9uH34O9Jj3xvZZl/R8PZ1TLg69EsG20iR3KVN0oP/ylEkNlbrPG5125njHdu
 1lEw87Qr2YxA1aJNyNTH0z2ve9GOfgwifTUPASwHjCIS4muLDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_101600_703342_CAF8249D 
X-CRM114-Status: GOOD (  16.51  )
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

Hi,

> Gesendet: Dienstag, 03. August 2021 um 17:13 Uhr
> Von: "Sungbo Eo" <mans0n@gorani.run>
> An: linux-mediatek@lists.infradead.org
> Cc: "Chunfeng Yun" <chunfeng.yun@mediatek.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring" <robh+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Min Guo" <min.guo@mediatek.com>, "Frank Wunderlich" <frank-w@public-files.de>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Sungbo Eo" <mans0n@gorani.run>
> Betreff: [PATCH 0/2] Add MUSB for MT7623
>
> These patches add support for the MUSB controller on Mediatek MT7623.
> Tested on Mercury RUSH-318AC Wi-Fi router.
>
> I got to know this from a BPI-R2 forum post [1], and managed to make it work on OpenWrt snapshot.
> I'd like to know if this also works on BPI-R2, I can happily share the details if needed.
> And I've just copy & pasted nodes from mt2701, please let me know if I missed some big differences between SoCs...
>
> [1] http://forum.banana-pi.org/t/bpi-r2-otg-port/10551

thanks for working on it. do both otg-roles (host/client) work on your device?

unfortunately at least host-mode does not work (do not know how to test client mode). i guess because iddig and vusb nodes are missing.

i took your Patchset and enabled the usb-node for bpi-r2.

+&usb3 {
+       status = "okay";
+};

and added these config-symbols:

+CONFIG_USB_CONN_GPIO=y
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_MEDIATEK=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_CONFIGFS=y
+#CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+#CONFIG_PHY_MTK_TPHY=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_MUSB_DUAL_ROLE=y
+CONFIG_USB_INVENTRA_DMA=y

btw. imho otg-node should be named usb0 as other dts (kernel 4.4) also use usb0, else i think it's confusing.

in my last attempt i had these below usb-node in boards devicetree:

+       usb_vbus: regulator@0 {
+               compatible = "regulator-fixed";
+               regulator-name = "usb_vbus";
+               regulator-min-microvolt = <5000000>;
+               regulator-max-microvolt = <5000000>;
+               gpio = <&pio 237 GPIO_ACTIVE_HIGH>;
+               enable-active-high;
+       };
+
+       connector{
+               compatible = "gpio-usb-b-connector", "usb-b-connector";
+               type = "micro";
+               id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
+               vbus-supply = <&usb_vbus>;
+       };

after adding these i see the connection of otg-cable with usb-stick in dmesg:

[   53.656304] usb-conn-gpio 11200000.usb:connector: repeated rot
[   53.696324] usb-conn-gpio 11200000.usb:connector: repeated role: host

but usb-stick is not powered (led of the stick is off) and of course i see no mass-storage device.

and now i'm back on the traceback on power down i've reported Author of musb driver some time ago

[  156.785185] WARNING: CPU: 0 PID: 1 at drivers/power/reset/mt6323-poweroff.c:4
[  156.795156] Unable to power off system

[  156.884496] [<c0cca1ec>] (warn_slowpath_fmt) from [<c090562c>] (mt6323_do_pw)
[  156.893203]  r8:c3296d40 r7:00000024 r6:0ccccb60 r5:c10fe3d8 r4:00000000
[  156.900030] [<c09054b0>] (mt6323_do_pwroff) from [<c010ba68>] (machine_power)
[  156.908558]  r8:fee1dead r7:c1312590 r6:92f61d00 r5:00000000 r4:4321fedc
[  156.915385] [<c010ba34>] (machine_power_off) from [<c01524bc>] (kernel_power)

i guess it's related to the usb_vbus.

regards Frank


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
