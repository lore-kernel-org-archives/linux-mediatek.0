Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34B4ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBA5Xqva8ic7f5V6Esgp2+e9b0zEOXFed5sBgTSTFt4=; b=FeGGBijDNbUTJRD4VftLTFMDoX
	jVHqAFXbI9JsxuCNky3dQ+72jZH40n8O6MTelYC1kLYUvgQ6P8eoenNSKIFRKKM3bbYAfK/zFLGAR
	9ph2t7OgzHRlwn3fkAZFs1VquMUqKo50xvEaT+W30wDcHUsPVERVoMnARRq8elhv1Zm19EsW+p24H
	RmqymlEtVeIzJjXo28c2Hrmy0BatkmF18LjW9dPVczej970P9qB4/WSjMLZPk2WGKlslckRlcCtOh
	0n7anhAHVU1Y8fDT1DEsCC33S0jVem6eZ58aoRhy2aq8g/hdpGLfJRffkwiTRFM+86M9Qf5dLFhX6
	h81xgKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYdO-00E3H2-Ks; Fri, 09 Sep 2022 07:41:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYYs-00E0AS-8x
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 07:36:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id az6so734033wmb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SBA5Xqva8ic7f5V6Esgp2+e9b0zEOXFed5sBgTSTFt4=;
        b=F4JIZZsLEbBIwtP/6ytVB148bSeusbnZgcYQhBUJknGtCAmFs8Rthjcmb/fSh602Tf
         LNECSMg4Dbqh3hugIRuDKeM8kYhIQznbrUdtco02ya7yEe7bOhk6V4dtAfsj6nCKyTnq
         KfNnw0tcztkYJlacX/ow8uA18iasLU58GzTxcuT8rOaaR2KmEC96ZBji0wgNjeA+fln0
         XBV+5rbYDCoZy48G36qRq1deIxgZVuOPlPX2gYCwmP6Anjggr9wGbURuPSMM6KstXVrR
         t314whH0KlmrBA6d1cYCnD35xmU9PfQfr0oWXvpyaeDnuR99D3ZSgENTNP8SOVVX0jxO
         VaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SBA5Xqva8ic7f5V6Esgp2+e9b0zEOXFed5sBgTSTFt4=;
        b=ZL324kKxmfuyr9ybUBlwYnq4ruE1XO6Hxc6Vsbpqkfb3iHy5VYXETKqAKOq0LowHBR
         M5tdVOLRM4ghPdu0qZtZC+lVkCrmv/xIsTHGsL2zM9SUfQeEGtD2iUFZRanIoiaVm2ml
         eUPFD3Ap0IAAEUr+Mzmo/D4gNsNeSAmwaWEz86K2HngQLxiCKHyPWUjRqrh0ANKGzWyf
         lkqiIuS9CiL8xPHeWpRzrV7+mYC488V2yjB95u0MxRar5bb92vCBfEnZ1d6zHAvdK/iz
         CKsvmhVbtoGF11F1A2pe4pIRDa+jgXJGhYXP96SoZwnmaolObz22i+qO2uOj6eH/ONfY
         arpw==
X-Gm-Message-State: ACgBeo0eW+zr7pecpq/IcZlPT75d+KDQJ06EXxYT12WBH4mFM0IXPETn
	kjE8n8IJ/LE9wD7ZE66gBWLgcA==
X-Google-Smtp-Source: AA6agR5ibgbyV7k8sEkNeKh4P9/DH4nNCrCM4+I7tJ/E7l0hcZkbVFXtF+uml8bHhUkxmacNDH20KQ==
X-Received: by 2002:a1c:4c03:0:b0:3a5:d65c:c1e7 with SMTP id z3-20020a1c4c03000000b003a5d65cc1e7mr4674884wmf.4.1662708983953;
        Fri, 09 Sep 2022 00:36:23 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j5-20020a05600c1c0500b003a682354f63sm5345901wms.11.2022.09.09.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 00:36:23 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: Fabien Parent <fparent@baylibre.com>,
	rafael@kernel.org,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
Date: Fri,  9 Sep 2022 09:36:06 +0200
Message-Id: <20220909073609.32337-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909073609.32337-1-aouledameur@baylibre.com>
References: <20220909073609.32337-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003626_341435_11067A57 
X-CRM114-Status: UNSURE (   8.78  )
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
2.37.3


