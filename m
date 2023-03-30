Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E789DC761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SA7K1DKPDuni2CUxMFtz6LVzpvZXN/0fsgagtyIjImk=; b=nzvEUC9VmPlOfj1kEnFXvASBgB
	qwvShgV8sUZbbQadDLYAoKO5147sGskvm38ns+JIr7XAKDSmBEH6ZSoKjVlqTuER/WfFEYdNpMJ+r
	B3+Xq4KDv+LEdvTYmu/APym4w6EeFKGlh0IZobOtAMRBP2/8/Q4X1TPjWgDGLG+8TPGrhkv1ZGXC+
	iUg/U9tlPdKHy/rUNTaoWcWTwaebMbO3BOV56OzhYFw38CYjh00QihUFw9j6S3InUswHQHclXPsJ5
	wxXgJBvQLXkMksxT6OvrCOQj6WkOBiiOlEorGliyMq0m6qR6Xt0OMb7OA+DHggv9NvCP44rW6SQlI
	0RLFDbyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pht9H-0042ZJ-0O;
	Thu, 30 Mar 2023 14:21:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pht8t-0042Et-2w;
	Thu, 30 Mar 2023 14:20:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 166E9660000E;
	Thu, 30 Mar 2023 15:20:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680186042;
	bh=l7DxgZbkLf1a/NAX8ACnOYom2qi3A95N4rbvhFxlUX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G+N7Mm5p05ibAjldy0ztpMj2bog3cgiYrH6vEB4EDL/2kVNHu6Wdcd/0CHcpnOdy9
	 PkVQnTF0JZowrF0aJhNMRqikGo19zxRYJs4VBNIYHpcZkbxAwcxPJyWJsmTFP2WOKP
	 qRFrx3+GiO52hsZejPFSNbIxuhdi/m7u+k92akp2y3bLcHD+00rp0OeqLNsOoG3LJO
	 0/KzS5KP4piExrR/Fn3UropaOKfZRXV85m7umZK0qYDVE/pbOEkwZbFvHZk+cv1hxl
	 oATil3lGCIuzoPjuCCCGmLV+eF4EhdQB0opGbFPK3sFE2vW1gsrWQG7zqXXhRN4d5Z
	 Y4V30RHoIja9A==
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
Subject: [PATCH v2 3/8] drm/mediatek: dp: Always return connected status for eDP in .detect()
Date: Thu, 30 Mar 2023 16:20:30 +0200
Message-Id: <20230330142035.191399-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330142035.191399-1-angelogioacchino.delregno@collabora.com>
References: <20230330142035.191399-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_072044_104938_2D378F79 
X-CRM114-Status: UNSURE (   9.99  )
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


