Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B93C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Apr 2023 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff0NfxhQnu8LLrD7EYe23V9dXb1Lq0Ktv9UwdB2G140=; b=Qu9RvGwdkCJ8x9A5Ty1xtVSjOJ
	mWmFWkYIKJjY1bL4MEtill0LJPRjya92OC2j5w2InotZsxN6Cn7kGMSKmOz3rQSzPOEE5WkDju8eA
	4oZd3P94K+7/srWBRFVZL8EMs6/DZPfsjFj6w+17A/kwP6XK+W880OD+7MmK64PRY2wlh+g8VrRGd
	17J4gqJ6cKyTUXEsYR8Cvh6ntZSbUKdb6/Ae/B9bYnsZx2NfKt1f0u8Rn1u1whMEtmWZPqMYRs2rK
	vXuCZ5479AaqC16hpryvldI5AMfanPGr1WARKglSFQtpCg7egkkgpIxJaItv0Kmr5+x7mrmDo/HYy
	HSKZ4nKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqZAc-00EK9C-1v;
	Sun, 23 Apr 2023 12:50:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqZAY-00EK7e-2U;
	Sun, 23 Apr 2023 12:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C66560EB8;
	Sun, 23 Apr 2023 12:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B2A4C433D2;
	Sun, 23 Apr 2023 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682254217;
	bh=0XtrEUR1rKRDtOBaE4iikDH8y7lfxm9ELVPwc7pzzWw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Nv25gNiN1wBjMxGYgUFvfAbNrvZBRAZwHoDHlCAIDjTb2WjzUqa+TficF7srYiUPe
	 hfSWeG1xbBWFm/pXe6wEB5BajErzMq3A9pgLulZIMr6plG/NheHWgXWYDzuIho54/c
	 GgwagxGXeDB96wFXF/gJIQdvFxqtRwvDJKpvZbvO9iu2OK7Wp4Gh5r+5jPRtOrFHrD
	 Qp+/uXM1kkIcjVo/QXj2x53GJMzxsMiivdmLNepjYX6PNigcSEE+NPKp3e/XV36ChX
	 h3Po8zhL81iieORMEXc5uRnM365n2Ho7EtMND3tJyZrGYi4KombEH+VTaQI8+nkI1q
	 dn92sGky5Worg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6DD07E270E1;
	Sun, 23 Apr 2023 12:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mediatek: remove return value check of
 `mtk_wed_hw_add_debugfs`
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168225421744.16046.7230758740526095778.git-patchwork-notify@kernel.org>
Date: Sun, 23 Apr 2023 12:50:17 +0000
References: <20230421151010.130695-1-silver_code@hust.edu.cn>
In-Reply-To: <20230421151010.130695-1-silver_code@hust.edu.cn>
To: Wang Zhang <silver_code@hust.edu.cn>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 hust-os-kernel-patches@googlegroups.com, dzm91@hust.edu.cn,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_055018_853525_FBC58D0F 
X-CRM114-Status: GOOD (  11.49  )
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 21 Apr 2023 23:10:09 +0800 you wrote:
> Smatch complains that:
> mtk_wed_hw_add_debugfs() warn: 'dir' is an error pointer or valid
> 
> Debugfs checks are generally not supposed to be checked
> for errors and it is not necessary here.
> 
> fix it by just deleting the dead code.
> 
> [...]

Here is the summary with links:
  - net: ethernet: mediatek: remove return value check of `mtk_wed_hw_add_debugfs`
    https://git.kernel.org/netdev/net/c/b148b9abc844

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



