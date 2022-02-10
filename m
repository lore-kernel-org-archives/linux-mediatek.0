Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2444FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kejPRaBejDOBfsK6PXyVW8sRUHj7eeqe8AtCkQ+EnGA=; b=YS7jxX0s1Fy+05
	cR2SJyrNu76ZZciDT3hosrRCJAlz3oFEHkCFbeQ9jVUmEpcLzLpW6HF4f9Gtj/D4WDFZ2s/OO63MZ
	YTmtDGnKKHB3nHOsdMPFuq9VXlw1xwaF7VZmfBGMUstUH4eY8yi6vP1UAk7BSfeWk7ZqI+C/evxa2
	bOSUABvGFnZ19FnHtksYGHB5VWu2FALANgXBW7cW9et3q/+f6fNRUuqCeu0yfX07u8kH/VUl2ZS9C
	H6C/tte4YFvJCIYuotRar84c8r1AT+4RmixY7BZYYJVQmIXkxExb/yZPhDNHevScxeHs+5Psp3dwY
	8IZaTAliLVDLYgf9Hyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI8rc-003n3K-Fl; Thu, 10 Feb 2022 12:47:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI8rY-003n28-Js
 for linux-mediatek@lists.infradead.org; Thu, 10 Feb 2022 12:47:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso3870451wme.1
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Feb 2022 04:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mntgPn8Qh+Nga93zR2phIa+qhcyXEPyRC4rw0pc7QyU=;
 b=CBWimZf5de7rEjmsIbxW3CkZ60rLERED1BkV9KD7RlFFX1/jSQ0iQujTrsjEqdyatc
 TGucGngeS0HAEfQdmLnuUU9bJYzv7aeAxdxRp3pVk2sfsjvLg+iqX9DDb7KH3YkypUJr
 oJgdm4QB/zazezXnNWw/2NGivfLqUJ5hD+6MHG8JsjA+SxJ9CZZRttVTo/z9Mof1cyDX
 /tUdxtb5mjbVUUppHuRWzxdARUE+sWUAOKJFgjgi4D1pZaWfhTpLSQTEOGp27Oc3ss6c
 8CHO5LzVKWymSWP06deo8tlSVJQO21bHmYgdFZIUwRtYgm0Rwc0ivlRgKF7Cwc1wjRKH
 lA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mntgPn8Qh+Nga93zR2phIa+qhcyXEPyRC4rw0pc7QyU=;
 b=MS/XquanuPkhlzTVrKoVo7ezlMS2NrjxFpOUhWbvZkr0HTTiCIO6EIecfuTx5ed63o
 4Qj1KljU1QDJR6w4h87DfxKbpsOTfn4nEwn9t1ZNqRBXnKB7gytudjUnoS0tRCxBXhd8
 ebnPBxUL8y9VZH7M94XSBnnqAkBwImE3FL+rR6MFJenJCDqx2vm7QHxZP/UHfBC1H/0E
 frnaq6f53swisiB1abTaDzh7zKAFmDOnWIK3OorNqoSrlnkCxwy8v49Eg/7XCfz22qsC
 NRExUPWFGOAfUQTsq/U968AHLMu955eNcgG8vKzdR/iAG3WtA0SbNRAlrP8QXQXCeniC
 5IFw==
X-Gm-Message-State: AOAM531cfhrjFXkIPAVjaPKkTVjU+zNo+MFOQm1c4ItS8/4Fx2j+25BV
 0RbkuhMZDtn8tF9oaizD5HqtBA==
X-Google-Smtp-Source: ABdhPJx1QVGMDH3bSUlRi8xCAZYjMCX58cJhV8Nzi0bBPvuN8l8LEJFyXhAp8Uy4QXE2zk+rqIBFWQ==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr2050270wmh.67.1644497270112; 
 Thu, 10 Feb 2022 04:47:50 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id 24sm1331687wmf.48.2022.02.10.04.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:47:49 -0800 (PST)
From: Julien STEPHAN <jstephan@baylibre.com>
To: ck.hu@mediatek.com
Cc: Julien STEPHAN <jstephan@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR MEDIATEK),
 linux-mediatek@lists.infradead.org (moderated list:DRM DRIVERS FOR MEDIATEK), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/mediatek: allow commands to be sent during video mode
Date: Thu, 10 Feb 2022 13:46:38 +0100
Message-Id: <20220210124638.2330904-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_044752_715642_BEBD136E 
X-CRM114-Status: GOOD (  14.91  )
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
Changes in v2:
  - update commit message to be more descriptive

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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
