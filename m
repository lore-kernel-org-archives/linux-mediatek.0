Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326B2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAZa5MFL/kgwwXWrMqu8oN1aUslhiGgDdUjW81Mvb9E=; b=cR9Dde+yR6vSr2CPMZP9XbbRoP
	3lW8FaXe+XhesZla4mMp2a+ME1IXe1C8JTEecW6BO72rthOPRh8qFn6e5ue5eKCGb9am0jOPQIYSF
	/CE7NVQ4mZcFnhF+Jj7gxA8AfN/doAL2wim0HWRBvQw2Y2gwA5PJpm4khTK5Vn9oycrrWgLAf2Qt5
	ay0jchoNRBNZQhY2EUCVD300UN5bYquSYO38fgFJTU/75tRz0ulSrigjNCYDPIbnCHVFuJywGVDeA
	7/54nfABWNqfbISiVgqSSohHOCDXSG/1leTrAv3l4X9MmaW87zaB/yFBWq53k8f0aZIfi2hqZWy2F
	rM8dASaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovnBA-000HYk-Qt; Thu, 17 Nov 2022 22:16:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3M-00HU6K-J7
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 21:04:10 +0000
Received: by mail-ej1-x62b.google.com with SMTP id t25so8191026ejb.8
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAZa5MFL/kgwwXWrMqu8oN1aUslhiGgDdUjW81Mvb9E=;
        b=XZBw/6JKc5rCyqd38GXo449XIEv3Pgnx/zV+EwB6bkMu7QdA3f5UMa5tHMvBjgZzBE
         uEKwrFE3SAZzIrnNf8MlwfrdlexUb7BK9KXsHO4ejyvxWkBQVNQ2OJPE5TGb6kKFePGW
         52Rll9OU9NXj61EHN95qVgdUAGOGZoNuhhtZJCVgbrSsiBtj4XK2RVNkmi8IAFBcnU1j
         9q98v1XEcO+CtNDuXUYYbW0usND2Y5IEcutXWvldYBMTxQvk6+U8/S9fQsfAiAWKYVCG
         hrba6pp1uZjPT4F7OIuywMumhy6TP2IAQNMwSiI/0uBADkwix95zhfEFzcQXdRYPmfkl
         OCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAZa5MFL/kgwwXWrMqu8oN1aUslhiGgDdUjW81Mvb9E=;
        b=684mDnS2WvwNvFInE+b56YNMZMk/kAf3nXWJif5zf1v+hvJFrFjW6UZzl6cbm2A9cf
         T+KEjfK8Qhb7bgvwGej/RBZrgM9TAAzifPaKH2E+7KhLqgqIU6mVEH9vVLXy68VhsCzh
         6Avp0lczYpM/V8ft3AbaRc7pvbefiBG/oNZv1cKcFgkcRUkBg4nIhVV72QJMjwlgfkb+
         MQNrvGmkyexR3McVOlrjkhPT6JrXCdSExjH8tsldmi7e8Ng08bCQk2OHT+ndGlP8fbJO
         eCpc19yX2fnGJl2JJKr+3KArithLw1MuZfFlYXTc+XHQR4aauHxSTgfrOLtz4Zhpzn+B
         0aVA==
X-Gm-Message-State: ANoB5plnG+S1ikx0OgLfsII7gB0bafBpYZvx8Z59lN+FEWhf+KK2BIpo
	SwtFoWcPUb+0gXg2poJPs2CVT7M0VpJpSUme
X-Google-Smtp-Source: AA0mqf6W3sFv9vFKd6YCkQLpyKtG+CyoNEaecRwrtqA8rwwNVI7AEZQPgXiyZgWKtmNic/zKOZsXeg==
X-Received: by 2002:a17:906:3385:b0:7a2:b352:a0d3 with SMTP id v5-20020a170906338500b007a2b352a0d3mr3502702eja.399.1668719044782;
        Thu, 17 Nov 2022 13:04:04 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b00461c6e8453dsm970807edt.23.2022.11.17.13.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:04:04 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogiocchino.delregno@collabora.com
Subject: [PATCH v3 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Thu, 17 Nov 2022 22:03:50 +0100
Message-Id: <20221117210356.3178578-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117210356.3178578-1-bero@baylibre.com>
References: <20221117210356.3178578-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_130408_671945_A6655E48 
X-CRM114-Status: UNSURE (   8.35  )
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
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 7642f9350d2c0..a9c18fc7905c0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -243,6 +243,10 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek, mt8365
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.38.1


