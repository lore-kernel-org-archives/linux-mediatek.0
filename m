Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FC5CAC5AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 19:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iIzcezubwlq0RFm/fy2Wz7m1elEGd+5wrncON0Sn1iM=; b=ZLRig8I5aMXepkZBWz78k+TSfy
	d/CujzaZu2nZcZz4aYGt/ybb43qlfKd2RB6pwDB4L1GMI2uT5K7x02N94mwPimKMPXm8Shu63P/VL
	r1+kY6ufrbB0IxxkZOKKjuiZ9rQ7BeMLLxW871pg6Q9YGSJr4BpMZCoGr0dmP1ze/RzcvHivDFLKI
	eTB8kMEpgBOWQTIvsEI/AwtOawiAwz2r9fKU2Uf5JdTP1UsXw8bYxFLnJvh56OFkBvzMqVBv5u2FC
	oMHXdGBEG6nOE4cwqKoqp5bFQB60rYp90E3DWQFaym8USZOWqhOLiCG6sAHrC9UiIyy20Ew2HV8sj
	6kxhpr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MF-0000000EcgS-3Of2;
	Tue, 23 Sep 2025 19:07:23 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MD-0000000Eceq-0MAA
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 19:07:22 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso6760151f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 12:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654439; x=1759259239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIzcezubwlq0RFm/fy2Wz7m1elEGd+5wrncON0Sn1iM=;
        b=Ei7TL0hU8gGTpaSknkExj4Gf+q9qULvEUKOrTeGbOoRHesNk9LS6icbPA85HQ5pmA9
         63L6aSs92htiImLMGi0Imw2wFFKuRrGPy9+Jjo9DqIb4YR+bw2c5ozUiSYGZPyg7mkyM
         it6zp8ha14raPxKBQl+Ntp7tIab2xXYANeE79zdm03PRXC+S49PfSg/LVM339YVhCcZB
         7yG9PavewNw0NSqHkj4rkgGQben1/fU22jaIpH7N0zMxx1DToCLuEppBeOZbalKk1IdO
         PB9J4galR7sA1+H4KVdCTUwkxYpU2MaLhjznRqy6DvtVnTUWaYhCxw7ml7nC8XehspYy
         Xb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654439; x=1759259239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIzcezubwlq0RFm/fy2Wz7m1elEGd+5wrncON0Sn1iM=;
        b=UAFIj53zc1dDky809tWVHb8xf0zvQnEfc9wwg2xs99OHWUzzKB/gyj9QH3Uz33C7w4
         2xIUZWJI70MzO6kzXJEd2zCa9NdMzSjIFlyohfYt0eJ2r+FctZgIuD879xIkbp+dUALO
         brlUjuMNvHF2tQgzxJz7Pd7oNLn58Ij6TjKUsIBIwO2teN9wHX4V/iVKOpq/LznIr4gC
         2LW2kt08R3DQfBMtNqfL/ZulTAFH7FR4AOlfJzoW3P2yDfZXTA++7Q6xKqOd61a8cvj8
         yeyjyNjgdqtEj3y8uvZY0KrFdDsVUiwKe/OBnRrr3H1Jz0S7UO7peuUkAGItyMdz4r2J
         CN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiTSHnDMMkVRhRY6fo7sUSXQ6csiZf/+nrgPRCamA7ONIX/rALkmwEZK75H5WOYQWApRubKY0B8JXv4oTjTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykbyAGPXg+S2vuQ3+z8kIKrfX5p6PI1ENiBG9Q8yBd30mAoiui
	zhAn3X6DjVGnTYOpDVhmhDVOknvX7b0O6xNTEJc3aAm0/UUyyTLbkSrh
X-Gm-Gg: ASbGnctehq7H0nOAZOUjvU1Ffo/mp0L1tr5c/AtrTNez1B3GdFtDZcUsfyfRTLZstAb
	Q1e+Fwc+b3AtdbwuM9tWkW4LUIoAStAZgQaHOo47BXkLhoosuySTHo0WQKiVQb5q/cxxZ2R11BW
	1qU1Lg4O+QjeXNQa2eRIq/29AABD228AUfiyjVkjKb9f5ssOpMf/taCosJwYFpjRVYFXwhZbu0r
	tFraeJ15KY+Ui2eevkcRCF7HMvk31VaAGMQVJx6HxOKZCFPvA14g/Ud85FnyXoqn/qFkWA6mVg1
	ZKZAkxnozHrTBBFcmoZnspYuMV8mW0p1AxmL+o80XaI8Iz1ZvJDVw8qdU5FvYmE6FxKVafpZVez
	PTKdnTT4CCiGMc5bRK3f9V0Jmu4x6SMWcAAGK+idFNSzxpRdOnU/b3y0SCqAhEWn7RE/vXqE=
X-Google-Smtp-Source: AGHT+IFMC5WZipXFwAc0jOhdCUt9YzXLNEh2M6BwA3JZ+CheIOjLK/BQJ1BA+7EBMR0NC+aWeWWvaA==
X-Received: by 2002:a5d:588e:0:b0:3fb:7afc:c17 with SMTP id ffacd0b85a97d-405c7c5e8d2mr3394096f8f.28.1758654438709;
        Tue, 23 Sep 2025 12:07:18 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-464f0d8a2bfsm265240915e9.2.2025.09.23.12.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:07:18 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add support for Airoha AN7583
Date: Tue, 23 Sep 2025 21:06:59 +0200
Message-ID: <20250923190711.23304-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120721_135642_1F6FD4AB 
X-CRM114-Status: UNSURE (   9.70  )
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
Changes v2:
- Fix alphabetical order

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 0278845701ce..1ca9594a9739 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -58,6 +58,7 @@ properties:
           - const: mediatek,mt8196-pcie
       - const: mediatek,mt8192-pcie
       - const: mediatek,mt8196-pcie
+      - const: airoha,an7583-pcie-gen3
       - const: airoha,en7581-pcie
 
   reg:
@@ -276,6 +277,26 @@ allOf:
 
         mediatek,pbus-csr: false
 
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
   - if:
       properties:
         compatible:
-- 
2.51.0


