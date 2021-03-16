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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37F7C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 03:23:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F93664E31
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 03:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F93664E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLE0i4j4I0hlZJ2hxAEHfxGtiZg17hCQJYKdSmtQYMo=; b=USz3LIV8fD/oK1SLBIjnXRVV7
	MLRIEYFSv+t+gsmfKk5v3V63Zivnr88Q/AOZWUIjciIpPIPMw+RAJsEabRaTYuZY1CJT0TbbtiJs0
	z4/E+Nl/7V9vuY3cMJsj/nb+Vp+XglFdIJpAEscuNrqiOLOp9otmR18R9/zHwZ0J1uvKORJby8AEo
	1vKhDT2y7T4Q8lV1RPBDgPmmtVlv39/YhjTU38IvuJNKqHhQeHH+xvejMO+TjTOzs96+kkscsgOVr
	M6ivAOyQnWjwUfD5z9am/wc/2pKklbTcDeM5wpPJ9SIAwiWogxcPhyo88gPRkhYMMi8Qk1E0i9vFb
	eGkMoBo0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM0Is-00HJJ8-JF; Tue, 16 Mar 2021 03:23:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM0In-00HJIc-Sf; Tue, 16 Mar 2021 03:23:29 +0000
X-UUID: cf699a773e854a64922510b39609cac4-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BPe05RU6YgT8pCR87Ihti+XPjA+uPiv9/8LL4N3+wUY=; 
 b=rdyvtL3mK9SKbWp037ZTDmSc+FX51vFD6xl1XvA5dA+RJbHI+G8sezKgaLYb2pYFsKnWMF2SN98X55g3ekz196ZNHR0q81QCTbhtm1rziHiuccgEiiKK2xxwEKe31iun/KxssRpaFoNGx34lS5Kn/nNqB6S0DBOOVhWV92Arz1I=;
X-UUID: cf699a773e854a64922510b39609cac4-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 445293952; Mon, 15 Mar 2021 19:23:20 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 20:13:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 11:13:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 11:13:16 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>, "Jitao
 Shi" <jitao.shi@mediatek.com>
Subject: [v4, 1/2] drm/mediatek: mtk_dpi: Add check for max clock rate in
 mode_valid
Date: Tue, 16 Mar 2021 11:12:57 +0800
Message-ID: <1615864378-21754-2-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615864378-21754-1-git-send-email-rex-bc.chen@mediatek.com>
References: <1615864378-21754-1-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_032326_527617_81B471EA 
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
