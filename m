Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0861BD2F7ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zaoO+565mGfry0W6j+qf2c7QIoIrwJPR2hf3bZTL/ho=; b=ODisO2jhXUsJ3t5XhWRO7P5yj4
	hwSWBOFHJnDJ62IM7STFM13wDNoRH5JsPb7p3S9j7DGgdAOzS7xCiSK257L1P7/oQjzqg8MEnYr8l
	xC1OtR+SCjc9aikjUoFBYj0mAHjaGBeSG+zpjizyQ/OCJDqNXt4VjB4gAsxumCjjjb9mwWDQfr+b+
	DRt3VjSfFuURmhHYpqvp1KGw8LR0LHNI/JtCJwsZtRnzeOjZiLZ4kKLQuZPIx33SYal8FoyBTFBqD
	nvbETHC7IuR4J9eZOmMqQHCIqUoyliXMKsU4oOTAeJ0d+eNpuI54BiHRW1AnEbWwx00ca67Nzshft
	ta7w66KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j5E-000000009Ht-0JNl;
	Fri, 18 Oct 2024 09:15:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j1P-000000008CY-0BWx
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 09:11:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c7a14ca26so1878325ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729242706; x=1729847506; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaoO+565mGfry0W6j+qf2c7QIoIrwJPR2hf3bZTL/ho=;
        b=w4qPiDkJ/5v5GedeEe0WJrARuhBp5iNzlPa19Y0yh+gnoEYDsvnV3k3nI1/P3tNsJv
         HHqE65sHcpto56+apCMN1rFRJpkcOgQpcjsB8uk/VtFgHe785wvGoTkOpFONtrbs6AWT
         I13qUL4XIz/VhPvOV8xHWzTlVT7A0oCmixWDN7sbAce7zP3UmDsZS07K3qYYB4E0yeg/
         ce05PeLqwAEKGUOXpmo/OLw8BAgFwzG68IeMlnPIvgiL5aYQylLmL3Zs/2+AbQIYZx9F
         Ocbdk0GecoUKfFfQuNNxVL+2rjuZy5R5r1F++V1FLFDTR1Xchq/3dZTwo/lLlurjqLKl
         R00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242706; x=1729847506;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaoO+565mGfry0W6j+qf2c7QIoIrwJPR2hf3bZTL/ho=;
        b=LagP13h9L3fmAn/66U9IrOIFenVJrBNrf/x0xQr6dI4CI/vDDnvei7hgLwEKVjxy/W
         BuhvcwfDIC3xzhJDv285FLTx3+O/CkvfBGCQ9UBzFUjzVRirVEU82tWTJxeDCENu+cEW
         5SBjxdImtm+OLw1r/lqSIwRumeWjbhn+e7MYAjdTXqCTsZI42SAv9rYNmO4lu4EJdCgO
         SgTWWLY/Gur8YfFiHdWzymGUBVEOVk/5Vl5chD1T9oOwCxrLp6/xa+6zrEK+/f2qrgvv
         Ewq/29mbRnUR/cly5Ucnyw9hXoVn1xg+Z0/ud69RPpsbwCDvvyzWYP97qmXpMOsxptSq
         q6oA==
X-Forwarded-Encrypted: i=1; AJvYcCW3MkJHmhMM7No7JSrpV2YQ83POvBFITZoIRbURRDMc7WLhrQWGuD4U4lM2kzl8DnUqkiYWjCkG3txu3jHHZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeNtZ/ue9Xm1ba6/bRDJnOkCRaitffmR2LUdb1useR6uBEnGza
	XsW4FrgLuehckOQGtIZYR+qcWRNtl2WFRNjyYzU69cS358Ky0Wdhj6PDQ/0++SM=
X-Google-Smtp-Source: AGHT+IF4YykFYrR5hyelgDHgiOYPw6kniN2qGv1Wi7cPdUoPh/WVQaQWN7J08p1ObfnrZx4Oshvnsg==
X-Received: by 2002:a17:902:f551:b0:20c:6bff:fcbf with SMTP id d9443c01a7336-20e5a8ec091mr11252295ad.10.1729242705804;
        Fri, 18 Oct 2024 02:11:45 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a747925sm8659115ad.71.2024.10.18.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:11:45 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.or,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] arm64: dts: mediatek: Add MT8186 Chinchou
Date: Fri, 18 Oct 2024 17:11:32 +0800
Message-Id: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_021147_249108_52D941B7 
X-CRM114-Status: UNSURE (   9.67  )
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

This is v2 of the MT8186 Chromebook device tree series to support
MT8186 chinchou platform. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Changes in v2:
- Modify location of "const: google,chinchou-sku17" in mediatek.yaml
- rename "pin-report" to "pin-report-pins"
- add "vcc33-supply" and "vcc33-supply" 
- rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
- modify subnode of sound 
- Link to v1: https://lore.kernel.org/all/172900161180.733089.8963543745385219831.robh@kernel.org/

Zhengqiao Xia (3):
  dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
  arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
  arm64: dts: mediatek: Add exton node for DP bridge

 .../devicetree/bindings/arm/mediatek.yaml     |  29 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   6 +
 7 files changed, 441 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

-- 
2.17.1


