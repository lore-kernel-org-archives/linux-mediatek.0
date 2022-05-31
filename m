Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE516C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PpiE3DOYWyuAI5vPJgsYlNLSUicY5mWP6JVloX+Yas=; b=FZXX3AZpkITo/w
	MsSR89kCLh+D7Fe3i5vNYclDI25tcQ2TNUUjqt8hxDCBJ9CxkaktwRT83lnRgIbDx36UxfOCs9YN+
	xv+YEPP7m+YAWOZsw+wEKVgOQ1QDBY1IXrM36KwPhV8Cy1ZyTsuB7MqZrwYrVg/iuwRWN6xkWcuUz
	HK/tCUMnL8hXyDpYFq565aEARIykeHxuT4xG7PPnUPjYfoJyJsP2Km/t/Whfy3O8NckIXTJ0z4osG
	PgjNDrnwuvvelaI3VvYx7WIOU5CDEuYhSB9Dclcn+5vYnGswXCqpoy6sjJhKTI0Qc4hoXuzuamWO9
	78cv1UmEeViqoSHzbu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3O8-00BPqH-HM; Tue, 31 May 2022 15:02:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gt-00BA8N-IX
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:50:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 129-20020a1c0287000000b003974edd7c56so1291454wmc.2
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7hTkqdJSG32FEC0xJwQxsGaVxXfP9pn5uHosSEpvk/o=;
        b=8V4VsGA9OVOOn0SdJ25JIZGwaIM5LceU5cEeIikivz49vnnxZAGp7IY4ojZQryeGnJ
         DP2gZq2HIx2X9KjjPP97ub/aV8GnlaIzRYU2dyi4ll7AaU5prn6VHbRNOuIWY32qdXGP
         lfSx/5pavnyO2+V0r85FCrEZZcgYKBajNvaAwL2INiM/VWtWvlm85BJkhIyhGFv2WlnA
         bgv9mq8TOvr/DR/S/KyRMtMk/feIQVxxIsgVxNxdt57BbR1t/pFrt7PFL6/ATtanGSR2
         VQ114YE12cjm+Zs5zQGB67fBgQPSdash0s6aDAcmmp0Efp6dbTMc/oGaq8ZPhlmKU1vA
         No1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7hTkqdJSG32FEC0xJwQxsGaVxXfP9pn5uHosSEpvk/o=;
        b=QsFsMX2dBHgnGjugeJyPSYQy1vuS2lipftB2XN97Xv+fH3Mhp4oIJZ9hlZYsAbpl6c
         JrpMOSx6mwShDBeP1+7if4lM0/0FGp2s19H/lz58Kc98fC8NoFToVolgxwj0CSRS31ox
         Cgb8pS6jGZWeaukYZFLEY8580jv9t5Nkgy/6jgiKLcjTGZuT7r8S1rofasvKVw9kp+z2
         SdysmTDcU2Jvq/kvRuHQNZFPOtn0IPzQgaLvzFOUh5gjwR9spaW/y7hpdAASEWcplOiu
         SUAF2MKQfvbPk3z3UkTwp8PweZJwC2w+K/AdzyRoXTUqdyitA8xSEa+xJYexnCpnTuXB
         ivtw==
X-Gm-Message-State: AOAM531Y0wxBJuB/Dc9HJcQq2Ocx1+i8Sdzmuw9huBQzg5QeA8iovAeo
	f0ZLkrPjelBSgBuO/5pxdM4l+Q==
X-Google-Smtp-Source: ABdhPJygJdWIMEqnFljSCeHyRbLD1v7vofyqs6EKiM1gktA+EiK+fDFmHMqxmTLq4ylJWgeaim7/yw==
X-Received: by 2002:a05:600c:354e:b0:397:7c1c:5b66 with SMTP id i14-20020a05600c354e00b003977c1c5b66mr23408175wmq.142.1654005051142;
        Tue, 31 May 2022 06:50:51 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:50 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 07/17] dt-bindings: nvmem: mediatek,efuse: add MT8365 bindings
Date: Tue, 31 May 2022 15:50:16 +0200
Message-Id: <20220531135026.238475-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_065055_649598_0DCF8DB7 
X-CRM114-Status: UNSURE (   8.92  )
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

Add bindings documentation for the efuse driver on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 7c7233e29ecf..444875264493 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -32,6 +32,7 @@ properties:
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
+              - mediatek,mt8365-efuse
           - const: mediatek,efuse
       - const: mediatek,mt8173-efuse
         deprecated: true
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
