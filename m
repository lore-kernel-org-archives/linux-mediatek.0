Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8323C3A59D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvrIa3O45gpt2G985gqVa8hOF+a0Vp/PW1UMbJtMjpQ=; b=EcH+hL+m1kT7TXOnZ5MUnNOL3n
	jYDCSsxoRdDfPqHfFOmgZKMpqYbaFG3gSAJlrYHegVdCcufCqiEaC27O0XKb76SeHVacx8SAiLKJC
	ZMCYwMqSdADu5QsMqV6fe9BNkUkzLPc8NYxH1T5bQ3iaBs8xmAVnoJ+uFtgbx6gNp6WDxKEkf9LiG
	eWYsyukLHqRQcVGJGT2iifR4u49IiJpYL1PrKg4TYr+AULvYvGDNBsyBtegJXciNHgUk9tfdza/Em
	KbdTSFTqKCY1EDH1Xt84LyvM0Ytf0wpa8wTkFqKJjflC2Ns9hAoqzVN7G8nUoX8qIyElI+V8gbWbj
	noldbhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnj-00F9L9-2h;
	Wed, 13 Dec 2023 15:05:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnJ-00F8wj-0Q
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 15:05:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d0ccda19eeso41827315ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 07:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702479900; x=1703084700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvrIa3O45gpt2G985gqVa8hOF+a0Vp/PW1UMbJtMjpQ=;
        b=dAgwhJL+pvYD288OXMtQIYFXtvcQgEu/L7f2a1o92OGib3eZ3W5oBmp1+a85p4GspC
         b6elvLF4OTA/uEb2Hz2fZV/JXWy5OAskAPUzG6tOS6bMNK3/hEITvXchzY5lC4rrRyal
         +LYNn2Lb2Sd22uIBurQDBwHcNvdNdHOvPwueQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479900; x=1703084700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvrIa3O45gpt2G985gqVa8hOF+a0Vp/PW1UMbJtMjpQ=;
        b=KAXir3RSqLaoS3UsXpiaDEUtG8caS30UIJ43To+GqXzM9QM+ENMrc3cXVJDEni2j+O
         nCblqGLrG3iQhrKrkgDu3ut9ifeV/buXgjH8yKm5nkigiBrE0/OCF3kgiLMcq+54ENea
         1NgXBgmDn4R9hxgvxMAiU7PDoV0WjTf/hC9Dyjd4MLKAVpH7jqSW1fCyqeN5a2weoPlv
         f85p/2loh/+1DwPcE6FF/G0QfWb0nh3M1RzlEppm654g20SE9UCMyw8UXB2cfN/zuKXN
         HXoKozxOO9jLZdUNaXZtWpEaQrB364o4HVa4pvZNqL3BgRvEZ2ANJiqbHUAVXd++WIph
         MvsA==
X-Gm-Message-State: AOJu0YxEqRn68Rnuy+50VZ78KfmF3i+WdEFp6sAYWnPsK75uqIhjSq3h
	DMulRYEG0Nfroykwez7VykM2Hw==
X-Google-Smtp-Source: AGHT+IF2oSj+ur61bjoC52Jha6uiwR39mZ8qZHcGzePU+fWCARUA9rccPDp45Z8i0yEhjvLM/0TPyw==
X-Received: by 2002:a17:902:e789:b0:1d0:6ffe:1e6a with SMTP id cp9-20020a170902e78900b001d06ffe1e6amr4428827plb.77.1702479900300;
        Wed, 13 Dec 2023 07:05:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1974:9e2:4915:58b0])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709027e8f00b001cc2dc61c99sm813808pla.22.2023.12.13.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:04:59 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 5/9] dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
Date: Wed, 13 Dec 2023 23:04:29 +0800
Message-ID: <20231213150435.4134390-6-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213150435.4134390-1-wenst@chromium.org>
References: <20231213150435.4134390-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_070505_201266_EC6EE494 
X-CRM114-Status: GOOD (  10.23  )
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

Add entries for the MT8186 based Chromebooks, also collectively known
as the Lenovo IdeaPad Slim 3 Chromebook (14M868). It is also based on
the "Steelix" design. Being a laptop instead of a convertible device,
there is no touchscreen or stylus, which is similar to Rusty. However
Magneton does not have ports on the right side of the device.

Three variants are listed separately. These use different touchscreen
controllers, or lack a touchscreen altogether.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
---
 .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 85d394e390f0..155ba22e2ad3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,24 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393219
+          - const: google,steelix-sku393216
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393220
+          - const: google,steelix-sku393217
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393221
+          - const: google,steelix-sku393218
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.43.0.472.g3155946c3a-goog


