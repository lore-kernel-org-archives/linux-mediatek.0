Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2998C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQHpVtx+LpswpCMfXbkO632FqFsBYitErFq0gVprKlw=; b=BVwyvHH1SLTxg5USwGXU2pAbrf
	m3usClmXv1NYtQw0N0DFRnyNbSqV69ypvoEhzrfZM07y48mIiwIdR9vJ7/GXik7fImMFjPGv4psQN
	4tgM0BkLdKCi9h46sNEx7IcLojfMzxdeMXkF5wxmRVcGm/gylyFBwCPaLCcoV+VpccH3sKZP4UFUO
	jP6gQF6BIX1bUYqlKzhIhqJ0ZXVWIUKT1mKyHerS1JzoM41ZXQ8HFwT3nxFTagSM6SZWfyVdWimyx
	e0JxHDMPKx7Hoeb5tpEN3IdN/NRyQszBv01E/xe4Cx9l7YbeZwWPuYG75sHEI8rJOPZrTC0eC2Wv6
	rgGsszmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xcv-00CqYI-26;
	Fri, 01 Dec 2023 07:07:53 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xci-00CqQ1-3C
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 07:07:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cfc2bcffc7so2041095ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Nov 2023 23:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701414460; x=1702019260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQHpVtx+LpswpCMfXbkO632FqFsBYitErFq0gVprKlw=;
        b=gJ5FQyo7AU2vZi6u/w+vV9y67xt5AZ13EtbGtFp6T4v8sCNvE6Do3pqZNfvmdq+5Rl
         GICfGouJlDkp2hWHof54MUvCHoJotUIXpZHpxhhzn/C9LirZFYk2Rd+xls+YiobKpIy0
         h2/qGOgHgVDNpVUbNX+3dU0l3qLt7i3yCPVHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414460; x=1702019260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQHpVtx+LpswpCMfXbkO632FqFsBYitErFq0gVprKlw=;
        b=MhOEF4E8pl4opTsH83qrnFRvaK/KNuBMrwG8Lm036IViDlDVGAZTlvTHTSGt5sR1p+
         H8/2V77uyt8Rs/1cgKN2dACGzouTMWB1elA3VesaWOgmtBh1pkt16q5QAGCqIh9lQtNi
         tcg/q82dbk3+rNeQBnHQJpdNBgQCTI0wxoYxEzErNq1BsPSrvscjV+yLuyIKn0GI3qkG
         5HLbJIXrWHSgaqn9vM6KC3fKGPzRVrowNtQGUJveB1pTSchmI6Kuu6D8cSN9SBj/4tZe
         Ic56LrOwmv2XVpHN+WBK0w2bEk9VQTy6CElJEhuLakS6wP0jWKu8sSN3qkl+FlvRn3yZ
         8rag==
X-Gm-Message-State: AOJu0Ywujt0RjC4xNTLUgYSuRPZRAPw8gkhFBZZas8KFcLfvTOMZbl0+
	2EB1zgkFnz/fCbCdLAmSbJkvuA==
X-Google-Smtp-Source: AGHT+IGrBVTo/lx4apWNRjqAHz5Fo0G+dTOBGULwAUgJTeKOs+idQWSAwPIk2NfwmZzh5FBumBHi6g==
X-Received: by 2002:a17:903:41d1:b0:1cf:a718:3ac with SMTP id u17-20020a17090341d100b001cfa71803acmr25221498ple.13.1701414460352;
        Thu, 30 Nov 2023 23:07:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:720a:d435:c253:2402])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709027c8a00b001cfa0c04553sm2558684pll.116.2023.11.30.23.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:07:40 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool Chromebooks
Date: Fri,  1 Dec 2023 15:07:06 +0800
Message-ID: <20231201070719.1229447-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201070719.1229447-1-wenst@chromium.org>
References: <20231201070719.1229447-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_230741_032725_8E84FF7F 
X-CRM114-Status: GOOD (  10.67  )
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

Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. The two
are based on the same board design: the former is a convertible device
with a touchscreen, stylus, and some extra buttons; the latter is a
clamshell device and lacks these additional features.

The two devices both have two variants. The difference is a second
source touchpad controller that shares the same address as the original,
but is incompatible.

The extra SKU IDs for the Tentacruel devices map to different sensor
components attached to the Embedded Controller. These are not visible
to the main processor.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reorder SKU numbers in descending order.

 .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 60337b439744..709a1292bca7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,32 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
+        items:
+          - const: google,tentacruel-sku262147
+          - const: google,tentacruel-sku262146
+          - const: google,tentacruel-sku262145
+          - const: google,tentacruel-sku262144
+          - const: google,tentacruel
+          - const: mediatek,mt8186
+      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
+        items:
+          - const: google,tentacruel-sku262151
+          - const: google,tentacruel-sku262150
+          - const: google,tentacruel-sku262149
+          - const: google,tentacruel-sku262148
+          - const: google,tentacruel
+          - const: mediatek,mt8186
+      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
+        items:
+          - const: google,tentacruel-sku327681
+          - const: google,tentacruel
+          - const: mediatek,mt8186
+      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
+        items:
+          - const: google,tentacruel-sku327683
+          - const: google,tentacruel
+          - const: mediatek,mt8186
       - items:
           - enum:
               - mediatek,mt8186-evb
-- 
2.43.0.rc2.451.g8631bc7472-goog


