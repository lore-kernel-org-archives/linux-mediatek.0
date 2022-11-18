Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89533C4321E
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBJERhtOth+rBeLxVgFfkJsarNx9GtznV7fQ6VC3SrY=; b=XJ+V+sPyZIBtyiT9yvw8L1Fr7W
	wByWDq9l6/JOd6YHdErst5B+JuuUSTO6A6I/EvD9v3BUdmvETZ6p15U0diSuN9i+Jk/AWi/RP5WE2
	z9SxBu5XateUCdIHPcKthUAEeaiMrf5qPJ8vDc9CZ/JNiaqIRlemMGF3c/XgwmcmKoXc3lewCZ621
	2Pamn1m/E2jZEEG0m5cMg49UERSKIF9h8yNbZeDQ/viqmqB7vcuEH10DMnyvlsScPxOo5HgJcBtC8
	TM9Z8MU+I1jrNKTNq3az595sRlycufvY1DYzAAJH1THSLjHDcnZQ36kefxgfTwx5f6P/Oe4Az3VOC
	+BScifGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzBB-003XPU-At; Fri, 18 Nov 2022 11:05:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzAr-003XHL-RC
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 11:04:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 84-20020a1c0257000000b003cfe48519a6so1012835wmc.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 03:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBJERhtOth+rBeLxVgFfkJsarNx9GtznV7fQ6VC3SrY=;
        b=vvdRx4XhO7STmF3ODXXs9rwYg2sCM9Fbli4LCPgXKFyjJe8pMcz+dyzPGZzvn67Yk8
         0Na7a9HlLh9G5bnvBX7jfnE6BlcjIgQzODOm7EvmKfOfmwMDXTYlUDWLHHrze0GMO6bo
         tDwRXzapE4HZWUu0nLh0M4J5sDZfXHI+6u0aoVrkeaarympPczI5z6sajFhWBk+RZwT0
         hwvixXzgkettkfYltivaVdJ+8X25LCTHQoVTNMUi8CkCYRiv3e4ioHqGPeVvzw042Sii
         cVsWm3Z2HiKFx9UiZ+V/il7ikboqZB2yg2Og2zVTGt23R/grQuR8WVeZ1yq9rqctmVkb
         P1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBJERhtOth+rBeLxVgFfkJsarNx9GtznV7fQ6VC3SrY=;
        b=HllhMul1vMoGElLGmlJJg+IyjF2V3Jw2uXzWf8ZVIclVOB3HFAI7M9VBCWrbwrGXAW
         la3GGGnS+175qMEJvDvcFLM8wBvloRSqn7KJbmPT/h7fy8syvpQJ6m1jsCcLLHiMFD+G
         Uj27Hv6U2bTIzzQtcLhGPd2KN+YPHLukmcDCv/o8CDUBFJIGHF9QOxp9q1xNzSTOpVJJ
         wn27dzVubBhCf7umJYkjQhVr0BkQri6m3/vaXyhUnB7JxzUrubPPR73vcWvYhh4gI7k9
         bG81jQeYVO47NKnIOifY2a708V+/eHb6DGDDwxkm7n1s3nodKY5TsJnDCYrM9hieWDL1
         WI+A==
X-Gm-Message-State: ANoB5ple3jJe1S/LZ5CW7ZWcO73SX7QgUinM8mLSWr6JoF5bnj0ozzDC
	1vdFanGi3khLylTqRrXoHmawNA==
X-Google-Smtp-Source: AA0mqf41qGV0bEND0GwPSMQhFkrT1VnGlLZtWZn2lyPUA5nTaZUlKkh7q3SAfsl6Dc+JAGpnk4/4Gw==
X-Received: by 2002:a05:600c:1e0f:b0:3cf:e9a4:3261 with SMTP id ay15-20020a05600c1e0f00b003cfe9a43261mr8273759wmb.41.1668769483874;
        Fri, 18 Nov 2022 03:04:43 -0800 (PST)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id i14-20020adff30e000000b002368a6deaf8sm3316948wro.57.2022.11.18.03.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:04:43 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 18 Nov 2022 12:04:27 +0100
Subject: [PATCH v7 1/4] dt-bindings: thermal: mediatek: add binding documentation for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-up-i350-thermal-bringup-v7-1-ebf08ff2eddb@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>, linux-kernel@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1668769481; l=1269;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=fY1CncUk6oCKZLxDY+iXmY9IFHJPxuBaTQTmU142aZo=;
 b=Oqt0uOOMB8WLDgzdVBOKBcnTWdGXbWz+ipYlESQz5dRiUdvgrn/7hHmra43XQrdY49ee/m/RuMPb
 tUHkhzfMA8azF4mWIrudIIRQqMDPrbMJ5OHNnqlI88SliBqaaPis
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_030445_918300_A2D52979 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Fabien Parent <fparent@baylibre.com>

Add the binding documentation for the thermal support on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029a..ba4ebffeade4 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -14,6 +14,7 @@ Required properties:
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller

-- 
b4 0.10.1

