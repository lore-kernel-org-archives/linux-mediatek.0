Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0575AC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li+ooNBePGxuv5adSrcu60bPx2IUcKrfzonF2RWQwto=; b=VYQ9O/eMHmElH2RWZpAlI7kRIl
	GEwfwcF6TaJiIGuOGoK+x0vFxRYme5twJfCF5OEgAN5Jzh2D6hWjZGa7SIQgw2JhjU1LAL+PQk4oU
	yBI0JWoliPg4gpEHgc1M4ZRp3W6CPHjA8Fu5UId8i91+0cpkvW3U83jx5VC4Z3SPhGev/4RD05gBw
	wQqx/ZyVdE5zLLlESDZrhEzRBvdxRRZ6J0JjV5+N8TnFWFTiBTkfoZiZJb8rbjoF3aGdklSbd2Wrb
	MmZDnZm/Thqi2/9mz4UCfKNUMelwKBpPvkYFxTAbXFWCz9W7nqdK6z9IwPHEEoioevuzuNtP5qu4U
	pa71rnsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMU2-00F9lh-B9; Fri, 14 Oct 2022 15:20:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMTl-00F9by-M7
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 15:20:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id y10so3309636wma.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li+ooNBePGxuv5adSrcu60bPx2IUcKrfzonF2RWQwto=;
        b=epkJ13yY8mYBq+7snTc4JIPHLrRNtilHx+hAalOSDuQQtz7vFP5mgU+7k1Vhr0+rFX
         Ow1xaOHCWvrWzCFqYYcViguZdLp828mdx+FfUb4KmOsBySHDSICcntviZ2W336a6B20D
         Govk7liuLT6Y5gJiCtbaGpu98F7yk7qK8JetNh9QJtVR/7O41KdtOWcSszbYCKNjK+oO
         WCC7gTI69GwD8HTlXtRqZ6XJlbkQptIlMG/ITOBi6Yl+1IfFhrk2LfFXI4o9IVx7ynBl
         /C3aGlkxyXAtGdgdwX5nXm3acDaEmIiDA4A0nDoP2aAcHyT7Rw7wYJsMk8u9fF38G0Wh
         uejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li+ooNBePGxuv5adSrcu60bPx2IUcKrfzonF2RWQwto=;
        b=Io4+8aJTtOwTodrzVMI8mFrD9JRBq3q3GNFWIcv8uW6vGmUHJI4Quh3dXXuAeZPSxM
         yRZYQ94vZr03uYJfiyNjZY0neWSy13tQqaHVKDEQJ8IXB5z5hrXQCRlc+ivrm8GJ45FH
         ZnhENcQ0TfOSZJ7Y6YZ0kYDHwtbbT1TW2+UH3Yx1wygswLqKgq/gGPyKBt32WVlHXC6+
         4aluviabp5KB75q7hkmA1ecBLFCe5snLu8J53q9Pb65cBM6WqND4tci7aSfaDsRBkXnX
         mMRXfPk7ljolVul5+oMe7BeJJDQNtul87VW9P/CRGDJ2rdyYJmq2CEqQ+YjqcKl2bTq2
         vi6A==
X-Gm-Message-State: ACrzQf2BiAVqaPj8SnGru3cBa2vHZzr6eidrnrkN0gWzvbJpnHxQK5HI
	VTVi7wpWHZhg79Ad3iiKZDngG1GB033YNg==
X-Google-Smtp-Source: AMsMyM7nfhhjiRNQJTJ256AUcmhFf8h1a1IyYKXuRQ+avC22+kNiw+Sb+phmd/NqxY8Jm5rg3oVcSA==
X-Received: by 2002:a05:600c:689b:b0:3c2:fd6e:1fe5 with SMTP id fn27-20020a05600c689b00b003c2fd6e1fe5mr3974394wmb.99.1665760803237;
        Fri, 14 Oct 2022 08:20:03 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net. [2a02:8440:6241:7429:3074:96af:9642:4])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:20:02 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:15:54 +0200
Subject: [PATCH v2 01/12] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-1-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, stuart.lee@mediatek.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mac.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_082005_727027_0BD1731A 
X-CRM114-Status: UNSURE (   7.94  )
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

Add a compatible for the HDMI PHY on MT8195

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 0d94950b84ca..71c75a11e189 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -28,6 +28,7 @@ properties:
           - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
+      - const: mediatek,mt8195-hdmi-phy
 
   reg:
     maxItems: 1

-- 
b4 0.11.0-dev

