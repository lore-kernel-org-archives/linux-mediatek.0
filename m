Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D392C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3o+IiRk7YCHyldJBMb0GPc27B01ZH60FC+j7BoggGMg=; b=AcnabcWaa3VIgf
	/ta0nHr/qf209XEc4+7lOxyKm3yUjBvZ1kAkOGRv/QKFx9G8wZAIE2/8xGgDhLC1O2aRzwckKwkmT
	PzRIzVKwqU8M76nBcoTtMm1sZkswn9lKdPiKiACVe3wWhncF5cfI/qMO3FPJqOPkh3RDxPSANpiy5
	W7OAVDcFD+Mw6tSHQeXjim0Z9nllgQpCpEzVUvXDe9nP3K2m+RIraNdwUFlZL010gF3QCXvqPtnnk
	xVvVupMvHLrxr0Fcao1Z0Gup2t50er8Ir98ltbzo3Ub2Gc9iwHr6K87n4zVwqTEXXDeRgzcgBn0Ii
	8+d2dn0IsPOdakncgXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOY1-00ApU8-7D; Fri, 15 Apr 2022 16:11:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0P-00AbTl-Cq
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id q20so5132600wmq.1
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOuA22Fnc3OP61xN2U3nVIxEXPTaTGZoGkevrFGNYyg=;
 b=DyqkpaQ0iLmMxTSpSfK+MHcWI4dG85kzMTTwtuWYeCRYtIbx5bXRyT07WmWzHsFmI+
 LI7CkRLc+ATmkIkjkRB9h7V4Mh98t7/3VuRbUF0WCDbS6f2SXmzSakByyD0Riyyh+BHk
 z5lhZdYKONmGFs7ue+eR/heV4ycjYDy1Q7Tc41VQvf4+ih15zXlglAOI8WCf6WOV2LnS
 6JnC6vlrDmKK02wcArS0L3jp8LUEjEwldHeD6qMv0Af21Wnar178mT4n7B4ByVi4nMAb
 UccU/HRTf1L9z8lDcTAvb9l2ETglTQ1praXDN3tBtyA2Dp/Hudnldqd4NOKzHhFW7Xqf
 Ql/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOuA22Fnc3OP61xN2U3nVIxEXPTaTGZoGkevrFGNYyg=;
 b=rnRD4YfkJFONTTtMdypFwRPeEDyv7hrU2drRe7kedpoDHtckH2cVUwNgl5fRkHbnmZ
 peL8PaQlLeQwfmwgvQGziX2mwVbVrT9F7o+U5yEb3xId6xk9K7gmWwdBCG7/gRYvmij8
 BbOsoc836os0LZ9eB0R1tx2QR8DM8RInB6XDIiyyka6obdSXuXN4Rs1zet93guWrVMFK
 whBS2R4TITV03o6LIi+w83yIUILXyxcjdDnZJEOE0f9GF4UOxwxwnIRW5Bn/sFGwSa04
 MzEq9NpVwr4cX8Pe3S0IvpjIi2vqExqEEOdBCtXXiWuVzfDOggxOsMRTIWLaOF93a3hy
 mmZA==
X-Gm-Message-State: AOAM530xuTFEyuZSIC/9gDM/J1bSRId7X6uEaVQj0wg+T7SR8XA6uMe6
 5Sc6ecmuRPgh58UUN/4gWOWj9g==
X-Google-Smtp-Source: ABdhPJx03NY3RAywsaD42S7tmhUjufCPfkN1P5jZuGzXIexElqoiAjwpZmPJGrrZ71UlLBgVNggQLw==
X-Received: by 2002:a7b:c384:0:b0:38e:6b47:58c4 with SMTP id
 s4-20020a7bc384000000b0038e6b4758c4mr3783287wmj.134.1650037024073; 
 Fri, 15 Apr 2022 08:37:04 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:37:03 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] Input: keyboard: mtk-pmic-keys: add support for MT6359
Date: Fri, 15 Apr 2022 17:36:28 +0200
Message-Id: <20220415153629.1817202-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083705_573313_22ABA747 
X-CRM114-Status: GOOD (  11.58  )
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

Add support for the MT6359 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 609b87afd020..115ed4aaae81 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
 #include <linux/mfd/mt6358/registers.h>
+#include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -87,6 +88,17 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 	.has_key_release_irqs = true,
 };
 
+static const struct mtk_pmic_keys_pdata mt6359_pdata = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+		0x2, MT6359_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+		0x8, MT6359_PSC_TOP_INT_CON0, 0xa),
+	.pmic_rst_reg = MT6359_TOP_RST_MISC,
+	.has_key_release_irqs = true,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -264,6 +276,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_pdata,
+	}, {
+		.compatible = "mediatek,mt6359-keys",
+		.data = &mt6359_pdata,
 	}, {
 		/* sentinel */
 	}
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
