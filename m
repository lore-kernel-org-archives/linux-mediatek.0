Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UPcwSf/6QO4HpZ12PIq0E8dxfa+SOYiABgHmOP2/u74=; b=A1HkWMpo/YZ5A2OiMswqG68fLH
	QNeY2oIjYWbPTmtmPrLvvPAkw/P6b3d6LLus/d7zruKOPvvlUr6s7xJ8p4uGqDFlVrEc/NwWQBF7C
	r9ZC7kSAyvmMx8rijtzEa/YQQl8/mNE3eOAb8RDOPhsalvUfY/xq9VuY2UM8QI0nUCMt7ZhUfgqX+
	U7KEixg8uIpZTLNlWuJV95PP9iKt3+iSicIl4TMmyINklYAzMuMxmLGcBgEGlCsJEYOgHxBYmGyAC
	Jpnt4o9NNWrOHE1kKKXBMbV/7yb1DS/7Wev3dqBjKG21rZ5fcW57YtLJh0rqYyuDrVTfeKajV4jtV
	w3YMJLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4JCS-00EKzA-15; Thu, 23 Jun 2022 09:32:32 +0000
Received: from 60-251-196-230.hinet-ip.hinet.net ([60.251.196.230] helo=ironport.ite.com.tw)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4JCG-00EKwI-Re; Thu, 23 Jun 2022 09:32:23 +0000
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 23 Jun 2022 17:32:12 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw [192.168.65.58])
	by mse.ite.com.tw with ESMTP id 25N9W7mn009951;
	Thu, 23 Jun 2022 17:32:07 +0800 (GMT-8)
	(envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 23 Jun 2022 17:32:07 +0800
From: allen <allen.chen@ite.com.tw>
To: 
CC: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@google.com>,
        Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
        Hermes Wu <Hermes.Wu@ite.com.tw>,
        Kenneth Hung <Kenneth.Hung@ite.com.tw>,
        Allen-kh Cheng
	<allen-kh.cheng@mediatek.corp-partner.google.com>,
        Pin-yen Lin
	<treapking@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil
 Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman
	<jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie
	<airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        "open list:DRM DRIVERS"
	<dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH] drm/bridge: add it6505 driver read config from dt property
Date: Thu, 23 Jun 2022 17:31:54 +0800
Message-ID: <20220623093154.52701-1-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 	532277101033EC0C5799347BF5418EF1C05372C83BD9777B75A722A680D091252002:8
X-MAIL: mse.ite.com.tw 25N9W7mn009951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_023221_203799_F492A86A 
X-CRM114-Status: GOOD (  11.23  )
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

From: allen chen <allen.chen@ite.com.tw>

add read max-lane and max-pixel-clock from dt property

Signed-off-by: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 35 ++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4b673c4792d77..c9121d4635a52 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -436,6 +436,8 @@ struct it6505 {
 	bool powered;
 	bool hpd_state;
 	u32 afe_setting;
+	u32 max_dpi_pixel_clock;
+	u32 max_lane_count;
 	enum hdcp_state hdcp_status;
 	struct delayed_work hdcp_work;
 	struct work_struct hdcp_wait_ksv_list;
@@ -1466,7 +1468,8 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
 	it6505->lane_count = link->num_lanes;
 	DRM_DEV_DEBUG_DRIVER(dev, "Sink support %d lanes training",
 			     it6505->lane_count);
-	it6505->lane_count = min_t(int, it6505->lane_count, MAX_LANE_COUNT);
+	it6505->lane_count = min_t(int, it6505->lane_count,
+				   it6505->max_lane_count);
 
 	it6505->branch_device = drm_dp_is_branch(it6505->dpcd);
 	DRM_DEV_DEBUG_DRIVER(dev, "Sink %sbranch device",
@@ -2895,7 +2898,7 @@ it6505_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		return MODE_NO_INTERLACE;
 
-	if (mode->clock > DPI_PIXEL_CLK_MAX)
+	if (mode->clock > it6505->max_dpi_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
 	it6505->video_info.clock = mode->clock;
@@ -3057,6 +3060,8 @@ static void it6505_parse_dt(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
 	u32 *afe_setting = &it6505->afe_setting;
+	u32 *max_lane_count = &it6505->max_lane_count;
+	u32 *max_dpi_pixel_clock = &it6505->max_dpi_pixel_clock;
 
 	it6505->lane_swap_disabled =
 		device_property_read_bool(dev, "no-laneswap");
@@ -3072,7 +3077,31 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	} else {
 		*afe_setting = 0;
 	}
-	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %d", *afe_setting);
+
+	if (device_property_read_u32(dev, "max-lane-count",
+				     max_lane_count) == 0) {
+		if (*max_lane_count > 4 || *max_lane_count == 3) {
+			dev_err(dev, "max lane count error, use default");
+			*max_lane_count = MAX_LANE_COUNT;
+		}
+	} else {
+		*max_lane_count = MAX_LANE_COUNT;
+	}
+
+	if (device_property_read_u32(dev, "max-dpi-pixel-clock",
+				     max_dpi_pixel_clock) == 0) {
+		if (*max_dpi_pixel_clock > 297000) {
+			dev_err(dev, "max pixel clock error, use default");
+			*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
+		}
+	} else {
+		*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %u, max_lane_count: %u",
+			     it6505->afe_setting, it6505->max_lane_count);
+	DRM_DEV_DEBUG_DRIVER(dev, "using max_dpi_pixel_clock: %u kHz",
+			     it6505->max_dpi_pixel_clock);
 }
 
 static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
-- 
2.25.1


