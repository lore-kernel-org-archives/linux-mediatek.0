Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6498C41513
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIHS4bCoAp7XmybFd1o/p9MaqJ7r9GiTTKSXXLd53E0=; b=e5PVYGqIphGFqprO8T8ewGEkTW
	wnp2h8OjHoUihVxs0kZSEvZM1UNY4vPne+rkJMuE/jN4pLBefBGCTads9SLbmu97egRoVhGiJYGYx
	ldKuqvd3fMR9UGDnSTotwa7VEs89fQS0Y38Kwh1rHsXBGz+YTtTFrohlFH2TVa8kzI/CcyO2BM2qy
	xRwHGGx1TWXMDXTvskivGuR2Wvi3cBjAv22ZXaV8MdRczTHccWxi8o2pH1BSTzOnj3WzIov0O7txs
	W4tZzNWJPZYmFh2NMe4McE8vNzCmOETuYpQ0BhSwI9lzwqNhmbdFs4HIZh4I1viMV4Sl/RMoWvRUh
	u8L4uyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFQ-0000000GApv-3kkr;
	Sat, 29 Jun 2024 09:19:56 +0000
Received: from smtp-14.smtpout.orange.fr ([80.12.242.14] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFE-0000000GAkv-0bQN
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Jun 2024 09:19:48 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id NUF6sgiHDa7etNUFAs5cmx; Sat, 29 Jun 2024 11:19:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719652781;
	bh=OIHS4bCoAp7XmybFd1o/p9MaqJ7r9GiTTKSXXLd53E0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OH1Tl9FyjuMMx4HmARLJfapnbS0a32MoPR7+1VKjwTwU/z6XOFxau1S89iYL0nNTG
	 FBmWeDrhea0TeEX0Lu3xNN+0+z5QzKnFF3aBBNHRPrT/E00VFDlaW5O4ZXwzNbyEzq
	 TyQP1fNOm9kdCMs8DIZ0layWZXx6TVXmXnO1mBiC7Za9+TXYpDgtRRjzd7bEgmz4XX
	 NrSS1dMehyJOJil0dR+A+UvsYSQRVIHx19WOaEbgjoWuCKn8uVqx6s+2sDmXKye+Ol
	 mPLW6ygkOlin0P//j7SV8OXiylbRcmevqxdEJDdFYLk+zzW6oxskgWmkU2OMgrZX3c
	 hdk+E9mrdyNCQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Jun 2024 11:19:41 +0200
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
Subject: [PATCH 1/4] soc: mediatek: pwrap: Constify struct pmic_wrapper_type
Date: Sat, 29 Jun 2024 11:19:30 +0200
Message-ID: <ee3160978ac6564663d044815f24cf79e2e0744e.1719652155.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
References: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_021944_645138_32ECB6BD 
X-CRM114-Status: GOOD (  10.71  )
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

'struct pmic_wrapper_type' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  45336	   8724	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index efd9cae212dc..0da0cdec5050 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2397,7 +2397,7 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 	.init_soc_specific = pwrap_mt8183_init_soc_specific,
 };
 
-static struct pmic_wrapper_type pwrap_mt8195 = {
+static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
 	.arb_en_all = 0x777f, /* NEED CONFIRM */
@@ -2423,7 +2423,7 @@ static const struct pmic_wrapper_type pwrap_mt8365 = {
 	.init_soc_specific = NULL,
 };
 
-static struct pmic_wrapper_type pwrap_mt8516 = {
+static const struct pmic_wrapper_type pwrap_mt8516 = {
 	.regs = mt8516_regs,
 	.type = PWRAP_MT8516,
 	.arb_en_all = 0xff,
@@ -2435,7 +2435,7 @@ static struct pmic_wrapper_type pwrap_mt8516 = {
 	.init_soc_specific = NULL,
 };
 
-static struct pmic_wrapper_type pwrap_mt8186 = {
+static const struct pmic_wrapper_type pwrap_mt8186 = {
 	.regs = mt8186_regs,
 	.type = PWRAP_MT8186,
 	.arb_en_all = 0xfb27f,
-- 
2.45.2


