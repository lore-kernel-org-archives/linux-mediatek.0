Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3084CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1M6SOZ2f3mGSESLLvwSWt2FR0E2pfAZrRLOeXesOvxU=; b=EibVZL5yuhhC2p
	pSo9kv1RkvQ44h8OooXYI+//4j5SA5tnl7X0sFxl2pZHzGeYZp2xyjm7gQfHjG/ncbdWUz/ExXmOA
	0M+gzSV6XSiYK78VwY4VI57plek7/0YLauRkE85tER+NjDdaIUUIGDbLEVgbQqxmGeb8WhMI9aGwx
	C1Yi1kTFM8EVNKVKqPBAJP/SLHSjZBvs4yljY7hjF+iRy7qf88XnsW/T/twRR+Nu31uhGClgUEyqF
	XLRf+FxEABPDt/uBELMX2Vic89/lnd9+rQc5jQVOIjZhClx/aUy1d5t8LOSVyAPOV0+rJwv1xf8+R
	lN90qTYbTotzz4TmSUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC1CF-003pCL-Rb; Mon, 24 Jan 2022 15:23:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC1CC-003pBG-5Z
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 15:23:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r22so6620957wra.8
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 07:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HoCKTXe73b6LRfZ2yfJRg1I4/082DZV6wf8n+3iyv3U=;
 b=DXFMPQqZJ0tKT0e1GyjQjptwLQE+7cHPUKFQBr+FQZeLkkE77ifDs5YB3GOF2h2Seh
 bgVGO7FGtiVNy3Mg062PsxfHEv95vu/7FuDahESCUCJFO1xZnM5iGo1upx+/pmKrvaB6
 CSUStL3QD1cOCq8v/QVMbsKXpJs2to+BaJ6sFHSy/sLvqdOxY9TIlA8KUI4Jrj4Zarux
 H3yY4uEjrAm5+t5Un+56XZMFQGrGxPIHVNdV9OMQtXbVEBu7Yd1EyCdR9Putf8JzYEQ7
 7zdN+Tdh+rSzq6KW5FsWt+yw5LYnZnrdPn/KOiBaoshGM3xl5+rV4Szbq/KKk17PP89m
 4qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HoCKTXe73b6LRfZ2yfJRg1I4/082DZV6wf8n+3iyv3U=;
 b=rR71NGK2T0Jwq3mBlA7os4R5GVEujFc8nKVj+xPztTDy3RwUcl63zwHgAennYLrROq
 9Tio+WZcRR5NwDKIoVgyjg2tN1otYL7U7afGhAP+rdhgTuhvppG/FtJkWzdf8kAjqRgK
 yazQTojZlSjpazPUcnyAt0GRo+fgktxOvnjowxRkcUWLLeRpwQxa+vEDNApS/NcHNr2B
 UDkFYID6Gk45SOkFrwDP4ZsbcIOKf0TSH4e49rqqordkwiduNUR7jlvq0oA998cxoFZX
 THz4YybqW43YsKm4H43+6l85GG1FhIYcd6C8eZwsn6MDA7vKLjXtc0cOVEqd52gPu0VO
 elkg==
X-Gm-Message-State: AOAM533rCDENT9+o8FusU9xZnnqUE+EHdUpzpgt9+TIUidQ3jeL5psJJ
 rWoMP73IfhjN+angPyoIPy7c3A==
X-Google-Smtp-Source: ABdhPJwuOAaYhLMRPNPmkmjib9G4ImRHpSjbxVDsSwkT8tECvG6c7seMPvA24tjBSCj5SaEJ5QMa9Q==
X-Received: by 2002:a5d:544c:: with SMTP id w12mr1825656wrv.47.1643037828828; 
 Mon, 24 Jan 2022 07:23:48 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id p14sm3806868wmq.40.2022.01.24.07.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 07:23:48 -0800 (PST)
From: Julien STEPHAN <jstephan@baylibre.com>
To: 
Cc: Julien STEPHAN <jstephan@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR MEDIATEK),
 linux-mediatek@lists.infradead.org (moderated list:DRM DRIVERS FOR MEDIATEK), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/mediatek: allow commands to be sent during video mode
Date: Mon, 24 Jan 2022 16:22:50 +0100
Message-Id: <20220124152250.441809-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_072352_291717_BFE39187 
X-CRM114-Status: GOOD (  13.85  )
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

When the DSI is in video mode, all commands are rejected.

Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
temporarily to allow commands to be sent.

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 34 ++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..7d66fdc7f81d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -891,24 +891,34 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
-
-	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
-		DRM_ERROR("dsi engine is not command mode\n");
-		return -EINVAL;
+	u32 dsi_mode;
+
+	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
+	if (dsi_mode & MODE) {
+		mtk_dsi_stop(dsi);
+		if (mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500)) {
+			recv_cnt = -EINVAL;
+			goto restore_dsi_mode;
+		}
 	}
 
 	if (MTK_DSI_HOST_IS_READ(msg->type))
 		irq_flag |= LPRX_RD_RDY_INT_FLAG;
 
-	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
-		return -ETIME;
+	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0) {
+		recv_cnt = -ETIME;
+		goto restore_dsi_mode;
+	}
 
-	if (!MTK_DSI_HOST_IS_READ(msg->type))
-		return 0;
+	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
+		recv_cnt = 0;
+		goto restore_dsi_mode;
+	}
 
 	if (!msg->rx_buf) {
 		DRM_ERROR("dsi receive buffer size may be NULL\n");
-		return -EINVAL;
+		recv_cnt = -EINVAL;
+		goto restore_dsi_mode;
 	}
 
 	for (i = 0; i < 16; i++)
@@ -933,6 +943,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
+restore_dsi_mode:
+	if (dsi_mode & MODE) {
+		mtk_dsi_set_mode(dsi);
+		mtk_dsi_start(dsi);
+	}
+
 	return recv_cnt;
 }
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
