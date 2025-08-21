Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27595CA0EF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Aug 2025 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=; b=0iwdOSvpUJCId24sKGOv+a/hvo
	u072qV20qNMZjUmhJ5XaNOlGkxm0liezjCGkyzkMfWz5IUTLAuANg+atpmp/lJOQUapm0nxlJ1I37
	HWUMblc5takWGKN+MXa8RcQiAOE6ES7yySbJmbupH5RXcvzpJXqeA0mWe+QuDbykSKQHtjXhpu4Qt
	fbqrSKRGjoduBijgktxWrtBL9C6wYQopshJ3I8JXlAzzvNBS4Di7YVV9t2hdR3YTZI+JaaSf3iloJ
	7EAz9SKAcexArPb4E6HHKBBTFZc0qksliGmNdc9V7fFTS2y9RbsdJK0yWbYBaZOuT4gOAF6jH30dF
	o1Zm6jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozYG-0000000G4op-4AG4;
	Thu, 21 Aug 2025 07:17:36 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozGM-0000000G1n5-3p3u
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Aug 2025 06:59:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb731ca55so7448966b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 23:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755759545; x=1756364345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=;
        b=lTG5jLyJcZaKkJGNrE1OHMchDQ7c2+kHduIbfTbPHlWL8bANMkPj1ah+/mZg3Axu6C
         CpOxkn+1n9uybsKwEMmIedLPBxtSWZ5UT6zLw46OekN3ZkDTNkHg8E6al/pKxyfpCniN
         5nC+y8KPmV3jGt+Smm1QH45iJ4LLgCLH4XmAxKiyG7al22Guq4TSuL7NAzRfOkOzFlb0
         WFVETb8cFDtObv0MngnVzxShEuPQiwBDlP5MDLuRPDckLhldHbEPVeJm2+aMDETDUwJQ
         OkdcZpkqU07kz/FmlbkxxbO+mUpnHl0yqFQHtqfXD+YnnCogON81/te1fWns6Wu/Keve
         GKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759545; x=1756364345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=;
        b=Y5Fbwz/fFEV+6cLTnx2FJ0eGBpK/smX88PgCs2LNw57q6pMc00S9p0WTdL61W5bBeO
         TIxBianmgKejKZxhl+7Zwf1Os7Ac0PVYzz8KSUQ9PurMxegQO1z/56dKAc+iXgFmfo4i
         1lkD5M87jBtmo5xdBK+uF2sQHpwx2aJaMLt79fRpw4WjbBHmuDqYQ0mFAO+1GuBYonvZ
         oGbzCtO1sJsc0A5+vgz+5t0OZoZBPH3dDY21W271kLf74kXMFYNgQbeWB5pH082Cm/qG
         UZtdcua2zuQ87Dor//agnHP6sLcKP+lZxNhaDALi+thJYtoU4Oap6r67Lri5t60wnPD2
         zmNA==
X-Forwarded-Encrypted: i=1; AJvYcCWBxYpDiXp0EDrZnqRpgbTkZMFqdAQ7xYm/is6yfZ0fmihSPkm4sIUMrLTiotWAb94SzZN8PzVznu3Th4jI7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5L7PJqV8HVD+0X8aPLR8RgfRLB98bf98FMTclzQMaCc+RrMsT
	ZXLIwjKhU+FrcNk0cfIK/oyH05GCV+GVBDCA3pZS9FMjgMwCrjB9i3DsPpLS7d+d2gg=
