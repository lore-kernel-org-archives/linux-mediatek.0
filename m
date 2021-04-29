Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60237C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 03:48:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C763161450
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 03:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C763161450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yMzyzomkt94s9EKmBujBEeC4HoGvZPNxYslTCIFD8rA=; b=ctQhd9fJVLs0iGSkmqUMUE3Cr
	cM7pN0Koxe1rp4yzHEGqLVj/6CK375m5cz0hTwvzEApjryCNp5EtspvERo0x4ruBUlFDohTEUuERs
	FRd3s01b9r2Lps2tVel8j1S0rXAjtslbDXGan+wPPMCw2S7PNdYQ/KCDoKA11vK7ej9SJ4t38UT8W
	VTO9Bj4ycAIF8DLn1NyYXSaKsITRei3UJBuWzsMXGVCPBzGtunnFkpeW9k9H0UJtpMYFtxdhYXp/i
	YNkbKP5nrCJfCS6SM7MI5JiSF4kGf2wRZl5zs0FvSjiX3TrK2/0oXlCRI0qZNOGO7ZodbhJdhurOe
	BMjr0qS3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbxea-004non-Ts; Thu, 29 Apr 2021 03:47:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbxdH-004nhf-AN; Thu, 29 Apr 2021 03:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Bkvd93yKu2uEmla9e30/yYGvZ0MOYFr0iUFIHbgWIfs=; b=BmSjpm44fWUug0mEjEj5Vakbsz
 IZeFpKQi+ZsP95a6SObRO1koa+xAc6Ru4i1XwAOYKhT+S419Xp3pExMBD7RZAqawWEKTdDorw56pC
 VCbLGi9PZ6kieyVizXvd5vld6Anrvw6hYQBKSgM0a3sfbbcEWjgCcj/yJBTMHxasHY4Sd38zM6j0W
 JktMlQChOVLMJSI0m9QbnuEQha9xWNN9UxyyEhP/k+8quKSzr467ggXo6i3fwHFj/mo+woFw4hu60
 kUrMBomfhBxMHvpG9MgrUlu7yNMLWRI+rItsB5uZNvJJA8xRmTSaNjzJ2m1x32sK4Mvd9bKfI7Sp3
 Tdw52Svg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbxdE-000LUx-0q; Thu, 29 Apr 2021 03:46:29 +0000
X-UUID: 64cb434bbdae4836bc55e94fba14fd42-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Bkvd93yKu2uEmla9e30/yYGvZ0MOYFr0iUFIHbgWIfs=; 
 b=SHG9NuBgrWZ5s28FS27w4UUHlTDoVA3sAFKbCihYfLqtkd43RQW9nC+Z4c8bG4QouwuVUpEuuCQmrRKFoniknosHbsRIgY2DuLBNMVTeevD64OsypH5+ZP2PK5h4ww/Njer4GP21gWaUKoCewVFIefcCBSRPODOY1N9CrUMEJH4=;
X-UUID: 64cb434bbdae4836bc55e94fba14fd42-20210428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2004325781; Wed, 28 Apr 2021 20:46:26 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 20:45:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 11:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Apr 2021 11:45:50 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [v3,PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
Date: Thu, 29 Apr 2021 11:45:46 +0800
Message-ID: <20210429034548.28030-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210429034548.28030-1-rex-bc.chen@mediatek.com>
References: <20210429034548.28030-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_204628_089217_F247B40C 
X-CRM114-Status: GOOD (  11.16  )
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

DPI can sample on falling, rising or both edge.
When DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index b05f900d9322..79f3e83f40ef 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -83,6 +83,7 @@ struct mtk_dpi {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_gpio;
 	struct pinctrl_state *pins_dpi;
+	bool ddr_edge_sel;
 	int refcount;
 };
 
@@ -121,6 +122,7 @@ struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
 	u32 reg_h_fre_con;
 	bool edge_sel_en;
+	bool dual_edge;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -380,6 +382,15 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	}
 }
 
+static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
+{
+	if (dpi->conf->dual_edge) {
+		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
+			     DDR_EN | DDR_4PHASE);
+		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, dpi->ddr_edge_sel ? EDGE_SEL : 0, EDGE_SEL);
+	}
+}
+
 static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 {
 	if (WARN_ON(dpi->refcount == 0))
@@ -454,7 +465,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	pll_rate = clk_get_rate(dpi->tvd_clk);
 
 	vm.pixelclock = pll_rate / factor;
-	clk_set_rate(dpi->pixel_clk, vm.pixelclock);
+	clk_set_rate(dpi->pixel_clk, vm.pixelclock * (dpi->conf->dual_edge ? 2 : 1));
 	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
 
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
@@ -518,6 +529,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 	mtk_dpi_config_color_format(dpi, dpi->color_format);
 	mtk_dpi_config_2n_h_fre(dpi);
+	mtk_dpi_dual_edge(dpi);
 	mtk_dpi_config_disable_edge(dpi);
 	mtk_dpi_sw_reset(dpi, false);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
