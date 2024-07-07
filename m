Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B34C3814E
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jul 2024 05:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ghi6/9KK5dnA4d7xrwkCyOhDZvJBSxCQgYi3tZ7zCuA=; b=YahuMU68VSrD38HgFTsxt3Fldr
	t13oopk11fY9mq6VFZxbl83naaHcxunfPZka0QfmCEO/CbLqXytJWy7HpkPhcQtolLwk70Xtmz7RG
	77MOqadCd6CX5wZTRqCVAhG2g/PCz/Txd6fYGOPOjc8EoYus9o4yROyr6EyPA+7fvmblFtNWZlIGh
	Yx0Ynk4JRj1myyEszeB6zLvj54sYEn3HfKoqVDsuA9r5alhamXKTFnJqAxIiaqnTMb+W0k/iyBl3L
	GXNiHO7SGtWYClFPEK7wQfagyk4zqdQ5Qse4xga4l02gnPwHQp1cpMJIM9eCYfXDwT2ufbhnCDZPq
	eqPX6zZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKko-00000001Nds-0Nxu;
	Sun, 07 Jul 2024 05:48:06 +0000
Received: from smtp-65.smtpout.orange.fr ([80.12.242.65] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKkX-00000001NXi-0paQ
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jul 2024 05:47:50 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id QKkEsyOxChEtDQKkWs8JLE; Sun, 07 Jul 2024 07:47:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720331269;
	bh=Ghi6/9KK5dnA4d7xrwkCyOhDZvJBSxCQgYi3tZ7zCuA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UG1BaYS5p50YBPSwi/Swqw/Ei+LajcK5WrI3tsOSriwLjEBS4TtTB64qkeuRQBvZq
	 pqg4k0guhhYIzkmJIY7VzCHzOIEePsz5qPbDzkI0b16m97fmLj1bl7aJNlAXQGmvil
	 BMwQ63yIMqJ9ogHWOuan2tiWMhtDNBLu/hycRjVlz7vrhDsF3cYA34ROnc4ycw6YcK
	 TfgO3c9uVxNoXtvCOZnv8DuTsTjbdTivBTLQMNItDjjeBNB5Csa4IIMt2CclcgX6nt
	 aIgrdKvDO690XhgaYAN0pZgFZzVcaR+8kYKzyHVHuVfVZGEN/UF/muwhDHkh+tyzK2
	 IERxLON+14o9A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jul 2024 07:47:49 +0200
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
Subject: [PATCH v2 1/3] soc: mediatek: pwrap: Constify struct pmic_wrapper_type
Date: Sun,  7 Jul 2024 07:47:20 +0200
Message-ID: <5b4b60c5dfd6d8fe893b05cfc96c0e2d67705463.1720331018.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_224749_398985_0B6CF343 
X-CRM114-Status: GOOD (  10.54  )
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

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  45336	   8724	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Compile tested-only

Changes in v2:
   - Add R-b

v1: https://lore.kernel.org/all/ee3160978ac6564663d044815f24cf79e2e0744e.1719652155.git.christophe.jaillet@wanadoo.fr/
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


