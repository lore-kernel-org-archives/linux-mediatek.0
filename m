Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F194C43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SERY71Vd1RHSOGeZoeNuejCrV5VkyCcMPbYPY5d0cXg=; b=2O0PKZV5Sd7fR0jL2+NNrKVWkc
	ArLZq2ThQmUg3zd444bbW9ioi/j6ypmV8iUHTazf0VqItnzn6LBK20m6bmbFi3EwmjKY7yt+QI17S
	jtttDr4FHSjysyoMUlmoWTbrsHpgIXjtjgtqhfABr3EYjLrq1vnI6gmIbTI6yQ3bfJWKfJp6pSS6/
	jaoAO1WkSnrqCZ38fsSLTc0CwbuEODdElf5qbM3q81DuzoTTaM1PSvFQTNczEZaGyskshy8cESobh
	SYOZuoYiyoVbmMb5Ro3RvH4xLvNlQaPEdDo0LclCpzJo4wxnk4OEc7rhXO4ZLQuGSfPCiIQF9WQPs
	Fsllo+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybO1-000E0Q-1S; Fri, 25 Nov 2022 16:17:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaMP-00HNOP-O0
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 15:11:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id n7so7158342wrr.13
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 07:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SERY71Vd1RHSOGeZoeNuejCrV5VkyCcMPbYPY5d0cXg=;
        b=CnUVkXQCV0WmPc2slCHcG/UmeprUoeDc+HlyXnUrx7JqxMpxCpCSA7pFyTYrn3mqf6
         chG2YxoLRHhLgIiCELc++4B1UO7vEWIO0oHL6z/LV5CSTxCatVilLeg11jMkZCBQMWs3
         zW1rSxQQf6k1mTmZojQfo+AVzx5qoZe9/cxOpyLTNcJJKKZ/JVHOjVrvrVtlzzAZjiWA
         AdCxHGywAm/G7J/6ExZqMAYEmYougS7BANF2KKGxYQf+O/ca1CLWhzgOzDRAu5nkw4BI
         +twOvRJipNrOLHGP757UiYCkaCsXZQC/C/MSNzWd5wmskYQprhUJm6FXSZTcpkXY1jub
         Lf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SERY71Vd1RHSOGeZoeNuejCrV5VkyCcMPbYPY5d0cXg=;
        b=e/gf8YyGatTFmpTeISV7U/ZQs5qK5GOJBodZF+lZazU5JIxMzwGKNgqaLomVZ8Nw+H
         iQkbFokoa8F+cItK/hAXS/Ts1KbrybV5lRFNVjR5O/X/3nifeZ4x8cNox3tBUNsrF6UY
         PQOSjpt2SYoNgAgX9JFLqRtOaYGcK01gz1x1HWVHXf+ZWzJ+1d6yLFo4j4v8X/9DhMzm
         SYjiqm6ccRBfPEsbm/0t/y+mrgG3vjFUpcjYOwAVL3lhZCDjh6kmMNKMEiaFLUFHid8L
         Nj6oHj3cvLnhiiax+vHooVzF32EO+cnoUx/HdZy9YjaOqXAGxCm7wvh62lLit03JBMBH
         DGYQ==
X-Gm-Message-State: ANoB5pnW6fADWAsqKF+J7OzPHriplDug2ujJfQSXmX2vUGlNaEWHzIV+
	rAEW/aZdoFuQxSMWNzyHHUfRMQ==
X-Google-Smtp-Source: AA0mqf4igpRB04xMtP9+f7/oC4bWlo8PKHx3XdmeOCBzo2w9zn/sPMuCZmOrNXrSKGKCwWr79oTWzw==
X-Received: by 2002:a05:6000:12c3:b0:236:8130:56e7 with SMTP id l3-20020a05600012c300b00236813056e7mr23334960wrx.309.1669389084210;
        Fri, 25 Nov 2022 07:11:24 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05600c474a00b003b435c41103sm11565885wmo.0.2022.11.25.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:11:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 25 Nov 2022 16:10:14 +0100
Subject: [PATCH v6 03/10] dt-bindings: rtc: mediatek: add MT6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v6-3-4f589756befa@baylibre.com>
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Flora Fu <flora.fu@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UVzrRIoQ4/WPI9WfRYNgs1FH7udWyYMvOv47aHSYxpY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjgNsWWFNWP2r19g13DFXu9HWhIrsdMIy+ZJjgbRS0
 4ii6dxSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4DbFgAKCRArRkmdfjHURbZuEA
 C1kbaOn8T/19Axqe3IfUlgoWPR1nuWLhIdexIoDHt5ai1UR3KlEIGPpLp5zkUbGqisBFdfLXUgdySq
 So0aFZ68mnCH8+tFAz4oqBHk/Kx/EoNpegC2r4cOtkqd3g0WemyRvhmdt22Suc+f5U1O55Hwk27fpT
 voC0B4CNXRlYSt8nhl/5UYmU/5Zx1wEoDNDoT8GGfg1khPYigJVg9qN54MyBAe5VhSW/+O5Lm/NHOw
 f0BNO7b0xqaQtiWHZxuBvbVR8pHjD8yaoUiueX7qsCRLCdiyNwOGm8NXBdP/33XuoIFGI6jWzUOka+
 vw3G1++yCphEWdHa4oN9TZW1g7DKJvS0xqgceVp9+DhGR/nABNcrpXMXlVi/nbvCZrvWectGs9nmCv
 IG53KpWjnDuQHrQHGgafivFJ9OhnwAXLVDQSiwpyqB0dzr+kvITTfDJ5rgsajWG7YyPB4XVypVHV1H
 zp+a90msg74NHsfBUwX+yHan9SDPefltQZz7DCYJxHntrSK+uQaKkaqt13DkzOr+GJNxSp/bEntTII
 N2P+Wycdlai24xk0YFDSsTppcFqo3Mjyy/ZpB7QzHeclL+0FIuwzGvFNdzFdt23qwRQkRMgVu0RGS/
 8BubbetpaGvJv3LIsowBFn0x3WRA0DWP10IaGZvOmFWyX3zcVWGXOMdg3Zjg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_071125_795787_5323D913 
X-CRM114-Status: GOOD (  10.32  )
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

Add binding documentation of mediatek,mt6397-rtc for mt6357 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
index 97b09c81e548..d582625430e3 100644
--- a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek MT6397/MT6366/MT6358/MT6323 RTC
+title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
 
 maintainers:
   - Tianping Fang <tianping.fang@mediatek.com>
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6323-rtc
+      - mediatek,mt6357-rtc
       - mediatek,mt6358-rtc
       - mediatek,mt6366-rtc
       - mediatek,mt6397-rtc

-- 
b4 0.10.1

