Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4636BC47409
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 14:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 198FD24679
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 14:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PtATsYFT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZFUA9+v1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 198FD24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuB/RlHfbZIxbt9ahxm0xFIga65ecABOIqmI0DosPCc=; b=PtATsYFTXr884p
	45njPVJFMqldoZz4GNatr7r3Z7taMSvQRXl28nse16SmeM152H4QZcWc1uyULZaDsuA6AudFgdus9
	jezVYlD0CEUqBRyyEHKak6hmiOdv2sFJjJ59NFXLQAj13hD28u4cfDoGz/RG9Exr4KMwNNSekYGX3
	AW3Oogt+D67A9TabYFeT8aertt4u+oKnCpRQ5LFCpSxirWyjRmS63EyJjLOtYUy0z/8hqgxlzSpoL
	7IfcugTrbKmv3Q63q6ogQZA0TlFNh46ZIVCaFEAaxpnWbPgxTbgvVRxxEwRiUvFa/b+L0lvv5Nk0b
	KKPAmuoS/5CkQ3jPGVww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irjER-00042j-Nj; Wed, 15 Jan 2020 14:01:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irjEP-00040p-9S
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 14:01:14 +0000
X-UUID: eb579e60ca364f1891dd87d5da870e13-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QePgB9tc4SkVnUDhhJ142OZUdU7BfgLSJrQxP6UdkNs=; 
 b=ZFUA9+v1PSIhtHPaig/HlNivwuaTN0jznf73ATuVmYO/r9lNgXI6nJSNVdx7/qyjhmsBzI2+G3NnrB0vOr7xBvSFxy4da1llhrETPZfuSrBWo68MRNwub9yLE/3Lv8PCnBrnr0uNJtG8inUheKVp2Tqdvqw0wwAwdCD+dRFoVw4=;
X-UUID: eb579e60ca364f1891dd87d5da870e13-20200115
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 563944172; Wed, 15 Jan 2020 06:01:10 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 06:01:09 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 15 Jan 2020 22:00:01 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 15 Jan 2020 22:01:17 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 6/8] drm/panel: support for boe,
 tv101wum-n53 wuxga dsi video mode panel
Date: Wed, 15 Jan 2020 21:59:56 +0800
Message-ID: <20200115135958.126303-7-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115135958.126303-1-jitao.shi@mediatek.com>
References: <20200115135958.126303-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 45C3408F2251DFBC84731F565A0C104C844D3A5E7B0F67857B8156C4EF8943012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_060113_334672_D87A1C71 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Boe,tv101wum-n53's connector is same as boe,tv101wum-nl6.
The most codes can be reuse.
So boe,tv101wum-n53 and boe,tv101wum-nl6 use one driver file.
Add the different parts in driver data.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 7f5d064bea69..0108bff283c5 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -593,6 +593,34 @@ static const struct panel_desc auo_kd101n80_45na_desc = {
 	.discharge_on_disable = true,
 };
 
+static const struct drm_display_mode boe_tv101wum_n53_default_mode = {
+	.clock = 159916,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 80,
+	.hsync_end = 1200 + 80 + 24,
+	.htotal = 1200 + 80 + 24 + 40,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 20,
+	.vsync_end = 1920 + 20 + 4,
+	.vtotal = 1920 + 20 + 4 + 10,
+	.vrefresh = 60,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc boe_tv101wum_n53_desc = {
+	.modes = &boe_tv101wum_n53_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 135,
+		.height_mm = 216,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = boe_init_cmd,
+};
+
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -725,6 +753,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "auo,kd101n80-45na",
 	  .data = &auo_kd101n80_45na_desc
 	},
+	{ .compatible = "boe,tv101wum-n53",
+	  .data = &boe_tv101wum_n53_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