X-Gm-Gg: ASbGncvd0lrTQkqeNe7hbJT1vJlEmK7C0OboRD7v6Zrsuef31LuZIzLHQTILvY6BQ2a
	WxRAK0eOsIXVod5hYhj8N4sZkJ9nhg2rTg+FEataIGWW6LlRfZG7m4IT99B2IqJJXOnG1wNMsgg
	89Ave47kXBrfn3yd0ZT4fzrYYiEeUmT0BqvppW32CsNezJtGZgBRszShFmLF9u1jxCbP1c2ae+d
	xwuK+dw5NMCY3mVFxYgCSLtGFtnbojE5DfYwO/WpOVwkfoOfjlhqwk/VIG5ljsgrVlv0oZyqny6
	lgi+5gNOrFt0J0I92baA3JOyoqeGCeEOPpJ1uSEjcFJrvdJJexsFE/lnluqw0J6QxgwGDpdZ3J1
	zSzWJlGbAAJ4Jjk9O+A3U0h8uexDGR2NsMw==
X-Google-Smtp-Source: AGHT+IEuVTZYnamN/Xowwi1nRdH6LMjKeL4XdJAvBXyBCXh3wYl1BQwHweSgtnWHDmWjFNyCCYNcGw==
X-Received: by 2002:a17:907:2d90:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-afe07e9d221mr56729866b.9.1755759545251;
        Wed, 20 Aug 2025 23:59:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf0ba2a42sm296119266b.49.2025.08.20.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:59:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] media: dt-bindings: mediatek: Constrain iommus
Date: Thu, 21 Aug 2025 08:59:01 +0200
Message-ID: <20250821065900.17430-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=noJnXR5fz5uvdCvAkcNEa1jNmbr6rkH0YiAY8IYmjQg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopsO0jo7CwTeUi/nTEXn6Hl/cd661HvDUBl1G1
 CoaNqlc6G2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbDtAAKCRDBN2bmhouD
 13pQD/9vTqb+ZSb40TqgV9s9GSHbKX+jREpUaz1Lbl/H9x1SCzuYcFTdKLgx0SBdIv/3/DnkpJq
 vo4NhdsbhEwABDRNfTFkidTninZ4+sOOW9IBkJcd81ceHIlMX/+8FhLS+PaWcfQMGzjmOWO2LeM
 hl1knU+od7Z5A6vy6xOrsQ+UIqs3NPsxc7KkHDjxYdc5HynoLR5dP02syrmBRRvX7A19iy+9RnS
 ZeW4b4suXJhVRt6Bp+OT3EGGuQxXuJ/lmlt5AX+5b/lYeUkw1+WQSRJDDEpl/7zgoQODT35oveh
 kmYdjWLaxjh6T99vUluCdHMm20oVUoiF1ESlZ+juv+2wkQ83KrC7H6V4mh24OywQu+omV6FXXgS
 UkP1ZpMX318tChOvSCx+Flh5W66b+1NAfDyq4eFJzqJsgd8BUj4HP7AXPZtEYZWUB+TlxW58LVY
 AUqfnNxQKwMp4in3IYO2O0a7/ybRfGUOBxTzYITO4PWbHZq3ofmPG1GG8qayMt9OFJbDjBP/gUb
 IxShcYENueZ0YrKLb82fSGXqRGhcfnFNr8AB8APcAIjlUg40iWE9ySR+DnZagKj74puDbphzG0Q
 iUyzR25u2kDVdGOnM5FcwTuUYBApUdObGTvJlNtxmoBzWfuZ6LQyU4DO3bPoiltiVSoKKt3AQlG vlGi4hhxJqNiBxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_235906_963969_0E8CFEF7 
X-CRM114-Status: GOOD (  10.29  )
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

Lists should have fixed constraints, because binding must be specific in
respect to hardware.  Add missing constraints to number of iommus in
Mediatek media devices and remove completely redundant and obvious
description.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Ack
2. Mention dropping description
---
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index bacdfe7d08a6..ac0d924a451b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -45,9 +45,8 @@ properties:
       - description: OVL-2L Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..c0fd0a91c4d8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -65,9 +65,8 @@ properties:
       - description: OVL Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..7e5234def39a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -64,9 +64,7 @@ properties:
       - description: RDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,rdma-fifo-size:
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..276868c0fde7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -43,9 +43,7 @@ properties:
       - description: WDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
-- 
2.48.1


