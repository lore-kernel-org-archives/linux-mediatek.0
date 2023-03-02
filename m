Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27477C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDLWBsaXf+EBRK3loI+aJuSsf0blQx7K7EQNqTkpYHQ=; b=iKHxiYn4z9UhO/U7nfxDGAWxMp
	eyg0YdnKvAl2Q7jMrx0PoDMvtpM/61SPNVxKm8CF14LpKvOQdDJHNq3dVqMtep4Hed8ssuLUoSE5b
	FucPtebcmgMY5KgrdoI+qpMorNDx7UOsHT56VEz49UtK85JdS5HDLuKiZ4LYPY4VAfoj1NN9V6hQb
	PoDE8pJI6BLkTXHQfD57eoGCA6AkYXPVr9O5BBXm3n2NmWl2VrjrCYuxbyZQe3mfC4gocFqj7EtdT
	ozDFdF4CZvxPBpEM9D2Gt7W1DCoTsT3zSnU14OSpMIaSHCz85rLlLCBCtYUzAcj0y6oDpfC8S0H7K
	0DSC1/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiFH-002Bz1-0I; Thu, 02 Mar 2023 12:41:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiEx-002Bpm-Ec; Thu, 02 Mar 2023 12:40:56 +0000
Received: by mail-ed1-x52f.google.com with SMTP id i34so66985930eda.7;
        Thu, 02 Mar 2023 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677760851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDLWBsaXf+EBRK3loI+aJuSsf0blQx7K7EQNqTkpYHQ=;
        b=Zn60fe0foaPBdbdW+KOWbitV44Eb5w5/+zFbZZXAX9mc/cDPXLg8q2hMKw9d4Ahg6M
         BE3jauOKS5qegUeCtDgbKMlz7dZB384zEr8qqDkerc6DHPVGdA7+70gLMFA7dbl2oj/1
         mqTmB3qqV4x6qjYGnat9ILzryi6QeqtWJWk8qtJG+C2vxAqoVEhNIB3hpHyKs8vjX98P
         1Iyr25oDpYuzBYIw99i1PEq2EwPr3BeF6cXIMNnNZLU0utk66SMfiup3xH5+WPE8eMk5
         B2fmOsxjFU3NJ+C+rTzkk+kb/tcdqYmdzKcOooDuKfyP+XE4tC9AK/gLHg3BAHaqb/iA
         JzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677760851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDLWBsaXf+EBRK3loI+aJuSsf0blQx7K7EQNqTkpYHQ=;
        b=DEbLUR/CNk7SOMkvRDVGLIC2ucFkMvpl/UfzJ8to1TzpIQ79v8r9zulN6a9YyVCfLN
         BnAhqTSCtCxP57jRAYAmOuTzlZHQeSRfK/tjwFMtZs9+TPHJA2T19d1Ao9s8m+ByU3lM
         Qxf3gG4iyh4sSnQWyltMVo5OgRvg+9ZzwYxI1EtqbgkYgUZDU7h7YFTxV6nPkyX2U5lw
         k692OKz1uot/Vh6ZKx4Cs9ZogDkc8EL9vklQ8oyvhOyXreh3CIwRgWeTjYWQWY9DVfGC
         tA84AlTwpHVdYfd7CkA3Ci8OC/5Um44oGuU5sqbpXwFOaZZgcIHzgyPNrf455SthOZPR
         5MJw==
X-Gm-Message-State: AO0yUKVTqhTvwMDbD06emtF/boHD+mnswUFOYWaYOqsAaXc/qPbiCHeN
	bDMqZWoi2UgUHeoYldS4Hbo=
X-Google-Smtp-Source: AK7set/t8XAsr9Hi4ReBLtU67ox5Cdan44QFcsS8HLnRsJuCcXvGoWLFaEzy7eE3jU/NZkB2LGhYqA==
X-Received: by 2002:a05:6402:2d8:b0:4bd:6b93:128c with SMTP id b24-20020a05640202d800b004bd6b93128cmr4444479edx.25.1677760850927;
        Thu, 02 Mar 2023 04:40:50 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id c22-20020a50f616000000b004c07b11deb8sm599036edn.64.2023.03.02.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:40:50 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
Date: Thu,  2 Mar 2023 15:40:15 +0300
Message-Id: <20230302124015.75546-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302124015.75546-1-y.oudjana@protonmail.com>
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_044055_536073_4AE4DEF7 
X-CRM114-Status: GOOD (  15.26  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add support for the watchdog timer/top reset generation unit found on MT6735.
Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
the SYSRST pin instead of issuing an IRQ. This change may be needed in other
SoCs as well.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a9c437598e7e..5a7a7b2b3727 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
@@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6735_data = {
+	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
@@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base;
+	u32 reg;
 
 	wdt_base = mtk_wdt->wdt_base;
 
+	/* Enable reset in order to issue a system reset instead of an IRQ */
+	reg = readl(wdt_base + WDT_MODE);
+	reg &= ~WDT_MODE_IRQ_EN;
+	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+
 	while (1) {
 		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
 		mdelay(5);
@@ -443,6 +454,7 @@ static int mtk_wdt_resume(struct device *dev)
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
-- 
2.39.2


