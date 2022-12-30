Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C25C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 21:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWHvYV5ANxh44fAnbu/SIKvM1eyaybv8RI9j5qMIu70=; b=Np9ihA6n4pS+FoXo/sSVdrgBee
	yCXR/Mu2mWvCiIGIHNxWrZVPP35b9LfJtjxMxo7CvNotGU/DEb+i/x9xsSDAgCl2ook4MqBHct2Bf
	zFaybP6PeojeKhKB1/ZXxELNPJEgNN5IWDFw9iNI8C7brBoD0G1h4C4re1cbBaDxSYFm75pd6/MzS
	NSfOQLbFGFzxkPtl5hQmjqyuq23cBRm0e5YQFk8vD+8Sw8g9G7bGuYvQqit2w/ro2PaXnvzdXFE3q
	Tlxn8ZiGmelCzgP93pKD1W6q2upHs7PaG9JDvpZt6gX+koQUKtofAZHrld2+7aiIMnjD9t17+ur7E
	pahUvTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBN7E-00DoRQ-F4; Fri, 30 Dec 2022 21:40:36 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBM6W-00DLeA-0l
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 20:35:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id z11so15863969ede.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 12:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWHvYV5ANxh44fAnbu/SIKvM1eyaybv8RI9j5qMIu70=;
        b=uS5XwbN6Cd+quarAEaPBZ8Qdm2GRtFW2gLwHOn/gFhRLB9JRyTLMoJ1sB1XetKmoyX
         BT67LhRe+AFPWthSJvyCZDvdBwbkUw7Ck5kZwAGEKtM0QbyW1yzzldtmmKfOqLlb9rH0
         JX5TjIbE8SLWFJEJE6dUA90Hwh6dHwibXprvaISB/FmC3ugguyJCB2l7MlPdggocSV0W
         J9sv1qOrdBikPYKoqEyx/c/WGjYZPteiRTAOkmxEk4bQhJFeGU3wGN9vh57B/PA/jnFi
         QD3KQHC1d2IPJNymVqhDWLineSflMcVg3IfKN7UQ9UVqbVz+3YX2aVUmairzzZq0z/7A
         7YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWHvYV5ANxh44fAnbu/SIKvM1eyaybv8RI9j5qMIu70=;
        b=nEQWeEuFPxqsP17jN1wxWiJdms8MAH1VoKLD5FSaLNDYPp/TfUb/19rmaPrisJDwuC
         gFawgbqHSHXdkUu+cBMkvFKtKaM1SBKfXgNOsWbKJn9G0nVZNxvsVecPFX6y+DjbPiu3
         A/jsflUd/MYbA/uEf/VgGfkF0fonEM/1IR5zDPYrsSgMnW1HE913i0r33BGC5C+6G1Jk
         Fidg4FZOL5LNYQYHcXpTA6W32rVpPMKoULPw6kGnTc4OGEm8BYkR7xORuExCRo/vpl1B
         U1nEbFgNxkMr7HqRRTWqlrt72j+DmKw4U2jRNpFI+tJHjva8nwmUgYSV3GPhMCUzQhaZ
         6aeA==
X-Gm-Message-State: AFqh2kpcZJQx6KpqgP4V/uI1PLJWvRx5YLFBpACI6WXAjL475ZlEKGd8
	BI1dv5JSrnwSFGW41O5g4Xq71t97LiBzyMNTR0Y=
X-Google-Smtp-Source: AMrXdXuy+dEc24z5+ONQrU6m153uiwdEz9TEz5Zy0BmpYrbHLTfOxwHWujhx9euA2k8AZL/eqIbdBQ==
X-Received: by 2002:a05:6402:b91:b0:487:1a83:a6a0 with SMTP id cf17-20020a0564020b9100b004871a83a6a0mr11433674edb.13.1672432544213;
        Fri, 30 Dec 2022 12:35:44 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:43 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	gregkh@linuxfoundation.org,
	chunfeng.yun@mediatek.com,
	linus.walleij@linaro.org,
	lee@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v6 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Fri, 30 Dec 2022 21:35:35 +0100
Message-Id: <20221230203541.146807-2-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230203541.146807-1-bero@baylibre.com>
References: <20221230203541.146807-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_123548_089017_E364F933 
X-CRM114-Status: UNSURE (   7.48  )
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
2.39.0


