Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34D3C3ABA3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 May 2025 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HboL1inph612c/117YiZElK3qjEwVJK9ilc054gg7/s=; b=O73iqAddjrtqgOt2XbmNte0AGC
	5YTOw9ofTHd9xOuO2mmsn/b9Ai1wgc/ecINgh1k1fZaHERGEHW/vWJ4JWvXciyCipiL36wAeznXAs
	xoHgYqtPtJTAOqogqCmLYrnajE9d3DXmvLEWrSlyOLHN8euEUWf0BeM45b+D03uSQMtR7iyL26Iis
	nle+Q3P9s8W0zExh+4WJ1DVJ+BplZfNhJvlDk46ty5eytuLzCgjWHDcuFoS9v3DfaSlB2bgh7eN0G
	GxDT/mMn4bJH1QJaePR3/TwmCwQa9dK0MTXREuT/NQMFTFH4EAYnPmgn+L0jQUvo+jOS218hdtBxZ
	HpbGShhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZLg-0000000GSgU-3fjF;
	Thu, 01 May 2025 19:13:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZI6-0000000GSKP-1XZE
	for linux-mediatek@lists.infradead.org;
	Thu, 01 May 2025 19:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8252F68443;
	Thu,  1 May 2025 19:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3F8C4CEE3;
	Thu,  1 May 2025 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746126589;
	bh=w5oQGsL5WVbxAnOLzbr4QxMJ0KAY+AvOJhyFU9NztRs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TV04T+3ZCAfB/UqTFExArQJ7o8xyrRomHxpy8WMkw5I7VbO9aBYp4SRpRSvZBfr9r
	 cAqR8IdWhQ1oywXI0Bb/EXZFVijKhnbglCiFAmKz4JJeOnO/Z/qfyLScOZfJtf1+HW
	 jCRUohUUx3dtzbJ0dR0iy+PY09slNgGdSpOtsMzpoEC78Ocf/GqTQTDYzljBfWaAJJ
	 CRdllFluIyFSZ0rKK8YICn2V/gJymgUNVwFbYve7ucHu4spzpmqutOp9l5eamTbVU0
	 NtsG902OSLPY6EoodGMzOAhX7Z+5BG57AglvkjETPJR3wKa1MuBj13vZVsuL8znq97
	 34Tp75blb+bVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BD13822D59;
	Thu,  1 May 2025 19:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: btusb: Add new VID/PID 13d3/3630 for MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <174612662826.3052720.2548130502833643921.git-patchwork-notify@kernel.org>
Date: Thu, 01 May 2025 19:10:28 +0000
References: <20250429101605.2862004-1-jiande.lu@mediatek.com>
In-Reply-To: <20250429101605.2862004-1-jiande.lu@mediatek.com>
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, will-cy.lee@mediatek.com,
 ss.wu@mediatek.com, steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 29 Apr 2025 18:16:05 +0800 you wrote:
> Add VID 13d3 & PID 3630 for MediaTek MT7925 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> T:  Bus=07 Lev=01 Prnt=01 Port=10 Cnt=02 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=13d3 ProdID=3630 Rev= 1.00
> S:  Manufacturer=MediaTek Inc.
> S:  Product=Wireless_Device
> S:  SerialNumber=000000000
> C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
> A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
> E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
> I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
> E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: btusb: Add new VID/PID 13d3/3630 for MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/c03e896217f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



