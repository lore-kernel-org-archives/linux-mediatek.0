Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983DFC4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mE06ENnVWqBTCRJ6dk+NTA+VvH3d3TbOoqSEznAMgR8=; b=OxpKJOPDZ/uj9W
	RoTT3Nt+NnoC6Jpv23RL4ZhFRKYQYqwZZxkwBn7eNEqa72h8OTeHQiumrGfaezw67X+0TRQXQG4iL
	RcNNL0jwV8cvYQEJGLVRnn296r6gZOsEKvt4y0nMMbZyRcqL6FyqNc2ml3m8XzFyLxkDfJo61Hn5+
	rI8Vhf9Nk9sHLzbp6Jvbg47Z53IVEUMpc00wWJyoEYaS+vT2Vw1J7Cn2HuzN5PqOMxWTjXuR11JFn
	T2QAnNrblAdcdjidys6bm355SuTIkoaHElLM5pnzzqAgennIT5X35LLMtC9ZlyH6lr8NKW8TVoYTt
	GzL1HQh7EVjiDDrJQVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjIc-0000000Ayix-0SJs;
	Wed, 07 Feb 2024 14:53:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjIZ-0000000Ayi8-331F;
	Wed, 07 Feb 2024 14:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707317594;
	bh=7dhx+O2PyaDEDeGc1HBTFc5NQvFFIflUo1Mzmg6Ym7U=;
	h=From:To:Cc:Subject:Date:From;
	b=XFzFNkTFM1aH23cD74LkWG3zPLnD/HBJr9y4S6RvFGQimYbG20ztzBGPyq0S1HKw/
	 Az8LXxflEtm+V9AK7gIAtY9M/PdzthysoHX0YBvtAiycfa8fXBIrENQn83KTRgSkH3
	 eeUCLDrHrJWMiwm46p0w0uydiq2FYbKqIm5rYe/9FPi6lGza5N4QHinfYOZLNdHeP+
	 pj/vP3wHY9lCUEN7LweLzugDIHXqpCQaYZkb10g77w5/E3uoH1mQxSDFtx7xcl6EcA
	 eynQlhkUCiIOVJQj2D1McyAZPyh2285nXFJd7+c9fZi2NcXlkhTjubO5hxE5ZVSRjg
	 PXDZv9bJKWSRg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 778283782059;
	Wed,  7 Feb 2024 14:53:13 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 0/9] MediaTek DRM - DSI driver cleanups
Date: Wed,  7 Feb 2024 15:52:58 +0100
Message-ID: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_065315_916857_F66E9111 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes in v5:
 - Changed patch 1 to not fix the DSI_PS_SEL mask for newer SoCs

Changes in v4:
 - Added a fix for RGB666 formats setting and for wrong register
   definitions for packed vs loosely packed formats
 - Added a commit to make use of mipi_dsi_pixel_format_to_bpp() helper
   instead of open coding the same

Changes in v3:
 - Rebased over next-20240131
 - Added bitfield.h inclusion in patch 3
 - Added three more cleanup commits to the mix to simplify
   the probe function and remove gotos.

Changes in v2:
 - Rebased over next-20231213

This series performs some cleanups for mtk_dsi, enhancing human
readability, using kernel provided macros where possible and
also reducing code size.

Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
and on MT6795 Sony Xperia M5 (DSI video mode panel).


AngeloGioacchino Del Regno (9):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
  drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
  drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
  drm/mediatek: dsi: Compress of_device_id entries and add sentinel
  drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp() helper function

 drivers/gpu/drm/mediatek/mtk_dsi.c | 310 ++++++++++++-----------------
 1 file changed, 126 insertions(+), 184 deletions(-)

-- 
2.43.0


