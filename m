Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ8CQWzmieI79jCbrKF1MY0APJS/hPZajjzdRAXiRGk=; b=SKopmyYqZCCrOv
	u2+C7Lb5n+gLDdTmIZqHCg3B3OdJfTcTSnx8QCWK1gZoUOx+VcMrZxbHnDxUaz5mBCLZCwRZr7ADY
	VjvIbXjTryOwrUcXU22PmMzDIuw/ZA6xslsv/dKNWB+m8DiCyMckRNqbWu25eeWlYkr7HVPWAjz1N
	M9knu8AYBTUIntDctlFkvwuXBWzqVN5ZbaXxOOynqZ5aJGnrCWnFWsy5K/2uDIIzEn3iVTC5FSqRV
	rd6PpZYTMrjpZxzGHxgKTdW1DPZa4NZnWZmJuF0zw8LTMFTcd9OL/scviRpxUdLZO3PTc4VFjKYio
	ZC5HWWVs+hdrDaJX77LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Lu-00ArrC-Be; Tue, 31 May 2022 12:52:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KR-00Ar73-Ma
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 12:50:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id p5-20020a1c2905000000b003970dd5404dso1153150wmp.0
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLlRUeN/TOrT2ebBiIFjsBEVkxm8B/bhYM4k20ZOGZg=;
        b=4y4HAEoKzbTSyTgajffhR2aDVgvpwQKNHVxtafAMmAzhwZgy8J0N+SW//gQNXEYCHE
         NOLtKIE4XCpn5KLcohuK1SQ41zRLV3svSj7hpHmwuYMg0vGfPCvniT2Rd1wkoKZKk0dv
         C83w1q8MipD7OFVbXuMhCq/HhwtEIYcOsSTLEuFLOtAR97BhFb0/7gPafVrMJFy4kIAE
         S5eJhPqZUeFsmEy0QK2cWGESre3hOUpIQI1H2v/zJOHcxtzEvX4atcMhFnYEQO6629MS
         xoQ73MjWqKzoIdnaPFLNJTuX55lurDtcyd5BvscNsJRUFvRAza8ah3KhcMpZm3mhReVh
         YHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLlRUeN/TOrT2ebBiIFjsBEVkxm8B/bhYM4k20ZOGZg=;
        b=h8v53euegtGjlqdc+nBxCShQnIElFWTN7O46ZXgWWZlNA+VN+KraGK57gXigPiSDfw
         AJZqplYn6rmQl7JsG849yLUubT6BBiFNXuUYioPxoNBl3E3Cjsk+ApnNuByzGmzUXnCv
         Cs8erXERVlE+I8gPXOdznySAb+7Rpe7iJ07VhETCjWh6+g8I1dIto79XVI5M/bCtJDoB
         u1GdsLCGG82kdELuzSzdYDCjLXS5sazEC8VyMM8t8cgJfGu78pq/oj+5exBw5F7OVHbq
         CGbUwf/pTIyM8vQjyQ8FSrNEigsJMsRTU0Nk0K0dbSXRSEYcDDPwGtMBxi/+qUexcIxr
         JtnA==
X-Gm-Message-State: AOAM53161Tn6Ql3IGsIffAHIvd5c5U+CnhouRd0SKiEo4I77qyyHHwID
	DvW6lKHdnKrR4llcFeWRegLJVA==
X-Google-Smtp-Source: ABdhPJyI3B52WGxQAocPAuXIiOIrcAUAGmzuyTmzC1BOgLKoCbjxKRJR7BzukFIiGKNeJhICcrjYjQ==
X-Received: by 2002:a05:600c:1492:b0:397:4afc:cc76 with SMTP id c18-20020a05600c149200b003974afccc76mr23694357wmh.124.1654001428114;
        Tue, 31 May 2022 05:50:28 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i13-20020adfaacd000000b0020fc40d006bsm11475019wrc.17.2022.05.31.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:50:27 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] Input: mtk-pmic-keys: add MT6357 support
Date: Tue, 31 May 2022 14:49:59 +0200
Message-Id: <20220531124959.202787-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124959.202787-1-fparent@baylibre.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_055031_789582_ED4DBDED 
X-CRM114-Status: GOOD (  11.08  )
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

Add PMIC Keys support on MT6357 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

This commit depends on 
https://lore.kernel.org/all/20220415153629.1817202-1-fparent@baylibre.com/

 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 609b87afd020..3a256c885a3b 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
@@ -87,6 +88,17 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 	.has_key_release_irqs = true,
 };
 
+static const struct mtk_pmic_keys_pdata mt6357_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+		0x2, MT6357_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+		0x8, MT6357_PSC_TOP_INT_CON0, 0xa),
+	.pmic_rst_reg = MT6357_TOP_RST_MISC,
+	.has_key_release_irqs = true,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -261,6 +273,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_pdata,
+	}, {
+		.compatible = "mediatek,mt6357-keys",
+		.data = &mt6357_regs,
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_pdata,
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
