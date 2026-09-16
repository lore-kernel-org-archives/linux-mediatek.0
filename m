Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248D5C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbDzrfV61Wxi+cHtWqnlZDsumAyv7C+3GqSui1gaCUc=; b=P/6j86+2VpVrRot1mQyXKcR9wX
	0yL2Astm3ZgAWLki8WSw9bWcduIk96Ls07ihKGoVi6jWs3W3nXTg+uu+ldMy7e2cbWarrbT6Ky7R7
	IlA1v2BJDbCrmlWw/tE/OBzbjC0bCFXb/8peLbtnuFVPALB83wYsrQQ2Qx6lqwKj5IapPmndtLDx4
	YxbM2roto8vbM7hlKIJgB6Qn+NYowz33d1okaPUI1roR8KqfjRKsH0PSuasuAs5lELVpn/hdrlunT
	jOE4WJIF51p2ZfvPO/mmW0o7lFdZtLV65/xb81gLvRvJF9+gscZEkbr/cmWSFI61KRsthwLEEtU9N
	A/EzVESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nVp-000000092vL-1VQV;
	Wed, 16 Sep 2026 11:09:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nVG-000000092PP-2D9g;
	Wed, 16 Sep 2026 11:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556916;
	bh=6EHds//n4+NFmxl71I9PCgmjYbS9lTfCOyADVHqg2XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oU4OqbZbjcODi1LGBvFbwctZxSAFUC79IZVYx7h6/b+Lj6UJnnQyOJF8lO4oUnasw
	 AUyicmKMgr8lVgKtEzuHOP3YQ9v+ToX9iR3qkmi8M83fmfio2KczGs2o5MaBerZURx
	 llrCkwgviBn6oDsmsVxGyx5CxafQg0WSZUJLTDWqAIMQ6VKKXrgjlya7ZYKZpYAzBV
	 rI5I/2XF6M4se+Xh5IEJgTGmCeSXOoVQjTPR7kT8A3g9WTCRYUxREy8KuGPm6/WRC2
	 +WGi96uTskBscpx+ZyH7zCS7o+3rSS/9ae5lbTmJUYpfnNPXwlaebiBU0WDlr8LHoK
	 GF8hdUYBv28KA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C722C17E13A8;
	Wed, 16 Sep 2026 13:08:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v9 08/13] drm/mediatek: mtk_dsi: Add support for MT8189
Date: Wed, 16 Sep 2026 13:08:20 +0200
Message-ID: <20260916110825.102631-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_040838_712694_9AB9308E 
X-CRM114-Status: GOOD (  11.33  )
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

Add support for the DSI IP found in the MT8189 SoC: this one is
similar to the IPs found in the most recent already supported SoCs
with the only difference being that it supports a higher link rate
of 2.5Gbps instead of 1.5Gbps.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bd2d17017bd2..08f6be311dd1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -826,6 +826,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8189-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
-- 
2.55.0


