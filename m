Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF79C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWLIjYhXn+zOSB+WdNuB6pdQiq0ngtAXwBenpIi80B8=; b=A0uqH8lYqoU/yw
	5me0/iw5uKW1TmPIEPAQEN0ulqQiMAYV3kQJVTi2TC/HbeuQGX/rAiEkhD2nHmBDPivCRTnunDs3C
	XHHnFQ/2DteS+wNFoDBalBczrIO0FJsNYuN2DktgdgIlMadGlcm8Hr1pLE5a6WwRIu8/7nrb13HbH
	ml+6OIG+YXCqMMxgIoLa4Oy/R1jiY4mHUDW8VsO4ICPOKOpBZxzx+iVmRjxP621H3pmcGZrLj/jRR
	/pmGNFPYAAMeADRcef8ch8Ec6s/lqcbRY6AnjjvPPcAFAmPhrUE6YFlCz8ioi4QDLFVLYN/ATh7lF
	MwJIFnHdw8XCXzsgIQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYWF1-005kyI-Ei; Sun, 27 Mar 2022 16:59:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYWEn-005ksl-UO
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 16:59:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so7208386wme.0
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GrkiYksIXcCr7YZZWEOvdXT2DA/jInP9u8Xo7/nCL0M=;
 b=GTZ2XxQZHx/jRc8T3Lv8E/z/1GWp49b6uLzBucRMSL8INJw5DyBeUQhnVhdavWirNL
 tmbW/itm/3LLUXpvwmVjZtWKBlaucszhH7zqf2ICmRqR+ZSLdu/uBqWj/+M5nzzzBn6U
 nmt5JvEmbzXijPg3VkZYogg+nJGQKOML2CgpTCo5P3ARFH9+ptXLbkv9C2YmJZMXQ1iZ
 7n8JkRVZjiFQla+jJumiLaTgmNmDSEsF47JF+ICa995EBRgvQ9R2A/0MyLBRZsMqki48
 sYxCPujMABUPs1bSP2dlqvfbClKwfe0fuPkhxyLkX0IXqK0iAzHHK8opy/CvaDSjhehd
 i2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GrkiYksIXcCr7YZZWEOvdXT2DA/jInP9u8Xo7/nCL0M=;
 b=fyGE95UYpCMlbeazUeIwZPkXaeTmC8sT0I+x7wi/+DBIe1hEWwYTDwhw7UaCUrXZil
 lML8NdGAAf9V4ys+SoE7ZaI4PfnRkq/+T2jcewPsve5G4CCMhje2zWMZRyQRxPSYhnAa
 OZ41L9WzZfgPvo8R425yDSYLLnYW+9diYogqVLdWXa29lQPCbbS5L8+KUyGGYofmDEg4
 pUIfUl8IXczglLMlGvqsMGUBLv11ioDEcokgB2DMw2/06IETUDJBQOPmZ7nbRsyG/6VA
 9B4hZbzH2i9ogomlfqoMZXVLcjs6jk8ec1ZrojLolPtVcxRZrRWL9gOWXcdWrELl61SC
 KO5g==
X-Gm-Message-State: AOAM533WMZwE7SOV469sljOkGMmJUYJxgPzIJ5Ah7eZ12fYDW0xgy1P0
 ix3Qmq32IXL6bS3+TknIgK1A8Q==
X-Google-Smtp-Source: ABdhPJy/tdJJQlDuv4mW16c8o9cKE4bOlxZGTM69qH8mj9pl3CI+OQLQ5IbGpH33qgENVnCRDEzp4A==
X-Received: by 2002:a7b:c77a:0:b0:38c:2c33:d8f1 with SMTP id
 x26-20020a7bc77a000000b0038c2c33d8f1mr29485151wmk.115.1648400372558; 
 Sun, 27 Mar 2022 09:59:32 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm9979423wmz.43.2022.03.27.09.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 09:59:32 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: arm64: dts: mediatek: Add mt8195-demo board
Date: Sun, 27 Mar 2022 18:58:34 +0200
Message-Id: <20220327165837.3048639-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327165837.3048639-1-fparent@baylibre.com>
References: <20220327165837.3048639-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_095933_987284_E24035A8 
X-CRM114-Status: UNSURE (   9.25  )
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

Add bindings for the MediaTek mt8195-demo board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ab0593c77321..1f68afb19d81 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -131,6 +131,10 @@ properties:
           - enum:
               - mediatek,mt8183-evb
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8195-demo
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8195-evb
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
