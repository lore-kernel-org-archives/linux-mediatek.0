Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F01BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 03:34:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EEE6500A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 03:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EEE6500A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLE0i4j4I0hlZJ2hxAEHfxGtiZg17hCQJYKdSmtQYMo=; b=JqDb67nGVAX+LCqxUyrNd8TWM
	cxQG6fuiGEIunol4B1itCytKYXyUlvjVMap9gWyEzWYL62Acs2AkoO5W3QFe59ULYEONmH+evO1b/
	/pss0Y3RVxfXPGTzOWx04RqadcOzhN11UN1AzO58j0ug4W6sUWz17CV4L5PGkqOoA9KEX/dC5yHfV
	9TDaaAm8miCYgYcwGAYGjfo91B5I/HWwEitNiB3l0U6LGoBEfojtzLhBqdhKl3WVddu++YtDqUvNM
	NOGjh3R4kx08Evyc9wBN6o67OvuAZDvkP2puYE+LtNkcgzkdIHClbUDKfsSYmbI7W6CojweHO3bKE
	xH6uk2fGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM0TQ-00HKR7-So; Tue, 16 Mar 2021 03:34:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM0TJ-00HKQ0-AH; Tue, 16 Mar 2021 03:34:21 +0000
X-UUID: 3480916be1514a6494fbaaafaa8bce5f-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BPe05RU6YgT8pCR87Ihti+XPjA+uPiv9/8LL4N3+wUY=; 
 b=cgkeIFus7WqRPhKQ0nWnTu2wSYvEjfMI6VO7qaA11Mb3+Iy2NjPRgvjBIyWojn5ZkLe76KJWzOTSrUvS8nazM8c8e/FWUk29UB2dn5jLE1YXOqX3JJGKnFyt2lQes2u05Ckl18Ak+ZH+IU6vslTcnvkkLJ1OO3Zhh4xhwB6ZAiE=;
X-UUID: 3480916be1514a6494fbaaafaa8bce5f-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1130078355; Mon, 15 Mar 2021 19:34:15 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 20:26:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 11:26:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 11:26:39 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>, "Jitao
 Shi" <jitao.shi@mediatek.com>
Subject: [RESEND, v4,
 1/2] drm/mediatek: mtk_dpi: Add check for max clock rate in mode_valid
Date: Tue, 16 Mar 2021 11:26:18 +0800
Message-ID: <1615865179-22051-2-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615865179-22051-1-git-send-email-rex-bc.chen@mediatek.com>
References: <1615865179-22051-1-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_033418_395893_929E1159 
X-CRM114-Status: GOOD (  11.63  )
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

Add per-platform max clock rate check in mtk_dpi_bridge_mode_valid.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index b05f900d9322..e1945d4bd7c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -120,6 +120,7 @@ struct mtk_dpi_yc_limit {
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
 	u32 reg_h_fre_con;
+	u32 max_clock_khz;
 	bool edge_sel_en;
 };
 
@@ -557,9 +558,22 @@ static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
 }
 
+static enum drm_mode_status
+mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_mode *mode)
+{
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+
+	if (dpi->conf->max_clock_khz && mode->clock > dpi->conf->max_clock_khz)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.attach = mtk_dpi_bridge_attach,
 	.mode_set = mtk_dpi_bridge_mode_set,
+	.mode_valid = mtk_dpi_bridge_mode_valid,
 	.disable = mtk_dpi_bridge_disable,
 	.enable = mtk_dpi_bridge_enable,
 };
@@ -668,17 +682,20 @@ static unsigned int mt8183_calculate_factor(int clock)
 static const struct mtk_dpi_conf mt8173_conf = {
 	.cal_factor = mt8173_calculate_factor,
 	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 300000,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
 	.cal_factor = mt2701_calculate_factor,
 	.reg_h_fre_con = 0xb0,
 	.edge_sel_en = true,
+	.max_clock_khz = 150000,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
 	.cal_factor = mt8183_calculate_factor,
 	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 100000,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
