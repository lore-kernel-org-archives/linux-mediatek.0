Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0734DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMx+8lnHYaoQJGJTnVIZj+JIYuaVktQaiA/S5krH6nY=; b=g5iZVnENdFL1VGqMGAt9IXrcSS
	OGw9Z4xTDQEeptoQJ4+kWpnNskS8Vv2OifAo2Mth9plTBxyQ6FqBB5f22EUH5hf1FnaEMMzJeWE/d
	4OPJimpc8iBO57EbGv9F3LDcuz9v0mJpvE7sHXdnyTOEXrk6IKqwgO8l10dAIstKk4I4Rv4XpxYjV
	yqmMIJf6+i7m/i1pGgPU+1MMJsa7C4QKLLcPrJjxq1Twizf1pgWsRj0ic94Wold18SLz75DkAYX9z
	5buET6IZlHTTG2AJgGn2Qx4A7c1H3jc/D3bHbNitk+M3bwBajpexy1ENhQh+7pNVG41is38wSwBrk
	6Z+tzZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum6h-006yet-Up; Tue, 15 Nov 2022 02:55:27 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5q-006yKN-P1
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id kt23so32921696ejc.7
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMx+8lnHYaoQJGJTnVIZj+JIYuaVktQaiA/S5krH6nY=;
        b=nWwH779Yad8VbMbCthQlgYkEo6VK8aaVP5klpz87p2A/ZilUOS5P1mvPCviRhDoblU
         dcquwc41Bw+lnHD8UD87tGcSOkM8KI7nUqFQ5I4pzK4/IE0ZjwpXB8m01WISHuBOoITG
         2eS+UMoQHcfes/7AORAM4G14neN5ET24bdSFF4CDiXA658PAkIYbHO6EwR86/PJZhaNp
         DXjv3rjHmL4CA1glBAYOqzLhs+zHoWryoJSsFc0uzqXYkbdGvgT6hIr3F6lvevkcpBBV
         OK8SnV0lzJ0cBz1ytKjrxBhQstItVDFINmq+XG4xK+IiBHWHGLGoF1A1gSuV2vltbVVB
         84FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMx+8lnHYaoQJGJTnVIZj+JIYuaVktQaiA/S5krH6nY=;
        b=Hx1S0zEqQra0nUU/CqO0t9Puk5ad3HQIKeggnXM2Z1Ys7APk/2Z1fDtPUUFSFshg1f
         g6oyAxkbOLtX+3ag6KAHutUCwciHehwu1NDGB50zbJdikMHOsK8pKXujrnlZ1xVcLCzm
         tmD+PgBxnWDYIfVTINkyxJuSxT0CEi3UyYsU894l/dODjp0EO2C0m3FPR5ey6CM+kB7K
         a5EmtA9HaIcmobVtnkc2MqxwV3bgVA/0wFlnhZJGUp5WiXOvTGP8Vd9jF4VtJkJsuLyz
         kAYrWz5tTFWCRIVa+SBOS40g3o2ok6Cj3kDAZ9mJOob891+Nnh5XpmeK2iUa8jmhejY1
         5sSA==
X-Gm-Message-State: ANoB5plGgIDE0BBwpHrGUdNbh7WkzR403mS3iitB/TB3iwuZXw5nBpXX
	mBxIehNjhzlEt0zEijJsleryT1chVlD9M/NS
X-Google-Smtp-Source: AA0mqf44yglbutt2AVjrjMYoluO69lhUJwJSnpH2BUmbB+rceVNA9A3KNZaaoX1cHShsIHoniDXmow==
X-Received: by 2002:a17:906:99d2:b0:7af:bc8:da37 with SMTP id s18-20020a17090699d200b007af0bc8da37mr3882187ejn.18.1668480872354;
        Mon, 14 Nov 2022 18:54:32 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:32 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 04/15] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
Date: Tue, 15 Nov 2022 03:54:10 +0100
Message-Id: <20221115025421.59847-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185434_847874_B8455106 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 421563bf576cd..2cfed35bfd9e9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -45,6 +45,10 @@ properties:
           - enum:
               - mediatek,mt8195-i2c
           - const: mediatek,mt8192-i2c
+      - items:
+          - enum:
+              - mediatek,mt8365-i2c
+          - const: mediatek,mt8168-i2c
 
   reg:
     items:
-- 
2.38.1


