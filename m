Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B71EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 03:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSC7fYUCx5PfCiKAqMgV1TPzlXcWPV9mDFeop7LcdFM=; b=AtOfNGHdr8T1JJ
	w+i0kI82OXvtnqQ1ODwnzPeli/Gz2WdaW1TWRFN4JAIgK+elDvkWqBvYgg54lJyHY/sSV77O/HnyP
	9vkk6lroTY+ZW1KLu0x/kvHn4GNeU/Z+1ncNhZvTRlTaRrdZhoNIzv7Ljeh0+pscV0NgcSgOvnykM
	RS/mzyINaF1x411ny431y/UEsFIQw01XeT1/NdOvl4kRqRTG2kI+1SN/jRBW8/URtWAVkRabIX6PQ
	9me3LZdCfUhL1uhI/Roe02Z7z81SqGKdkltEmuRWCS3xZlF4R4on1iy5Kt4nDBErxfHAeFbDuPwRA
	feRV//kdkYwRda7Pn+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9Bl-00Fy02-37; Thu, 09 Jun 2022 03:50:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9BX-00FxuA-G2; Thu, 09 Jun 2022 03:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86D0C61C32;
	Thu,  9 Jun 2022 03:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFB25C34115;
	Thu,  9 Jun 2022 03:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654746612;
	bh=fFZmJ6RX445T/UbDv09I1P7giPriqSfKBoZ4d+EjFvM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VVbOUlxRb15927m30PHJ3obRhNGxrbNpvz+ocoQTtAqCfE+UcUUpzfKfm8ZpqtsU8
	 /RjPJ4dd/paQcbZyhTBYaHk9K0DBBz7yQmHHxndRA41+KQt/8kfnH7RHXgZ+I3RnCC
	 vF8pX/NvQPy59/EmNwcVrINQPbrwOAJryxPflOqjXoU2xd0+mNw5E8yrZaQGdpAFoc
	 +3dbF/zjY2hm1KXiUP7eMMz4xVrNzWaB7aBT6CB1N410oDLY/fl+uyzEMj/CoIDPef
	 0F9CtABRwup/nn2YV9IdK9hwpjotoP3GiqoTXyPwrHbak4LbAjco7v2mQnkkdePqUC
	 3G2RgLABWpJpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7009E737FE;
	Thu,  9 Jun 2022 03:50:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165474661281.23506.13629631597684739850.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jun 2022 03:50:12 +0000
References: <1654692413-2598-1-git-send-email-chen45464546@163.com>
In-Reply-To: <1654692413-2598-1-git-send-email-chen45464546@163.com>
To: Chen Lin <chen45464546@163.com>
Cc: kuba@kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, alexander.duyck@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_205015_593460_100320F1 
X-CRM114-Status: UNSURE (   9.58  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  8 Jun 2022 20:46:53 +0800 you wrote:
> When rx_flag == MTK_RX_FLAGS_HWLRO,
> rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
> netdev_alloc_frag is for alloction of page fragment only.
> Reference to other drivers and Documentation/vm/page_frags.rst
> 
> Branch to use __get_free_pages when ring->frag_size > PAGE_SIZE.
> 
> [...]

Here is the summary with links:
  - [v5] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
    https://git.kernel.org/netdev/net/c/2f2c0d2919a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
