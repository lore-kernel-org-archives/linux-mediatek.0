Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83923C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBxhYOUHGPOJj+Oh+TP9e12XKFk5G9K5xOSnQRpIOaQ=; b=UO7pXiKRF7yLZm6H3axvq/MoOm
	pwfpwnfICznkV0vsTSKc+lvbrjjBElmszFgNMSOOlhSXaGmdHkNKaE/VaIBpyIc/Q3e5CFAULvvkt
	4FKWDpHK6kTB2c2OfizvfPHoELl097f0iMtoW7/qfOwT6BwbaRApi3EudmR/4wZgH1P/vZLVFRwWk
	dwvEH1NLe2pjWmzCF8Eh0TEDM5V4CcNnToeTv86RLYIkJ1AzO5HLqAhIYuqAQQ294MgASObC7e8Nv
	ALsc4oXFz2vQE/xfJ0OjdIVoxD8kClJD2SBrYOPQcuRKIJTiThjHjARFSsfU30yVXDBOErfg/eelx
	jhmtUYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj85-000000074pY-3lf8;
	Fri, 05 Apr 2024 12:57:13 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj82-000000074ls-0j9Q;
	Fri, 05 Apr 2024 12:57:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso2581329a12.0;
        Fri, 05 Apr 2024 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712321827; x=1712926627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBxhYOUHGPOJj+Oh+TP9e12XKFk5G9K5xOSnQRpIOaQ=;
        b=cB2bt8FU3dEqp8YGXOCHEfmJbQfKbmMHXWyXzFs/td5l/mXbImkh4X+IoOp/ObM9R7
         Vs1X7oo4XL7d8esBg2z7kS2w09MhcRdyt03CoD84BdUh3/3d9ZQ7mdNXNBT0X8yzVDx9
         iTyTkrNHVnsJZT0jq9xbrh0r/uI1gtZLjD6gZ5P6Dyg2JC1REDI/cjqDTK7j6i2j+pUv
         fSZDpcf0C4YjcDW5uTa51oD1DJBsg+YIPN0IE0U4ZHyBYREDzj6zh1LaKN/u/wsYCNLW
         QUEaWalOYL62AhpwgYvFg/Lh0c3XuJPF7a3C+2uLzhKTgIs2CLp3mP8bkIWKLPTy+728
         3LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321827; x=1712926627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBxhYOUHGPOJj+Oh+TP9e12XKFk5G9K5xOSnQRpIOaQ=;
        b=Ipyn8VdN4Z221Bt8wJMf6DFmYoFluk/Ur3pMt+qoA/Kl7WZkUvMn39PFSp5WmtdZit
         qHKMrzAk2DyW2lyn7Sr5dWN4yq9aTH6fSTKtQLR0zib1X4jPD2AwmsqFofMXUeQpnBqn
         nuqrAhY2werAqKMRymtNgIeTdS1HOnDNtFbajwNVz7zvxODGBJsGCm6UzRAaefLrOIYI
         Ne0xtxpI8QYDXkFFxZC6tFa3w96l9jBc9uKcB1oc4LeMPpfaRlfiwWIOZVubMsaFLpaO
         o4V6ietHk04O7tlPVG3dIXueWtV5oJGLbhAc7mGyZA9Bzq3UY6PFYPI3UX6KbP2BYkJK
         NnHA==
X-Forwarded-Encrypted: i=1; AJvYcCV61bwxbcNsDgvgAjY7N3fT10iEu8AlUegPW0GFxqvKWdRdwgWYBAVNd0VKiLD/t17UGd4zuXrb7+4dNoVzrrCmVzqV68dWMQ+q+OfW7/rRgPOR66fvUjPLMiY7ToVNvYLAdVMiFoQJc7qsLrxEU0ZbjSN/ZfaXw2U=
X-Gm-Message-State: AOJu0YzkiNhEF9GhAbyysosyg1iQW//G4peuSqUzTX4YoZXF9cncOrEJ
	mum1bOayywYurWCrvpa7Ki7CTCiSBLcwGK66YnvZ4qjlvp8/CVsI
X-Google-Smtp-Source: AGHT+IFc5l6DlZCGShlDoeRFkkj3e62fh6QH3sDCWl+DprBkJYLzp6MOvPOCFDgePSdbeqntlQrQcQ==
X-Received: by 2002:a17:906:2c5a:b0:a4e:233b:e470 with SMTP id f26-20020a1709062c5a00b00a4e233be470mr1019105ejh.53.1712321827037;
        Fri, 05 Apr 2024 05:57:07 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id gx5-20020a1709068a4500b00a4e579ce949sm812121ejc.51.2024.04.05.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:57:06 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7988: add PWM controller
Date: Fri,  5 Apr 2024 14:55:48 +0200
Message-Id: <20240405125549.11972-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_055710_244792_1FD4C1AE 
X-CRM114-Status: UNSURE (   9.96  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7988 has on-SoC controller that can control up to 8 PWM interfaces.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 3eb5396dea22..27098f724b7a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -105,6 +105,25 @@ clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pwm@10048000 {
+			compatible = "mediatek,mt7988-pwm";
+			reg = <0 0x10048000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
+				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
+				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
+				      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
-- 
2.35.3


