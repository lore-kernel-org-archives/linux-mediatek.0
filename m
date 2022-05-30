Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB45C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0IHqqjvLnSKINMnryrKtdFl57qxU4SnldR4bRUfiesY=; b=LuvVJUU8o8DdQw
	0aso9NMPuvAcFU3FnRAp1aKf9i1ago338d9IRiFpJ0RQHreKx25R/BRWjHKizW5oNOY66te9s+S1/
	rDw2EmRxtorsABed8ncuc+mEHdrhsIfpWzaEs4kR5GmDJwUMg+gaNPF+5lvNzms5rPlSetXp9ZQmX
	gcHoIz71YaNMs6NTlRX0kvMabFeugQ22aJDGI1wrQwoH0OKHXTfwjHUPN/Lfg6IgNQH6NkPVGWh9+
	Yhyls0SFSlcl4X2A+Di0Kq/z74YXNN+YqxGwK0DhsfoedQ3PLcsTi+6pBzCeTHR6t7ckrBUVHpzIC
	HrtwQ2HI6iO26VtfVvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkI2-007tIs-FJ; Mon, 30 May 2022 18:38:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkHo-007tEV-T8
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 18:38:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id p5-20020a1c2905000000b003970dd5404dso53279wmp.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 11:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gAZcIMVkbwQAZDaJSRG1uLvlbaEmw/pRqP3mytMc9Sk=;
        b=SSgqIfRN0e3iUy0WuvEyWAskLlKpZcfPbBZyeZwWyTWSZlWlnExNurqhWYS8sLxgJs
         7AnGX6iYAE/6GhEXOEm2FfMW6r7e/yEPkJ+PrRGgT9Uj/cHp0YFa3cURpQV5JM8vr9jK
         BYkmPCoItCfRIsVO8xEq3T2KiHK34zxYxAOWzToJ25n563MLV64bq+nTA81GC7P+uShv
         OiLSM7gSyh/46FH92dhVAQW2MwUvMn0PthAI145pTEhIGJsGV0ginynxkdvOSaX0qeL7
         h6It4lXQuM/Tv4KXceslm6JN7BV1I2WEER5Ume6m6qw44SStThVESKEORJHCA4mSG3qy
         lYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gAZcIMVkbwQAZDaJSRG1uLvlbaEmw/pRqP3mytMc9Sk=;
        b=knhX+hQVep1JG/Q+Mh+kyufrsMXdR76iAKymlF9KG3N/1AIfPJAJmVyPCa+GZVFSP0
         x46zx/KHRqlPLyEWzuhWhZ6HKUVLw9nhc0nFiv6daofMbJElX3beadv+LT45I/D5PvJw
         IldpBfMOc/VEoLsrR7cZMpgeVKy/xHwGsM5FRNg4VIRq45u27VbZH1nqBSG6MEGxV6qY
         Eht1kTsuzlqkJEpGWu4dlIJdkrzJcYj7rdCYqB5ZMOSHvYok72bAJbSdosBCtdHdULaD
         JChArr4DnG3p6yEsFDfQWen/l5NO9F7GMriss3LUErXlt2AchFTG0fJLjvhoL1tRGryW
         czyQ==
X-Gm-Message-State: AOAM532qa71x87MhOMTRcZ6J/aqFZ2ptcrjL+O/bDtM0xhZCD8upDxZP
	E9LfGo2zcljuWOg1B9eXCDJRJA==
X-Google-Smtp-Source: ABdhPJynr97IYtN0ZgoGAiRMpzW0FEJgGKAE0GAOj8GidWDJahFEiTIA+vDnJ9z6b1hv/Uv3l1DE/A==
X-Received: by 2002:a05:600c:3799:b0:397:7c8c:bbd4 with SMTP id o25-20020a05600c379900b003977c8cbbd4mr19488928wmr.161.1653935919394;
        Mon, 30 May 2022 11:38:39 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe389000000b0020c5253d8fcsm11459088wrm.72.2022.05.30.11.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:38:38 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
Date: Mon, 30 May 2022 20:38:31 +0200
Message-Id: <20220530183833.863040-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_113840_959310_625FC461 
X-CRM114-Status: UNSURE (   9.62  )
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

Add the binding documentation for the thermal support on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
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
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
