Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD8DCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJqNYQ4cdfTFLv2z2ldssPg3Z08F+8b/OmsBnqjGcYc=; b=CPI1jAoogLvmsCA76xKDLcFrlD
	caRQB9HE8kk4nV5uOaQ+HnfVoIOQvdPayjvvCDKLAljQPjwnqIY8cftQimLifKqj89EMjv0MfQh28
	N1JCL01FtkPPQ8lsDjTE23iUGwO9Rnrnz1jQRCfwUSsMEM4zwz0qJBBhYmsrrQBN5SowYGbBYuZpf
	31LwCmyExB1Pd3B0DZkw6E35eV9SUsvtQAE6jCdAHq76ifbWdvypFPPnSkQ+xPW4IvWyGALJ48LCF
	aItuVKidNO3fSTaeqqMY00+v10tSq870e2f5oPC9tV0EyEde59r2Xe1RSTLiIGLDhA6FJzwSdfyUL
	S2rdcWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oHz-0000000ArT9-2AtW;
	Thu, 25 Sep 2025 15:53:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oHw-0000000ArPj-2rHa
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 15:53:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so9395565e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758815622; x=1759420422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJqNYQ4cdfTFLv2z2ldssPg3Z08F+8b/OmsBnqjGcYc=;
        b=Wf4PnoSnQDwEgnxwg3rvqQT8yVewrOdUiQ/U421iT6f0U3tO84eWZAsNamVMahAUeX
         ElzRRSi0/RdyGhKp30pipfj+iJ3TKo2viocG3fvhVWCpGX+nUY8xKkr6SzqKyVlC+4PD
         diWg8knLUqZg5A7wdiM2ugb7DfT5oSpDSVmhl/lKYM9UPbxSE3f/Dxj1hIh6t9k6O/89
         /8KbmHPjFONtrhwcwxteFEd3A2oUoHwJ1XII5g4foJLhXUMIyCKh49fUhyBs9a9ZOXAv
         4h1h9YT2BtRj3HrJF9noGfIANn2irUv6oGbic3KNacSsfXpw29Sek4zyprePhQZvMw3z
         TDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758815622; x=1759420422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJqNYQ4cdfTFLv2z2ldssPg3Z08F+8b/OmsBnqjGcYc=;
        b=nFp9YpOjM4i9DCSLsMl5gBGl8Lxct66jwtUny9w55ps2hNVJsPiU2jhP0MZY2aqkr5
         ZomxAmqWlFqWuYHwtHN3w9wil8fkc5rQtVt42B1exIjUVvXDMYM1R34rvR6LDwTdsJ+L
         wqPINWVuGc8LmKfmK785ZtcEHOwNOQiBMnPoPe2Uw5kmvBIWcLSt09m5yE6IxYMfRRdn
         dazvH47g9eTw9/uYg0X08YhfjB7ulc0asdVqw6RAoqCUjfn8232sbf602GdG9AV+8aKL
         dp5DniJhh2SmVsWV6zEK20JZFvxPRnIlx0TuQJ93C+a+iFJRItWyXj/c965oTUoJ0obB
         hT0w==
X-Forwarded-Encrypted: i=1; AJvYcCVzowkbRVeOJArCPFGaFuV/6/nCLvBqJ0IfWnxsms3ptqMI08ayq8QgcglHx6wuVIelSmktWCL6N8CGsIGVlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNl8F2oGJevXsogpEzQKu/REl20iE0XVRvexYAJP5mkt3T1EmZ
	vRGXIv2IpZ1qEwKWfwSrF1/C/PdVmr3zpLNEcDQXFsGQYSXprVS7kBWw
X-Gm-Gg: ASbGncsIziiJQQ1rHFOrJV6bl7xVqVSazaPpRbX94Xf8tldcPaMz1sUzKE0XrO5+vv4
	yEP6jX3/wLexV6V08IgNujbGbXDKaOGfoSfpbI/kgdGFbNc/QU7HT8awAVrbO4NL0w/KLlThBFH
	CAvwWnK89toGUGVr81yyy0CV0O3CfxniKUzMyypHkKd2MsgU4/T0I5hslsoNf9yYAKPknNZhDpg
	z0Q16rU3Iqhkydh3+EYpRUvB0hMzkH1mHRYIjD7EhFN61IbsI8UIDyzf7sFTf0RjAqP1kS1+aKA
	Z9x7MZZMJddhLNkTE1kStBsdJo269+8geGiytOoL3WScrNnilk1Xu0bkiJ299xSn4rHDKJV1XXJ
	T9Tsvzi4fFH/aRSQgvzXSZW3hbaaVLZKrzIHPR2Gvv8yPJCpopgXkchKuixqD1LcJXXmpSC9/d1
	DAWrKcuA==
X-Google-Smtp-Source: AGHT+IFdx6Jo6h2Zlp0z9KNqZKsNTsBYY7KcgSjHFZWdKQaN+BPd2cWlPTLOF0WlCzxaWRiRR5GgVg==
X-Received: by 2002:a05:600c:8b16:b0:45f:2bc1:22d0 with SMTP id 5b1f17b1804b1-46e32aff787mr40556945e9.33.1758815622333;
        Thu, 25 Sep 2025 08:53:42 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm98449995e9.7.2025.09.25.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:53:41 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for Airoha AN7583
Date: Thu, 25 Sep 2025 17:53:08 +0200
Message-ID: <20250925155330.6779-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_085344_730640_097BD13E 
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

The compatible have -gen3 tag as the Airoha AN7583 SoC have both GEN2
and GEN3 PCIe controller and it's required to differentiate them as
different schema are required for the 2 PCIe Controller variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes v3:
- Add review tag
- Add comments for compatible inconsistency
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


