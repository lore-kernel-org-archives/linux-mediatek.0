Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42837C54EAA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=; b=N+NN+jYNPBejgQKHUZYwK8/nj5
	dmkvj7aDxmnIjJrFnaa67f+YUh0iIa0dmru3Ss+kKqGJXWFBmXvt/AKoOM9uCo4AXoMLarBmT6aMh
	Ubh/kZhDqCSOoe3/kQDyO7W5Ff0N0m/Z2cS+TkU6YrYW/F7INHZsK24Z1cLM7eImpeEcAr10/MZ9X
	KtkHgYO+10KRvHzssoJu8ZdvV6eggR67ZcD0ze+Ze+5UFR4bfYHPUcEegS9Wa1/Jbp0SewfbleMkr
	VG/vb6+o5m+Fu9cwqKchlZkz1qjcoOaGXI3jX2s7sHJWrTIwOQ3u2RGhTRWwHHDMXbOKa367y/S1i
	Vqa2AO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgtK-007aFV-Vw; Wed, 25 Jan 2023 14:36:47 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrn-007ZP7-5z
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id ss4so48030110ejb.11
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=v+pZY1FqnOLtnw6Qx4mx4BS36Xs8JRYRNLk9FEFKaWbVnIyvJxvNCoum9KWiP5kv2P
         1W117xRbwSUz2cM05vigF58g78LxW1P5RwHOONrh5g/SG3ZiyLoH9cYJOGqPYYRj/ZYP
         GxOnGgcRF1vC1ZZOkueX4ZD2IhM5wZNY4dINgrPJirO5BwypPM7x4BYS2RE5B1pQNwrW
         sWcIL76xuOLM+cdCOQ//8nTAv6jo7iGSH7DmaTHgwk8SG5dGoOD+HT0T0RPuxGRulmK0
         bsLXs44t+7OxZ2I2ZVWUkcw33k77pMxu+gTnGAZHuEVJ8Xc6kq3qyQFdVuWj2UlT5Zdb
         +9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyfspq1JmLNkK0b3Mfw2BakGpLZXP/GVs5UPSvVO/Ds=;
        b=gSLU/pP0u8TSXFCy4ZfBY2Yny7tvKpAXK7IhsdctnF3xQ/FrhoRG6SRrFInHk4gJkj
         3k8NQ14GB17pHpr1VjZSsbP6joC+tdbjALSuiEpuQorCM5crRlvhQsnR7OuGs1qPXUZp
         OKpLMD2FS49kJXn3CF+gOiH8clOfho/4cFQd4Cx8ufyz5RnC2+aW/aEWLR6Seg1+ZXCv
         t4cQoIlF3uSNajp03RCU20Y+A4NpzYwGDGGlyRDHzyw27vT8Z6fXfZ0YPiLUWYB1yeVN
         Zh65klBMRq6odeHrwsyhMDM487QkqDSJog/62F/Lx8X+2CPPDt7KWxMrSfuLUzxkxk7D
         hmKw==
X-Gm-Message-State: AFqh2kqXDvzv+IPpd3YP+oFe2lnahFpNA7R2HIg96lNecEQjfHKxPPYC
	ia55ZLFSz+mb+Aq76gZTvi3MlnaPnEljnsVk
X-Google-Smtp-Source: AMrXdXvGswLjKTFKStJKK5MMwCshqT+defETqAcFpsMxkCizGLfF2quhPwyyiVyb0Ln9ODBiPmaRFQ==
X-Received: by 2002:a17:907:6e02:b0:84d:2eb0:57d6 with SMTP id sd2-20020a1709076e0200b0084d2eb057d6mr48685082ejc.52.1674657307165;
        Wed, 25 Jan 2023 06:35:07 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:06 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
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
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v9 1/9] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Wed, 25 Jan 2023 15:34:55 +0100
Message-Id: <20230125143503.1015424-2-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063511_232178_209C3D0A 
X-CRM114-Status: UNSURE (   8.09  )
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


