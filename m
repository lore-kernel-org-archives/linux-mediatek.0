Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76415C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:35:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9156117A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9156117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fn4qZODXRXQpJU8RDOBs6Kui1RfQM+UnGkyBN+ACbDc=; b=ZjR06Xa6lp9Oap9HNu+Ru/TmL
	RqM2d7l1HQ72COw+GapSEY1sYRyBzRFNxrn2MFFL9WsPSu3a7s7qrSi+AFQySBV8rUrYi5z0ndWeU
	MHHCjOX0EchJZSOJtjzva/kxpjB4XtoSAkmpfD9WReTb065M8c7useo9YB++XG7+0jLFzfbQc2yUh
	FlRySwZS1CF0NssIdCpZGdfyA5ysMPMBkWpktN6vykOb96mDpcjBMJdb2ZPkDorJmknGJ2FEMlGX/
	YRV18bANBlkb+MTW64nSvnihd9o92HLgtAJh/cmw84QvxE9oMdIDarGaoee5TLT3yLvEq4+442qL2
	bWrgAjQPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWfgA-00ClKD-AM; Wed, 14 Apr 2021 13:35:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg6-00ClJI-PO; Wed, 14 Apr 2021 13:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=YrQo7hu+hLlnniLXEpDE4ackqT/duH1E4bjH87J2ODI=; b=3xxbULBVzyr11n1JE5IuKXnHLv
 S0uIb7V21QForWjb5ziAiFD9+cjvx4Ix0Rje4Cv1pN3JlWbRfUOM/0p2rRUb9AQv8w1mt2vOZWVaT
 1amrCgl8YudXHSYlw4K/H3J1avuuPTMr+0kwcoqZ0R3OIWxdb23pNplb/KEyPyelYxHLZsHWMvi8L
 FfDpJua015dgyjLEffk9PzP2tRzBNwjsqv8+JUHpB2CHUPPQ+ygS1h07X9/zc8Z4xgvFlACt+8Q7O
 Kn17BU4k9qhV69kHtV3ZF2LYCErIdBTwfRZ3C45XJTafPBtVSsVfWiN6Hv2HZjZLWOGKJOArSda9j
 qFQ8tkzw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg3-007nZI-CM; Wed, 14 Apr 2021 13:35:32 +0000
X-UUID: 75ac9a6606ac4b098af2ef64ef9493f2-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YrQo7hu+hLlnniLXEpDE4ackqT/duH1E4bjH87J2ODI=; 
 b=lKOMP39X3EIfDIJa149r3LmGy/KTVq+JyI4Ss6838vXReggHqI1ScqNU7tbJmj16n2/Sq4tssRWpChYhIJV/KHfG/ay8Oaztz62fa48qi6xosu+fAKGoRIjHvaImJ7ERzCYcR7SKoybZXidsbq4oEP+ElSApLc6fxjsPatkCi9M=;
X-UUID: 75ac9a6606ac4b098af2ef64ef9493f2-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1730592063; Wed, 14 Apr 2021 06:35:24 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 06:35:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 21:35:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Apr 2021 21:35:22 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [v2,PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
Date: Wed, 14 Apr 2021 21:35:14 +0800
Message-ID: <1618407316-10042-2-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_063531_453720_C6FDC6B2 
X-CRM114-Status: GOOD (  10.57  )
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
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index b05f900d9322..21a3a7b78835 100644
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
