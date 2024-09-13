Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A5CEED600
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 01:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMxkeNdrxiqikuKLTukYhJ/j/5AL+Bs96CDGSxnXGSg=; b=novv6afSMnD8ZOLDgdQkAMHmkD
	jKcPi8oOc8Tt2AVXhSAZ1rwQTaqrU4m3oP2ykP5NI5kAmzP080TEvdS+M1z5Irq3r10L7qqTPA08e
	rs7SjxqQnMs54yRaKa+eC2xMpUum6jnydnnKBRLqmOg1B0cYS75GJKS7K0Oyge9NdzW8AcCzZPlcq
	apPCakud8afKnu/ovhHf2lXqpsPCLomdRPN4oxwLfAycj4PiV+veArUssLY+ZbvZlWo3k8vxdeOhR
	h4NJ0kcMQ9d7xzOeaopjAkxcoPUv1Er7lzGlUCKRSMY/xW+rWNvEWGJiOElmYlnKLOH13o+MPCkfc
	4USpcGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovWo-0000000Eh0w-1EtI;
	Fri, 13 Sep 2024 01:55:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovWl-0000000Eh0B-1NRR
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 01:55:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2057c6c57b5so9508735ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 18:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1726192514; x=1726797314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IMxkeNdrxiqikuKLTukYhJ/j/5AL+Bs96CDGSxnXGSg=;
        b=sbqodOXNiDXMMz2sPkoXMvXM+waRVI0V/Pfog1L7ZAYJD6mrNijt/tBht3LhluHAsr
         +A6kBIdMCGinIx/Uaf4PXFYWCWp0AAhMARYA7COkYhaYiqGxbznJvuQ6TNRp1vJTjR+D
         Akd4pA14GH5gHPaPkPu7k2G0JVbEUN/rJGnG2fhlFgDHXT1NV4IHtsMYnpHq1RuM/ng1
         oMWGmgyGqiyAtsPlU2arja4zIZLNCyWYKGNgCtnlEO/E9G7foRx+y/wDCdP7cZBkTQW0
         7I2of9JJqH9XwxbdLEGcsdZxwbsqvB1ijoUtbd3XAhR2Xpjk0m1DYLOWRGCcJGQ/C5c/
         Q/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726192514; x=1726797314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMxkeNdrxiqikuKLTukYhJ/j/5AL+Bs96CDGSxnXGSg=;
        b=DvSQDr0Zj9jeT1TuSD4JAC49oorX2NIN6urnqNL2K5IepBt/2kCIeD1o8n91Jbv6rJ
         yA4m4OXNJJU+3O+0XkGmhNS7xmdnvp3K9A3CYqZckDcZ4m772yi1pBtRfITEqkyHw6b1
         vCA+14g+ONBQhDo3R6neDLq3GQhAHLvBsilY4ThtDgZJ5wwun19fATTNfoPMvTiybtac
         a0lCHY1pQSo0gKKE6lzky2+Ri/Ri1I4L1vCKov9pv6Z/naC9loMgja1g+zs5vPpuElt+
         Ai95RMe4msXAM6VkjhPWvkv6QYKt2dVbWsrCuFH0vLB/xR5dEctqLDDvQroWYZAt5RfX
         7Edg==
X-Forwarded-Encrypted: i=1; AJvYcCWcEFDE8Dr7YLATyPY3T9JVo+pyM96hpQBC5MJU0NCosTGgvHwOUNMZdOsQn0/OgBBToJ8EsigM0VNKt8WaQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEgJgsWe+7/z9Mc1pTlaX5pWuAmdZHc4oHjU0dILL3OkU641AY
	ImARoE2avT9qAJwDH9XH9r7fu7kYtWgBwxhzRrA2W2IqdAmTVeTRlr3Y9os5NxI=
X-Google-Smtp-Source: AGHT+IGxrtDK2oxIlkCa8nrZNGoU6o2v1wR+o7ZOWg02JmyUm3+u/KgHhFUU6pBBIaZ4YEIAqXAk3Q==
X-Received: by 2002:a17:903:32ce:b0:205:6121:1b2d with SMTP id d9443c01a7336-2074c5d24aamr135964765ad.3.1726192513808;
        Thu, 12 Sep 2024 18:55:13 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af49210sm19896605ad.99.2024.09.12.18.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 18:55:13 -0700 (PDT)
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
Subject: [PATCH v6 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri, 13 Sep 2024 09:55:01 +0800
Message-Id: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_185515_558210_5D594D83 
X-CRM114-Status: UNSURE (   8.66  )
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

This is v6 of the MT8186 Chromebook device tree series.
---
Changes in v6:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com/

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
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 23 ++++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


