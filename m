Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67665D5B841
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om5mM7uxoyKyU+mgWzVmY7p6fEJbFwmbQTCGVmR2FLs=; b=SlusM3i6d6uRtS3fMceGXbdgQr
	qFmCJlRyIYk6p5yV5Kfh74NoXGQx9lSS2maOWB44KrRg3DknZAFlBg5ahCqsrBV5lr0hwdwH1fOAa
	k2t3Ef0zlQbb8SEZ2bYxIyu6ZiYZVzLoV8qrQIb0jt8oIKH0fcjCEkY6R6T21zjjtdk/smbqxuYzN
	QzjLbc5iJmPjkgDD+tsBR5x0Ep1j67TPA3gvLa8drHhyE6PAE4jmFc6pYZGW24mbry2U78vReKceZ
	mKQ8biUzh17nZKFrAGE0k86U/8v2X+lZwY98ElnrxTZ49pOwsEecyo7NgMl4qZ293vQktc/gzvbZR
	H1ZQyO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAII-00000003su3-2WXa;
	Mon, 15 Dec 2025 15:15:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAIG-00000003stl-2RGe;
	Mon, 15 Dec 2025 15:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CE5660157;
	Mon, 15 Dec 2025 15:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21162C4CEF5;
	Mon, 15 Dec 2025 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765811722;
	bh=/hSiNj09HL1MEnGjr6tcPCIROWmHXWDplJK1S8UVBGo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=t/uK+6r19aNRWoDv0W3wj4cnikrdzmYo8vbM43tJe4nlhKkFY+WXueNKSPhkjFzXg
	 XD7ZGMtik2+zO2e1VASyMyaPm1gYYJuVKYNuImPfqw73mEr6o2BuOR3xEWyZZvYBz8
	 vBUV+wiZLQoTQB1Qd+VGxJ9+3z4xSOi0rIbOWlgGMhLwRo7Z8/zBSASlirM/bqmCY5
	 GS5Uxb4viOfBJFgYyqoLm4YMfMdbOPWL+Ope25DEHa89iPjt029geZHH1mSW+7xax5
	 pM9RZfGgyIVUcn5ZiDiaQgGKKucqiirjJR7CqUQAciZ1OUkkHWVYa/AprakOrsCQ3B
	 NXPFkSnXFqfdw==
Message-ID: <7d6c96ad2922a8cc6008f27609fc055a@kernel.org>
Date: Mon, 15 Dec 2025 15:15:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 03/26] drm/todo: add entry about converting to
 of_drm_get_bridge()
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-3-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-3-88f8a107eca2@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: 7bit
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

On Fri, 28 Nov 2025 17:50:13 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated, but converting some users is very
> complex and should be reasonably doable only after the DRM panel bridge
> lifetime rework. Add a TODO to track this.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

