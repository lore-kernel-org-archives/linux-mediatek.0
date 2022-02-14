Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48903C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9qLNinXCyQ79Z/4UEVU2WviHiL5hP+N0jLFk6udEa74=; b=Uw2z5XrjfWxKoX
	ldHRGVzVihq4/p1KhF+bZo9T+pOwk0d02OaeFyX0ZkWRV6dOYEpSxifCW/ijhXAugPO6a/fqL2qXy
	MMZWWRSTtIBGDrEnoz8fORzTC8rbzHjjv93BGkzyAG2Kru3y7SCsVozwUe8Ad+DKEZreeyA5fI4uS
	6mtLZ6auIVyGBEIASKzkSAKZ3RBr1l/UZY91Dt5M0Aki4sLj9Y3uMWcAuI0qwOZi9bvzSmHGsmx7w
	PFXXrrV3PH+Ih1hXfUjoOXJ4k///DqJ+mjpYu9W+yC8poYChjVbIaupgQfptmdjC2ZAeeSvQM3RY3
	DyvA3JKUwtksMZvkxK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXuh-00EJYv-4d; Mon, 14 Feb 2022 09:44:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXfG-00EEpX-02
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 09:28:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id d27so25732320wrc.6
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KStTxY9XVfRTy0jNX2vsLO+sccZ6tcP3+MXbZKzhUog=;
 b=RRmTvdH206P9cFagseNai5Qkh/Y3gvxhEZYcItRUx3Z9rEGdbrrj8+RMSJBQMDQ6Ti
 /KIXUPdzytBTQ0ksw/z3Qy94t1bAcG+ahCZXsO5wv9qTuL6ocOaX36x2KxnoYqtfHLdE
 nFbBnJLi7GqAsDtg8KQ+jO0zGiDqzGuWjOsar7FHjFlqRu68oHIVacm6iRybNRxOjlTl
 Qws1U8zaHo6hRAFlR2mkexqUTohqw7KSmEu/U0A0tn4DOBw/2YdbewEFZPnm+YTTOocr
 Wb13phnqsbITLtgPk2htUT1bTW3fTdqeyiUuqExmM68oWDlGVOFyFj6r2o+jO7ofAevM
 SIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KStTxY9XVfRTy0jNX2vsLO+sccZ6tcP3+MXbZKzhUog=;
 b=RenaXy5yerIrmqjdKvSt9z29fXe1ACcZYf5T0Cr3cJupwZDK73JxAOfYTDo4iQJuEI
 epNzDWclqDqRaFmIAXKeOQjErNsAGNKrDkuWZnOFUrEX9VAa4AnMyWGEWO7u3+Rfw8G+
 EyZ15lqZEesmLovRtYsh2gVW9EJ5hgm0TLb5r7caEMEQJhD8F9frlXcXzhD2XAXn2CtF
 M4OM/zPhcTWdXYUpyUEkWSKic7Hxo6DgM9PtnY665fNRbdtSWiKdB3Mdb6K6KiB3KqPx
 86AjAWk5QwUpdI57Simyt5AlFSqcY3PctNhMeZrKXKk91z+0FSvkZqkMmkypHCp5wzOT
 YiXg==
X-Gm-Message-State: AOAM532sTADSs/NwAEGW1jHLI527WUt7FKG9eDvKPeS+HCVeZrQjWlZl
 ZywqAQZaGLLqymR7SzmyV7r4Yw==
X-Google-Smtp-Source: ABdhPJyGQ/UgchooSSeFiGSP/VpjbWioBhy23eoI5rS7fHkwylzEihvSntyQAg6+0NSZa+CRPy+XjA==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr10579723wrr.141.1644830935927; 
 Mon, 14 Feb 2022 01:28:55 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id o14sm11182012wmr.3.2022.02.14.01.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:28:55 -0800 (PST)
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
Subject: [PATCH v4] drm/mediatek: allow commands to be sent during video mode
Date: Mon, 14 Feb 2022 10:27:42 +0100
Message-Id: <20220214092742.3461587-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_012858_114915_749EF199 
X-CRM114-Status: GOOD (  15.48  )
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
Changes in v4:
    - fix missing space:  "ret : recv_cnt;"
Changes in v3:
    - increase readability of code and use correct return variable (see
      comment
https://lore.kernel.org/linux-mediatek/4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com/)

Changes in v2:
    - update commit message to be more descriptive

 drivers/gpu/drm/mediatek/mtk_dsi.c | 33 ++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..abdd9cdebd86 100644
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
+	return ret < 0 ? ret : recv_cnt;
 }

 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
--
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
