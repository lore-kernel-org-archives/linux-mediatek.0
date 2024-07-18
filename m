Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A57DC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utSXrLGn1xRfeVYf4SwrbBdj3Lx3HnZupfBCs8Tlwqw=; b=2c7YwD74lHQvdlEzbzJDRCAqN9
	bz0VAFFrMBkLnekdNHQO+QFpTzBcBYRIv5h54vYtQ4bLGuMCdwLKGLN3Z5bqAMaFoTurl2TatcZz+
	gmSh8UfJcJbmq8WI1egTNkyNZH69VPn2Z5abE4XOtTjj1Eq6FWefOD9T7aDcnrqB/7HqHWlK34fXH
	7fJY66e1nJlzoSIVk7ulr/LhwevVhdqivMLj/ePick6NUydpu/havh0dudIGBsXxFty44zu5upGD7
	woMZJNgwVR8OFv1Fms2bOTis42fbQv5YTdBswHPr95r/V9RG1nbB87KK0ZGMEE8dZQZKKMu9itlFd
	+1Hrxm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNmq-0000000Gbln-0GRf;
	Thu, 18 Jul 2024 09:50:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNmT-0000000Gbim-0bmN;
	Thu, 18 Jul 2024 09:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 196A961A77;
	Thu, 18 Jul 2024 09:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6ADBC4AF09;
	Thu, 18 Jul 2024 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721296231;
	bh=NmMbqNEq417p0M0i/dA/33XfPB9L8BA4WFDWPW7yDzg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OjB0wWQ7yTNPUwv/hT+4uf2Y1GzfUWAh0tj+DmEABT5bSIfS3VnutizYF8TI/h1Yk
	 THbXxcfAn69L9NnTXvjMXD5Bs982+T4kOzGoI3M2tUrzAjJy6QUpT3MDRJqavXp/JF
	 u3OqwE1SZ5Y1KC4RCYje41lx0SNYFerUg1B0t61yutfMsYb06nZQmcXfdPth7FxFS9
	 cF0QSWoyr69tamDvWqmrRGIeQIZbnpyuyXlEEgbEMtlK30s3zCBhjDADvrecbzupuP
	 iQqst1ZGqZbRvS98M+X/J5hwWDAof3fpBunibAMk9RFoinXYCkWWzWIhkeWB2J2p2K
	 Az3qdPRh5KlAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A079DC43613;
	Thu, 18 Jul 2024 09:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [net,v3] net: wwan: t7xx: add support for Dell DW5933e
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172129623164.5775.484196429931641435.git-patchwork-notify@kernel.org>
Date: Thu, 18 Jul 2024 09:50:31 +0000
References: <20240716024902.16054-1-wojackbb@gmail.com>
In-Reply-To: <20240716024902.16054-1-wojackbb@gmail.com>
To: None <wojackbb@gmail.com>
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025033_253413_FB1842CE 
X-CRM114-Status: UNSURE (   8.83  )
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 16 Jul 2024 10:49:02 +0800 you wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> add support for Dell DW5933e (0x14c0, 0x4d75)
> 
> Signed-off-by: Jack Wu <wojackbb@gmail.com>
> ---
>  drivers/net/wwan/t7xx/t7xx_pci.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net,v3] net: wwan: t7xx: add support for Dell DW5933e
    https://git.kernel.org/netdev/net/c/a1a305375dc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



