Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13298C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EcAu/9hvgx3ps8F25msVczJDGWX5NVPviG/Sjfiskw=; b=NuoiXOqAeJp9kv
	GBvjE2JRg0SJGaW3mgqC1sz/Oc8eEhibX1XtrVMx98h3eQ0hmbvUcYhEZy94iISl7nQ4ncr/03fux
	DlS/oKHb6/1WJRDrGSnlJZ1sSQtec02oLLfbcMuknFjM32NsnxlCl1MpPTsZ7zVADRf8RsF17NkIy
	DXYZ128u+oGAmR5VeNeVUIsL77JDDo5LkSMaHBE3oVwF8n0tLnsckXX+IlVGdK1kDVpo8LrOxWA/F
	r7u26inStUIBM1uFvKAsOcDVcyX6HPUnUV/fx65dlg7RzmClPIt2lrC/fvA5HH2hCjPLaQEXkRFxt
	7c6wPqMAbsKWaFQMwc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw34b-00BJh2-Pr; Tue, 31 May 2022 14:42:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw34G-00BIzQ-1Q
	for linux-mediatek@bombadil.infradead.org; Tue, 31 May 2022 14:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uQC4VQ4WPzHEK/K/bvUrrtdGhjy2EyWTwZNKtRp+iyw=; b=hkAwE4HPCvoe4tzg3hBdQAQ553
	g82IyGQeW4jfFQssbY1hdftMzBFQ4kN4jqp/JoxP54ZSXOpDHCL/GhMc5kUjBl3kezfwArb5IJzFh
	OA/WwyB7kZaeL4YNfVsK9Zy/79haFyUejJl6PPTRrtIRHpgMasPFEzeXrFZWklZt86wAk6PozxsN4
	2rXzRS+9RHY0kopKH8VGqNMVwuypiIMORLnBtaE4IN7FW1QVDUtDsVdKbtS/vjmIdHBTU19dppIGQ
	lC8zF2HeE5ztVDTo/b270WTgfCM+c5abjpMjTEX2BEa68Scz0enhVoGghtuF5jpz2JwAuc6CB8+mL
	eBnSs84A==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gx-003Sde-Be
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:51:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id e25so8161261wra.11
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQC4VQ4WPzHEK/K/bvUrrtdGhjy2EyWTwZNKtRp+iyw=;
        b=3zIN1i390joEcWbbq2lEOHhXMbqplBLfG3SD7Gn+0anr4jkoPd2gwnoMEaZyMG8yla
         79QJeDtdsmbhvTN0aVi5ShWLg923FwOfwzsJscVxwTBck9XRvgDLMf1YBLIGIMtHLxp/
         2fx/3yU5USgbjMKAZuKyerFEXHn9DkEkkIQcxl7/VfGcrIpsxQUqsiMBkPIUbw5ELdWP
         LaEcasNOwwN6Hgwjt+9noUuQw6IjSIkKmqo07es5YJAW1c2FQFNg2FXnXV8QrSZU7KcI
         E/wqN9qZKk0nK7AO5t9fdLwAoMhU9MFxIRULSYgcApWN7dji4+sJeKwaQnjXe2jGwzNH
         ekoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQC4VQ4WPzHEK/K/bvUrrtdGhjy2EyWTwZNKtRp+iyw=;
        b=eoe63ueHY33bvGDW/Sl34vksufBLSW8VJEiSaWyVn5LPSvCYvfGT0f2avDP8Uq8+0E
         TAPhZ0ujC9fveVgY9OvpEro2IjFbTOYgWFr0QjBDMcidwN8+qIClsxok6I5kT182cifn
         cA0mmdzkGfSRIYiaXvJOky0VnaKMddfXud0TNF8m0SOVol1zOQodMKY0kbsUTIwtgdCk
         9wPf3y3ID2U8dKiddFabgNGSMtgbSLiEFre6Be5GWe854n2FydXrY5KbukuFArn1RKNF
         myMwjEG5yPUTFwaMS+q8b+tKdGMfVUHB1xM8IzuyTvfL+nOjuo7Mqk+KwhLPbF2Zj0TT
         QOtw==
X-Gm-Message-State: AOAM533HgXUflBP2MQiVWFSVVaJsGR5jpXEMSgZK58QcO8zMZkBf5ByH
	pF7bFzE+SPcg+/74N1QYHp1c6g==
X-Google-Smtp-Source: ABdhPJzt2aaYFVPwdsiueoPDpTiBXsJc2pSW2BEWEyPMk06DY6DCbjp2yLb2MuUyFpuwoIgosOJPOA==
X-Received: by 2002:adf:ed86:0:b0:20e:6f48:a194 with SMTP id c6-20020adfed86000000b0020e6f48a194mr48087877wro.290.1654005059022;
        Tue, 31 May 2022 06:50:59 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 11/17] dt-bindings: phy: mediatek,dsi-phy: Add MT8365 SoC bindings
Date: Tue, 31 May 2022 15:50:20 +0200
Message-Id: <20220531135026.238475-12-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145100_688827_1CAACA74 
X-CRM114-Status: UNSURE (   8.94  )
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

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 6e4d795f9b02..9c2a7345955d 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - mediatek,mt7623-mipi-tx
           - const: mediatek,mt2701-mipi-tx
+      - items:
+          - enum:
+              - mediatek,mt8365-mipi-tx
+          - const: mediatek,mt8183-mipi-tx
       - const: mediatek,mt2701-mipi-tx
       - const: mediatek,mt8173-mipi-tx
       - const: mediatek,mt8183-mipi-tx
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
