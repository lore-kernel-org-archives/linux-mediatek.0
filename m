Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4944FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAvNAEqJ3dtE/wo987YzdcE+EKUQoZ65tV0c5wITRhM=; b=lIWG1JzvF5RFJSgBFoA3q6fnyG
	jnJeE2bfFUCVbIYXxzjfwyJeOTgseWzx2CZa9abTSg2c3lNjZ7yYDFmSBEmPlqpNdadHUtyNErncn
	E2udixS9NWK0i6BhvLDIq+WjYj9MMQnAkigV8QI1DH0hnqxWcCYVZP8ybBJRBkGBwigcQADUchVR5
	PszykVvGRqzKwda+y3H4ssmpFsxdhFrGhPIiK8x9LZ3wZjKxnlQgIT5m5qj9FqIcA2EKF9YML5I5W
	+ptc/3OpPe5K4x9/yG6kXoLLOnGIDZgplKzJtVsStoFv7G0e7EsbxLT1pfZMJ7KZfYQatoVBS9iFE
	ORVERzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNu0-005IDX-Gl; Tue, 08 Nov 2022 12:40:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNtp-005I3s-VC; Tue, 08 Nov 2022 12:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CEE2CB81AAA;
	Tue,  8 Nov 2022 12:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76DFBC433D7;
	Tue,  8 Nov 2022 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667911215;
	bh=iktiCSkZHbrqB3HWxE9FHVPAwdqsL8+VKH+8ULt7qTg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cCV/2aPBwjZ7zZP6HniDVz+BfQtU/Rx39iwn14xUZbsbvnfqxYtPpe5Fs+Tc6KtoG
	 7v7iMwLalrUCy+ze02GgF8uK2HGsW0yn7xElj9/n5mZwvMZXMVOWzUvpgPsFQYXYq6
	 1FO5Ko7P4TF5yhQbLRA8qMPSd4lY5WSnbKvTUZH4WsJl4d5itNkTCD7800tktnyKxa
	 1aSGCPdiOwets3LBn9A59yAh/bANfOGjk94WWmZ0hw6GsRVEGabKO3OwhB5pfphitB
	 IimFDfb8HhJMGkePtC71HpaZLAmH6Kmx3uxARsDBtMeVbdmm85mvS0X1DIszYjL83O
	 sBFmyMQC+AW7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CAB3C4166D;
	Tue,  8 Nov 2022 12:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk-star-emac: disable napi when connect
 and start PHY failed in mtk_star_enable()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166791121537.583.13082535543863984299.git-patchwork-notify@kernel.org>
Date: Tue, 08 Nov 2022 12:40:15 +0000
References: <20221107012159.211387-1-shaozhengchao@huawei.com>
In-Reply-To: <20221107012159.211387-1-shaozhengchao@huawei.com>
To: Zhengchao Shao <shaozhengchao@huawei.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, bgolaszewski@baylibre.com, weiyongjun1@huawei.com,
 yuehaibing@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_044018_211123_E2CE3696 
X-CRM114-Status: GOOD (  10.06  )
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

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 7 Nov 2022 09:21:59 +0800 you wrote:
> When failed to connect to and start PHY in mtk_star_enable() for opening
> device, napi isn't disabled. When open mtk star device next time, it will
> reports a invalid opcode issue. Fix it. Only be compiled, not be tested.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Signed-off-by: Zhengchao Shao <shaozhengchao@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk-star-emac: disable napi when connect and start PHY failed in mtk_star_enable()
    https://git.kernel.org/netdev/net/c/b0c09c7f08c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



