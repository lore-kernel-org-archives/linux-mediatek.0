Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED51C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qem02ElTOfIEGBZ9hs4Pgv/bXYxn4uT7NZSUdA1BxY=; b=qytCYZYxAaaaUq3cYg9mYVu27V
	/lcwDFtN/PAVFSjAhKVIf6LwA2n6eGeAIPWOpofxY/5KTEG80t7PuHigQy+79qXAKFP4Hp6zjoExV
	2hKnebLA3mViF8D5c4cmgTlHIEqCz3gefpR0Qsl7JCmX/vZlD5Przbj3SEEvW36dJOVTNjWXV/Hyb
	ShghyGis2rMndFFTYWsfd3ymm0S7NVrJfh5D3AKyKFiflA5LSgfqhGex5zsR+3wWX4jI27JQshXSe
	JAY6fX+YNQUrosDBB6idLYOzWwYx2rtQ3IOMKlu/vlaAq7MH3In+BoYl1p4wxIBhL6KvKEWyUectF
	zTpMbV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6sd-00000000mfW-2w7Q;
	Wed, 31 Jul 2024 10:48:27 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6rn-00000000mQM-2Fuo
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 10:47:36 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3db1e21b0e4so3562278b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jul 2024 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722422854; x=1723027654; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qem02ElTOfIEGBZ9hs4Pgv/bXYxn4uT7NZSUdA1BxY=;
        b=msit7je+ThGnPK6P+agMkPCzn8nht9ElkUiOi6EsyM8EE2OtDMszhnUjqGQdeidgar
         ZkzAnpLXKnD8UUS4egSq6I5yWDMu2oduYblCmIzTVpeRw4iOON32NXTpkpM5TFGxB+Gy
         Ij0tja9jlAo/uDFd+raK7taa9clMTUWIBSf54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722422854; x=1723027654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qem02ElTOfIEGBZ9hs4Pgv/bXYxn4uT7NZSUdA1BxY=;
        b=w1mnG89BcCg8Ps4ybDrXS2Ahcr/+CZuO8+pGk1UbIETyU/nW9+Yk66aDz2qcL3v6zZ
         NSdcZub1f4Q64LQEHpcAFcWyvIik8HllKY5fn63H35jKg7y3Mz++HNiokbnQw4f/IF72
         CYX+fdLN5T2pYwMaf09d7a6ETAR4elw9EGnvNgo3fBVurDPcD3ryrPEeJGewmACAbefs
         7W/SG7ZsiIR7FSB2t+1INUpzkjX/9sAfFOxCzX3NPM3fDFjAjb2NdRKYwRn+joygUVXZ
         vHZ7UuPhTArsYjYnS/altf5VF9beMUn+ByWEcvFVrlDolI+4ym11Wp/7hZNuLtWwuFIF
         iKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXPNRPBkBF6ugsficDeQygLEsVGBJ16k5jLQFBLIB8qPzMWRxv7fD2NMLlSE8S4ek4noOWcYbx2OqjR3DK1i975e+cU7p1zEJBgnuwgWA8fK8Z6
X-Gm-Message-State: AOJu0YwElTI5XmOpZm3//RuycJKEJxuktug/7yj8lrWZPbVaQ1Bu68G5
	+JB9LEAIOzk43H07CFmjAPQL0yD4Xc/6wG7h06NmGzUls1dM8tIlu3qQ8CpSFg==
X-Google-Smtp-Source: AGHT+IH5bC6y2xO5nokTVAVKXYLk/DLl9mJhg1O6q+f7058Iueo2iMjXfYVgLff9hn3UfbyamVgNaQ==
X-Received: by 2002:a05:6808:2185:b0:3db:1db4:5b1d with SMTP id 5614622812f47-3db23a640d1mr14284005b6e.48.1722422854540;
        Wed, 31 Jul 2024 03:47:34 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9fa5a0bcesm8788400a12.89.2024.07.31.03.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:47:33 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 31 Jul 2024 10:47:26 +0000
Subject: [PATCH v3 2/2] dt-bindings: arm64: mediatek: Add
 kukui-jacuzzi-cerise board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-jacuzzi_dt-v3-2-1c4314e8962f@chromium.org>
References: <20240731-jacuzzi_dt-v3-0-1c4314e8962f@chromium.org>
In-Reply-To: <20240731-jacuzzi_dt-v3-0-1c4314e8962f@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-a9570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_034735_623635_060E8D65 
X-CRM114-Status: UNSURE (   9.61  )
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

Cerise is known as ASUS Chromebook CZ1.
Stern is known as ASUS Chromebook Flip CZ1.

They are almost identical. The only difference is that Cerise is a
clamshell device without touchscreen and Stern is a convertible device.

Although the commercial names are different, the bootloader still
expects these cerise compatible strings even on stern.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..087773a43673 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -146,6 +146,20 @@ properties:
         items:
           - const: google,burnet
           - const: mediatek,mt8183
+      - description: Google Cerise (ASUS Chromebook CZ1)
+        items:
+          - enum:
+              - google,cerise-sku0
+              - google,cerise-rev3-sku0
+          - const: google,cerise
+          - const: mediatek,mt8183
+      - description: Google Stern (ASUS Chromebook Flip CZ1)
+        items:
+          - enum:
+              - google,cerise-sku1
+              - google,cerise-rev3-sku1
+          - const: google,cerise
+          - const: mediatek,mt8183
       - description: Google Cozmo (Acer Chromebook 314)
         items:
           - const: google,cozmo

-- 
2.46.0.rc1.232.g9752f9e123-goog


