Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D106CAC5A0
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xEwCQ2kLx4wO4jHEqwEMPS8Qvt2FpFOtZT1uSLzl+Q=; b=cb3powEmIj8qvCQ0LiC8FAki4y
	XUB0KuhF/x528fCH58IVpsWrua0Bz1y+qDr50AoetZVf9yfRX4kznNp9rYHfMFbUD2uP7I13ELxPS
	B9q6j8mOkTRANLv4r+RI31MPX+8ivB5PD+J9pgdnHiK7GsRjJnrP860398INPwCZKP+1QqodATyj2
	An0JDIHr5nl8rmITaoFr7lq109Wpm5DFrfAAiuA2jjJLUmSsgAq30OghaX7Tu0QlAEDsmoVKIR75W
	yoGFMPPSY+F1ounRvekGJa1mgCk8IUK1bI5d1ifOSkLwNmvUmcUkMarYZQ/RUCJHeugi/7OIq5dvf
	F75kVQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uztrR-0000000573b-0fos;
	Sat, 20 Sep 2025 09:26:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uztrN-00000005721-3mvI
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Sep 2025 09:26:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so22562205e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Sep 2025 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758360384; x=1758965184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/xEwCQ2kLx4wO4jHEqwEMPS8Qvt2FpFOtZT1uSLzl+Q=;
        b=j3G+JMdkwEvbdaTnvkLkl/iBQYZiZp3vDFb1VvgeZiZOykawQ3qAC6KJhPV6QDvdKu
         PXW4Nyqow+aQBI/i0vKfdYeMtas/j6quaROjVuuSSJg2YnVr0t6XDqFf0qiJ1BctSgRM
         ZVY2OXYQdEGANkp0LymK0Xt401cy4yvMUi1tnhCTekhdqBxS/OTa+tz2SHuwC3g6MjJV
         ldO9Y9+3pnhNh3laogLJ9rOq5k7b3uF7YyaRB1FOMQRmPXGWssI3zm6rMyzzFdsX6lw5
         S0Fr/hxtwE+KPNWgh1O6AagKzDajFR6kCUFkZSyLIyfgLKWRTQ3lKcclGswV63NEGdLE
         nlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758360384; x=1758965184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xEwCQ2kLx4wO4jHEqwEMPS8Qvt2FpFOtZT1uSLzl+Q=;
        b=o7veyvLiBCIJc2vsDxYrBA1KfXYwKFi6EigPwqy69VtEU+S67P3CBqpFNPhZ8s1RJv
         9ZPjkAUiznS5wXEIhutMY6M4lngLWYy0NhBRh+tLzld+JQhkQnYMwzzyX7FbjKdPqaVH
         FiNMhUB/v6+4pkXUJ8q9QD7JGvSWnLP/acesQWoFL0QKqYpUE/75TKOQe6n7jpzEweQz
         Lgp0eynRyZ2EJUKg8AznX7DUMFLqve5YQ55MMBJe/FsZpq9K+1qJAV3uWZ7RDimEhztv
         Q7lMEAsyX/G1oPAkUtHXyD8R+IrKYPZ0MwWhjfTBFZe/A5/6Fk2AcshyqWPC3iF0NWy3
         K65w==
X-Forwarded-Encrypted: i=1; AJvYcCVbLpQNtTnZI71/6RPGQtl4HVFqb7hTLBut3z2r8CNqlbRbxjixo2T2EhP/4dM7O3NukYCo+RMo9ZwyRqqxrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG+6yj1N9pOWt5jJjd50MwVsVgOW1vEaPuVst17p9X42kpZDW6
	J8N+YmRmbWVL9cpMQxIIznuTLVWKM/xTwzU5xEbJS4UQld4RLzY1vFut
X-Gm-Gg: ASbGncuCBpYJbFYb6nxExOA1ahxBdjn2LL/b96bF8GtiRAQYFrDg64anzMKnKebaH3X
	oVEXCRnnnrd4BYr1RqV4Dnw371P2AbQ2ZgbdCS0Ju/KnAj4+ob9neVM94gljG+zdgHLFx2Oq+T3
	Wj6UnDJiTYbLNCNaHzslrNk14UbcA41LOKsKrmqNAYWAtEksjTp1I/xN6R+Wh4K6HtiLba6ezA/
	lMxKymKC11eZOMQx5+dwvhVRy3q8ailK2sHE3JpyE0R/b+PIoaq0NGBemH3BWunThwlXxHkMMej
	myXRu+91q5cqNVy/Um/Qf9RFu+9gcysNhsN4/XqqidTwHikVsIdRLZXyE9y8kyj0+JV9yc1axhH
	SNA8h8aQrPVNNi9c0VzF1PoB6pRVJ2neo7n43vG68gTZy5kLr9AcXtNE09dGupIwcsKNGdlc=
X-Google-Smtp-Source: AGHT+IFxlAXSV4W5++7XWnPzZ12JWvBKJO7xkpt1cyOakCo8rv+0InqQQYz6OthfTBtMJczwkWlkVQ==
X-Received: by 2002:a05:600c:43c5:b0:45d:d295:fddc with SMTP id 5b1f17b1804b1-464f7027ee6mr62778095e9.4.1758360383862;
        Sat, 20 Sep 2025 02:26:23 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-467fc818e00sm73648535e9.0.2025.09.20.02.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 02:26:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for Airoha AN7583
Date: Sat, 20 Sep 2025 11:25:34 +0200
Message-ID: <20250920092612.21464-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_022625_956198_4521D9D5 
X-CRM114-Status: UNSURE (   8.97  )
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

Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
binding.

This differ from the Airoha EN7581 SoC by the fact that only one Gen3
PCIe controller is present on the SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 0278845701ce..3f556d1327a6 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -59,6 +59,7 @@ properties:
       - const: mediatek,mt8192-pcie
       - const: mediatek,mt8196-pcie
       - const: airoha,en7581-pcie
+      - const: airoha,an7583-pcie-gen3
 
   reg:
     maxItems: 1
@@ -298,6 +299,26 @@ allOf:
             - const: phy-lane1
             - const: phy-lane2
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-pcie-gen3
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          items:
+            - const: sys-ck
+
+        resets:
+          minItems: 1
+
+        reset-names:
+          items:
+            - const: phy-lane0
+
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0


