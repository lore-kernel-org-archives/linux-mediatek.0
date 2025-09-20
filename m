Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBCACAC597
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Gusk5zt0HMd76bDL+pQKEW4NdN74ndDk79BJJ1+vw8=; b=XNwaUP6bnasky5/D3T6RgY59oO
	em863tw9jTR/ReZO7ZNEB0bAxBCVSvwgVaRKCAunFTmkJ0XwUB9lasGnVMzWvkvbCcnPn83gdgwG1
	6e3lu0HQjdZCGVQIY8qg16jOP+WUCPb3UJK96lIR9/rKKOWB+waYxrar8x6exrre5F2T95WA8ZIyX
	BAXs5YwwSRWzAxWk45O1/kNyARUfOhcP7CV1RFnueer0Ja00d885G2bTBHafutiYlOc8UPsc+GcQF
	cI6VInScMOBs8yfaNTAvFQpOjAs2pgZDLJCPOEAjRglaKGb4hXm+G+RmYkwuzAVqCuBO6O9FzPvHN
	+vTxMSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzteA-000000055pb-2c8x;
	Sat, 20 Sep 2025 09:12:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzte8-000000055oH-1Ihv
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Sep 2025 09:12:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46130fc5326so20012975e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Sep 2025 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758359562; x=1758964362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gusk5zt0HMd76bDL+pQKEW4NdN74ndDk79BJJ1+vw8=;
        b=BzIYRLQ1thzpJX1xaeX5fn4rgHV2y/DCwA6vnkF7ePfgIxnKcQA0WGyEhFS32tIA2H
         GSo9jF1/wg8DoWGg7SeOJNrby3bfmJkSqhQEjsdaYyIGGhX6OauZQmI3xhCWMYzU01lO
         puf867i9cHp2wMBxET2gzzIYHqZpje305lAyElrQaW1uatJEcSizHmjQdq3z+f+sxM3o
         3XPhHmMF5IY11c4uhdndk/Ox/e+M26tq5DvmVIP8HEN9yoAVismXZna1HhKAh1BP0sNG
         F4o5eXRRTfCJ4r+LNQMdFEjPUGPfbULX4E028PylihZY3KT0LZWveeSXBwgKw+Yv6L1x
         5bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758359562; x=1758964362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gusk5zt0HMd76bDL+pQKEW4NdN74ndDk79BJJ1+vw8=;
        b=jP2rBYqG810h7gwqcwXWhTsdNZwHSTbzE5MHPhvpOvCl7rCS85ODgd8n+3UeU6RbLh
         fLjjTNIgc8JODFMYFXjoCOzOKLqnJ4EHYKCDGzatN7z7DQJjVrLBxLinBt8wr//VWpVz
         pjv+fVAwh6pXQmqLgJJsVbVZzNTLkm1RnflckYI2a0DJUAo2uQnKkwEHN3ikSf5boF26
         l0dyhHKO2CXLn+LSyOzWNnew3K78gFJ1h4/9GPQDZOyNM3EYoetEVyfWy9Mm5AVyehv4
         /FYMiEwiaPjjZgwM28I1yL7AOJHod6+YkYaYkn0M7J3VWOJCUGT0qacdQTgkTT+XWvQu
         7fcg==
X-Forwarded-Encrypted: i=1; AJvYcCVXxG4LYfLgTrc1TgnpY6BzlKj3jKu7ka9OrsSXKqkl1aPOpkrkxzx9b2G+TyEL/ki5oxwyR8c6QtSQtFfRsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR24FREkRwT+yeVlaCIxqtpzv9q+HLkzQXyOEabdFoQzfvnzux
	XVpNecwQS3+C+Gl9ZsId6wB0ZBLHSYyMqZ7y+jKStHJh72iCaXSRqqJV
X-Gm-Gg: ASbGncu6ruVYB4zfV7TevHE73n5Jn10tUdARxoUu3VL3g0ZXGxcC+E+jpHnm3OTvJMr
	KXW3m6tOShVxDkg/tgb0Jwg+d3Kk1uxOiYY3fxxgoiAIEIW/LkhoaK7JBZuT1ynPMFFBvJTcXs1
	sKFefiB1sfA742dY0c4EyFOAmLX8qiWJLz2L2O2RnMB3UEgN0gqxXIsUG4n7iBuKCsQI/CaQ5lC
	yeXQij95rC3htn1ov41sMCdCqeFmFOMe6CGHRv1/DFe4BYm6/OgnWva8IxPR3JQSRzoGbaU4YfC
	6wGICU9X+eqNIxgu9ZEVUJZH3RxxyERJX2cXW2eVS9D7vwSTB6sowG0Jc+7nnE5UH34DnwGqWEt
	Ju8tgREnuebvmuj+IIUcBe+umwPMuKf+OImHQymcQGrcm3i6HfT2KrrUyUFlNOctbWiRt7wmq6s
	mjYJKZfw==
X-Google-Smtp-Source: AGHT+IGeCGycSjOjMk8oko1TsOrOMJVtki4nnFeQ3rx2NoALaXwxO2K0x5BUb16MSvGQYr/OhAVjnA==
X-Received: by 2002:a05:6000:310f:b0:3ec:dc87:26a8 with SMTP id ffacd0b85a97d-3ee7c5527damr6050719f8f.10.1758359562015;
        Sat, 20 Sep 2025 02:12:42 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ef166e62e5sm6375782f8f.40.2025.09.20.02.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 02:12:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Sat, 20 Sep 2025 11:12:28 +0200
Message-ID: <20250920091230.17702-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_021244_366349_4292156A 
X-CRM114-Status: UNSURE (   9.23  )
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..6506c64af4f3 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - airoha,en7581-evb
           - const: airoha,en7581
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
 
 additionalProperties: true
 
-- 
2.51.0


