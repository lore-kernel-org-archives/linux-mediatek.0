Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7013CC0219B
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWHJzsYYJTdCVHMNRU+3MiDtHxMFNyb94LDyd2w1CCo=; b=fHjoXRna//A6hiq4Rv0ryAI9/r
	pHv52HuA7kvXm41zeKK4wTD2n2TiGy0kGGF1N465u2ghrO1ydZqbqd7C5EPti70q2Wk38b+ocIsVR
	P/aoY0RLj4xkjwHsYhuzWCygl3HlaUZ1eY6lJFgoADDpZRuoMuXXwo80RAq3pxgZkhGMudZoyneU7
	42usV7u1HawJBi6sR1FPF3r4XTpT3vbZwI5ORsWRqGC5bAOfFQ6x6tZLAjro7szLrGxgGPJ2UMrQh
	FK7KqK47A0LCLsLwWHTXjM+JpPJ3jfR3US3ObmQrIgJK4/5K+0r2RjOwwWT5AMOyIdzPALwboRMPX
	rHjLtIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thp1n-00000003gxF-1UPK;
	Tue, 11 Feb 2025 12:06:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXS-00000003Yor-06Gz;
	Tue, 11 Feb 2025 11:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273688;
	bh=OpFE5KX05bhAFzZKJkZt1uiKDtHUNPBO/MfI26ZsSl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNAVUDw1zhiEbliVOc/tPzGZ5hdfIf+/5cPoSYvOVfeF+l0sQYvaMECB2UDMAEtZ1
	 8SS33RIE1+nFXnQZCA+4WnZZv+hoT11j2NEr0aYsWdnRQ4+ZmKBAB72KyzV5rqyaR1
	 5JTcBCDxi7X8eGfKVlZaovmmH5JkyJ2SMZ9SdlXnv4Qn95+trS0DP2zSc/FC4eiQnu
	 gaTI4c2OWDlmYsDXxNBzYNZlNwNtA+5XRtJ8D+oazT0WM4ZXuGrP7ahtNPXvRCPhGf
	 W3JZMrU9iVJVtnsrmBEHu70IN92LA/SrWn+7DFPiM8SZFbUPEYJMo4XCgC/EPB3hgG
	 QofI+08AOvGqA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 754C617E155D;
	Tue, 11 Feb 2025 12:34:47 +0100 (CET)
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
Subject: [PATCH v6 19/42] drm/mediatek: mtk_hdmi: Disgregate function mtk_hdmi_audio_set_param()
Date: Tue, 11 Feb 2025 12:33:46 +0100
Message-ID: <20250211113409.1517534-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033450_204472_452D03AF 
X-CRM114-Status: GOOD (  12.36  )
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

As a cleanup, and in preparation for splitting common bits of this
driver, disgregate the code in function mtk_hdmi_audio_set_param()
to the beginning and end of function mtk_hdmi_audio_hw_params().

In a later commit, the hw_params callback function will also be
disgregated so that the code will get two functions: one that
performs the generic hdmi_audio_param copy, and one that performs
IP specific setup, both of which will be called in the callback,
allowing all of the non IP version specific code to get moved in
a common file.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index e60d3cf7e83d..065750075d7c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1054,20 +1054,6 @@ static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
 	hdmi->audio_enable = false;
 }
 
-static int mtk_hdmi_audio_set_param(struct mtk_hdmi *hdmi,
-				    struct hdmi_audio_param *param)
-{
-	if (!hdmi->audio_enable) {
-		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
-		return -EINVAL;
-	}
-	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
-		param->aud_codec, param->aud_input_type,
-		param->aud_input_chan_type, param->codec_params.sample_rate);
-	memcpy(&hdmi->aud_param, param, sizeof(*param));
-	return mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
-}
-
 static int mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
 					    struct drm_display_mode *mode)
 {
@@ -1487,6 +1473,11 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 	struct hdmi_audio_param hdmi_params;
 	unsigned int chan = params->cea.channels;
 
+	if (!hdmi->audio_enable) {
+		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
+		return -EINVAL;
+	}
+
 	dev_dbg(hdmi->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		params->sample_rate, params->sample_width, chan);
 
@@ -1547,8 +1538,13 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 
 	memcpy(&hdmi_params.codec_params, params,
 	       sizeof(hdmi_params.codec_params));
+	memcpy(&hdmi->aud_param, &hdmi_params, sizeof(hdmi_params));
+
+	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
+		hdmi_params.aud_codec, hdmi_params.aud_input_type,
+		hdmi_params.aud_input_chan_type, hdmi_params.codec_params.sample_rate);
 
-	mtk_hdmi_audio_set_param(hdmi, &hdmi_params);
+	mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
 
 	return 0;
 }
-- 
2.48.1


