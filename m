Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01B0C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlfPqWT97z1YROQRQvh6WsNP+KyqyN3e7xtJb7b7v5E=; b=SZhZnuz/XLJO1jkECMH84O5ltB
	7vW+uRawSo6mvomBKCRg1kHQ8m4ZCJusxGlUa+wiT2rinn7vsXdkLwDDPUh+mHMFV8ZWIJRA4ai9x
	TF2j1TlpjOOd7+Wy2OPMMhvr0mNGXf1JN1X6ScVJguj8e/2exXogT1LyuD/LDTDwb431cG0wYYMfT
	rQz6gRFiBk9WpoOisSeWKk5c5MDFtRk8RWg6mcpSsggCg8qR71cgV1a4wzOVRBurqdcUklrt10CEa
	5cmNOXiR2P4nkKNHXbZeL0Y5gpex9tKIuDjLD4Z/4zqQ93SotfrmMrYpngv3XhryphQqUxpHYoYkd
	xzss03ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkk-004ODo-1A;
	Wed, 03 May 2023 11:34:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkc-004O8O-0R;
	Wed, 03 May 2023 11:34:28 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CBFE56603137;
	Wed,  3 May 2023 12:34:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113662;
	bh=Gj6A+un8r1QWElAagp5zDVAgfl0pGla/oA/vRjwfzxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbCuGRvcGZM3gl/VcwXhnEvM3JsvydoH6TP/0t+ncFEZqbKdHKjJf73zqAPPzFGW2
	 nJb6xnVZhrj48PS+tPMX0M9/acadRZOg8lcrb/+KJ2KBclN+dDP175/MdxII2Ymkjs
	 9RdpRCYeJbB18jj6RE6+ylyJca9UCZaqh/PL7y4ELbMScGnjrVE+BR/z+Zk7aWMAfY
	 rkzuXMboJZHL1Aza50FpNuMspCTVN8wPuNnh1At2iYvpH6Wm2tDlxuh1c1gd78rC66
	 EvwCXq3sOiwfLU6HZ0utyT8V6/ntdsT6ZlsszEzNPo5KEf1zfUrm73nvvu0EPlRGPq
	 qmjKZjSeVITmg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	chunxu.li@mediatek.com,
	tinghan.shen@mediatek.com,
	error27@gmail.com,
	ribalda@chromium.org,
	yc.hung@mediatek.com,
	Allen-KH.Cheng@mediatek.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sound-open-firmware@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH 1/5] ASoC: SOF: mediatek: mt8195: Use snd_sof_ipc_process_reply() helper
Date: Wed,  3 May 2023 13:34:09 +0200
Message-Id: <20230503113413.149235-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_043426_304824_7F70A20A 
X-CRM114-Status: GOOD (  13.66  )
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

Function mt8195_get_reply() performs practically the same operation
as the common snd_sof_ipc_get_reply() helper: removing the custom
function allows us to simply perform a call to the sof-priv helper
snd_sof_ipc_process_reply(), simplifying and shortening this driver
and getting all the benefits of using a common API.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 36 +-------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 42bae574c87a..7d6a568556ea 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,47 +49,13 @@ static int mt8195_send_msg(struct snd_sof_dev *sdev,
 	return mtk_adsp_ipc_send(priv->dsp_ipc, MTK_ADSP_IPC_REQ, MTK_ADSP_IPC_OP_REQ);
 }
 
-static void mt8195_get_reply(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_ipc_msg *msg = sdev->msg;
-	struct sof_ipc_reply reply;
-	int ret = 0;
-
-	if (!msg) {
-		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
-		return;
-	}
-
-	/* get reply */
-	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
-	if (reply.error < 0) {
-		memcpy(msg->reply_data, &reply, sizeof(reply));
-		ret = reply.error;
-	} else {
-		/* reply has correct size? */
-		if (reply.hdr.size != msg->reply_size) {
-			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
-				msg->reply_size, reply.hdr.size);
-			ret = -EINVAL;
-		}
-
-		/* read the message */
-		if (msg->reply_size > 0)
-			sof_mailbox_read(sdev, sdev->host_box.offset,
-					 msg->reply_data, msg->reply_size);
-	}
-
-	msg->reply_error = ret;
-}
-
 static void mt8195_dsp_handle_reply(struct mtk_adsp_ipc *ipc)
 {
 	struct adsp_priv *priv = mtk_adsp_ipc_get_data(ipc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
-	mt8195_get_reply(priv->sdev);
-	snd_sof_ipc_reply(priv->sdev, 0);
+	snd_sof_ipc_process_reply(priv->sdev, 0);
 	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
 }
 
-- 
2.40.1


