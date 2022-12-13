Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69EC4708D
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unaiPR7U0bSA4jIaNyFaE18Ri5beRIzrT2lfy7T7b+k=; b=EdYoUeXsoMwVdYbFKSdffDkccS
	RBROqZi9c3khzpF1FRScv1KGV7j4KYB2mEs5D+PU23ivqTIZybRgy5kNPQlYUO7m2XuvKBYZA08Xp
	qMbB5hyvcU0lkeD9iSGf2w9W87WvMti2UlIygYXNwJ4Pk2keLpYFPLrVkDcxwYxLTYerETH/Txi4d
	Tx0agAS30LUTTCk/I4QEyTi4OP2erliYcTbI9XbM4t5l55QTorwihjUdq7GhRyoCuCj2oZwItP7y9
	s7ayDHwqp6NOCOjTgNsiF3PtwxSLjc/UyJ8foeArzBiWnwfnll0gcyyfcRnDNW/aFJw1SJT9p0l6q
	Jri6OwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ewr-008BHi-TW; Tue, 13 Dec 2022 23:44:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5EwF-008AyB-7Z
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 23:43:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id r26so20165856edc.10
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 15:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unaiPR7U0bSA4jIaNyFaE18Ri5beRIzrT2lfy7T7b+k=;
        b=4BP1l0f65r9/a+w5k3VKrLf4iTN60No+ztQ1ub1VqcSXNxyO+B6M0qqvd726B3OfTE
         ayFLPh95wwH+lh+CvmzpgPSMOvvOr/ePFaXJAn4YSRh5e2qtRPQi2F3SbtZgGuEgO0SA
         WpjV4T8gztSAA2XQtApBHrBxPt7kYLz8lYLgr15f0/CgDXry8EBSiEZ9df+zCb2ZgRVA
         DULZTZ0lcuG6TdqoxnnYcD0cVDQFp3JoJV2c+jRgkdBytpNOM41aIc6LSJ4KQibOTz5S
         ybbDlOTcNgVlcz0yCH36mNjGJbK3cGFD73kLmRAtVFgNJfE4InUBISWknR2kQjNJG82y
         Z1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unaiPR7U0bSA4jIaNyFaE18Ri5beRIzrT2lfy7T7b+k=;
        b=ktPPcXPKIYjbTxem99TbIVhECiZXTgG8z6rDo9TYitEQf6gt2YRChppzATq9v25YK6
         rQroKeHmDogYwedA6WC2OcaVzCwh6R70VclH7/cUaW5lTEbvHRpOV1S8+oYo7lSmcsG9
         ZUgTiLpfmqc8WISAM+tFhwH4ZlsDmLciwHy9KLRZTOLIWeYmwQg3eoWTfcSMepjP6sJI
         TJziBPBZ7hh8hzp98Njpa0jypqzhSPw8ftFemh1k7Y+TLMWNvQeD/8JQB64wHzu4rHi2
         CXBotFIHdSc65YnMnAy91Bx1xjNfecOzoXYuy1x6lRUbLJRnA7o6wYOuxew0dddh3fIT
         RXNg==
X-Gm-Message-State: ANoB5plqPRaSYEr+hR6ZzHfzOUKrTedzibAFUSlBQjNL01PlW0jqDsju
	3LFFnPinCwvNBljLzTiJguGSWxzYXR38lWYVwlQ=
X-Google-Smtp-Source: AA0mqf6VVtH0+m2H7JGcxe0//+7NbC98TbZH9LSOIcRviAn+dwdPkNCy6oPr0SNQJVJ/jZokDfm+QA==
X-Received: by 2002:a05:6402:f23:b0:46b:159e:9511 with SMTP id i35-20020a0564020f2300b0046b159e9511mr22304036eda.7.1670975029720;
        Tue, 13 Dec 2022 15:43:49 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-093-129-109-038.93.129.pool.telefonica.de. [93.129.109.38])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm5407498edx.92.2022.12.13.15.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 15:43:49 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v5 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Wed, 14 Dec 2022 00:43:40 +0100
Message-Id: <20221213234346.2868828-2-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213234346.2868828-1-bero@baylibre.com>
References: <20221213234346.2868828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_154355_286711_16CA212A 
X-CRM114-Status: UNSURE (   7.39  )
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


