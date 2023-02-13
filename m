Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91A8C636D7
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 11:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=; b=MUtQSJqJP7AO3JO+Vlu5qweAx4
	s1ns1kDObmbno0dLCGG3BsYI/s9ZHEcpJQX1tMMs4SpXkbCj2Av4HGpYhcbJHyjOsjx2wC3kMXOsz
	/U6htwO5WK1cMe/GjfiDysrQJAWgywGH8GB4f9dEuKE/B2EZNhFp9e+lWs2/EuHjJvT/eLWE9BYgz
	QXN5oEu/weJG5vbBPA8w7rLF0ZdJhvVOwVJiP0KziJKsaKv8OKE7V7bf6N8xfWfHm/J0hZroDEjnK
	g8I6pApzkMjrz866yR6RyJSsyFmFaOaSnbs+DfeOYMRs9zlAq/2Elh3wPkMP4IStl5eGHSsJbV+A9
	ECuEFQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXAU-00ESxK-MS; Mon, 13 Feb 2023 11:38:46 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXAR-00ESsl-98
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 11:38:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id sb24so7125701ejb.8
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Feb 2023 03:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=;
        b=KyqOQ0df6FEgf9gICiV885GCDpndXa+lmmXMH+DHBPy7eqxKtfXKKn9XGwj5dOCd6h
         U600WT99CJeIqv9SN6dPkfq0n4AdBZyCCft8S0+uSYUvsTfSXOh1dM3Gmm1KRCvwTaOg
         vHZg+EZMweMGUw8maNeCHSMmQoFyn9CQ884ySoEmqQ071FtHiOwavfrDcwDJKYcbKwYg
         T2/Tg+Cyzs0EVPv6bU6wvrI5RjxXX7t5e8HJg8sfAMcBUoHqTnQd+XA5LQzjBDiwo/cR
         3PK/NvdcMiUScimQVDwhE09vdgZdPEj3XHUAc0ErMJZ/7qPSXtzOFuJ/szdkX7SG5cJD
         pByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=;
        b=zfpHCEHPol55ja/ZyMvtbqCofh7Ruz5Gn1/8JzVomXXtK9NaX9r4pTouUPO5+MVXdp
         dzWEFcjf9yXscnUFbXxyLTPdeTfhSjl82DRKrmTVwonVQiBZic1MlbtpvfNsr6lLvRa4
         KZ+wusG6+bAAs82Gl7A8C/wEimWalgVGdCVxICwYnxKfGxnXdco4+z6aItUrgloOXzHi
         dvZ+erQsjVyOa5HyNy3J+9N4asUqnvNUidKXow0+GZpo2ZC4jtuy84QEQ/kgjixHaLW7
         PnrKI/nO4gQ3dXAbdq75WTFcpQbQRa1KdRt2+V43nzwUCd3wX3z5hYD7MARVa0xzzAhb
         B/dw==
X-Gm-Message-State: AO0yUKVPWowv7FwN9eizj2LmoIXBmUh7m+0MP7CGWfga+xCeIzXV8gKp
	3UyQ36uKU0qhHKIbCX2F5/D5HQ==
X-Google-Smtp-Source: AK7set/M9xakFWvqD0VD285d3nonWBNhQ4te0JGTGn3C/66m1GVrSXBBXD8MX5r0tcSBxSBOBeAiBQ==
X-Received: by 2002:a17:907:75d4:b0:872:14ea:1a7b with SMTP id jl20-20020a17090775d400b0087214ea1a7bmr21115151ejc.13.1676288321224;
        Mon, 13 Feb 2023 03:38:41 -0800 (PST)
Received: from [127.0.0.1] (2a02-8440-d206-ae05-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:d206:ae05:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906061400b0088ba2de323csm6638792ejb.181.2023.02.13.03.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 03:38:40 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 13 Feb 2023 12:33:32 +0100
Subject: [PATCH v7 1/3] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v7-1-b5b58c5ccc07@baylibre.com>
References: <20220919-v7-0-b5b58c5ccc07@baylibre.com>
In-Reply-To: <20220919-v7-0-b5b58c5ccc07@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mac.shen@mediatek.com, stuart.lee@mediatek.com, 
 Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_033843_405531_E38F4478 
X-CRM114-Status: UNSURE (   7.69  )
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
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 6cfdaadec085..f3a8b0b745d1 100644
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
2.39.0


