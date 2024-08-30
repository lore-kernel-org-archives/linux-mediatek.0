Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EB2CA0EFB
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNhoisuk/jUSOFe52sR46QCIHvi7hEsksA7LiMmuHN0=; b=3LXv6udmqd3PZenAyqg26dASjf
	EkKpr0rbB/2mjHFWxoLvyZFVPli7y60pTbbBTQTX+QmS6IZeu8fQdnjO0StlMUzeIdvAIIV76sSpr
	yLMILrbXo1Za1RstzRjUWZbhNhnNTGAiPJgyQUJbADpqLfcz3mW9MGV/sGCeQ+Ae8llu50oHt844d
	PGRG1itEZET72KH65PfBUUgCWybJNoXoupeuMwo2YeE4mePOc94Gf+Fl9rDh60aNgxASX+066M50Y
	LKXMzGJ4jCA2zD6IMf69vJH2AX3WmzlzO1py6t3eC91pJQQiDDjIxtncRQoH2wutScLydMbXzNLuh
	sp3IkkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyRK-00000005gCc-1RSB;
	Fri, 30 Aug 2024 10:01:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxGh-00000005PnV-18nJ
	for linux-mediatek@bombadil.infradead.org;
	Fri, 30 Aug 2024 08:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BNhoisuk/jUSOFe52sR46QCIHvi7hEsksA7LiMmuHN0=; b=jCrzT2wW1o+lMdUC4afLsi3hlx
	NUx74c1stpYxbEprAWwT792vwKrVOn33J5E5tqbzEqQMwPDUhaQa+D5iuegHneE8iZn3kMEXOM6Bk
	87rpKx9nGoMek7hkvwusoDtqoNmIUh1ekXnMP9t/jHAOPZxte95PM3pqHgYsYWVJGGVLznNXKfLay
	XclqcUAHlbvK2ZfdWhv4OBlYSkKEL+Qvh8xJDlcOkD5NWjkxtHRBEpfdGUz1yykLM3eSQ8uMT6mUG
	xpQpbdQUyWIa7EA5D2dCT2cVyPeiHB3yPjIykc32Xa9o3F1CB4dxrXqvFLVOER7N5W1JKSu75AHha
	yQq7czHw==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxGb-0000000Bc8Z-1kv4
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 08:46:05 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7142e4dddbfso1259184b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725007558; x=1725612358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNhoisuk/jUSOFe52sR46QCIHvi7hEsksA7LiMmuHN0=;
        b=nuCPvJZTpjmOkeY4CzEig8CSlwd6i0GjFN6+V+Ttayr+6gyCc8+L1Kn//u+baiBQIH
         TvZFePWNEMcGlUjq3hdycFkW4hZKIqs30CwobtZ5VGyVKP2unx8gATHkAvheoPkyt8gJ
         Mia8ghEj4dY8DdtfxToRC9h3eqQf3pHpF658w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007558; x=1725612358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNhoisuk/jUSOFe52sR46QCIHvi7hEsksA7LiMmuHN0=;
        b=JqeT/eePHKOn0EnUEo10+8EZPjLtvVHdgd5CkAuFrD2/9mWo+EnuKHgnYxabArmV3e
         ZZoJOHLDAPvnFsz0YCNFkRM+qu1EalMOjAcweYi0vCcOyEVINRCrCd++HIV93nPHDWjx
         bMhuwdjxu1EyUZRSti2S9TqKkeLsMarf/U+yP40l0vuuUqo9eR0sL+omlNrNyY1zYwxK
         lBUe4f50NtQiCTkXmCPMdA08PVPjsKFGHuOjU25AoV8e7ltuxGgPCidrV4rzcccIViTN
         HWInBsNQlxEGp/bC9ifuMgo3GUKZUrCmg4SqEilphlHKWezqaQ9OQc4coUYDxECM3FkP
         vmiw==
X-Forwarded-Encrypted: i=1; AJvYcCVmCQo9E4TUOwn9s1e1JKdyrZ8BBy/gj8yZEKeeNiH/liDcO5rX4DpeRjhR7nIyh+3yH3ZpMGrbFfJMOoRStw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI+OFBLHBVUxtjYwoFNcxcdsK3O7SGNLKafY9s15Z/opFGd9w8
	jS5EsTYzRjkLhlnGKp+44L1mB8mVueqH7WLyU6Cnev1oOfRfRUs+uDfz+SldDg==
X-Google-Smtp-Source: AGHT+IHJFS1jtvkTZ22k5pD+Kn9bReufF91Us6y0WLt5aVVQ6EqMEnI6zYAJ2oR7UwfAiAfac5+tAg==
X-Received: by 2002:a05:6a21:2d07:b0:1c4:a1f4:3490 with SMTP id adf61e73a8af0-1cce10a7fd4mr4563290637.39.1725007557633;
        Fri, 30 Aug 2024 01:45:57 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2d8445d5bb0sm5784248a91.1.2024.08.30.01.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:45:57 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Fri, 30 Aug 2024 08:45:42 +0000
Message-ID: <20240830084544.2898512-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240830084544.2898512-1-rohiagar@chromium.org>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_094601_748159_29C11D16 
X-CRM114-Status: UNSURE (   8.21  )
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

Add power domain binding to the mediatek DPI controller
for MT8186.
Also, add power domain binding for other SoCs like
MT6795 and MT8173 that already had power domain property.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..3a82aec9021c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -62,6 +62,9 @@ properties:
       - const: default
       - const: sleep
 
+  power-domains:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -76,6 +79,20 @@ required:
   - clock-names
   - port
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt6795-dpi
+                - mediatek,mt8173-dpi
+                - mediatek,mt8186-dpi
+    then:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.46.0.469.g59c65b2a67-goog


