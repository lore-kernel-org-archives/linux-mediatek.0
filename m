Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C831FC369CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 01:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=96K+mNY7OtOPr52dzDB019LRxvI9XjhygxeglXZ6I3Y=; b=X+ZWEot1pP1Dcte1OLCxDunQqM
	p/7GLiMtJJgZ/PIq9Zdz5EYPc/eZ4IbPFmYqYr9FmimaatjaEgdNDZaBwQm8PHxW5ceXSp68CAZOQ
	bmVmG4eBLhHzyc6O2Rthfjw4uxkCmpUBIywSupx1IgJ5OJRJGAvG/KISVJXPKUUpK1wxGvnFHrsqm
	e8Hl7KLzac/jfAy6UH9kGQ5uSUKqwg7UFnAuaTLCKaTKdLs+rg3Op0uImCj/MjudggKnxHosaQyUk
	tMk9bq5Gi7fbwuysEOqZBTNz4ajqW1tBoSYE/pgLfoxVjWmgngjHU8uLp0o2enGL2u0SKAyL3WNhd
	FnfmKlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7l8z-0000000CUaD-37zX;
	Thu, 24 Apr 2025 01:12:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7l5F-0000000CTqy-1Sr5
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 01:08:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73712952e1cso403558b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745456936; x=1746061736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96K+mNY7OtOPr52dzDB019LRxvI9XjhygxeglXZ6I3Y=;
        b=UNHLnQ1FQlcjmzcpNmw/BgHx+Ju2NfhFD67xnouLBECCp9bF401lLtGsApus9QqRg7
         tus10BVAtIxRU/rQdiS8VKiKsTAdOxogdhHo6z3PH5e9dTaxhUQKQWKGs1HSpobJMwL/
         ZbbUqFatN1rw/DSX7dEvIppm+1Lb+rnQTX2RLqSBa6tXMeuz4A5pmLnvyRl32qf6qHWD
         LD5yKa8Ly7eL755GBrcP6/GY42EJgn9ylvzeeNxXOeZ00kAywVU50onP6u9T47XjxFDR
         Eh0hathSZE6dl3cF3IHrimCJSccP2l9I2vpD+dJx0EW0ddue7JIq9YzXtRLeM5Qv4NGJ
         FZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745456936; x=1746061736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96K+mNY7OtOPr52dzDB019LRxvI9XjhygxeglXZ6I3Y=;
        b=LLodEX7ElOqc2vDFdUwCbrZR325wJ2cM/HeFARRCotajGct+1BoWhXCEGZ5cD2gcfl
         cFLdCOKjdCTY8jeb2F+SYPAPMLVJe/w4zPf8RWOkBCJi7NKczzpKAuJ+eArhokdjvxEQ
         XYpWmZZ2PUsgceaPPa0to5B8CPSgG/ELPCyMrMFeYRAE9QOvKh3O273j1xRRzw3H2zBE
         r8uVEtb4hKSFroJ2gw6UlHb/+J3JGRxcdyBkCmfl8D6wn45U3TtjX90Bir38UUT9OO/h
         GMIhS6aJhj097xucGGgjbqih4GlPXocra5nvBC6ifJ/mF+PjMgCd/DJkASNTvXyMF4Ee
         /Y0A==
X-Forwarded-Encrypted: i=1; AJvYcCW3pJCI0mi8bR/xEdtkvDzUd2LUplCObydNQFkHXbNeap708rMn0EhdPGQ0RJuYzLliIa8Wy3O7ZYOlNbnNBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Zo5ka1nft9xaMLHcn8SJ84qo36+6nZ2Zh+U9AcHoim/w+Fat
	WjFEoNRf4MTPdZYnbBoDG7Ve2iKKgJOiiU7ENG57qA7Pe1iGdjwqFr+ET7CmSoQ=
X-Gm-Gg: ASbGncsj+63kX5TeT5+zpp5pQ5vx3owpE8Uy7Z6pxhF5WHlj8qWeaZ3BH8sNMfLKySW
	NWGaEAFg2CgHhCHbO3vrLpbjLYbOKAspj8RbXUpZrHEUKvZ/IckByM9UJnoaYFE8/fm9QzgameX
	fA3hWCv05DhRbnoaDlcw5qpxA5JVsklWTYXRnb3usE8o3VfV+0sSjK6A4dICrY/BP2MkftRCivB
	3ZAQVg9gPNvhHi0GTCeDGtBek4tDCF2pAynr0+iH9gSqXC/OIh0cWA25rg068nHwMfxA/gokgmm
	KMkSkFlRxoJFr7CLSBAVSrGqz5/mRssL4cxiucv+LGGTcPdI88e3M3o0/mqu2kyNuAKpmWlOpKo
	=
X-Google-Smtp-Source: AGHT+IEjab817v1eaoeZEkx35Op0t9qrF1r28YyBnzNAO8gZBkkFNiR9lKADu4oJ6ffW4g43dcuz5A==
X-Received: by 2002:a05:6a00:1d81:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-73e245c09bemr1272531b3a.3.1745456936651;
        Wed, 23 Apr 2025 18:08:56 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941d65sm236071b3a.63.2025.04.23.18.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:08:56 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v11 0/2]
Date: Thu, 24 Apr 2025 09:08:48 +0800
Message-Id: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_180857_672587_3129DE86 
X-CRM114-Status: UNSURE (   8.63  )
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

This is v11 of the MT8186 Chromebook device tree series.
---
Changes in v11:
- PATCH 1/2: Remove redundant items.
- Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v9:
- PATCH 2/2: Add sound model to fix the warning.
- Link to v8:https://lore.kernel.org/all/20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 1/2: Remove custom label.
- PATCH 2/2: Change the commit about ponyta.
- Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 0/2: Add the modify records.
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

Jianeng Ceng (2):
  dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
  arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |  7 +++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


