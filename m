Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA357C77B6C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 10:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SA7K1DKPDuni2CUxMFtz6LVzpvZXN/0fsgagtyIjImk=; b=yEtUiOqCcEWtFWjQqGdoBDmnCi
	zxShn1dwjrBkWx1FhPT+AXSE++wiFQuUHossY4dTZi5KuS8FVylW3C9ff0y/tb67AwzG428ewZlQR
	YZSNHZj1F74EDHCq9ciOAbKLg2SRZa5phw7qtwYO1EM/iMLA+z19b4FURHTNDDriZtCE15HCdhpze
	MiIpEzvBOVtKmveXjNhJPHsm6MNgxXhREjpHZDCRjdpAsUBWBU4RGwwe6zE8tYLFnzLdnCUbYybyF
	w3KbapPulQ2zQTjl84IvMBpF8wDwA/uMUXp8xmsnOmQdIUPIDJMPq9vxDiwGQaeVSTwX478jMD9Dh
	n4c7woZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeD6-000wLo-1V;
	Tue, 04 Apr 2023 10:48:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeCx-000wDz-2O;
	Tue, 04 Apr 2023 10:48:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BF23966031BE;
	Tue,  4 Apr 2023 11:48:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680605288;
	bh=l7DxgZbkLf1a/NAX8ACnOYom2qi3A95N4rbvhFxlUX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qcj4Qi+79FHY08lDUv+IuJKMzkByf37aVI6u5qC0jUQt3ZRcXDE1iKNkwKAq2Bvsd
	 dbjH9R/pjLEzjaFHWiA1KrsQ6XFOB/gBkX2GLDIE5Z48yMBCBZN7dbrPJUzaPnWif0
	 ob71RyaxPPNz7znBU21XEctjcQlz+z4Ifal8886rn3voYj0vU5gIMlXRbKIhPqAow6
	 qr9M8tMGcwcc9u0QR11iqc5qWFcaktMOak5trBzLhY2hgYB+l1lshhgO8eIffXUu/R
	 GpTp/MpfsBcxGstaOgjf0AIpxY8ve//lyl+l707t1O4al5VMbv0FvTLYyuCmKLqDWC
	 t7uuXgEBymStA==
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
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v3 3/9] drm/mediatek: dp: Always return connected status for eDP in .detect()
Date: Tue,  4 Apr 2023 12:47:54 +0200
Message-Id: <20230404104800.301150-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_034811_950709_0A9B5D25 
X-CRM114-Status: GOOD (  10.49  )
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

If this is an eDP panel it's not removable, hence it's always connected:
as a shortcut, always return connector_status_connected in the .detect()
callback for eDP connector, avoiding a poweron, a check for sink count
and a poweroff.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 76ea94167531..c82dd1f0675d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1957,6 +1957,9 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		return connector_status_connected;
+
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
 
-- 
2.40.0


