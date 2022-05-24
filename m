Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2DEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2RAkxGt+xT8wGaEntcfD0b1MavXpTE339l7nCF2HXU=; b=i9/n64fIke14yN
	cwVX2GFLmNYeXKKme/fp0K0BQhw9ER2TlodYd3/3X/9IBOmRx3BrYEc4IH73jJbaFgdc3KwfUq3Fd
	erW40U19jpmS71YDGI4B6y8n5FBwylmUWced3JZqbyZXpSEgfGO/Xlv3VhXaHdue1UVnxCMiafH4m
	qHEQ3+6OQbABdcYoHaqVMqSYtCUTATOLl96XV/1eq/Cf/Q5T2x4vEJzJ5lA4M0ICL2/CtPGd/XAom
	WZkQTB8A1KJt3qVTfM3sKVGFajBfIAnuNEDyV9kEI6ndBQ607+iXzEloTcuRE0TV41UXLGg5W06ao
	2T0jh/7iqwX9ltAM5V0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWSy-008S6G-B4; Tue, 24 May 2022 15:29:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWSE-008Rgt-78
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 15:28:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id u3so26247068wrg.3
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oy1kZAZOz3Zat+eCWp1ANSEO/o3HnHK4I7yTTp9RPUg=;
 b=y2QIOTyTAkw1SY+KmTimrQNjMGU50fuosL+870SicdiajGcu0by8NuImsQxD51qLzP
 owwT9JnOcOzd7FnxNVgO97ya+zTjP5oEHJIq7XplQEO/rEcPTIOpd0DEMR6rC4uFoKg/
 yU9ZoJBwdx6NxF5+OITCdq3g9p5xhXnLn35COO0ThATeBHYqRl2e4mFhAg4KLPvSNvdo
 MA70ngH1QCdxPFyurlqEY4IOjIcVNEctaKjbinz7xp5eE13XQidMbTQ6nqtQPvCEoxdm
 qztsKLP0WoizYJUbBhu0bj+HjTP1Mrv8zTQh5bkyQu+becx/FiijWnBRcVGw4jueRZXb
 S4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oy1kZAZOz3Zat+eCWp1ANSEO/o3HnHK4I7yTTp9RPUg=;
 b=TBw0qZOK9ANiFQQ+oChF2RQ+IueRPOGLqNrI7ct8V/bVGGKbb17zGvAB5UVT4S7NwC
 3e3MnzKLPXwPvAAaghnIW98411JKqsuce9gyejvgnC7l21lJxrSQEiDG2jBUT6oKPVmM
 1ozzLUhkwmjbxYTR/9JU6KMNj7634A8dfJtvUTZNLu0kMoytqxvcXuUuVGMgRM9MQvo3
 PBK4KFNa9w6IYrYhnR0hKlbWcKQqsgw70J/xvhQHmTIbv4G+oymWKWSe5jexgZoh9ePY
 Ln3LokfrAvH0yMZkCz2tuyTYaV/W9SvXnL6y1bCOerZCdoqmNkyA0NtVJ4EMHqHgc9CS
 XDtQ==
X-Gm-Message-State: AOAM531ALnnglrtQUh3qTtjeTHyKnWOlACM8vJvevJH+cRAC4ugxGU8X
 trm6zW20D6g4zlvLL47Ag7WzVA==
X-Google-Smtp-Source: ABdhPJzHXNQGnyXKK6XqhtJp7RswjDASwaTe1SVr75wS7O0TZMXeZJBZKo4mgwr9U6fU/8lBOyibbg==
X-Received: by 2002:a05:6000:1a8d:b0:20f:e61b:5203 with SMTP id
 f13-20020a0560001a8d00b0020fe61b5203mr7093450wry.109.1653406090517; 
 Tue, 24 May 2022 08:28:10 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b003974027722csm2703693wms.47.2022.05.24.08.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:28:09 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v7 5/6] arm64: dts: mt8195: Add efuse node to mt8195
Date: Tue, 24 May 2022 17:25:52 +0200
Message-Id: <20220524152552.246193-6-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524152552.246193-1-abailon@baylibre.com>
References: <20220524152552.246193-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_082814_307827_33147CEE 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds the efuse node. This will be required by the thermal driver
to get the calibration data.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 0011a8ba8f96..51443e83d906 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1238,6 +1238,23 @@ nor_flash: spi@1132c000 {
 			status = "disabled";
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,efuse";
+			reg = <0 0x11c10000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			lvts_e_data1: data1 {
+				reg = <0x1bc 0x14>;
+			};
+			lvts_e_data2: data1-1 {
+				reg = <0x1d0 0x38>;
+			};
+			svs_calibration: calib@580 {
+				reg = <0x580 0x64>;
+			};
+		};
+
 		u3phy2: t-phy@11c40000 {
 			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
 			#address-cells = <1>;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
