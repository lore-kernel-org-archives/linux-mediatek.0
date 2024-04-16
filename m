Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9D2C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8mIG+wlFBGpCQ9y2C8oUFWaNlcxAs+o+qIbY0ursuQ=; b=c5QHn0DDYLNgHeHNAPYUWkL96I
	mTnpT4WifhrtIH+zroHaNGDlFCjtoCnM3Wa8Rihs5xMrHQGpBpzFg5ocigqA7pzfFKwnjLLYDJm7A
	AzlZvLMUEDmGqLOEuoMNVbrR8w5LMoesAdig6UHgKH2Tu0shJ5FLQhRIfCbvOFJzuCxpH1+vvMHFr
	LAtK0f3/aGhLIjA8qkaCgC63fO7zIqC7YTi1o9sM6SqjQHUPdS9Y1BbhnlJeOnUm1s7UmnBBCLmd1
	vvYe9oz39Xy5SmGeMYeE5IhQIbtA0tig94vYKCgV3YJwC7Em3I3MZKcl1iopZXHjTojysuJzAuSJo
	PKuGnV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkSL-0000000CglT-0vwv;
	Tue, 16 Apr 2024 15:10:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkSH-0000000Cgku-3Xwz
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67883CE109C;
	Tue, 16 Apr 2024 15:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3678DC32783;
	Tue, 16 Apr 2024 15:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713280234;
	bh=nxyADXIj7ToWnQ3DESNbTFi4qaMN9HcWjTWckTpOI+8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B5XETTx+jZEk3gkreJ7pC22WS1SK698FAtRVMvhgxTEZyuXJjbbwv3CQ3jGTeblWC
	 2EX364Mqt8xlzTw9Nt4QAj0Y8U1uA8HGVGmXYYk65xTZS7pDfSSIq5b69y528blmGw
	 LKXyA0SL0QsjJrgWBTbaSPs9HlyRcwED63rwxmtNgxASVJBQHp2VegDJECUKJfmS3S
	 7GGXBsBfGqyjJod3s3mklhQbyGjEV3ZolqBGsOY2D6Y4tl+LZNxxc37pH8E2ktyLSK
	 dzV/KtQjFtbba3PlwOka1t41W0UEmQwZa7uNZE8nrnDJip8sOJeGuTc5tiqhePo8MA
	 BIk62PIjJ5T+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22ED5D4F15D;
	Tue, 16 Apr 2024 15:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Fix the patch for MT7920 the affected to
 MT7921
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <171328023414.16225.12939333659144302573.git-patchwork-notify@kernel.org>
Date: Tue, 16 Apr 2024 15:10:34 +0000
References: <20240415141922.25055-1-peter.tsao@mediatek.com>
In-Reply-To: <20240415141922.25055-1-peter.tsao@mediatek.com>
To: Peter Tsao <peter.tsao@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, deren.Wu@mediatek.com, chris.lu@mediatek.com,
 aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_081042_190213_3E8691D7 
X-CRM114-Status: UNSURE (   9.59  )
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

On Mon, 15 Apr 2024 22:19:22 +0800 you wrote:
> Because both MT7920 and MT7921 use the same chip ID.
> We use the 8th bit of fw_flavor to distingush MT7920.
> The original patch made a mistake to check whole fw_flavor,
> that makes the condition both true (dev_id == 0x7961 && fw_flavor),
> and makes MT7921 flow wrong.
> 
> In this patch, we correct the flow to get the 8th bit value for MT7920.
> And the patch is verified pass with both MT7920 and MT7921.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Fix the patch for MT7920 the affected to MT7921
    https://git.kernel.org/bluetooth/bluetooth-next/c/263296438807

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



