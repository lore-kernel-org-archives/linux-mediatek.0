Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF644C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvLQ9akZqxuH83Sg2xSQybdSLpcUQ3F4S/3oM7vIGDU=; b=4yHiLQHfa9czIh
	4B0UJ2GT7qEw6RO3g6znxuPCJbacw5UpVal1QtY7qKeQp0D8dLc6I9BABVU7HcuVok2VTEhGcQ5OS
	G+DCF3afqLjNQQ4M085h23yyO4vbgIYDYdK3uZ8OQbZxi78TZ5XjszQzN6pQ8+xVpaadXVnjWPBro
	dWgAoVK5Splyl4C6SVueAAjjdV4NU1W80lqh0Vh5fyb4fz9ya04UOR1xqUDtysOox/S7QrludSyDw
	bjUK7gaqXsBO6ul4BCqkqP+4t3yJPHQz0DtdIql7Ld8q+IH5smbuAplaOhCduVxAC1ouV0xvPybEA
	vsfme5/VE2owG5A4UX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0KM-00AYyx-Bf; Tue, 31 May 2022 11:46:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0Jv-00AYku-2Q
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 11:45:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id k16so13974820wrg.7
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 04:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UYSEyUlsKgFpMImQK8ePQlB37MdL0HrdJFsY0FXbKmA=;
        b=JT5l3xMYkAt+4TZYJ5fHveeJWZa96eRE0vHFuBF3Zjv+2XhDxCbnddvfhAawHbou3O
         nmLtys+/mYZKVxGVA4M2oacHrWqtFQr/aJmYYDT9i3GWqO+GeGTur7j+wBhSy1y2zSUS
         W+AF+ZWnuP+wrHaWmWonlM5MuziB7iv4m/+0F8BGxiEuHtEO7FjOE/W9p5WHzLpRTSKv
         NGX52+vK3k+I+EpnQmtsfhqb6lm8e7Vojo0JmMVQBzr4aFHGMSofBq1qEpvwXYMiiGmO
         sJoSABKT6sCy55cZIlY/Ei3P06cwCOzA4P+XW0yKXRPtWNRSxNwYXiuXLD6qZnZRkmo1
         Q3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UYSEyUlsKgFpMImQK8ePQlB37MdL0HrdJFsY0FXbKmA=;
        b=ap+r/ya77xKJDsYr1HRM9EFfcWCddzQXN/QRdXe4Xvbj4VBB+85W+wDnyYDygq1McN
         7xngXuLwhezyT51tj8ufrUgHnhe6h14u0x1AW47Qx8pfnn8XaHDd42TlpUSuJsFCdjRi
         k/WzXTGU/M4761zj/Jlwj8ApJopaVVe/NC238NOUB1BpG0NvBDnzm0hlkaCsgBg/8ol0
         eaDUfRwPjjyJT0FMfuJPPo0eFsDJrXz15TGjPfGpzE8YmrytlHxETkqv11cKd15uAjxE
         LZpK98Us/+Lm21GGlJDQ+/Z3KMSX8yG8MibbWSchixOIp/efI7gaWq7a26hLoWCY+y3H
         hWAg==
X-Gm-Message-State: AOAM533OyUHTRpcgNjpKuRk7WfgnxzD1GZOlTN01WzhAcdzdkeTnXlrO
	dySvVdAk4bo8Cgn8dkH2uzTfcA==
X-Google-Smtp-Source: ABdhPJyePNMa/IHOGRQ08K1lGsWNcl+BGJTvraImexb5JIbQoAQ4i/xDhuHPCpbkE5fkVdYO3IGe+A==
X-Received: by 2002:a5d:4450:0:b0:210:e8b:7896 with SMTP id x16-20020a5d4450000000b002100e8b7896mr20712199wrr.490.1653997552679;
        Tue, 31 May 2022 04:45:52 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm2064154wmq.29.2022.05.31.04.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:45:52 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8195: add pwm node
Date: Tue, 31 May 2022 13:45:44 +0200
Message-Id: <20220531114544.144785-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531114544.144785-1-fparent@baylibre.com>
References: <20220531114544.144785-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_044555_216051_3536AE02 
X-CRM114-Status: UNSURE (   9.37  )
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

MT8195's PWM IP has 4 PWM blocks.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index d076a376bdcc..366543f27a99 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -367,6 +367,21 @@ pwrap: pwrap@10024000 {
 			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
 		};
 
+		pwm0: pwm@10048000 {
+			compatible = "mediatek,mt8195-pwm",
+				     "mediatek,mt8183-pwm";
+			reg = <0 0x10048000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_PWM_H>,
+				 <&infracfg_ao CLK_INFRA_AO_PWM>,
+				 <&infracfg_ao CLK_INFRA_AO_PWM1>,
+				 <&infracfg_ao CLK_INFRA_AO_PWM2>,
+				 <&infracfg_ao CLK_INFRA_AO_PWM3>,
+				 <&infracfg_ao CLK_INFRA_AO_PWM4>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
+				      "pwm4";
+		};
+
 		scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8195-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
