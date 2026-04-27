Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AAEFF8850
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 03:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=; b=fexTZIyUNd0qXl52gRrtjJK+Aw
	0rJXzzpni46kauYB1YtYjm3DPqRzVNm45ZevRS3Qm3/VsLKRx5FMFtQSf0CKLW2Bz5pgrw3gSMxdo
	dm5kc3ryb26J/AoZn1wJc1wUS6hW+d9xfirUGtcO9Nm70uzahJrvFI1M3RxKnyLs7L1dQMTbZpUa1
	vIYN8jqiSHXq35krty9g16DSbJSPY7D+lgWI+lW3hgK61XWM2DT5rss2vas2VRVeOmiXG7c4YKi4A
	ullgIZ8brEk9TdtNQmpmkPNV3tgjEXCH/7haMMiQ79d7mmC4YAhtsx485B9CpckFodWmxLIibC7lt
	4GtXyHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtz-0000000G74G-1K7l;
	Mon, 27 Apr 2026 03:44:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtu-0000000G70d-08ax
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b2503753efso101132815ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261489; x=1777866289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=KDAijN4UbJVbUC5rgO2u5e3cspPex5d2MBPSr00Owq7wO9BnkCuTRc4GDnpP4i5FQH
         5MtV0O3PHwryn4z4R4ZfhN9lXl4TMt4GV/EC3ps3IzuU6rFNoCiiH4HyponGBxTkRYE5
         CPFtPK1NNyJnU7aVje3vK6/dSj4P9bX6So7BIdV9mupBcKNu60NAXgUDnvhpKSQcjdH/
         BdRXBVqai3AvT/E13Ckfw2cDNvDM8oTba9wuO7fKeQzGb0h7taakwJvF+Mq1rydVzsmq
         GvRHtiQxBiw98Db685+q5ATfMIf5G9l9xzNU640fYYGAm1N01jP2jdtQkI9sSBdPOLvB
         oQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261489; x=1777866289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=MZL5/qCxv6WGhSmazVrOPb0JlBjc+hZrVJV0iYKOCth9fyJRQVeukJ+izxjFRXp8mO
         4GIPQlBY1iZr/lIWl8IteUDMKtzqevEqzE8efT/2L83dzq+9yYiupqR+iWKnk8FPvmSL
         8zOjlbineyt7wehCf7w4/kUGRxr3f29oydaf74wRW/3kFZNPfIg0FirDrrsZjife2Aok
         JjURv/Y1Mo6OJGKQdtdym7T1di2qSvy+Bm8Tn9qYhUzqtIttXIa7iw06JPyalC847yXe
         vq5uMeeQYk4v08tKuPYUI5IALwyf08ClWgq8bBc3u56r8SXUhIQU7EntI/9a1Vs+WEPc
         J+bw==
X-Forwarded-Encrypted: i=1; AFNElJ9VJYvxig36MH6RUcD5tlOWp0gUh1nbEMH7e7UL4ivsKg9GyLXKCrC79dsv2d0Jd42Q/rMrQNCzUXVTdn2tFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Ddyb1Bfangxj2/vpKobUTBp4nnJ8OLrk/64eLIoMpk0ZxU7f
	vraLQzDSjKkv58/YvMdmDAxljE3OFwQCypInG/U8vXvZ3toxuEsJ6mAf
X-Gm-Gg: AeBDiesEhfQeMePrvc3kyl7o1D+XMumNv4uzzMIguvmsqvhu4OQjBUb8PlYJo4kE8bu
	159c9dO2x1wGF/UuFqc5k5v4VDXe/mUQpHa3HMeLTD8efoczLFY8knizbz8qpw3s+GzdpDIpUV1
	0Wmg82hzCJdlWQEobwWz0jUqCIUlpRWmHzWAyFS4S9I1K4t/leiUbYesnufiGMlRlouYj0FK5HE
	KzOI2zyegzsi+OmOqLHQZAuNsTaQ/m8ZDiRSlrFfSyKofzYu9LbicDL9/JCyrdJF6o08cN24FRf
	bMo95I8InDBi2w/5+AWOdup2yUYS6YnbsvI318IzR8sIMKh/z4GGCjI7EJkKbwdD1ngGY45Pu7V
	tQWku8w3+FhgHja+6ARXAw1N/SCbNx6VGwTDBRMQfwpSiWFBflzp1h4ky/iYd3aTZwLfmLINn8P
	Z8naTDwz9D3ccaDx+95W8CGPpkmhwibsuPqEwKYdvEaVR3FVDMp0r2W3/Q2vJSDkrwFmEjTVGRk
	uSxI5fLZ32csFixTu2oopF0fA==
X-Received: by 2002:a17:903:37c3:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2b7aba0aea6mr161097325ad.11.1777261489333;
        Sun, 26 Apr 2026 20:44:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 2/3] dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:26 -0700
Message-ID: <20260427034427.881389-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204450_101449_99092282 
X-CRM114-Status: UNSURE (   9.91  )
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

mediatek,mtd-eeprom is a widely unused binding that predates and has
been replaced by NVMEM. As there are no users, remove it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..482c22cd6627 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -87,21 +87,6 @@ properties:
     description:
       EEPROM data embedded as array.
 
-  mediatek,mtd-eeprom:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to MTD partition
-          - description: offset containing EEPROM data
-    description:
-      Phandle to a MTD partition + offset containing EEPROM data
-    deprecated: true
-
-  big-endian:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Specify if the radio eeprom partition is written in big-endian
-
   mediatek,eeprom-merge-otp:
     type: boolean
     description:
@@ -314,8 +299,8 @@ examples:
         compatible = "mediatek,mt76";
         reg = <0x0000 0 0 0 0>;
         ieee80211-freq-limit = <5000000 6000000>;
-        mediatek,mtd-eeprom = <&factory 0x8000>;
-        big-endian;
+        nvmem-cells = <&eeprom>;
+        nvmem-cell-names = "eeprom";
 
         led {
           led-sources = <2>;
-- 
2.54.0


