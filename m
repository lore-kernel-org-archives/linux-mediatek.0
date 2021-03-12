Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017F6C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 15:38:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981F364F4D
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 15:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 981F364F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A/WCBmvIaICTbfrwaHxkjkUeC01Nlc95pcNJP6RnkR0=; b=LA8oBANvgTERzQzE/pl2q4Em7
	nFBk4DlWXiT81pM5cZiu/ceXDXYnkhx00x3Yaowab7h2GoeGCCGp+zVMArjsMRnrT9a4K+42ePRDs
	w6DiCd5HC0XiUTWXHvPA23jUFHj88YwM9KXvhMQYB1oHL2VaVJ2OMdKH0ekBiXKfM9Yu3DX7f7B0Y
	cXogV+5rKM8hazpVsbt/1FCtEqjkuGYONhY9ms1WaEwSR7Ua0mU8t8rfVWR7SMzkLUiLny/BrkLWn
	ByzW0mZAG8Mfekz3gzB8q4vraGhAtwO0NEByec4JImdpBqmc1uRSK+rk/Q7ehzaJ8c4gT2cu3MExs
	Sy29ieIzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjrG-00BouV-Go; Fri, 12 Mar 2021 15:37:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjod-00BoPt-Is; Fri, 12 Mar 2021 15:35:08 +0000
X-UUID: 6efea904d4bc4aaba4ceac58b3d69f86-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5sbQFe70aJW8MqVpgYsd3m28hbwdECfzrdKFqrq2mlM=; 
 b=CloyzFNg1u4P0dIypH/Tfn6vlTe2374IeRwi8mksdM6iMOpQWoa8GqUd6xLL1WLCk/YnCX7OG0rPLi3475GoMtxgf7b29w/5qNnHCDk+gpSQlE3pZk1eklJlsU9/CRSuJiXKLyw/g+2zAAtGwopqraCNe+/uHWn9f/N9PNqYXdg=;
X-UUID: 6efea904d4bc4aaba4ceac58b3d69f86-20210312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2003446388; Fri, 12 Mar 2021 07:34:56 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 07:34:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 23:34:52 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Mar 2021 23:34:52 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <drinkcat@chromium.org>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 4/5] soc: mediatek: pwrap: add pwrap driver for MT6873/8192
 SoCs
Date: Fri, 12 Mar 2021 23:34:45 +0800
Message-ID: <1615563286-22126-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_153505_736437_76D25D15 
X-CRM114-Status: GOOD (  13.39  )
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

MT6873/8192 are highly integrated SoCs and use PMIC_MT6359 for
power management. This patch adds pwrap master driver to
access PMIC_MT6359.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v5:
- no change.
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a75019fa02dc..e4de75f35c33 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -632,6 +632,17 @@ static int mt6797_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x1D4,
 };
 
+static int mt6873_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3E0,
+	[PWRAP_INT_EN] =		0x448,
+	[PWRAP_WACS2_CMD] =		0xC80,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0xC84,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0xC94,
+	[PWRAP_WACS2_VLDCLR] =		0xCA4,
+	[PWRAP_WACS2_RDATA] =		0xCA8,
+};
+
 static int mt7622_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1050,6 +1061,7 @@ enum pwrap_type {
 	PWRAP_MT6765,
 	PWRAP_MT6779,
 	PWRAP_MT6797,
+	PWRAP_MT6873,
 	PWRAP_MT7622,
 	PWRAP_MT8135,
 	PWRAP_MT8173,
@@ -1511,6 +1523,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT7622:
 		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
 		break;
+	case PWRAP_MT6873:
 	case PWRAP_MT8183:
 		break;
 	}
@@ -1947,6 +1960,19 @@ static const struct pmic_wrapper_type pwrap_mt6797 = {
 	.init_soc_specific = NULL,
 };
 
+static const struct pmic_wrapper_type pwrap_mt6873 = {
+	.regs = mt6873_regs,
+	.type = PWRAP_MT6873,
+	.arb_en_all = 0x777f,
+	.int_en_all = BIT(4) | BIT(5),
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt7622 = {
 	.regs = mt7622_regs,
 	.type = PWRAP_MT7622,
@@ -2024,6 +2050,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6797-pwrap",
 		.data = &pwrap_mt6797,
+	}, {
+		.compatible = "mediatek,mt6873-pwrap",
+		.data = &pwrap_mt6873,
 	}, {
 		.compatible = "mediatek,mt7622-pwrap",
 		.data = &pwrap_mt7622,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
