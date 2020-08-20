Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3382BC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 09:49:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41E92078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 09:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cxSqlklr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u4kmujXa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41E92078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IahzXQHyeJtIXYCBgsVdCoR//1IS7a1wbVZwaeGsdwo=; b=cxSqlklr0gNEwi/QOiNZIUrwfG
	BgaYf4bd/dX6/4KjbLphI0uNbCNfJ3+O9aPJg5Y9wun0PDGgd5C8m2k1xI6ggYQsNRIcYMLtxXf2L
	SF6xKeq3uSPMtYal6IlNWssf+Xa5Cu5OQw6TESFpMTPHUjcx2IICjntJv8cxGZjl0DINXBkCKh1pK
	BdD9BVPXTySQ1wF9zpDjrDIojRIeJ10MFFdlMYG8PbA7T6WhKb7zSpiQVyRrIiHVJSa9h7Rgm7PO3
	PRB5hSEWlXkFjBq1XqUosTJdTDfpBLlpp8VLG68mNpNlp0rBDcGeLgRpCjQknDhnC7UPBv+tuL7qh
	gAvxkXng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8hC3-0002Tj-NZ; Thu, 20 Aug 2020 09:49:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8hC1-0002Sd-Va
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 09:49:11 +0000
X-UUID: 23ec3a9a046c46b48722ff70e78dba2b-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PEJq9o5rjHt9Tgt/ghXvLxkCSShvH3PLy1g95tCOzfo=; 
 b=u4kmujXaQXvIQTsiNtWhYp1Ir+63ck6qM6hUbYor08fTrvamxwsGwbRChhAqFPiLrA3xaTpNnbvg32Cg13H6mcCd2Sj711agi0uo1EFrzigGdJdgjUoNngR2Cj32wiXN3MUHrkEPJa3rJEvgTrgPTrBkHmKmq51H/c4Z4ZEzPE0=;
X-UUID: 23ec3a9a046c46b48722ff70e78dba2b-20200820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 712067444; Thu, 20 Aug 2020 01:49:04 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 02:40:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 17:40:39 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 Aug 2020 17:40:40 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: mediatek: refine mtk_pmx_get_funcs_cnt()
Date: Thu, 20 Aug 2020 17:40:39 +0800
Message-ID: <1597916439-26376-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 89E841128ED7E0737F0C5C3B513376298F38FFC82A08151051B83A73D1B33ED22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_054910_217008_11D4CF48 
X-CRM114-Status: GOOD (  12.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

Refine implementation of mtk_pmx_get_funcs_cnt().
The original implementation always return ARRAY_SIZE(mtk_gpio_functions)
which is 16.

However, MT6765/MT6779 only support 8 functions per GPIO pin. So returning
16 is improper. The new implementation check member nfuncs of struct
mtk_pin_soc for a platform. If nfuncs is not zero, return nfuncs.
If nfuncs is zero, fallback to original implementation by returning
ARRAY_SIZE(mtk_gpio_functions).

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6765.c | 1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c | 1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c  | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index 2c59d39..8d9f3ea 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -1069,6 +1069,7 @@
 	.pins = mtk_pins_mt6765,
 	.npins = ARRAY_SIZE(mtk_pins_mt6765),
 	.ngrps = ARRAY_SIZE(mtk_pins_mt6765),
+	.nfuncs = 8,
 	.eint_hw = &mt6765_eint_hw,
 	.gpio_m = 0,
 	.base_names = mt6765_pinctrl_register_base_names,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6779.c b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
index bb0851c..1f26adb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6779.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
@@ -744,6 +744,7 @@
 	.pins = mtk_pins_mt6779,
 	.npins = ARRAY_SIZE(mtk_pins_mt6779),
 	.ngrps = ARRAY_SIZE(mtk_pins_mt6779),
+	.nfuncs = 8,
 	.eint_hw = &mt6779_eint_hw,
 	.gpio_m = 0,
 	.ies_present = true,
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index a23c182..96f9f86 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -657,6 +657,10 @@ static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 
 static int mtk_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
 {
+	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
+ 
+	if (hw->soc->nfuncs)
+		return (int)hw->soc->nfuncs;
 	return ARRAY_SIZE(mtk_gpio_functions);
 }
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
