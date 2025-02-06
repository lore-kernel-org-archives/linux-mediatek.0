Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E13C02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V51BqvMXsstVmBXrA58cJ8IeABrLgI422tA5NG01R4=; b=gjkGCY0N7Qc41OGhUryrrX8XBC
	SFjSS/ZLyb31+h8LUMffGvaeht5O1rV0O9np6rEDBHZujhGs6aruVk6+w6wtLBAQvsQPLxB/sp7s+
	NIW7UO6GPfdmchniFi7CVvIwVDhQfyuQWCZ64vVKBXc7VnYP0Ho86YdsRFsr5LlNU4lh6C3NRrPbF
	S7QAhZuy72h2yUbGvtE/W6W4AIe/D/zo/AjRaKLaS8x9CK/ZHRu7T1W3kDWjBXRtesi59wIe3H/Pm
	9vP53a299wS5izxxSj/4R+YHYQWV1Hv83pFmqXm0/zCOHW45tNyIoZCevruHXzfpUzHSqZP82sdhT
	rFUH0jSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2q9-00000006ZJq-2cdt;
	Thu, 06 Feb 2025 14:26:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2fD-00000006XTX-30qj;
	Thu, 06 Feb 2025 14:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABF5DA44301;
	Thu,  6 Feb 2025 14:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7EFC4CEDD;
	Thu,  6 Feb 2025 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738851330;
	bh=NnqBms1V+4E9EfQaAWHmp1xTPNsYHk4NHNYKw/gc4LE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=QFN15TOtrwkcAyA/lsiNaWymj//OCxIz5HucWhWHhCATirYavxVO59r4NPBM1VITc
	 e+0xwpj/6cllUySpG2J01BM9d912Jm9lleZqs3pU1O3HdQFqJuEnxhX7s3ayQaEn+J
	 uPpfKRER4ScCQc1p6C4esmKdk5fGJxU5pFXYI+hvewBb2q1GnMjw+Xc3wld5LiVHqL
	 IYNH2q5SCXspU0KCnOPUdyq4IYIMyYl8fk3Zlt4hpVsFdD3w+JsD/hYrMTc0fCojHr
	 fsXb+MFRghIZqpKoSuwq88hRtoc3i7eJ2eeyZkraYPppScjf4IDEprsKrWZYlzxnvI
	 kZYRg3Qh41w1w==
Message-ID: <a66f048616d94bd68f56fb73abb5fd60@kernel.org>
Date: Thu, 06 Feb 2025 14:15:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 04/12] drm/mediatek: move to
 devm_platform_ioremap_resource() usage
In-Reply-To: <20250205-mem-cocci-newapi-v1-4-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-4-aebf2b0e2300@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Alison Wang" <alison.wang@nxp.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "Andy Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Chunyan Zhang" <zhang.lyra@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Joel
 Stanley" <joel@jms.id.au>, "John Stultz" <jstultz@google.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marex@denx.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Philippe
 Cornu" <philippe.cornu@foss.st.com>, "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Stefan
 Agner" <stefan@agner.ch>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tian
 Tao" <tiantao6@hisilicon.com>, "Xinliang Liu" <xinliang.liu@linaro.org>, "Xinwei
 Kong" <kong.kongxinwei@hisilicon.com>, "Yannick Fertre" <yannick.fertre@foss.st.com>, "Yongqin
 Liu" <yongqin.liu@linaro.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_061531_824193_6D45631B 
X-CRM114-Status: UNSURE (   4.48  )
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

On Wed, 5 Feb 2025 15:08:00 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

