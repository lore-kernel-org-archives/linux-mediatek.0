Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FF3C761AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOAA9ZkxzHphL4CfbBmzX2YrNd0KbOGa9iHzjcturxo=; b=FvhYbd5s6nMzjcZY5FEfxmHEDo
	UNDkk1yZm3H03wX1LZlvEAjMmA/2QttC73Bk+CPTgbT8C/Kelp+TpzqLnFb3P8tBGs1IZHi9HMSJq
	NT7JDytJDRmsSTSYYYyChQ4ocRkR7vkzFzfej1xQ/ttpKjAv5AjfUvWvnjlusJGoYzJ9k9b99Ack8
	6LRnuMd2SI23KnUk8oV7QSLsptZLbD/MVW0er3kO5FIEOX8MGZ+oNWObJVzalsDKxv2kmJufCg0CI
	lJByRPjix6wAtxg/pJFR6fY1VbGmftGjrVsO56bxrLRLVy5c/ROvEyzTkWQtDRmIGznmEUKKZPulU
	5qoPyhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOwi-00GD1e-0E;
	Mon, 03 Apr 2023 18:30:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOwe-00GCzm-0j;
	Mon, 03 Apr 2023 18:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E137618F8;
	Mon,  3 Apr 2023 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B09D3C433EF;
	Mon,  3 Apr 2023 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680546618;
	bh=4LH6DmsLQfzTs2kOVQRO7644p9IgdG5cgEpOhmSGjRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oTD81naPwuSaro0Hvwrg1IJXSP2u1sMcvRGBbpwv1mhhjeLHp8blQZXsylbgYrivI
	 EKX6thdKaKqSgGE+n4dRucWLN0dolTkLXBOrqjvvbF+HTYqBOyrJpmVFbvYW66JXOP
	 IlPVsGGNuAzWG7sCBXrkR5zXRb/Qlt63kJQYwh0BN047YVIfVaE/vN62vfohT/Bgu7
	 4GgUC+ajo7U6v3xFW6C+RjZWNzqO4Y8wnQp1HXibjmjXVngYTESZKPDTXaI5sQ/fGx
	 DM3rPUFuPQnUwUeAoPFxRhZ7SJ3A7gMH+Vca3HV+VKw2MnnJ5V2rVyovqTjUf9MDg/
	 9hOgwRKrnAicQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93268E5EA86;
	Mon,  3 Apr 2023 18:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix iostat lock protection
From: patchwork-bot+f2fs@kernel.org
Message-Id:  <168054661859.14597.6329451701329861497.git-patchwork-notify@kernel.org>
Date: Mon, 03 Apr 2023 18:30:18 +0000
References: <20230331092658.72386-1-bo.ye@mediatek.com>
In-Reply-To: <20230331092658.72386-1-bo.ye@mediatek.com>
To: Bo Ye <bo.ye@mediatek.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, qilin.tan@mediatek.com,
 yongdong.zhang@mediatek.com, linux-kernel@vger.kernel.org,
 light.hsieh@mediatek.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mediatek@lists.infradead.org, browse.zhang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, peng.zhou@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_113020_321757_341D59AA 
X-CRM114-Status: UNSURE (   8.33  )
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 31 Mar 2023 17:26:56 +0800 you wrote:
> From: Qilin Tan <qilin.tan@mediatek.com>
> 
> Made iostat lock irq safe to avoid potentinal deadlock.
> 
> Deadlock scenario:
> f2fs_attr_store
>   -> f2fs_sbi_store
>   -> _sbi_store
>   -> spin_lock(sbi->iostat_lock)
>     <interrupt request>
>     -> scsi_end_request
>     -> bio_endio
>     -> f2fs_dio_read_end_io
>     -> f2fs_update_iostat
>     -> spin_lock_irqsave(sbi->iostat_lock)  ===> Dead lock here
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix iostat lock protection
    https://git.kernel.org/jaegeuk/f2fs/c/daa080db4e7e
  - [f2fs-dev,2/2] f2fs: add __pack attribute for extent_info
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



