Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415AEC19F32
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Mar 2025 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZXGMgPNkhD4CGMcDqX1hVuPYAB2+Smpe3fAdywNO8Y=; b=RNMYG7YCzBSdl8uMO2o9/yEmDB
	sgFUrtU1vtxqEY83sHTWyuaCscgr5mAVZYnlJmbCfCXJTC+xyR2dF83jAqgRlYY+p9C/I7x55uzCf
	8uKZNnj1WByA/wQW1/t08w3V2xGeLbXoMu/Q4OEoJfNQZV/hbaiuV582FEwSaL5Hod8si40pjioD7
	F6J3CE1To8hhj8EuXOGm0eLWWf7XEGSQzuMdHcgNVmrTcSuJoXpYojrE2r/WlFXznU8+dfQQinyQr
	1mCR8V3K0QatXQHv374BBXRWYlvwRW0wur9vBuCAfor3/Lu1Pes9zA/qJHBfbwdBVUrR0JKz/nqfr
	XEbvGhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSC3-0000000DRHp-1E0e;
	Fri, 07 Mar 2025 07:32:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqS9a-0000000DQyr-4B6l;
	Fri, 07 Mar 2025 07:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0448DA45530;
	Fri,  7 Mar 2025 07:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C70C4CED1;
	Fri,  7 Mar 2025 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741332593;
	bh=9IM2Zi16jhQTEhlsjN0XpLrMG/R/xIXyk6ZdOXdSFl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHXnY75kTGL+ySabRaVU4JEh0F1XwB17J6xFxYfo3CM1sjc1J+V/AYcH3M+kf3T1K
	 VjM1Zk3gAU0zIvhzYNvYayA/EOUTH3C9BrPrZpWSBG7Y+HKFg2QKDrmkhzfSSEbUR3
	 cdRtWpocD9vf9zl5tNgY9FZjFplxMUAkYMT1IplwAiFKkZIMV8nZGrwielBu8qmoNv
	 8vYLGhKh5EvYvH/mD/5kTTeZ8TGkwTpOY/LAk9gQpQq5plXrQiHX2mvf4khhmGOqZm
	 sS6sFyrFPlJUb+lkbje5aklcglsY5sCZOBGI7LiH525K7ZaPjPJbEOQHal+T47nUi2
	 cuYtbsZvEUamg==
Date: Fri, 7 Mar 2025 08:29:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guangjie Song <guangjie.song@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 21/26] clk: mediatek: Add MT8196 ovl0 clock support
Message-ID: <20250307-godlike-quizzical-mayfly-dec36e@krzk-bin>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
 <20250307032942.10447-22-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307032942.10447-22-guangjie.song@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_232955_116585_90C0EF21 
X-CRM114-Status: UNSURE (   9.51  )
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

On Fri, Mar 07, 2025 at 11:27:17AM +0800, Guangjie Song wrote:
> +
> +static struct platform_driver clk_mt8196_ovl0_drv = {
> +	.probe = mtk_clk_pdev_probe,
> +	.remove = mtk_clk_pdev_remove,
> +	.driver = {
> +		.name = "clk-mt8196-ovl0",
> +	},
> +	.id_table = clk_mt8196_ovl0_id_table,
> +};
> +
> +module_platform_driver(clk_mt8196_ovl0_drv);
> +MODULE_LICENSE("GPL");

You have warnings here about missing description. Build your code with
W=1.

Best regards,
Krzysztof


