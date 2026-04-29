Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23017FF8867
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=; b=Pf4d0X/uJvQb+UnukgXxg5EeN2
	A9Nws54F7YRzU5pN72Cyt4f0FfsS18m6JGOvbkp0Iu8ZH7hYg9eKhYN9m8IiBNvP54uvxXxAttDg1
	xcM8mLXGpkraGq7cPXeR9976maDE+/pF8cxeE/6xRlTv5CyQEF10PTEpHSLQAN/zCjJtREZ50lUpe
	/Ot/7DMs6FKJVvqyTK3t9EHXoIWHB8vBRLG/ta/0lWsT9UwJ/U2bQjAJ2LVDNw1pA1gbuLzAeJYm7
	ArgNvvPrWwsK7kkVUyg0V51Om/zXTJvXfs7rp4+zJhtCgUtxT2mnpp3n2B77oWlzQgSxB6yIUv9Gp
	K0zULGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYD-00000003AoM-0Q2c;
	Wed, 29 Apr 2026 07:41:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYA-00000003AlO-1gAQ
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35fc258aaa4so7716321a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Apr 2026 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448497; x=1778053297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=;
        b=U4vc4/bvYWNG/d90mm9l7Ok2NJpUZO3NUUvkPkwG4GdKmANSOkon8FOROXnMLR/dSO
         YDzWvYdgJ1F9NgITrq6RyLGBUzYvLfToMCVReGnS8Cm1T4qgXA5As6PvlVDivHIDWN2D
         IwyYqf6Rn4uh4r+S61/D6CrkH5bcmNkW20RVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448497; x=1778053297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=;
        b=ruBUpDlEaB3X1zTJUUPCmNkWCAH2IrPINv3wNe4FH7zgY2gCym3d2BLNUKpZ1MQLmP
         nnQV+Ksq87wII15Tw8uR00ttVZNSmYTLOuH18QuUhbQwJHzjL/DTEJjivXqg/TQxdty4
         zuc/KtvZev4uLmz/Ibi9Ons2Pa1o82x5SzIS7IVpTXRO0wqZqpepLnVOvZKawduFgF+D
         FZNziFIKRbalxKeEyau7xf3XS0L12JVxLwRFVekD6yIw7dWuJ+fXj2icF4ENvHGjZMEr
         bf72yqpbCQiJsSzIRcQoFyaW3hN8s319ANZgnjuaouBiipuqKoi71JP3SeTtmnKjIC/M
         SXVg==
X-Forwarded-Encrypted: i=1; AFNElJ8S3cyVddvP130vcrYM+K7VrILfG+XOu3azOysP0ponJPA1Xzgo9aUxgph7pkCGh5lj38YxL+m1HthyC2QbBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/PlSvBrlYHqI54ONBDBLX6qV7Ym2GDD90B23v4w9mkXf2uAPL
	7HnOpQ7Q5uoVrEgQf6QPFqmgUkVaaZG5yJc1zsiQPTBCUXxe3oGJ/P1cgawuLm7ehg==
X-Gm-Gg: AeBDieufDZQB2zgQcat5MeZJXnZS0EdT0CTguoLoZPGSQryQVGZrFp3Cf89ParxqLQZ
	moCS97p67Ml8jrIClB/x5vOJ1GCqQ6rQPYxXvwgOpVkXvpdRPQqmhxsX15e5fS97tDkUrTOPuGy
	pZjX+lpQpPdcORQhBqAwE5DC4sT7/h7TCm6HRuQ1SpmJM9B6rvQEQYEPKkRyJQhQSABg/kRbUnC
	2J2iecGj2IXV+v+g8i8kivuhfaoOEUS9B4xpR+B3BErTqPCp6W2eVAyehu5oRBbNgvaIeDSTwSs
	GFIxPPN5l9+/F67LEaE+98ejLlfuQ0igxkK6MfgxIMG6y2XJUNQ89i/WnZa8vrR963DKbFWhEs1
	OlXqZZsm5l4rL0dZCFyt3YS1+1dclEyG/VoZpZ+ieIvV/qaUjWIXwt94VVBdz2o4VQ4o7GKmAhv
	E/WvSf0b+u5y1NfFwkTKCpzgOqDXYh5Nv5dEaS1FlXWul0HjVPuDgdlH8PqWun0St0ETX3/qO01
	VDDHDHxE1FgS4C2zwHhzUcGuhlAIg==
X-Received: by 2002:a17:90b:35c3:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-36491fbf094mr6917809a91.4.1777448497660;
        Wed, 29 Apr 2026 00:41:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Wed, 29 Apr 2026 15:41:09 +0800
Message-ID: <20260429074113.3720271-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004138_441209_DB528DE4 
X-CRM114-Status: GOOD (  11.79  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- deprecate the bogus regulators and add proper ones, instead of
  removing one and keeping the other

 .../bindings/regulator/mt6359-regulator.yaml          | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..eb62d6a0355d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
-- 
2.54.0.545.g6539524ca2-goog


