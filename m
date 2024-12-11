Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD84E77182
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jun60MmpzFO+KyxqgW/fdFZZGJL7nbsZCnl87/9ABDo=; b=iJHdGWwTpudll27/9wdfIoUB7J
	2B8dMW4LrjlaQG6Yv3IXBCgoRdV5nerXQKiBQsLnYZO6P92EWZlh8sustpnLYEYisEyb5xQXPuAC3
	+cUOMvMNzpxigHMzqYeMjrEnMbPHZ7ADkSkiV5QPxukpMnT6c/XefFJpdhapHpbtgKSJveLlXALkI
	TeJP9XuhgG52g6e/6Rl94LuXZloMWsFa8HEE2sSqAb8S/j1Kf3L093uyvHiEsklLZeSJ74VloEb2k
	+PhIEJX+J9Oox1CRF5sIiA+Qs+pNWmP67H/IxDL0UglXwwAocuC0Hqu25qTEYBSHiuacV8+YzuKHa
	eTLaNeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFEE-0000000DpN9-3Vcz;
	Wed, 11 Dec 2024 05:25:42 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDC-0000000Dp2v-080k
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-728d1a2f180so252375b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 21:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894677; x=1734499477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jun60MmpzFO+KyxqgW/fdFZZGJL7nbsZCnl87/9ABDo=;
        b=lO0rmazp5TKs25tg6u8oSKqs1pxHm8tGfCp9wOeYzjT4Fi0H1EHZ43ExTjOfxjMzLx
         U7NJXQDM0m4Z+yymmMcFhB1O1SdOjyR05LbNfFE75jm1kKTrQgJgc7P9Wz6e9r+VpQBo
         nx5gnaSB4ypkGw+YDZKRbRgZ+w/2Pyd7l2d44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894677; x=1734499477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jun60MmpzFO+KyxqgW/fdFZZGJL7nbsZCnl87/9ABDo=;
        b=QH6kiqzLa7aCzwCEAAQbCvAV15J5sfJCbS/MTvB+tku3dlnunUbNNWLJfVR3Kfyz7c
         Iz4s3o69ym0diy7ZzGGnr85Io/lRH1uLil//a2K4E7AEOmd8ll4Yyl3hgT82lufqxh6c
         Mocz6vmgTxaeBUpl8dtuBQ5hspigj7ksQEHQsW8ya7/Pz0Rb+ZithQlTcRMx95j1ec/t
         DR0N/JlI0sGmfAGbRDu9nP3/tIVLv5cOCktTVbHXUubwoVIaz1v5fal1GvQImiud0n3k
         A4l9HqqrHw93kH3DTk2vdqstPa5ogFKcG9+tfKxZKmreoWOqAUcFcI2NfryXHS6KC6bw
         ALBw==
X-Forwarded-Encrypted: i=1; AJvYcCXNUzoNfIf0V2PdSwfLix4JjYz8TyvDRY/rudMoRZZn6LrpgYgfqwCWe61R2hUIFFOeUvqE9mOvviFkpvNtFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQGPAl6TJlSjnjhz9QGKNMkyxjOX5HK8r3pncBzL/Vb5nl+nu+
	ltT3nHs3oijwNPrfvH1c7uTFkmm96GQSR26PlR8MJLUQyYl89HtuJZr/xpABBQ==
X-Gm-Gg: ASbGncs5zSVCvt/EPi6JFfrcBZODZUWIcC1FoNqB8cv65Nwj9Pz9nrRUspnAyaFggpd
	qqugnRACuLXp2xolFLYyMUEJ3ygCv6FPh0Io/FTJXoLpvTIohaOVozfbHXM5VJw3sGLnpYGtCID
	kafAk85O0RFdF2I+mywftsocf1tRPH2sztnJSgqZUezKD8gYugMDE2jbapuZqp/gbhMiyAzDhFA
	KlMPdb/KC1zcIo5hQW8FknVAajg02C7VHMHkUBFaKVr7ixDi6hCNgEa3rP9pr3hC40AfRas
X-Google-Smtp-Source: AGHT+IGbqDRc3+clit5iH+/2d79c7sSOb6z0W5OMm5yS5wDnwt6aR/KeI2oLsBGyyaqwf97b+Km3wg==
X-Received: by 2002:a05:6a00:3cc8:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-728edb5c343mr2486433b3a.3.1733894677079;
        Tue, 10 Dec 2024 21:24:37 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] regulator: dt-bindings: mt6315: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:19 +0800
Message-ID: <20241211052427.4178367-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212438_065302_A3DE226E 
X-CRM114-Status: UNSURE (   9.49  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It should not have been used for new
submissions such as the MT6315.

Drop the property from the MT6315 regulator binding and its examples.

Fixes: 977fb5b58469 ("regulator: document binding for MT6315 regulator")
Fixes: 6d435a94ba5b ("regulator: mt6315: Enforce regulator-compatible, not name")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/regulator/mt6315-regulator.yaml     | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index cd4aa27218a1..fa6743bb269d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -35,10 +35,6 @@ properties:
         $ref: regulator.yaml#
         unevaluatedProperties: false
 
-        properties:
-          regulator-compatible:
-            pattern: "^vbuck[1-4]$"
-
     additionalProperties: false
 
 required:
@@ -56,7 +52,6 @@ examples:
 
       regulators {
         vbuck1 {
-          regulator-compatible = "vbuck1";
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
           regulator-enable-ramp-delay = <256>;
@@ -64,7 +59,6 @@ examples:
         };
 
         vbuck3 {
-          regulator-compatible = "vbuck3";
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
           regulator-enable-ramp-delay = <256>;
-- 
2.47.0.338.g60cca15819-goog


