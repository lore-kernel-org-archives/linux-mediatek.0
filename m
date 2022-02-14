Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC829C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mg6ryfQ1mRxOUncDtDeMsdMwH66McHzNDiQIF6xFb2A=; b=YHd2NKahFKPX1h
	bwcjUeFeF1Ijw+5QT68Jn+lFUzCuvEfNhp6EkBG6j7fzmqLJmzUGrZLsgaCMz0gZcON9qTHoVzV7l
	1eXzYEBacB9FMyhLmFlhyVfuhO2/4DMFpd1BcxBA7TOLm0JLmH7Hfq+dav7h8lVywFII9Ur1zKNPD
	dKVrClvZB8oLyUjrnT+Y2sz1p52aw3iNpp8DY6NDpKVRGnJ5+oG+HXadKsQqVUVMBbQM7fyoar349
	r/DV3Kq1s8dEFbZbkoC67b3gW0qgWS6IF1uomkRRQfve9e6hHySRMS6tNCrHgu9Hn3telBS2eCGli
	upsHtATh89U35a2MBRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJX5n-00E56i-Lo; Mon, 14 Feb 2022 08:52:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJX2Y-00E3Oq-Lv
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 08:49:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id o24so22909776wro.3
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 00:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDE2yNU8P4fdqNYbBxxI65OvUTBCmdeIAAj2LgzPKAs=;
 b=IbonyEV+9C8urgFscwP5SMpYJpuDdalopVZGuNmDcbOwE9H1M2gOG/T9JIe5n6zRfr
 gLeUe/kNbG05x3kGzKQl3tY2DUYimObTU0eFumzwlPdM/efcUmq8pQ8y30qYimDuQoHX
 l9AQMBqziiDy0cHCLrAqr5+O8aBiLcsGDZv9nv09B6wyPSYba3OaH05P9t3Z8ZQSAf5M
 nAiNLn0/lthA91A3AiMODe4afZk+GRyvjM5f16ipS8S9z5+abCM9d1slFnciY5kr7fxz
 cvY9aO09VsLyeeGVSrFww1O4EcX5untTiJaYwWDPDWaH16rCt3wViM95+wkVYDmBNPmw
 qtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDE2yNU8P4fdqNYbBxxI65OvUTBCmdeIAAj2LgzPKAs=;
 b=jcad8kJGaH/Chtk/eUOipB5kN0xlwkbGC+bjT52M4hsnlZhMWDgIbafOynKKFs2dzv
 qXos7r47nvplRUUJVEt/vYkzXcHKiod+r7hdcSJqtPGiDrawp2LPYEWWp+pAWjU7/zEG
 bMQO+RGtYxJI53zmDmSLyxKIGKw+516QLLSvzTp++3D2R5red/HTSgd9tR266HBrwulB
 lQitTc2EIA0eFRwP+WzIzMBXtcxh8C/OxQ5/awouYlGo+nL1qr/z5E0OUFuQHQNOIfFx
 q2jCriLSdZS9GP+/KOC9KtVCKi3YhtrmgUxfrCORwhv1qe0+LEEmmqJrPeWfbcsu88MO
 KzUg==
X-Gm-Message-State: AOAM5321b3Twga/a7GH8nQ/vihBIUoAdoZ+yzX7g+GaYcB13ui2WLic5
 Zvl2GJ4et8KrYrYB+0SAG6zDAw==
X-Google-Smtp-Source: ABdhPJyzL++bK8rE9MHyjyMK5tAC+ty5zZCR7BnVxJXu2kuykUHnUrWNsGeRiBmI+OFT7STG1OHTww==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr10275152wrr.168.1644828531216; 
 Mon, 14 Feb 2022 00:48:51 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id f8sm7189992wmq.19.2022.02.14.00.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:48:50 -0800 (PST)
From: Julien STEPHAN <jstephan@baylibre.com>
To: angelogioacchino.delregno@collabora.com
Cc: Julien STEPHAN <jstephan@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR MEDIATEK),
 linux-mediatek@lists.infradead.org (moderated list:DRM DRIVERS FOR MEDIATEK), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] drm/mediatek: allow commands to be sent during video mode
Date: Mon, 14 Feb 2022 09:47:36 +0100
Message-Id: <20220214084736.3374211-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_004858_824618_F179621E 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mipi dsi panel drivers can use mipi_dsi_dcs_{set,get}_display_brightness()
to request backlight changes.

This can be done during panel initialization (dsi is in command mode)
or afterwards (dsi is in Video Mode).

When the DSI is in Video Mode, all commands are rejected.

Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
temporarily to allow commands to be sent.

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v3:
    - increase readability of code and use correct return variable (see
      comment https://lore.kernel.org/linux-mediatek/4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com/)

Changes in v2:
    - update commit message to be more descriptive


 drivers/gpu/drm/mediatek/mtk_dsi.c | 33 ++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..7f1b2b7ed3fd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -891,24 +891,33 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
+	u32 dsi_mode;
+	int ret;

-	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
-		DRM_ERROR("dsi engine is not command mode\n");
-		return -EINVAL;
+	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
+	if (dsi_mode & MODE) {
+		mtk_dsi_stop(dsi);
+		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
+		if (ret)
+			goto restore_dsi_mode;
 	}

 	if (MTK_DSI_HOST_IS_READ(msg->type))
 		irq_flag |= LPRX_RD_RDY_INT_FLAG;

-	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
-		return -ETIME;
+	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
+	if (ret)
+		goto restore_dsi_mode;

-	if (!MTK_DSI_HOST_IS_READ(msg->type))
-		return 0;
+	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
+		recv_cnt = 0;
+		goto restore_dsi_mode;
+	}

 	if (!msg->rx_buf) {
 		DRM_ERROR("dsi receive buffer size may be NULL\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto restore_dsi_mode;
 	}

 	for (i = 0; i < 16; i++)
@@ -933,7 +942,13 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));

-	return recv_cnt;
+restore_dsi_mode:
+	if (dsi_mode & MODE) {
+		mtk_dsi_set_mode(dsi);
+		mtk_dsi_start(dsi);
+	}
+
+	return ret < 0 ? ret: recv_cnt;
 }

 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
--
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
