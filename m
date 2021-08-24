Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE671C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:31:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962F961212
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 962F961212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT/gguWvhm/f0LPSglyr5z9/rMfl9XEH75uOc8Qiid8=; b=ElVoQD/B83AeXz
	jv9CFR1rM6bFhSP16I7N4tufDkZ46bc0poiYHUDdwgP0BMZgmycVELPX83HU2un5Rg4/pa8MrG8Ua
	od66FNUgatgcRVMHPKiD0qjZEUxzPeQvpc1uJxfPDm3JixOOWY8DGv0h88FTY3EnxNTpYZchE8fQo
	4ekdlYFq62bqz5URRkXsgELU04VtdBznJhe0VP3X2z60k8niJENTv/3twaVsEH1A5utLiK762u6Ua
	VKIjAjsIxm9WTo50b8LhMMw7OFv3C8bMCw26uQYo98h0XqngLdsWWKI/jgk5zTZGmmMdfPk9QDW4v
	SVAT0SvxOjHcBz6xo8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIN9y-001O80-Pr; Tue, 24 Aug 2021 03:31:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIN9B-001NnO-HM; Tue, 24 Aug 2021 03:30:48 +0000
X-UUID: b294a232ab4b4cde8a41b708a2c9c1bb-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9tv9qjBEDYXwIpXMEhq649UzGBahqBmCZl+IrAacSg8=; 
 b=Kr7kTHLMCTe1b8DzrXrAK+j04T5r5l08HU28dZ9SuUphfk3gM+Ypxw9RE5uXGMy7enkDNgV47Is62crOUaDPOSQWkdFdg5LHNgSaRYX2iOaewuJVT/3q2v5Li7bXV6wO1bEYLVfG2XxwjOJeBl40lf2hjWstkWus+RjsWlgnbH0=;
X-UUID: b294a232ab4b4cde8a41b708a2c9c1bb-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 887691009; Mon, 23 Aug 2021 20:30:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 20:30:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 11:30:37 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 11:30:36 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>
Subject: [RESEND PATCH v5 5/7] i2c: mediatek: Add OFFSET_EXT_CONF setting back
Date: Tue, 24 Aug 2021 11:30:26 +0800
Message-ID: <1629775828-19993-6-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_203045_611736_ADC3CF15 
X-CRM114-Status: GOOD (  11.77  )
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

In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
support"), we miss setting OFFSET_EXT_CONF register if
i2c->dev_comp->timing_adjust is false, now add it back.

Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 633bce4..4da6b43 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -42,6 +42,8 @@
 #define I2C_HANDSHAKE_RST		0x0020
 #define I2C_FIFO_ADDR_CLR		0x0001
 #define I2C_DELAY_LEN			0x0002
+#define I2C_ST_START_CON		0x8001
+#define I2C_FS_START_CON		0x1800
 #define I2C_TIME_CLR_VALUE		0x0000
 #define I2C_TIME_DEFAULT_VALUE		0x0003
 #define I2C_WRRD_TRANAC_VALUE		0x0002
@@ -486,6 +488,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 	u16 intr_stat_reg;
+	u16 ext_conf_val;
 
 	mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_START);
 	intr_stat_reg = mtk_i2c_readw(i2c, OFFSET_INTR_STAT);
@@ -524,8 +527,13 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	if (i2c->dev_comp->ltiming_adjust)
 		mtk_i2c_writew(i2c, i2c->ltiming_reg, OFFSET_LTIMING);
 
+	if (i2c->speed_hz <= I2C_MAX_STANDARD_MODE_FREQ)
+		ext_conf_val = I2C_ST_START_CON;
+	else
+		ext_conf_val = I2C_FS_START_CON;
+
 	if (i2c->dev_comp->timing_adjust) {
-		mtk_i2c_writew(i2c, i2c->ac_timing.ext, OFFSET_EXT_CONF);
+		ext_conf_val = i2c->ac_timing.ext;
 		mtk_i2c_writew(i2c, i2c->ac_timing.inter_clk_div,
 			       OFFSET_CLOCK_DIV);
 		mtk_i2c_writew(i2c, I2C_SCL_MIS_COMP_VALUE,
@@ -550,6 +558,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 				       OFFSET_HS_STA_STO_AC_TIMING);
 		}
 	}
+	mtk_i2c_writew(i2c, ext_conf_val, OFFSET_EXT_CONF);
 
 	/* If use i2c pin from PMIC mt6397 side, need set PATH_DIR first */
 	if (i2c->have_pmic)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
