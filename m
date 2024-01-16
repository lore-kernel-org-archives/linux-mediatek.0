Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85A1C47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Rrf1fxb70Gr9p8ajyV2P0qTu+donro7enOc5GGL3Zg=; b=JLuWc58zbaQDEIOwL4NckxRfg+
	aLJMD7c6UyNr332eDbCvVPmwz6ACu13SxcktRpklLSGKkSfszVOc7tZgATZ0XOSMHFfBWtM0jviyB
	UwrIZJSM5pC9HhQYqXjk29AWNiPUborb9Liks2EUMcGvllJ35Kw13z9wxIknR7xXHganv6+U/HTMb
	UYQXBndIl0aHTAGM/rKguWDeG1BL5x8QM1VJ70+odZiDmZGI9cn9jX7V5hNkJ3SAwZrtnlHn1d3Tr
	dPsbjLtFRuK0+ftWQeat53j4UsWHqNWJqwD/Kz3M4CFJxHtonlqJcxEGhvx/GIDpuypPRWfOGjaM9
	W5LqpUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlsB-00CWm0-0E;
	Tue, 16 Jan 2024 16:01:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPls4-00CWjO-37
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jan 2024 16:01:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF236612A4;
	Tue, 16 Jan 2024 16:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C670C433B1;
	Tue, 16 Jan 2024 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705420829;
	bh=VR0zelLUhCaJCX6Q+iJZSRg5efDI4Ll3fVjKY9C1snQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aJTgUX3e6/A0yIlhhnIzOStguN5+R3jHPTRwWftJgervl+iM1z2yHGabqqGT1j2Mv
	 2P6SmQjA051ZSnNdrioIU3vevkkKIgEqy/iCojZ9L5Rkp/Yhbt5PvPK1Do2f1IbNNS
	 flX5Iu78NYp86thTPRzU55uTeEq6IG6mwgxGGV7WrSSavmlyXsrJGJsJgwbRBQdRBz
	 PcZ9A36paB2fGPTblj4Dz0KZdVL+jID2szHxSPqqweV1ipt6CURIHcTbn4KKDFUX+O
	 76XDwNwpk6qIW0b1aKfvKWiD8Tyj5MoEG6v923rtEb3My7HNZmYGPk66BSYhoBI7w0
	 Q2ZaYsB0+3COg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53407D8C987;
	Tue, 16 Jan 2024 16:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add new VID/PID 13d3/3602 for MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <170542082933.25552.3927828232982053152.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jan 2024 16:00:29 +0000
References: <800469f157c862bcdef7213793004d2de977791f.1705129502.git.deren.wu@mediatek.com>
In-Reply-To: <800469f157c862bcdef7213793004d2de977791f.1705129502.git.deren.wu@mediatek.com>
To: =?utf-8?b?RGVyZW4gV3UgKOatpuW+t+S7gSkgPERlcmVuLld1QG1lZGlhdGVrLmNvbT4=?=@ci.codeaurora.org
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, aaron.hou@mediatek.com,
 steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulrik@strid.tech, deren.wu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_080101_067772_3732A97D 
X-CRM114-Status: UNSURE (   7.37  )
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

On Sat, 13 Jan 2024 15:27:38 +0800 you wrote:
> From: Ulrik Strid <ulrik@strid.tech>
> 
> Add VID 13d3 & PID 3602 for MediaTek MT7925 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add new VID/PID 13d3/3602 for MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/eaab5c300eab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



