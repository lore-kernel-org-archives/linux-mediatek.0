Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA4AC0218A
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jan 2025 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roLSlasG/q41dscrlB7eO6FGDf3F4zgrpr5LEf+aI/Y=; b=t+UTnhuneMkQs5s3uA062mzLiB
	BOhBcrzQY6d9G4Mf2GAl1jVKCpfW/jv17Y+47kNdpzlDqRR1kk95VGO/rNdZLce8gp7O0wNPdJkCv
	56VQaqcFQO63V99n2fVfOc6x/gEZ5N7lph6LPmxwK43Wm6VDTMhyf+HHqvHvFIMA9h/Mb3NVeIzgf
	H98BXy5WK3eXkZvQy3xLJNbxrsd5v+hg4ip1L3R+F/mYq8+VFT4KZlfrSDR6Y7wYtXYGCHQEsJuXx
	QefVXZnyk9jfjqmwI8FEyFGHak5OzmYxyAqJTZ9k2Wk77AokDr9L3fGjQDvGYGd0ezNdcNgYgN+Qe
	0ug+EmhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcvKe-000000063Ru-0VRO;
	Tue, 28 Jan 2025 23:49:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcvKb-000000063RN-2nw0;
	Tue, 28 Jan 2025 23:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738108152;
	bh=roLSlasG/q41dscrlB7eO6FGDf3F4zgrpr5LEf+aI/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d27kyn86OW9fKb37uxAAjYTxIMGhniYZF6utj0d0lxP83K5OlLXIQGc3mwfwR+qjt
	 lXqOymLQrDX/9BLUoaBptalqeGGhBCGvev5Y5KFsn9hbt7sc2Gsqe2gvTK1BqX2av7
	 mqh0HN0lBLqtvidZC5BXZC/UwBxCS6aqMrwbm+Ewg1AG/SQ+VUj6WK9TlhnIibrnsd
	 ZLstgk7mr4Fnq/pX2qwnssCN+qKFpGOKxHSVnRAc10ZBaRYk0ioU9v63xfJvpzJcbR
	 BpaqVLh43vIi78A+Gztr8p/PRCBc/TQqZrVOgFBSlCW0+ERJYYiTavaKlbeJHiHqKG
	 ZvfGucQWj7yAQ==
Received: from [192.168.68.112] (58-7-145-34.dyn.iinet.net.au [58.7.145.34])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B175F700F5;
	Wed, 29 Jan 2025 07:48:56 +0800 (AWST)
Message-ID: <0589b4c2a6cf4e946e927081c4ed5a4b488010aa.camel@codeconstruct.com.au>
Subject: Re: [PATCH 01/14] drm/aspeed: move to
 devm_platform_ioremap_resource() usage
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Stefan Agner
 <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, Xinliang Liu
 <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,  Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin
 <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Wed, 29 Jan 2025 10:18:56 +1030
In-Reply-To: <20250128-cocci-memory-api-v1-1-0d1609a29587@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
	 <20250128-cocci-memory-api-v1-1-0d1609a29587@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_154921_911746_1D03A9DC 
X-CRM114-Status: UNSURE (   6.65  )
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

On Tue, 2025-01-28 at 17:29 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);
>=20
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

