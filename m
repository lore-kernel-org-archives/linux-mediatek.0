Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3356FC4708E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2vYyMfyM6jX6/g1W/VcDRX5gPILrkiFyfgJSUm6rgE=; b=tEBoSwKYbIxBex5rQ6ICgk275X
	4xYY4mz1R8d76mqnxgG0bT5Gsgy3EI9WWJu8OVrQeRVugDGjU4qEI2TmYwtH3FVFd6Aahs5zJewKl
	of61ncmGXXKpO3eiLxNaOxQOEGzxTX3DLCNvsWZA8pPSVkai0NTym11Wdh1LGxK0qQi7QgpZ6LRJb
	LJRpkvbwdp+iaP/1fuZkxHC8MUgEk7KBNF4h94yzjzWZkXROpE4qoV7mmxnmwroFXR9mk/CHuQoWr
	07aBg3lJGWFhgLZk4QcC7gF1qj18LdOpyBQMiZ/Ku5yjf0DQ4xVrCXOrZDba3O8lKAbNt85QMVdYA
	Gj55JUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpyQ-005UJK-Ev; Tue, 03 Jan 2023 22:41:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpxD-005Tvz-8d; Tue, 03 Jan 2023 22:40:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D75C061538;
	Tue,  3 Jan 2023 22:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45E97C43392;
	Tue,  3 Jan 2023 22:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672785617;
	bh=Hy2eaSHJ7J2zC7XsHloSbhX5fiCeUzgDRNH8GWrVzBo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kdv6zoK8FKOpimfXXG54bXrGQzHkT0L6A9zWIXGLktQOSRGfznbDfkfxMNOm5HZPT
	 qD0lTNsq0C1bXVLKY+UD7i/5OcxHp6ajIsHGlsx/gFe/WZJhrh6z3jHrHV3nlOxf8k
	 dhFUkKnBlFFpPWz9pr1UfeSOgovKCTAKfL+gJoC3jSxJJlplYermJoIrjxXA6npVVR
	 vL7Ed0aYiwdLzfExjNx26xQLE8VKmgcvE3peBJwVfL+n+2ucM1lu4ukKQnR2TEVtJ4
	 vN4RFQTj1wmPGzgNbiy/+pfkLxlQFLM83zljIlhzvxwJiUAt7QSHCZeNGnskGUqxcm
	 glFmgtebiVSEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30F1CE5724F;
	Tue,  3 Jan 2023 22:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add new PID/VID 0489:e0f2 for MT7921
From: patchwork-bot+bluetooth@kernel.org
Message-Id:  <167278561719.24920.2698221237471540145.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jan 2023 22:40:17 +0000
References: <20221215021854.1429-1-mario.limonciello@amd.com>
In-Reply-To: <20221215021854.1429-1-mario.limonciello@amd.com>
To: Mario Limonciello <Mario.Limonciello@amd.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 matthias.bgg@gmail.com, mario.limonciello@amd.com, sean.wang@mediatek.com,
 anson.tsao@amd.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_144019_434142_D23515D9 
X-CRM114-Status: UNSURE (   9.67  )
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 14 Dec 2022 20:18:54 -0600 you wrote:
> This bluetooth device is found in a combo WLAN/BT card
> for a MediaTek 7921e.
> 
> The device information:
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=0489 ProdID=e0f2 Rev= 1.00
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
  - Bluetooth: btusb: Add new PID/VID 0489:e0f2 for MT7921
    https://git.kernel.org/bluetooth/bluetooth-next/c/ad230933bec9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



