Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE98C61DF4
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=43iqpWsQOIvUj4idO/6jD2I4/VKJLSuA11XDlQSzX2g=; b=bMrCD2aeYzbsAIKH5HtwzWbWRI
	SAGnEynSZFN8x0JLf42xqbcVW4oKtNT6kEbYAgY9HzBQF723msZIpg1zm4YoVITFPNEd3jwjtHT90
	b5493wFDIFokjRsBdR5LXFRjLgqxVjU9Qqk9nmmww42vSL85Csm69PIxts/K4xnGKrJd1KDtv0Wni
	IWYlX2ORl/fPuk8KMnqltx5uR7BVFIs97Tj//1mFIZXo15RAuCqE6a1rTsnhZ1U6HXsYyGJ+BVxXA
	cIBUh88wekenIy3BNt6D93GSjuOq12mZrf7vw9Ga+8mlEm5FbeccKmz1csnZrVMlStir5uqz8+YUc
	2MZjmwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6sKa-009Gab-1x;
	Sat, 25 Nov 2023 13:04:20 +0000
Received: from mail-40137.protonmail.ch ([185.70.40.137])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6sKX-009Ga1-2M
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Nov 2023 13:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1700917452; x=1701176652;
	bh=43iqpWsQOIvUj4idO/6jD2I4/VKJLSuA11XDlQSzX2g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zlk0cw4OPc+Zc80S+sBy1obAJ+u+qBnyIwAVzuvZjQr9cuEtY2bHiznhesoAFJUt3
	 lt4PGu5kvoJw8MBwykRHqqCLlBtaeuSEaRPPiIa8RdD9nFFK138U9vW+oXt8e71gg6
	 B9pCefKxZOx1OzRGJEO/SVOMcO1h56K0A3LrxHn7rabmGTJdzLKtDq0n5D8EYm+Nfs
	 /c3wZTes8y1Jh3p0T/vgMavPGvSSYs2hs13k2EX68OIPJCCMptSERsdzcPV7laPCUU
	 XPBsCPgXfNpLkUVml9apYUwg/J+vWhPuKuOdBwWTy9SSgDKQ1M9KBNl1nmkWHwFlci
	 VEO0OVoJBb1fA==
Date: Sat, 25 Nov 2023 13:03:45 +0000
To: "kuba@kernel.org" <kuba@kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "cristian_ci@protonmail.com" <cristian_ci@protonmail.com>
Subject: [BUG] wireless: mt7601u: probe failed with error -110
Message-ID: <Bnwq2et4CBU1_MS8X3rFeejMDmKf2dr_BNq60IzBcGKbjTxHG1CjJ0zB_wZjn8_iLJsi7fCx6_Eh01ozYBqPA-cEZXMZE_X98E0b7yotXCg=@protonmail.com>
Feedback-ID: 27475468:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_050417_955527_1FA051A9 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, this mt7601u device attempts continuously to probe spamming the followi=
ng lines to dmesg output:

[   99.604249] usb 1-2: new high-speed USB device number 7 using xhci_hcd
[   99.758083] usb 1-2: New USB device found, idVendor=3D148f, idProduct=3D=
7601, bcdDevice=3D 0.00
[   99.758098] usb 1-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   99.758104] usb 1-2: Product: 802.11 n WLAN
[   99.758109] usb 1-2: Manufacturer: MediaTek
[   99.758114] usb 1-2: SerialNumber: 1.0
[   99.880644] usb 1-2: reset high-speed USB device number 7 using xhci_hcd
[  100.025562] mt7601u 1-2:1.0: ASIC revision: 76010001 MAC revision: 76010=
500
[  100.029499] mt7601u 1-2:1.0: Firmware Version: 0.1.00 Build: 7640 Build =
time: 201302052146____
[  100.455461] mt7601u 1-2:1.0: EEPROM ver:0d fae:00
[  100.645586] mt7601u 1-2:1.0: Error: MCU resp urb failed:-71
[  100.645610] mt7601u 1-2:1.0: Error: MCU resp evt:0 seq:5-4!
[  100.645678] mt7601u 1-2:1.0: Error: MCU resp urb failed:-71
[  100.645697] mt7601u 1-2:1.0: Error: MCU resp evt:0 seq:5-4!
[  100.645774] mt7601u 1-2:1.0: Error: MCU resp urb failed:-71
[  100.645816] mt7601u 1-2:1.0: Error: MCU resp evt:0 seq:5-4!
[  100.645920] mt7601u 1-2:1.0: Error: MCU resp urb failed:-71
[  100.645926] mt7601u 1-2:1.0: Error: MCU resp evt:0 seq:5-4!
[  100.646026] mt7601u 1-2:1.0: Error: MCU resp urb failed:-71
[  100.646031] mt7601u 1-2:1.0: Error: MCU resp evt:0 seq:5-4!
[  100.646036] mt7601u 1-2:1.0: Error: mt7601u_mcu_wait_resp timed out
[  100.784270] mt7601u 1-2:1.0: Vendor request req:07 off:0080 failed:-71
[  100.917572] mt7601u 1-2:1.0: Vendor request req:02 off:0080 failed:-71
[  101.057650] mt7601u 1-2:1.0: Vendor request req:02 off:0080 failed:-71
[  101.057737] mt7601u: probe of 1-2:1.0 failed with error -110
[  101.058197] usb 1-2: USB disconnect, device number 7
[  101.313690] usb 1-2: new high-speed USB device number 8 using xhci_hcd

I'm not the only one to have experienced this bug. I've been suggested to r=
eport that to kernel mailing list by linux support channels.

I've tested this bug against upstream 6.6.2 kernel tarball from the latest =
stable branch [1].

To solve this issue. I've also tried to patch mt7601u driver disabling mcu =
calibration. Which doesn't seem a wise idea because apparently it fixes pro=
bing but also hangs completely the machine after some seconds (so, it needs=
 a hard/forced shutdown).

Thanks in advance,

Regards,

Cristian.

[1] https://www.kernel.org/

