Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D51E7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 12:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUoyzTld0yFkc31J9nG3omv7sqs7kv9qf6eeUpZebQc=; b=taB5YoLUY+kxgP/cOP1ykb8v8N
	DVvhwB0EefVukxNZmlcSOS3SuSv/jeWGY1dKLnNk2ydyu5ud2tDZamRUh/vxLDlqZ9EFpyqKm8pXP
	Yqo0oSLKT78ftQS+Eckpkl9C9eYtyqH4TafnVA+7vyTJWxH+XLlkh8Yn9/EM4M7oHWmZcKG6+boR1
	pwswKs2KaoQBHEWJAoNZoMu7MCk1JgAyvza3Z1JK1kuGWIxQ+k/8eFnCsojgfnBfrMnL/pgLTqq/T
	rpBIAdUf253TphxBGNCUgm+b0+S++2ZQ8cF+czP+/2hOUL/8p0CEdeWQ673K1llrvSaCDxXIIzE1o
	huAOUVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAYM-0000000Frkf-044S;
	Thu, 05 Dec 2024 12:01:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAIq-0000000Fm9U-1poK;
	Thu, 05 Dec 2024 11:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733399151;
	bh=YhUwLiomFSbr+h2O2iElubF3nmJkJZ8Y7TswSzL9/+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IgTzOiSPRbcICdLg23SBSHqxi6yiQF27M+mtgTpTbLqP7F5eQ/59pJKC3Bb3Pp/lu
	 e0fBv0PUgwfnNHSpC+MonhcSF+YJFJG5BWvzh+O6bq4f9CWb0rWO1dMczSDobnxrFf
	 AOrtKoRQZ++Iu5YVMjfjS3QOlN4QUOEKLpHeW8JtBdmGBbmVm4lOrKoRvevZZbLGix
	 wUKW9UTIvfDjlw+BDyjPGTC0u1U6vrictwEBEi4Q3kNiqOzudMaF2dXMsMpAf2KUil
	 U2FFAF0Jm3Q+w4TS6pPCJM4DdOqrwY1+lBDk5bURXO0lP53Gdl+oZrKJh8BiUSFtBH
	 KmDovnzS8HaSA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C3C117E36CA;
	Thu,  5 Dec 2024 12:45:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 13/15] drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
Date: Thu,  5 Dec 2024 12:45:15 +0100
Message-ID: <20241205114518.53527-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_034552_622572_1E13908F 
X-CRM114-Status: UNSURE (   9.24  )
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

In preparation for adding the new HDMI TX v2 IP driver, assign the
pointer to the DDC adapter to struct drm_bridge during probe.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 1b23ab6969ec..4f708b04f5e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -410,6 +410,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.ddc = hdmi->ddc_adpt;
 
 	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
 	if (ret)
-- 
2.47.0


