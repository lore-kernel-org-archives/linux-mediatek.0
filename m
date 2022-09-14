Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB78C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUat9zmWtc/SExw0CTfPcvF0IrABs9S4MYPQ8ZBJDLs=; b=eqAK/1nwfeBWdaUR4yJYN2/dsH
	KnWxpzn8k29h8WC+gxNvk2y616EZOasQ2kU4YqAPI0eiVDoaV1zfKRdTZdlZrHGxOP5874nK6VcNv
	on7CE5XGUo5Pmn5yrs5v4EwRhv5+ICDeshaEkh0/NgYo+TfoRPfDMjlx94/woYGGKpM/Du6idIDX0
	j55+EGNuuCMbAQ9wQGQFAx8CSE1486tFytuFp1jVtgCklWg9LIjKfJXBo/bQqUGkGUvTs18XX2C+E
	2vwH8RM0YS7q/RXoB1uGaat6lHhaFGqtc03DYUSxh0lJlm+yCZq1pzAuHsgCETXYxrYv6a1tzABnB
	cLQfqNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYiC-008w3W-Jh; Wed, 14 Sep 2022 20:10:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYi9-008w1o-Sd
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 20:10:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC95361EDE;
	Wed, 14 Sep 2022 20:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D684CC43470;
	Wed, 14 Sep 2022 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663186215;
	bh=9OZMr1n0GHCTt6IZXGKGKdtXKIOUSGIvPn8gy1kQ/4g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VyXdUxzSiZcu1aDdrbdILLiW+n0b09Ni8LMynwA1wpv0ONBrsA4s9mM+S57Q2IdbF
	 ggADrY0MriiV2lHFHy3uZUdT8w22t6XPEi8B7ryGAVFXIZTM8l9uvNAUVU0mcXQNMn
	 wzBMKc6AoKxTP2LWWhRnt30hB2ZXK01s0pRAD5OIdWGMiftX+gpHscsQRnuMkfA8BB
	 DdP9/pO1OZ0jgIm5hvO66XTA5DWQYNNnY4K1JJEyS17D3pEMkzHOhJH5mwnlFdhyuy
	 BcPXwP/++I63LIIgDn1h0ZwVAiHgFnBxxkb8M0cZwvm84awznJVRyIEmKXYB4amZ7q
	 X/MJ/FWvB2lbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB342C73FF2;
	Wed, 14 Sep 2022 20:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add a new PID/VID 13d3/3583 for MT7921
From: patchwork-bot+bluetooth@kernel.org
Message-Id:  <166318621576.18930.954047185528748078.git-patchwork-notify@kernel.org>
Date: Wed, 14 Sep 2022 20:10:15 +0000
References: <cec2ae0d86aa633f3a6666e3812c1c05ab9a0d03.1661921257.git.objelf@gmail.com>
In-Reply-To: <cec2ae0d86aa633f3a6666e3812c1c05ab9a0d03.1661921257.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_131017_998150_69490589 
X-CRM114-Status: UNSURE (   9.50  )
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

On Wed, 31 Aug 2022 12:53:28 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add VID 13D3 & PID 3583 for MediaTek MT7921 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add a new PID/VID 13d3/3583 for MT7921
    https://git.kernel.org/bluetooth/bluetooth-next/c/f0ad26ee822b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



