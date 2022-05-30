Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4F4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhP/bKDCUR2QFbTqtAplBO/MxWh/MRPpeFmW7joZvRw=; b=r5PNlXb0/sAoqh
	r2uVtOks3e/KGnYUrIaYKVsGHKk5vELom763WpJP4rDwFuyT99OCj3LP4rWSQbRIfzEfyi/dzkZaU
	rz9CfVKz9Y8i8ODzfH67kvHeaYlQfYpypPkQhhEKcQX58iRuyDb1Uxpv78VDWtUh0SFm8811aJxLt
	O8q0UQJMrh64H54nw1UBy64nFDrXIzEY+1/JPXtpyi00UHbqx5yO5tf9VflbExif0v69TSU2T+9gQ
	cGJac2evLz6owVCFVeW08OVFRq9/YXMDeDcGrA1X/W4Wke2EaNDlLE4+OL1gYTe7uZ0qdetyMUviG
	0ftb3ZvAZmGDWD6AZTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgVt-007H9v-4V; Mon, 30 May 2022 14:36:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfs5-006xFf-7W
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 13:55:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id t6so14768170wra.4
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ny6VUrWxjHm8jMh3Ia0lCl9MeSKoF7nURmAMV7qqfw=;
        b=A9vqnek0ZPA0hdZmxuGUbrYRquI1u0RCVqKrwZ14ATjw+ekMR89m9Ed90xvow1mBst
         p5Xbs5JHmPR0Te9yt1uUWLQCv13rEe/ZSkauaGx+V+gv0Vwjk5reCm/Hj6LYIcwAUnXH
         J/QTcNhnpiYBRqTVDxiobEYXw1RDKzhbQzb4k9gZZbMB+0/fnrPS6AYkPDPOx2gAOKOl
         X/lGY1YrhmbGRviMtXJZqHK4zxtd87Tn4CXeWwhBAuGVP5RGI8mh3qxzB34IcvQK32RQ
         qpEr1a4Q6Nmog7m0YjvF0rRATNUz+3xqhHjkIVny7u0s7Tu+Bu22+OrTRUX2cgQwIahV
         wc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ny6VUrWxjHm8jMh3Ia0lCl9MeSKoF7nURmAMV7qqfw=;
        b=3PbRGft/M9sXXO1tJLUJXCHHo/0nSzQllAgcrXlB4143W3B49G2i9oNVNBxwxHcZRl
         7aLbUBBX44YnNluyQLD6OPWEJTbt7jzCbN6UuVQCb+DSJHyKvdULandiaxjjv5yC5x82
         l5L1kuqjv1IiHwNe8g4vX19trTD0gr6Q3X6KASFO1ExoAgJXOzcyUHOO/FG0YpKjEccC
         aTNkaPrnNaIIW//PbHrk2ehM8TivZ9xv6nNfS+rpBso7e+BdnC2+2IZ9UGyxNnfxRn5o
         dioXN2rGM/+GzKUuytqXPlcm11iNFjLJNZ8+VqQg/RTODEUsEki0rHC8Mm1PhlvDeIqh
         C8cQ==
X-Gm-Message-State: AOAM531hVhptH+bvkzTz7C0tDRPlOg3InynWtMN1VRdULUCRXUodlQkh
	++zoPG/Lqjjbod1NIH6wHAoOTQ==
X-Google-Smtp-Source: ABdhPJyG9MFHWhDCKIB+1mOHRrIPC43arbgwTvE15Nb9SeGNOh+fykkMHaWuUCjeLE7KibBEbUgPjg==
X-Received: by 2002:adf:ffcf:0:b0:20d:437:97a7 with SMTP id x15-20020adfffcf000000b0020d043797a7mr45424305wrs.286.1653918945433;
        Mon, 30 May 2022 06:55:45 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id w9-20020adfee49000000b0020cfed0bb7fsm9214856wro.53.2022.05.30.06.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 06:55:44 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] soc: mediatek: pwrap: add mt8365 SoC support
Date: Mon, 30 May 2022 15:55:22 +0200
Message-Id: <20220530135522.762560-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530135522.762560-1-fparent@baylibre.com>
References: <20220530135522.762560-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_065549_406516_B6ABBA19 
X-CRM114-Status: GOOD (  12.00  )
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

Add PMIC Wrap support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 80 ++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 8dea5e14d73e..16595c3330ef 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -980,6 +980,68 @@ static int mt8195_regs[] = {
 	[PWRAP_WACS2_RDATA] =		0x8A8,
 };
 
