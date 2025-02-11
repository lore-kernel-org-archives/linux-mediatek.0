Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8CC0219B
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pu0PrB3DsAf+USf9Jw6q9yB//iKlOgvOZ7D7xh/DKHg=; b=vYIYiBOfuWUivF6vF1OvSTgPvM
	sbQalK081H8KZsaAS8pr3WvFD6aEaWcdsdAyTYvI5CUOnxWAF1V1uQHxXj+8VqonnIDYwxteF3Wfm
	Fy6s7cXZbBF0PSDYDlLFbHhkH/gx41K456euJW5X4g0Z8CsPiXs4P+54rIkb+VBu3AGyQ1TjD/VX2
	WZYx8C5n0Zo8PDNsS5jvOL0kt/HDMbBTJCTZCYBFTON2HjzBgHkS9LzIYUci0/0C3YSITQQmIjUO2
	E3DD9zhtOuD+cgwFiDsXONAAurdEBQiJiLix4ukv1vxq99hzds1is4dFFlkReGJmfBjJyJ5s3w2u2
	Q3ANDJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpNB-00000003lmi-3bmv;
	Tue, 11 Feb 2025 12:28:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXr-00000003ZEM-1G79;
	Tue, 11 Feb 2025 11:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273713;
	bh=6kVdSYZdtPCMQugvJ7RDPUMa0CBD62YwgIFWr+p05bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iSsfQvex+/mhKqVk/z+tVgm9ibss9DU9kY2hP+8lsfqStiOh+bfRa+l230EoST1y5
	 hkPZwQ4PiLhfGPMUCxJfPFwtwxMv8NZSrqsK+bFlJJYm6jey2qmZehKGPxCETYsefB
	 3Y2R8M4r+CpH6i7x1MKWPnDJBE23jBq64LuaIZjTgu7wwgQ8r6Z+Y0pRPVxFcCycpe
	 MQMl72oTLUqwPJO99Kp76g+s12tJU2re5ZDM+F0gRJHrx3kywazTR2Oo2uvEnHgQ4C
	 hRnnGUTO8nJ0Fc5JpCpCQ+t6t+33gvM3i/vWAZGj5u6ddg4sU31RpE9Bb6VozE/szW
	 7KbJdxsIB19Xw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84D8417E0EB8;
	Tue, 11 Feb 2025 12:35:12 +0100 (CET)
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
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v6 36/42] drm/mediatek: mtk_hdmi_common: Make CEC support optional
Date: Tue, 11 Feb 2025 12:34:03 +0100
Message-ID: <20250211113409.1517534-37-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033515_509078_87266070 
X-CRM114-Status: GOOD (  14.57  )
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

In preparation for adding a new driver for HDMIv2, for which CEC
is not strictly required, change the of_get_compatible_child()
failure error to -ENOTSUPP to be able to differentiate between
error conditions in mtk_hdmi_dt_parse_pdata().

In that case, if -ENOTSUPP is returned, this driver will print
an informative message saying that CEC support is unavailable,
as the devicetree node for that was not found, but after that,
function mtk_hdmi_dt_parse_pdata() will not return error to
the caller.

This will not change functionality of the mtk_hdmi (v1) driver
as that is still checking whether CEC is present and, if not,
will fail probing with an error saying that CEC is required
by HDMIv1.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 3dfde63198e5..5ea45608921c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -254,12 +254,11 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
 	if (!cec_np)
-		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
+		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
-			cec_np);
+		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
 		of_node_put(cec_np);
 		return -EPROBE_DEFER;
 	}
@@ -323,7 +322,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 
 	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
-	if (ret)
+	if (ret == -ENOTSUPP)
+		dev_info(dev, "CEC support unavailable: node not found\n");
+	else if (ret)
 		return ret;
 
 	return 0;
-- 
2.48.1


