Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ABAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxX5+GAYJehlR5WtKbHGYDZPfYdgMVGee1DuVxhdJMM=; b=L65oFrqQfruNIG
	bXlvoh+ZvHInDaeEx8o2gMdH2nKZnt0QHcd40YFzBYCBk0RVwl/DHzRvmni/QPq2y+MWLNl32UATq
	K4CTXueJuXSxpp/dIey3pruV3/g8JSohxMi7GeP5PuFZYbJTFe403yMOHDTBemmwnK/syRV3FeUsx
	/5VVA/7lxtV/dqvMmJ2R3RZeuvAtz77w7BtSDvVM5psjgcY+Wx2sd9tWRIwV2xkKDmce0wByr3U5A
	BRJV6cQyvxJ6rxrrOcUIOQBpkeEtUBuS+Uu2b9Meie3lSUC7AQwoRAANKpQMae8bw+GthiPfEgm1s
	kp5S7PXCHfLCWPGx8EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwn5Y-003i3p-HX; Thu, 02 Jun 2022 15:50:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwn5W-003i2w-2P
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 15:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A205C61244;
	Thu,  2 Jun 2022 15:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A250C3411A;
	Thu,  2 Jun 2022 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654185013;
	bh=3IcmI6aTuTaZ9jT8NsJcigQPndxrKj7HswxoA95i+34=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LodZVhqVBaO0Y9KZXYE+Gsj34bPo+ScTnpLKOMXipjuB+ygTgs0si4KFi0Yv4MHuI
	 nJj9tlHJJrakJQrL+YBnZ0gjxoUGpPKj8k50ucUK35Fyq8Qfnt/qo9SHd6B08PgUt1
	 wBdY7w+KFZzmP41m9Bt3mxr+HN7iXGHIHbdBkuUNimtAaLgGeHU9ZMNMkEMwydwa8P
	 S7Y46o6MneFOas6n5tdhTxDD/WV7xdh6EGRgdFpu8pkqu4kA4ZQXiU5AZ5hBkRYK7p
	 iGFTdXqtKeoKCufD8YyVcKa/P/LOMABnF9T3G9W3E55qtMwDrGS1ve3GOBX9VmOCol
	 6npDQBujhdEDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDA51F0394F;
	Thu,  2 Jun 2022 15:50:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Bluetooth: btusb: Add support of IMC Networks PID 0x3568
From: patchwork-bot+bluetooth@kernel.org
Message-Id:  <165418501290.10758.3267160679920762449.git-patchwork-notify@kernel.org>
Date: Thu, 02 Jun 2022 15:50:12 +0000
References: <20220602092822.953521-1-aaron.ma@canonical.com>
In-Reply-To: <20220602092822.953521-1-aaron.ma@canonical.com>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, luiz.dentz@gmail.com, johan.hedberg@gmail.com,
 marcel@holtmann.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_085018_190301_F088FAEE 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Marcel Holtmann <marcel@holtmann.org>:

On Thu,  2 Jun 2022 17:28:22 +0800 you wrote:
> It is 13d3:3568 for MediaTek MT7922 USB Bluetooth chip.
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=480 MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=13d3 ProdID=3568 Rev=01.00
> S:  Manufacturer=MediaTek Inc.
> S:  Product=Wireless_Device
> S:  SerialNumber=...
> C:  #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
> I:  If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
> E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add support of IMC Networks PID 0x3568
    https://git.kernel.org/bluetooth/bluetooth-next/c/d60ea31cb434

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
