Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3438C3DA40
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jul 2024 05:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5hfeJJaQd2sDlwjtKUNvEvzR4Fj1xT7GH3XV3uqVeI=; b=l4HXE/z+Bmlabwdfn4Tw2mg/jX
	P4sqtuIMNlrsKSwLBRsg1+9e+8DW+4JjJ+JFWQHTVV5h5GfeJ9VbyxCNqwMJrgU5mIoKwo+UePYTw
	mN6ILtBgbE8sQVDp7zYxsv4EnFieZybTIgZHhneBMosb4bzCV/dJA+MLRNblFtsqUKItddOrLRIsf
	vpsrBMOfb891Wpv1WMYxIgGH4e5SnPTUiUOt+md2e7ODlixpMJrX55Qd23kRGSLBo0moanaxUqNSQ
	bVtGt4uwyKuSeNEGkFgNCFWdJqDP5pDu1Pm4qMjCwbFQMFi9it2IM2JRO7MPvA1Sll56ZbWMNt6gW
	RJBKHFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKko-00000001NeG-1tms;
	Sun, 07 Jul 2024 05:48:06 +0000
Received: from smtp-15.smtpout.orange.fr ([80.12.242.15] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKka-00000001NXh-0ool
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jul 2024 05:47:54 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id QKkEsyOxChEtDQKkZs8JLj; Sun, 07 Jul 2024 07:47:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720331272;
	bh=m5hfeJJaQd2sDlwjtKUNvEvzR4Fj1xT7GH3XV3uqVeI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=f4UZ+dfpSgIf++oPpNP1xmqTHIJ9Nns4VYsrkS0XHVn54a56e99lj7h89jST+8l1g
	 X/mHEiSgI/vq3+AnkdDeaydhwpCfzsCW/vO/5jwIjmGZjV+6a91J+paMzPTjA+b4rY
	 swubC7XIy2uB3jZ5S0HtPXo59GCyL6nczVfXq3Y8Q/KcOZ6ntgfgddqZLvfG3xX8xm
	 bUYYAhfCIRVV1RodZMpbsNxl3mVbH24/3fZNhWLpx8VXJCeJlhEjO4oFSCCSB7QNuV
	 Rbb3Hn3ZdbILHcBKki4B1K3Y7IxVtx9El5b3dwVYIdTFZ5/z9LAoTu9rr3cukQL+uw
	 aeEnuA3zVSEVA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jul 2024 07:47:52 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fchiby@baylibre.com,
	fparent@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/3] soc: mediatek: pwrap: Constify some struct int[]
Date: Sun,  7 Jul 2024 07:47:21 +0200
Message-ID: <f1fea00fbaa0fea298bf67732e019f9cc5c407ab.1720331018.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_224752_534351_8298D517 
X-CRM114-Status: UNSURE (   9.92  )
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

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  52664	   1384	     16	  54064	   d330	drivers/soc/mediatek/mtk-pmic-wrap.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Compile tested-only

Changes in v2:
  - Add R-b tag

v1: https://lore.kernel.org/all/626783bb264a8b3b0c8cd7e1d9f9b241f0a494b6.1719652155.git.christophe.jaillet@wanadoo.fr/
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


