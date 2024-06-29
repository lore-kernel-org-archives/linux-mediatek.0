Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D2C3065A
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyjA2BhEiXaiYu36IgBQtDPeZotGjNfhM/eFXVY5sOg=; b=sigbLm98hS57wXjkMUx0AIb6xa
	lJOzJx018mB1ZYyFCzVBY81+Ne0KBRS3l90XXwx8MFANew9sTfhepYZ67u5Qn8K2WNRn8edQaujW0
	gAIoJVQXOH2ZwPagsqGyxhyecUSXoL3l+IjoFZTO2+rW5WmKl0Qt0or/F/Uq8ot1tTMVIhQPEo6/y
	UX9yJ8Fd0mwFZl6CfdEC9OSfeoqlM7nRyIWm4w3UCrIgtGVxQ1VOTRRez0aloBJ3OJso29yHtVzr3
	ojgIpXWk/UpD2QpYbkNQ7ivwDqgYNRDsUuLsVlwkT5DWRzxmMlinvcDpJV3bKi+i1Da11rgpkCJa4
	CaijoO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFR-0000000GApz-0v3v;
	Sat, 29 Jun 2024 09:19:57 +0000
Received: from smtp-65.smtpout.orange.fr ([80.12.242.65] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFE-0000000GAl3-0zPJ
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Jun 2024 09:19:48 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id NUF6sgiHDa7etNUFCs5cnD; Sat, 29 Jun 2024 11:19:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719652782;
	bh=wyjA2BhEiXaiYu36IgBQtDPeZotGjNfhM/eFXVY5sOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N18GjfXyCMCL0Bfw0rX/L1yZjQLg+P+cbpJLsU0XO16j1gxXLhpcjJNjlggMXf4l3
	 Li/cp9PZBJgcuBcMsQrkdQ/hD8O3Lu1CAsj+Kgca5LOppYwNLBCZOuB0S3fhslsGmk
	 uIoiLCOl4UyP9mZEdED4duW5Ysc2JxaeD/lozPQQeNtP+QDxMewVpqaUUOXIC+Jt6p
	 t1xhs1NQ9hbf1YCx+28EbMroVUzK3UbiKywKVaAyGfWW1XNQyRQ1CR8FNj8KBh72CE
	 kE9NuwuDBMqbtARqPPRuoXFAaa89vYhN2DWPtlgTNgUFK4JYjDSfYPwrQAzZRkJ35m
	 18xZYF9C0NHFg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Jun 2024 11:19:42 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fparent@baylibre.com,
	fchiby@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/4] soc: mediatek: pwrap: Constify some struct int[]
Date: Sat, 29 Jun 2024 11:19:31 +0200
Message-ID: <626783bb264a8b3b0c8cd7e1d9f9b241f0a494b6.1719652155.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
References: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_021944_642194_A37E6816 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

These arrays are not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  52664	   1384	     16	  54064	   d330	drivers/soc/mediatek/mtk-pmic-wrap.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0da0cdec5050..d57553486383 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -483,7 +483,7 @@ enum pwrap_regs {
 	PWRAP_MSB_FIRST,
 };
 
-static int mt2701_regs[] = {
+static const int mt2701_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -569,7 +569,7 @@ static int mt2701_regs[] = {
 	[PWRAP_ADC_RDATA_ADDR2] =	0x154,
 };
 
-static int mt6765_regs[] = {
+static const int mt6765_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -601,7 +601,7 @@ static int mt6765_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x1E0,
 };
 
-static int mt6779_regs[] = {
+static const int mt6779_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -640,7 +640,7 @@ static int mt6779_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =		0xC28,
 };
 
-static int mt6795_regs[] = {
+static const int mt6795_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -725,7 +725,7 @@ static int mt6795_regs[] = {
 	[PWRAP_EXT_CK] =		0x14c,
 };
 
-static int mt6797_regs[] = {
+static const int mt6797_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -758,7 +758,7 @@ static int mt6797_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x1D4,
 };
 
-static int mt6873_regs[] = {
+static const int mt6873_regs[] = {
 	[PWRAP_INIT_DONE2] =		0x0,
 	[PWRAP_TIMER_EN] =		0x3E0,
 	[PWRAP_INT_EN] =		0x448,
@@ -769,7 +769,7 @@ static int mt6873_regs[] = {
 	[PWRAP_WACS2_RDATA] =		0xCA8,
 };
 
-static int mt7622_regs[] = {
+static const int mt7622_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -881,7 +881,7 @@ static int mt7622_regs[] = {
 	[PWRAP_SPI2_CTRL] =		0x244,
 };
 
-static int mt8135_regs[] = {
+static const int mt8135_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -954,7 +954,7 @@ static int mt8135_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x160,
 };
 
-static int mt8173_regs[] = {
+static const int mt8173_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1036,7 +1036,7 @@ static int mt8173_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x148,
 };
 
-static int mt8183_regs[] = {
+static const int mt8183_regs[] = {
 	[PWRAP_MUX_SEL] =			0x0,
 	[PWRAP_WRAP_EN] =			0x4,
 	[PWRAP_DIO_EN] =			0x8,
@@ -1087,7 +1087,7 @@ static int mt8183_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =			0xC28,
 };
 
-static int mt8195_regs[] = {
+static const int mt8195_regs[] = {
 	[PWRAP_INIT_DONE2] =		0x0,
 	[PWRAP_STAUPD_CTRL] =		0x4C,
 	[PWRAP_TIMER_EN] =		0x3E4,
@@ -1104,7 +1104,7 @@ static int mt8195_regs[] = {
 	[PWRAP_WACS2_RDATA] =		0x8A8,
 };
 
-static int mt8365_regs[] = {
+static const int mt8365_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1166,7 +1166,7 @@ static int mt8365_regs[] = {
 	[PWRAP_WDT_SRC_EN_1] =		0xf8,
 };
 
-static int mt8516_regs[] = {
+static const int mt8516_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1251,7 +1251,7 @@ static int mt8516_regs[] = {
 	[PWRAP_MSB_FIRST] =		0x170,
 };
 
-static int mt8186_regs[] = {
+static const int mt8186_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
 	[PWRAP_DIO_EN] =		0x8,
@@ -1377,7 +1377,7 @@ struct pmic_wrapper {
 };
 
 struct pmic_wrapper_type {
-	int *regs;
+	const int *regs;
 	enum pwrap_type type;
 	u32 arb_en_all;
 	u32 int_en_all;
-- 
2.45.2


