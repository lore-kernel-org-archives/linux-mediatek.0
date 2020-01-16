Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D5BC32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CFAA2053B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ag56ykfY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ukPNW743"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CFAA2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IY4Rn/Zm6B/+1DBsJFOrtA5FE2hRVJGbAwVc7EUD+0M=; b=ag56ykfYPG9ubo
	631Dp4ucYvOWmDQU7ODo8GNyV1kHu4ZMNIyn22ki54xNopdqzEV2iYYN/GB42OJ6yO20xI8yjplBL
	4f+VsjauWe+WPahbn8rOGFQAh9vaGcArSe79gmzA3dc+b9Pf0MEaohBerTn60Uh7oLOfLG3DA0unI
	KJGhTL75ZjHvDeKWh00r60nVWNmpAjUGt/Jv74CU7UorYbPf/82AhgZuMszMxAVFj4ERtGjCa5vMU
	ZEYpOZHoT8V0LmRFJzrmcfcy3s4rR/g/xKjSinBa6oeVXztRguAkwQaACrr3iMfR0OmdIEjyl9cCY
	LC4lcKOlTun2TmdTh+wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iruhB-0005Lp-0r; Thu, 16 Jan 2020 02:15:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iruh6-0005HA-5a
 for linux-mediatek@lists.infradead.org; Thu, 16 Jan 2020 02:15:40 +0000
X-UUID: 7cb0d67b3ff6413bb14865aac7f70d41-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x3qlvVjA+1w0zdnvIBDb63N00F9OElYvDcvNejnWj1k=; 
 b=ukPNW743mG1ol5zw6UA/g5DtX0+C0JSDNvgrT2V8KyYnUw3+HuTT5u7rCdVL8eCZ30/bVAV1mik8Pwb76bTeYFB1UapOmHWZLkw+KR5Y5ncLE6boKDA3p6HFqNsvPTMiJ6SCaLOcmZe6rzm03xsaObyr7rujRxqGmKTNi5fA8Rg=;
X-UUID: 7cb0d67b3ff6413bb14865aac7f70d41-20200115
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 327513084; Wed, 15 Jan 2020 18:15:28 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 18:15:26 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 16 Jan 2020 10:15:52 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 16 Jan 2020 10:14:30 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 5/5] drm/panel: support for auo,
 b101uan08.3 wuxga dsi video mode panel
Date: Thu, 16 Jan 2020 10:15:11 +0800
Message-ID: <20200116021511.22675-6-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200116021511.22675-1-jitao.shi@mediatek.com>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CCE803169FB42EFBDFD24E123096C487210EB1B57222C47804A6D756F52EC3C02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_181536_217728_C8E5F602 
X-CRM114-Status: UNSURE (   7.67  )
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

Auo,auo,b101uan08.3's connector is same as boe,tv101wum-nl6.
The most codes can be reuse.
So auo,b101uan08.3 and boe,tv101wum-nl6 use one driver file.
Add the different parts in driver data.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index e77ea577d93a..01faf8597700 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -377,6 +377,53 @@ static const struct panel_init_cmd auo_kd101n80_45na_init_cmd[] = {
 	{},
 };
 
+static const struct panel_init_cmd auo_b101uan08_3_init_cmd[] = {
+	_INIT_DELAY_CMD(24),
+	_INIT_DCS_CMD(0xB0, 0x01),
+	_INIT_DCS_CMD(0xC0, 0x48),
+	_INIT_DCS_CMD(0xC1, 0x48),
+	_INIT_DCS_CMD(0xC2, 0x47),
+	_INIT_DCS_CMD(0xC3, 0x47),
+	_INIT_DCS_CMD(0xC4, 0x46),
+	_INIT_DCS_CMD(0xC5, 0x46),
+	_INIT_DCS_CMD(0xC6, 0x45),
+	_INIT_DCS_CMD(0xC7, 0x45),
+	_INIT_DCS_CMD(0xC8, 0x64),
+	_INIT_DCS_CMD(0xC9, 0x64),
+	_INIT_DCS_CMD(0xCA, 0x4F),
+	_INIT_DCS_CMD(0xCB, 0x4F),
+	_INIT_DCS_CMD(0xCC, 0x40),
+	_INIT_DCS_CMD(0xCD, 0x40),
+	_INIT_DCS_CMD(0xCE, 0x66),
+	_INIT_DCS_CMD(0xCF, 0x66),
+	_INIT_DCS_CMD(0xD0, 0x4F),
+	_INIT_DCS_CMD(0xD1, 0x4F),
+	_INIT_DCS_CMD(0xD2, 0x41),
+	_INIT_DCS_CMD(0xD3, 0x41),
+	_INIT_DCS_CMD(0xD4, 0x48),
+	_INIT_DCS_CMD(0xD5, 0x48),
+	_INIT_DCS_CMD(0xD6, 0x47),
+	_INIT_DCS_CMD(0xD7, 0x47),
+	_INIT_DCS_CMD(0xD8, 0x46),
+	_INIT_DCS_CMD(0xD9, 0x46),
+	_INIT_DCS_CMD(0xDA, 0x45),
+	_INIT_DCS_CMD(0xDB, 0x45),
+	_INIT_DCS_CMD(0xDC, 0x64),
+	_INIT_DCS_CMD(0xDD, 0x64),
+	_INIT_DCS_CMD(0xDE, 0x4F),
+	_INIT_DCS_CMD(0xDF, 0x4F),
+	_INIT_DCS_CMD(0xE0, 0x40),
+	_INIT_DCS_CMD(0xE1, 0x40),
+	_INIT_DCS_CMD(0xE2, 0x66),
+	_INIT_DCS_CMD(0xE3, 0x66),
+	_INIT_DCS_CMD(0xE4, 0x4F),
+	_INIT_DCS_CMD(0xE5, 0x4F),
+	_INIT_DCS_CMD(0xE6, 0x41),
+	_INIT_DCS_CMD(0xE7, 0x41),
+	_INIT_DELAY_CMD(150),
+	{},
+};
+
 static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 {
 	return container_of(panel, struct boe_panel, base);
@@ -621,6 +668,34 @@ static const struct panel_desc boe_tv101wum_n53_desc = {
 	.init_cmds = boe_init_cmd,
 };
 
+static const struct drm_display_mode auo_b101uan08_3_default_mode = {
+	.clock = 159667,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 60,
+	.hsync_end = 1200 + 60 + 4,
+	.htotal = 1200 + 60 + 4 + 80,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 34,
+	.vsync_end = 1920 + 34 + 2,
+	.vtotal = 1920 + 34 + 2 + 24,
+	.vrefresh = 60,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc auo_b101uan08_3_desc = {
+	.modes = &auo_b101uan08_3_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 135,
+		.height_mm = 216,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = auo_b101uan08_3_init_cmd,
+};
+
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -756,6 +831,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "boe,tv101wum-n53",
 	  .data = &boe_tv101wum_n53_desc
 	},
+	{ .compatible = "auo,b101uan08.3",
+	  .data = &auo_b101uan08_3_desc
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
