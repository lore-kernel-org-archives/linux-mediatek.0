Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9099C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLTLi7Z7FiKWId+bi8fZkLc6EVgRkKs3skyHC5sG8CY=; b=q9EfE/x1BTM4rIPJ0zShOw4jW5
	Akh8i87rxHw7Xn60ZwKUMW5UKaTfy7kiBMbg3pVoBP66S/eaVFu0H5uWAUgEuH9LTWd6sFZWkhvEn
	KJpXF8OSPNzQUq6dRkxzUkRa3Z41CKTXqQitJM/PfeaksK/uIS5U0ez9UhPC8OYznGoBQzom4k4DN
	2n5SDgdDkinPoWjIHRo/f66RyZePU4fSztdtlJ+eSG4pnyqdtBe/k3Osp1pfQCA/GFuNeQg+Tgzfe
	ZakjOstnpdqV/ZzFEy6qBasDUakAhKu+qtS5jV1lRHkMtlQE97BMm0b+sXHbjACoyVzAsWXiX+B33
	bzdcBtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7iE-00EPJd-Ho; Mon, 21 Nov 2022 14:23:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7hf-00EOt3-BG
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 14:23:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id i12so16231019wrb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLTLi7Z7FiKWId+bi8fZkLc6EVgRkKs3skyHC5sG8CY=;
        b=D5V9EF0OejBZwuqpXWui3ZalpJ94bdEGZUloCx4GdvNpwOu9DnvwMeBnDCPDI1vp46
         AGFcpmiIvx+gkVhyBOQnmNadzLjlkAaJd40zYPC7juQ7zSpWS8V024Im1PK6bd3RzqiX
         s7wxVLjufCv/PrmyEFEvNG0y31n8d9ZTC+LQeKmJqeV7LETKBBo1Yy5cd0hUhqFSGIVF
         Djdl1Im3wRsOrQCpl08PJVOEe5hQvCd3aEmJYgsXVaw1mhZ5bOEVNf8AUKU0lYOAhbAy
         E/U6awm3Pe3WLXI4jtWCv4avCJhKROA1HO6lb/tJYpFaBfNAkReYvX/lilAdSpcIwTKg
         EDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLTLi7Z7FiKWId+bi8fZkLc6EVgRkKs3skyHC5sG8CY=;
        b=S7YzK/tIVW6oI7IL36o471p49oPPe3o4DK9Y5RCVTouXUiqHMV+1rtqjPJaJOjyW8B
         DqZ8D0H+8VEtuo17KItazzR9OYGEN1CPsmLmbcMddkSCapQwvgFv9RuKNXXnj1pw228P
         1XyDF0qeXyUc2fmX1+ONe3wLN4TB4ZezRQcbi0FCxsh49r9GvAEiPLhacpYsJveeISuu
         /FSs/7Fgzzgp9f2aOhlVmthXA1NlFQt2DqvmXE4wAIgztAtNuVoXRDnAloDqTQT5+nXu
         uq53m+tY2ZZ1n/S4qGLn6RQaXuhVDdsvWB3HzvbdZdJOFTeH+bijiYQec4WcBbgvhOxh
         9Fbg==
X-Gm-Message-State: ANoB5pkK7ZNEQyewjxxHfb0KFV0pKIkTRu/TgwQvMh10gqnKfU4e+9S9
	CX4ZE3Lo9C2X53xTJ+0WaUaq6g==
X-Google-Smtp-Source: AA0mqf4in6pPCN0j2CQX8M6zf6umy322ySdxWk1PP56QJInbjwv4ZjaMUm16qPsll5SjfuP4QxNrwg==
X-Received: by 2002:a05:6000:983:b0:236:aacc:ea07 with SMTP id by3-20020a056000098300b00236aaccea07mr11745338wrb.36.1669040593275;
        Mon, 21 Nov 2022 06:23:13 -0800 (PST)
Received: from [127.0.0.1] (2a02-8440-6441-244f-3074-96af-9642-0002.rev.sfr.net. [2a02:8440:6441:244f:3074:96af:9642:2])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c4f4700b003b4fe03c881sm20206468wmq.48.2022.11.21.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 06:23:12 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 21 Nov 2022 15:19:11 +0100
Subject: [PATCH v4 1/3] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v4-1-bdc21e1307e9@baylibre.com>
References: <20220919-v4-0-bdc21e1307e9@baylibre.com>
In-Reply-To: <20220919-v4-0-bdc21e1307e9@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jitao shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kishon Vijay Abraham I <kishon@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mac.shen@mediatek.com,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_062319_467156_4047958B 
X-CRM114-Status: UNSURE (   7.41  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.38.1

