Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AFEC021A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMCNnE3xOrLT5/r0SHnNMiW6p+8bEPbBTJKrhVZYNuA=; b=d7wqtzFGFyQcbqJLNuAxoKVBjb
	mVo+eEGuqjUCXXT68tOsAzxrwWGmhj293Nc5urUmEVrLMfl28NSJopqN1hPtT14LbYaqjO9vKDrKH
	ZgBAbmmJwEHbL6Okw7C4afxhGEXpdJsvo5XvsjNnlHBeK20Z0VUTKyVe6Yn7O36kb9FJpBrOboV4Q
	0mSWAGpGKj0Pb600TZKaZMZSsX4CYOQLsJbceXC6/LVAl0c4yT2M9EuxbG71wbSunXltOIlCQ8Old
	V+BzGL+Ak+rrkCR44BKTVuJES/KwHIZmuNcE/9niay6hwpO+RpGsD9uCRVZpWlJaXD0g0EfOJwIJT
	e3pdxyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuhB-0000000EohK-0U3J;
	Fri, 14 Feb 2025 12:21:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuh8-0000000Eogm-2aVy;
	Fri, 14 Feb 2025 12:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A44A8A4292C;
	Fri, 14 Feb 2025 12:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DDCC4CEDF;
	Fri, 14 Feb 2025 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739535680;
	bh=QVeyAHjLchA7WqNCbOqpcUiyNoAjfJYd0+puryVp7pk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AUjk/HNSoYoQ/6J7hjZcAlA15HEnPLWX8YfTGndmLW2hjnNec5mewKqHd3o4W7hn1
	 BRejwhFBtkt0Ou/hhrCr7MBj8foKiGnTV43qoiKEdocEbiKnBmgLreJK/YOTEVKPN3
	 +A143cv0JRt5IesiDDjXgNTavFgIBYxDBRUaN00DB7p+FrFY2uJyHYz5UplrnP2F5q
	 g7zwJDQKL+1a6+P0N8QeTIIB/O1r8Ld7StCoKkmZ3d4Ixq2ekTm3LtkRLs1vDw8dNS
	 GehvDSkL6cE4lZUY9EYrRGBPRnZC6rukHydjIItJvaaudbv3dquLg/8mujJzlMYbNH
	 RxXBM5LjvADdw==
Message-ID: <c045b5b46c8daf79b124e6da9f951fe8@kernel.org>
Date: Fri, 14 Feb 2025 12:21:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
In-Reply-To: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
References: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Alison Wang" <alison.wang@nxp.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Chunyan
 Zhang" <zhang.lyra@gmail.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Joel
 Stanley" <joel@jms.id.au>, "John Stultz" <jstultz@google.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marex@denx.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Philippe
 Cornu" <philippe.cornu@foss.st.com>, "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tian
 Tao" <tiantao6@hisilicon.com>, "Xinliang Liu" <xinliang.liu@linaro.org>, "Xinwei
 Kong" <kong.kongxinwei@hisilicon.com>, "Yannick Fertre" <yannick.fertre@foss.st.com>, "Yongqin
 Liu" <yongqin.liu@linaro.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_042122_722132_1B25B004 
X-CRM114-Status: UNSURE (   4.37  )
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

On Thu, 13 Feb 2025 19:19:24 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

