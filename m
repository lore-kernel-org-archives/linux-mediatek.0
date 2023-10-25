Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952ACC25B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHcNRy2/Nv0NAoVYg7R7CrfDmOcMA/mofPCoLqjIELE=; b=qW3+FpZ08IUrZgmZe2cxbqJA2s
	4T7TAZoZQa0kPbJp8jus9mzknZlyi8dtEoHXgLI/SVpdZ39LVw01WsHe3ifwT2CNIEzscaFMZSW5t
	y9EOUwS0i2PFuqTOQzEPz7l1YaHqAEYiaZEbEQ25rp7dZxjjtb5DmZ0QboFarI+p7e63Ib6ky53vq
	yCKtv3AVZs/v5ZvjJ5wfEvWvFJuqZZxOthTjrjDmdgzLOCPrrmPQID16ZihdNsrVbFQyNn2qdAzVg
	lYfkePyJG9iXAQdpEaVlvzNqJxFaMK1T9aOsSQQoisOiioWHXNwUDfxR8mVBUPFywBixmBS1NET8V
	iBpizy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlrM-00DD7z-25;
	Wed, 25 Oct 2023 21:56:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqf-00DCkz-2t
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 21:55:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso199148b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 14:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698270931; x=1698875731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHcNRy2/Nv0NAoVYg7R7CrfDmOcMA/mofPCoLqjIELE=;
        b=ib5qQ9KizHYfdBa4DAPb/PNfNN2nzqWKE6HmdQBdj5b6H/prcgo4bbCfRfSZYDkLLM
         s8875nVYgSX0bgbTNbDiavbwp6hTxFBrYhMSjMV+bDHGTu4sYS/90qLOKWNSw4KbMQ6P
         UXMKO8zmNIsvcIKSDezt0YF4aje6mHJ8JXhuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270931; x=1698875731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHcNRy2/Nv0NAoVYg7R7CrfDmOcMA/mofPCoLqjIELE=;
        b=EJyN1L3hn9N7nPjouLSAoCIuudcivrR5atctD2X7LCwXZAAz2plckMUxSDjIWpbNFn
         GKj0bMH7IOk0iYt/6d424S8BHhUnpBI304Nh6fOYfsTz3O50xZwcduTo+6/Kky04hbzI
         +MB2enS3I/1Kc/ZN91+5p6lVqIVFnA2Bz4AxdEwb23MDRYzgVkDtpUn1fhPDtNCOsi2D
         yZBZT9TrIshy1xklRcmlhx6GYTelXy2+X/EFbQDoo7czjvuVpLSVWxh87xu5Zck83eQi
         Jhn6zBuMcAJMNroEdbU24SoGPcJO83YIILm3Zb5tKjvJfpzd+sBWkh8RXparQWsdZYJW
         lGGQ==
X-Gm-Message-State: AOJu0YzCgswg11zYbtCcCJasIydIByZJgnPIBMkmrkfd/KFtcG4zxAJF
	h/ZHgU+lEtinKIsijz2s/4exIQ==
X-Google-Smtp-Source: AGHT+IGVzOhxkSH/VY3HPPr3z24MzSL5wB6xSdbuILvtp1/p10yq0YsamgCEg9vTwFlTID+c+9Qf0g==
X-Received: by 2002:a05:6a21:120a:b0:17d:ec93:6a86 with SMTP id oe10-20020a056a21120a00b0017dec936a86mr5973524pzb.19.1698270930923;
        Wed, 25 Oct 2023 14:55:30 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id w14-20020a63160e000000b005b8ebef9fa0sm2994943pgl.83.2023.10.25.14.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:55:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 6/7] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-pico
Date: Wed, 25 Oct 2023 14:48:48 -0700
Message-ID: <20231025215517.1388735-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231025215517.1388735-1-hsinyi@chromium.org>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_145533_970621_31E3EDA4 
X-CRM114-Status: UNSURE (   9.14  )
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

Add pico (sku1) and pico6 (sku2).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 54141b9bb714..bf793f644e6d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -258,6 +258,13 @@ properties:
               - const: google,makomo-sku1
           - const: google,makomo
           - const: mediatek,mt8183
+      - description: Google Pico (Acer Chromebook Spin 311)
+        items:
+          - enum:
+              - google,pico-sku1
+              - google,pico-sku2
+          - const: google,pico
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


