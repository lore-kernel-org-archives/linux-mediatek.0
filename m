Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426E7EEEC08
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 03:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TubZ7clM1MJ6sPd0lA2DkuHJ4eIzYwhY6qHr+nDS2JY=; b=WuKtgaNdZxk35U/mdZ76wPSXbE
	lv34gMpD6e+raPPzMOKtVTVn8/MLLmA/wIh9LIEoWhm3zu8T6P1+87KrWNaCPpRTN9sbLzhvqy++t
	z9JGO45XHgYWdT1V0JQod0M53yXS9FkFMJjwAUtG/sbp/vWPyD3tBjNsNi5KWmJxxW4cJUCyQuFya
	22XcFI6IvgSoD8VYb0cUp/KcM4CHDEyjdHVTbtHMJ90C6Vved3QdAM915DqfIbHUdUQiLlSI9BQYo
	Wmg7OhSpQxuntjd/MJOcZRDsaqiEoS9XtiWygjpIVo7ln5dAj1fPrRMQ1SdC9MvTlWZPOLtjI0vKs
	u127rWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowmI-0000000EnlY-3dPu;
	Fri, 13 Sep 2024 03:15:22 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowmF-0000000Enkj-0BVM
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 03:15:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2059204f448so15753965ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1726197318; x=1726802118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TubZ7clM1MJ6sPd0lA2DkuHJ4eIzYwhY6qHr+nDS2JY=;
        b=hiIByWzlW55/GoU7GhOV7+KYg4YhUbzfbC9lOda1l8lidYJlbNh6JbYmUX/WgjOPs6
         0kPpiwiOz7DzEDMuZuHOabzisuznYe05iaV/OvTWZtFaA88x6Q2wwivVJ/J0eD9DNl6u
         0S/IuqDMEl0m4m1UBvHzd3u8QaaH8f0pgPk8b/BrXD1+8NAJlCaTcjrZG0cR/ZNv7hJt
         PA9wXH1raWC/9oQLjCOPTFK8RFRfIRaLJ2P5cqyMtLhFvH9ylRFJnutA8XKSqkyG04Nz
         Rfco8nmehGy1xSfKZ+ewrbTkygnIFNK4iAi9oKPfQYGzl4xyeA12uhCuphZrKZPO7JtQ
         qPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726197318; x=1726802118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TubZ7clM1MJ6sPd0lA2DkuHJ4eIzYwhY6qHr+nDS2JY=;
        b=HqQdqeGrYqohfj6zJvNGHOwEYvgXuoxfM72sHPkv1u7FUuD3GxRyhxRInQNh9SrxgJ
         e/9Z7h1axhWLE/Beb1PVR12scL1WyF1Whv60hoO5E9h3m6N2uHvHt0FboUuAehxCDDLd
         l7gMk6kcrhKJcs2lyC58TzhP84wJfTpRjkc7DzMnh6EFS86fTKTs615gvI7wEwpDaZeO
         jKYh8pF/0ssXYfqiDcyxLpFeCosrJEmI++zbiAU9rUB0ik9+OVLdILUWjz5I0mUkHeDP
         3Q7SoJ2CPMqh9/dYb92/gdRmoDtS6muSOs7p462HFeS3hbfoZw+L0PJdup7qbpqFypNS
         uV7A==
X-Forwarded-Encrypted: i=1; AJvYcCXdUlcF0MD7rlQUZqbfnY5oqx2lFSKo81iW8F421+yIUPfba9JqItSkdCC1OUvn7DbM2mBW7Uq16rolSxMItA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzliErvFXu5zn//1TyAp3JUHyYjYCAOAeieR7ZH6oJESTkKUTsE
	LlYCi9rE+I3XyzG3aYvQceMn7WR8AaR1KMFvEf15oxV3tIy+Mb7RcH678ajaI0A=
X-Google-Smtp-Source: AGHT+IE+iazR4De+MBDM48Q6idkzARa1pEpWsipiV6SxZvqaRt2xeoupHSj0UJ9RkX/BCJ/hb43PSg==
X-Received: by 2002:a17:902:d2d1:b0:206:c5cf:9727 with SMTP id d9443c01a7336-2076e39a4d1mr73694465ad.31.1726197317886;
        Thu, 12 Sep 2024 20:15:17 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af45432sm20382305ad.91.2024.09.12.20.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 20:15:16 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com,
	hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v7 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri, 13 Sep 2024 11:15:03 +0800
Message-Id: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_201519_574669_1A2A1AC0 
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

This is v7 of the MT8186 Chromebook device tree series.
---
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

 .../devicetree/bindings/arm/mediatek.yaml     | 10 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 ++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 ++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 96 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