+static int mt8365_regs[] = {
+	[PWRAP_MUX_SEL] =		0x0,
+	[PWRAP_WRAP_EN] =		0x4,
+	[PWRAP_DIO_EN] =		0x8,
+	[PWRAP_CSHEXT_WRITE] =		0x24,
+	[PWRAP_CSHEXT_READ] =		0x28,
+	[PWRAP_STAUPD_PRD] =		0x3c,
+	[PWRAP_STAUPD_GRPEN] =		0x40,
+	[PWRAP_STAUPD_MAN_TRIG] =	0x58,
+	[PWRAP_STAUPD_STA] =		0x5c,
+	[PWRAP_WRAP_STA] =		0x60,
+	[PWRAP_HARB_INIT] =		0x64,
+	[PWRAP_HARB_HPRIO] =		0x68,
+	[PWRAP_HIPRIO_ARB_EN] =		0x6c,
+	[PWRAP_HARB_STA0] =		0x70,
+	[PWRAP_HARB_STA1] =		0x74,
+	[PWRAP_MAN_EN] =		0x7c,
+	[PWRAP_MAN_CMD] =		0x80,
+	[PWRAP_MAN_RDATA] =		0x84,
+	[PWRAP_MAN_VLDCLR] =		0x88,
+	[PWRAP_WACS0_EN] =		0x8c,
+	[PWRAP_INIT_DONE0] =		0x90,
+	[PWRAP_WACS0_CMD] =		0xc00,
+	[PWRAP_WACS0_RDATA] =		0xc04,
+	[PWRAP_WACS0_VLDCLR] =		0xc08,
+	[PWRAP_WACS1_EN] =		0x94,
+	[PWRAP_INIT_DONE1] =		0x98,
+	[PWRAP_WACS2_EN] =		0x9c,
+	[PWRAP_INIT_DONE2] =		0xa0,
+	[PWRAP_WACS2_CMD] =		0xc20,
+	[PWRAP_WACS2_RDATA] =		0xc24,
+	[PWRAP_WACS2_VLDCLR] =		0xc28,
+	[PWRAP_INT_EN] =		0xb4,
+	[PWRAP_INT_FLG_RAW] =		0xb8,
+	[PWRAP_INT_FLG] =		0xbc,
+	[PWRAP_INT_CLR] =		0xc0,
+	[PWRAP_SIG_ADR] =		0xd4,
+	[PWRAP_SIG_MODE] =		0xd8,
+	[PWRAP_SIG_VALUE] =		0xdc,
+	[PWRAP_SIG_ERRVAL] =		0xe0,
+	[PWRAP_CRC_EN] =		0xe4,
+	[PWRAP_TIMER_EN] =		0xe8,
+	[PWRAP_TIMER_STA] =		0xec,
+	[PWRAP_WDT_UNIT] =		0xf0,
+	[PWRAP_WDT_SRC_EN] =		0xf4,
+	[PWRAP_WDT_FLG] =		0xfc,
+	[PWRAP_DEBUG_INT_SEL] =		0x104,
+	[PWRAP_CIPHER_KEY_SEL] =	0x1c4,
+	[PWRAP_CIPHER_IV_SEL] =		0x1c8,
+	[PWRAP_CIPHER_RDY] =		0x1d0,
+	[PWRAP_CIPHER_MODE] =		0x1d4,
+	[PWRAP_CIPHER_SWRST] =		0x1d8,
+	[PWRAP_DCM_EN] =		0x1dc,
+	[PWRAP_DCM_DBC_PRD] =		0x1e0,
+	[PWRAP_EINT_STA0_ADR] =		0x44,
+	[PWRAP_EINT_STA1_ADR] =		0x48,
+	[PWRAP_INT1_EN] =		0xc4,
+	[PWRAP_INT1_FLG] =		0xcc,
+	[PWRAP_INT1_CLR] =		0xd0,
+	[PWRAP_WDT_SRC_EN_1] =		0xf8,
+};
+
 static int mt8516_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1136,6 +1198,7 @@ enum pwrap_type {
 	PWRAP_MT8183,
 	PWRAP_MT8186,
 	PWRAP_MT8195,
+	PWRAP_MT8365,
 	PWRAP_MT8516,
 };
 
@@ -1590,6 +1653,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT6797:
 	case PWRAP_MT8173:
 	case PWRAP_MT8186:
+	case PWRAP_MT8365:
 	case PWRAP_MT8516:
 		pwrap_writel(wrp, 1, PWRAP_CIPHER_EN);
 		break;
@@ -2112,6 +2176,19 @@ static struct pmic_wrapper_type pwrap_mt8195 = {
 	.init_soc_specific = NULL,
 };
 
+static const struct pmic_wrapper_type pwrap_mt8365 = {
+	.regs = mt8365_regs,
+	.type = PWRAP_MT8365,
+	.arb_en_all = 0x3ffff,
+	.int_en_all = 0x7f1fffff,
+	.int1_en_all = 0x0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_INT1_EN | PWRAP_CAP_WDT_SRC1,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static struct pmic_wrapper_type pwrap_mt8516 = {
 	.regs = mt8516_regs,
 	.type = PWRAP_MT8516,
@@ -2171,6 +2248,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt8195-pwrap",
 		.data = &pwrap_mt8195,
+	}, {
+		.compatible = "mediatek,mt8365-pwrap",
+		.data = &pwrap_mt8365,
 	}, {
 		.compatible = "mediatek,mt8516-pwrap",
 		.data = &pwrap_mt8516,
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
