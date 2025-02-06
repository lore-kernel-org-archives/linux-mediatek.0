Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2DDC02196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leY0h3tERW3OeUGKi9SVNC6gkRyitXalmxljJ5c8F7Q=; b=MSBuLxI+sq2WVQvb1epttuUJur
	/d+VkfHZK73UO1mgF4CdfAE8AiJnOI5C/0QCFf8j5MEwaJYdsWdIE0oci6iVuJUTHTtCuN8vip/BL
	yzZ4XTU8WBFIs5ncKM5xkxVYC5q5VOzosV4Z06dMr2zdgPD2eu4lJCtARUvZS7s0AzACvuh+aQpkJ
	o+xySTtmCO12bWh0lJAoyYMbMroAxKkRhNj/dc1KMZ6Dbhpw0bS5+fsMhmLp6+/kPcnTkfJY7Wg6F
	OIsC4xgE/R/5NlFYFixgY0uDd98TMc4zBY52uSwDLUrRznJVoibJ8JZPibtiGXZnanUYxfQpT5+Yj
	K74pbaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2qA-00000006ZKs-4255;
	Thu, 06 Feb 2025 14:26:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2g2-00000006Xg3-1Top;
	Thu, 06 Feb 2025 14:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E40545C4A80;
	Thu,  6 Feb 2025 14:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A9DC4CEDD;
	Thu,  6 Feb 2025 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738851381;
	bh=TVrqcXFgqBq6YFt7saP+I5ihtXmckW23rwRocf2v0ks=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=oUgdH98XCy7hXa1ByUogw4wZqfQiUMbkICr6OB2xFmDDElLbT5m+D0XzwWV8BzN4F
	 aU9wIobTYhSktwzOBbHotD7pjFpro/6rKfp44cW1VTaAe/r3Tu9Dm3YATGZaMn2wgX
	 XVkzNpxRcchr65QYCKk9NSQ7aYVv5llZoLqveCPFe/hwdm/NdwmCWys1PY11NtWe5i
	 FNVVTG6tm05bKn3f29wvDj4nqSWIk0efSNkn3CEI6D9AALmnMa4ilpyTl2kDXAIIs0
	 Y2z6DwgguFYCR90SoCdiXek/5rFwYlX6uaKOVNi1aLNRYHKaG1yyJtQlIFNK0BPpYM
	 nRSntspicf8+g==
Message-ID: <ca7086893b5b7bf0e119144efc00733e@kernel.org>
Date: Thu, 06 Feb 2025 14:16:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 07/12] drm/sti: move to devm_platform_ioremap_resource()
 usage
In-Reply-To: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
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
X-CRM114-CacheID: sfid-20250206_061622_439523_C40F10F8 
X-CRM114-Status: UNSURE (   4.36  )
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

On Wed, 5 Feb 2025 15:08:03 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource/_byname + devm_ioremap
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

