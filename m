Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6A3C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWHvYV5ANxh44fAnbu/SIKvM1eyaybv8RI9j5qMIu70=; b=R4zrbeCX0la8CVuOv9VlkN0odg
	wPo1ERAjqV+Ta5pCgTt5IgUSTmhdy3VShKo7/3dYLNIBMpDQGj7m/tZTIMhMZz5zaMG1mdbzOtsTk
	9LiIZd+rFM9C1GMnT5XmmulWsrDz5SQ5DYSGPcoAU0r/SP5Ravpg2omoXv9pnqTbw5dz9kcbHkRML
	yh+6AOmi1iXkCu4mF8Sq9CHhx6eyEDJsP+7usIe5dfH7532ou+I+eBfyFixvEreMhcQZSQFkbkMov
	pydIDY8RUUyz0xgf9WG9Q7KOm57OE6yl1rYrPMjBdauvXnqwZqQz+OdQK42QTXgbATlF193JycfPv
	CI81wtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6PD-005fI8-RF; Sun, 01 Jan 2023 22:02:12 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Ox-005f63-48
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 22:02:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id kw15so62886896ejc.10
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 14:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWHvYV5ANxh44fAnbu/SIKvM1eyaybv8RI9j5qMIu70=;
        b=D80aUyXF24nfC9838cOKHP96aBm8eEFTNO5NV26uqleYoSwnPs4VT8p66pZ5t7rNlO
         WbymV29lTpfnvjFdBVgDYYU75DKxiDZSM/9YMEiORNZ9hhqOGChgGAkB81Fvm4MlDQA6
         tAtt67s1rvSdf8D82rDwELCZ72CWr1aqMDIteuo8o0LTL7cTDcuCh+Il9lllpM9sNTxv
         FAtB2OZk830T2QVef0M+3KHXD2axQPhySdEq2WU1mdozzi2298Qxh10XFti/38d2yeuC
         8LiA03SZvkFg1pZDH1/whvcGcdSITcBbXGf3e5kUA8mDmCSKssMfNJZOcSQ8jcY6x2VZ
         9QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWHvYV5ANxh44fAnbu/SIKvM1eyaybv8RI9j5qMIu70=;
        b=Fg3uaMl+Aofww2O5HriMOCDwNUt3bql1PYPvZn67DpFwkbzuyRH8jRBtAUDsg/D4g4
         R05g+l2ytV+NB+Tk0kP7ZzPbCT1F4dVl7Uic6A8Fmf1rTCG+ahJJV/gdSj10QSisxh02
         B28PIwaTyrdKor4WqFlGSq1w2HOT8pw+nY9eosZRzfBhHbK5W0h1qltHd3ghxXXk6rSp
         Whx9ESZVs6+sC0XL7YQLxGnQ0TZxfqOHKwdJxLiwzM2XKI+YqhJtNs06PexvF4k9uTEv
         umYy5SVrZUJ4sIznVjtpa13DwGzATm+3ZUSiaiIF3F6atGm+hEclywtEGM22NjlYKlmc
         QFkQ==
X-Gm-Message-State: AFqh2koHMfJ5fl6npulS+Tci+oPvp7nqrx04A/xgOzYFpiM54w2gmjn0
	3sE+4qsOTjCRufTTFm3ccW2rSg==
X-Google-Smtp-Source: AMrXdXvKToPZxcHkuMoE/615y81aE+lenmdxC3R2EXwCVGX0r600chYCaTjessAPeLLeFcT9WsYkxg==
X-Received: by 2002:a17:907:a643:b0:7c1:1752:da68 with SMTP id vu3-20020a170907a64300b007c11752da68mr29439639ejc.76.1672610512844;
        Sun, 01 Jan 2023 14:01:52 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:52 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v7 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Sun,  1 Jan 2023 23:01:43 +0100
Message-Id: <20230101220149.3035048-2-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_140159_836777_690C6E75 
X-CRM114-Status: UNSURE (   8.15  )
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


