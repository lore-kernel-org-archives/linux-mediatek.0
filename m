Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBD5C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsZPKvakc6spYVBvH0fjfPrt5MSpIpthndsyjD5ZeIg=; b=O65YDPzHeNdP005rePrx8DqCcn
	v9PobW02Jgij7DXVjfKJjnYtFV8ZNcDtwTvEnxDjXJGnBXo5v4mwavq8MkHLr6YohefP4HxoSOnFM
	Ko/xl13Lt9cUCS5Zv1g8zpnsF3dG0nFedilIUXnaiW0TNernCSfxJSidnS1bflj/OhVce941I+LAJ
	pWdKx9V303nYkYDXAeqSaYbqJ2wFmkhzR64VAZ/XCO3cHtDIKHh9lkKApYaQJ/xlsp5chBt6ORh7D
	BaA8ivHwYoEbBd0fjDn2beQip07szEQPjoulLwYeDyExtX9oiRSy7+VTXtxI6YSX6nbesDGAQTdFp
	3Ex+zc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kt1-00Cyhc-2J;
	Wed, 24 May 2023 09:34:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ksx-00CyeT-2c;
	Wed, 24 May 2023 09:34:25 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 608966602B7B;
	Wed, 24 May 2023 10:34:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684920861;
	bh=a0EL23vvvIql72p1r/4NKLcSB4WiPqmju45rIVviM68=;
	h=From:To:Cc:Subject:Date:From;
	b=ZP5a327h5yCff5ZXdwT2PhCRIiWKVrLGL6pB/6yDmbhFk9LVZjUpotpTzwphtKI8I
	 4Zef0ZrvJR3ggmSITFsYBPYGwV7gVTQ+LsfeIMP77I9JFMAgphxxmYD+puW04GCRno
	 k3ybG/WKIdxUm8n/hG/xL1VoNw75mwN305REL6VLAKtiinVPe+KiUsFAJK1BumaMr/
	 yhNLv/M2Sde4LXH/NC1EU3xpr52o5D7BKD2Xj+8L5mw/Wva/cO+RVBKripiJNjkQl+
	 FPm7DoVy9yfrKSmoSeHqc99cuD4JJQ8n/wtaBPe5tRHgb3mkqv3GIF8RnE6hMMvWla
	 ZxQsCu7VSlHWw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/4] MediaTek DRM - DSI driver cleanups
Date: Wed, 24 May 2023 11:34:08 +0200
Message-Id: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_023424_013396_0F7B1094 
X-CRM114-Status: UNSURE (   6.21  )
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

This series performs some cleanups for mtk_dsi, enhancing human
readability, using kernel provided macros where possible and
also reducing code size.

Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
and on MT6795 Sony Xperia M5 (DSI video mode panel).

Please note:
This series depends and can be applied only on top of [1].

[1]: https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (4):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ

 drivers/gpu/drm/mediatek/mtk_dsi.c | 198 +++++++++++++----------------
 1 file changed, 88 insertions(+), 110 deletions(-)

-- 
2.40.1


