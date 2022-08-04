Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E7EC19F2D
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNYml0pJZwTGwtJKLLK7VkX/NLD3rdkLagQmwO0aon0=; b=x5raxNShuPSQnb7xNT0eC5oO7C
	Ezl/dMyyE5JAtyp+4PuBwy7fKy5bZqOb8kbJ7CDBP3bBbfPkbBsH8eTudJZCSvsV23fpVVG7owkHt
	T2dZ0Y9R/GOlZVSpDnHIl1f7riqS7wyE3pNDxIllrmwueNiLRp1Zfhc1oChsToiey8IStBUAUismL
	KND4e9f9wSZi2zGhhtuiMeR7HJv1hvqWfEj3M+mP93PflkKISikC9p1buch+UpzP/feENgluAy8pw
	OtPAH/XS+LXs041eo2QwbiaPCFCknAYBNby834JLrUUeXEyZSrrENNImT+Kb8yiutlvQ8A3xwiPuT
	6LVab8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJad5-006BH6-3I; Thu, 04 Aug 2022 13:11:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJac1-006AXk-UK
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 13:10:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id j15so17129459wrr.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WNYml0pJZwTGwtJKLLK7VkX/NLD3rdkLagQmwO0aon0=;
        b=ZIF8770Ihf88JsnID2E4OKI0p+G1KqCThV1B61k6ZnS8dsLIOYFWyCkB7bDfs7agFr
         d0wl7p9RVQBrWZNoxLdVC2hu2PCA9l0ZYwEDNXpC8RlnTcJ87X/Owzk6sQ4MCvd9WyWR
         1MuXn+M5hdTC9n6LvkQ33zzNgRbfwSqFW4ZK4nqYWDhkeg1VCLHk6odj7c4kLWKxG2eg
         4qdrFDyQbKjanHaWKGYQ5WuWEGMR+Pan0cQPTsTT2Q4dRqMxCxyWtWZ/sPAaEegUKBOA
         CCcutBRhbY4YNhFVm9AwHvlxP0QBOKRffr9nlfwiomPmmuSXw1iMyW6s4PsoDtUihjbP
         O6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WNYml0pJZwTGwtJKLLK7VkX/NLD3rdkLagQmwO0aon0=;
        b=lAgbzEToQE6N4eZSEagM0XxGlzRMMNk9EezZqfDuG55IOtWatXSn+Ht3/cw/77LqDt
         VxOTSlMlZotfsr6r89qxm1c5xBHQL4BcMSUqYUPdZbPI6aA5QgLd2ViGF/wT5xlOErwM
         RJdM6+KOYhycL+m4NWrcBpeoWsJnnC8T8sqvPLg62XlHzKQ+HGguFouSgIm6jCG/35LU
         l1Vo3z9QZEDZEQcCbANuVx4/mkAALP2Ps2UHQsnbpP/MeG0jNEWx7jjOAlMUH+4+qz56
         S9878QuHQUyLHuw76fg4RZB2rruESs3rYFmHn2MZlFAT7MNrlLalzX+m9GJGZjTTqNd4
         tPIg==
X-Gm-Message-State: ACgBeo2AtaELC6KRv0hmTIQe+4uviRKQqqPX9oD+77KMdFvCYpGFh2vs
	ur84dW0zG0JMhFTEKYkNAcw7eQ==
X-Google-Smtp-Source: AA6agR4i2eds1JM8hnk2a0haj7V4iukZavQOGw33veGLMXvkiAhhA/wBiCQmQspA8M6Bxt5N1Bt3zQ==
X-Received: by 2002:adf:ef8b:0:b0:220:8235:124 with SMTP id d11-20020adfef8b000000b0022082350124mr1378639wro.628.1659618605481;
        Thu, 04 Aug 2022 06:10:05 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.. (235.163.185.81.rev.sfr.net. [81.185.163.235])
        by smtp.gmail.com with ESMTPSA id o15-20020adfcf0f000000b0021d6a520ce9sm1156817wrj.47.2022.08.04.06.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 06:10:05 -0700 (PDT)
From: bchihi@baylibre.com
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v8.1, 5/7] arm64: dts: mt8195: Add efuse node to mt8195
Date: Thu,  4 Aug 2022 15:09:10 +0200
Message-Id: <20220804130912.676043-6-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220804130912.676043-1-bchihi@baylibre.com>
References: <20220804130912.676043-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_061006_004548_DCDEF0D4 
X-CRM114-Status: GOOD (  10.56  )
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

From: Alexandre Bailon <abailon@baylibre.com>

This adds the efuse node. This will be required by the thermal driver
to get the calibration data.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 73a0e2103b83..cbd0401968a2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2022 MediaTek Inc.
  * Author: Seiya Wang <seiya.wang@mediatek.com>
  */
 
@@ -733,6 +733,18 @@ u2_intr_p3: usb2-intr-p3@189,2 {
 				reg = <0x189 0x2>;
 				bits = <7 5>;
 			};
+
+			lvts_efuse_data1: lvts1-calib@1bc {
+				reg = <0x1bc 0x14>;
+			};
+
+			lvts_efuse_data2: lvts2-calib@1d0 {
+				reg = <0x1d0 0x38>;
+			};
+
+			svs_calibration: calib@580 {
+				reg = <0x580 0x64>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.34.1


