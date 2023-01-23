Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8ACC54E94
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=; b=pHisBNVPXjlPt8x0jdRWat1ffT
	7teyx/MU1eb7Y3PVJDuJnQQe6LRpME2f2+okkKp8eMKHzA0/8xDvcJRt2Z9LN/yJh/c3dFMrzJcC/
	fUs4vxqntk6J4I9L04ShltNzizNtQ9e4t6DdkLE6TaAPsoKT62j46SpMZL7uRrgWMErz68vPpz7Yg
	JYKmL0B94WxcrefRYnKHApGkGK3QdDXng1I+kg+3XYiRmwf067njF9sqvW/erxTYJ+XTeHKw0sDpd
	iQCD2QSIZ1gkeFR9446pgTN8FzV1m+myC0oF7gPktGrjwBWeAagBTT/VcXvfJ7y5LQdFqFpFKKfkK
	VL/KswkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzuw-000dr5-0d; Mon, 23 Jan 2023 16:43:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqC-000bqo-8G
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id az20so32122847ejc.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=Xg40aRWcadavBhA30H+HUY1A8uOsHmLruRjzjO1N+e2rkfn7lIkOxFQPKj0yvvnpCW
         df6wDGLlFncB3rM7gzp3E4OeURwUiS1fQITjyYylL04mFdGF1AM+ecTquyM7WgTaNOJI
         edwZeXlP4VCX+1mRk9HVlAg+oUnnGHXPu8Z0kw7/amMJ5T2G6JjKYA/n4eZA7Hw0Ej13
         BPRqqKh7W0msqX5UkvJ+cKF9gjHllGWDUm8DiLGh1jnnth+e4TWhwUIbyaVu9as4LjKT
         E8WY+GkpVIZq3x0dfbIJAFhY5YOl8D0dWnz7yw2vyW/VXIkpbjNVDKNyClwSgPlZgLW6
         oETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=aZBGb25dPRWAQcADXDWVlOD+4yjjk+j5i99TBguajD+Flndsn//XJ4UgEM1xJewRD2
         A88y9/jPtHBK9LFUxVTJBGpOuC7aWEaJTXhlFy0E6kWuFAraPeTsaoLF02NpXYyFHELj
         OrZYmnUwAA2sjp9lgCjhOj1MHrzeoobJPRxAY2tacvSMcAZkJIrfHri5oA1sotQLfvbl
         um61rzlZoTh8gUtQIdcxDJ47tlgQ1yr1HL++lYym4K6Ji4/2LMVhheFSum+wNZZxze9K
         S52jsRPsbW5CRKkRXbTJyQpOTA6H6Xh3411r2/6Egy5nqhwozPsYwSHcHqINy5Nvbi1E
         PWsA==
X-Gm-Message-State: AFqh2kp59i6NkuDHaqzYN7frsG7YS9vJn1vHzbrV1n3M2rO2rlJR1D8N
	WHtbvLwQnRmrHToTUWUw5bx/jOuzDQRWey7d
X-Google-Smtp-Source: AMrXdXs8VvJu8lJI1oIw6i5DZVBXTHaTyPtTbXduMOGDi58vDAO1b04D7zJkGNudQJqatLF3RsGpKw==
X-Received: by 2002:a17:906:b009:b0:877:8ae7:2e44 with SMTP id v9-20020a170906b00900b008778ae72e44mr15517453ejy.5.1674491916569;
        Mon, 23 Jan 2023 08:38:36 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:36 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	andrew@lunn.ch,
	gtk3@inbox.ru,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v8 1/9] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Mon, 23 Jan 2023 17:38:25 +0100
Message-Id: <20230123163833.1007181-2-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083840_362674_10A927BB 
X-CRM114-Status: UNSURE (   8.01  )
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

Add bindings for the Mediatek mt8365-evk board.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2275e5d93721b..ae12b1cab9fbd 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -244,6 +244,10 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek,mt8365
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.39.1


