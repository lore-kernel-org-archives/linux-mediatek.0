Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE92CE7AEB
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HGUemR1VhN2nMqLUgi9zXLGIZPomuw+no6hZxV3BaX0=; b=OwyY5MZyv2mvi1rot/KRlsVvQw
	6Uw0VisZo6mqostkTX7Fk0tpBulDa9c3hkOmA7oxRLowAtkLOXJpxnuZF79JyaPAFTX7/7CI2Esh4
	qno/Ilh/1aBZHH5AtbD8mDMnYFKvQEUpNz4VFmDsOymE9hhAuBJCFNjk9X3oEnLP0TAdnTLrepE1f
	uQzeXKU18AFWms8E8bcblGWrmi757TmP5nT3LvLHPZI1et2fnzeVZIi8LTcxvtgONGnh3kbOvUqTy
	jQV9/2U2c+7KWq7xF4kZmPbDxfWOHTk3UvXtmAPe/WA51B0jiB8fEji/xsZSrO+GT0FcN047d2ZBU
	OTOXiEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUmy-0000000BQwV-1peQ;
	Fri, 06 Sep 2024 08:57:56 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUmu-0000000BQvW-3mEg
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Sep 2024 08:57:54 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-277f0540c3aso1038341fac.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Sep 2024 01:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1725613071; x=1726217871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGUemR1VhN2nMqLUgi9zXLGIZPomuw+no6hZxV3BaX0=;
        b=iCA3uYmO6qcsk8dtGAa0F1ChxgZnMUz9vBLKCphTQMgRcvKYPX2aixQwDL13AhMxYS
         2ZWo7lMpKso27CHJbnO7r0XZHmpqEnssQIxWipjvVTiXp+nkJjH7TK8ZhD4/Ldjgt263
         y/JW5T6I4cE+QJxEj+o2jB6oZhj3xjkrAVfSmuVDGIokUB9TB/DhVw+Y3s4Os/G4iht5
         wW5J1ElSxe/Aui0n2pm4ektgU6L1Shg7tJ10SNe/Mn8cBBkesY/ak8Ij4D3lDNtRisLO
         c9UbIxkjOoKngIRCcTEUOUia5eJQijo8JR78vhJ+KF4OMX8nEOej0PKfRxN/8bfEi84z
         2zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725613071; x=1726217871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGUemR1VhN2nMqLUgi9zXLGIZPomuw+no6hZxV3BaX0=;
        b=hqTGF1m/DcrXM7bgGTpg5MdtVyX7bsvrSDkmLiAfQahqrH/BQnlMRR1tBwc2rzhZmd
         5AFjeIbTRFvnOklCgjQipCJ1DqauD+CaEsjz3waAiJu3noVwAJ4l8mRlYswuEKpquMmr
         cvbLZawXRPhmq+/IQxbcPd9T3/5mYrN9UObG2Bec7zb1fhPO+qUULr08aewGGcmbSpZu
         NB8Zk4DZmXSEh4Kf87aaoiUxGenF6y7gzEBU1lOruosCSJzIzTMkN+BI4z3RNiplxQTj
         qqrRcDaXy9+NCj1SUhVZeQT986OT54KBx+GBF3W3xuVWhz3UWGDWEXZjdKC3B8m7cbse
         SASw==
X-Forwarded-Encrypted: i=1; AJvYcCVqKNkyzUqJBwnzl1Lgp8BmPyluYVnIJS6Bc+/+lyBh9zKmrNavglk7hmt6CEKAVS6MlvZpgRT+/LqRwELiJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy92+CIxu7d3/GfV+dcmuGXSkWDPc1P2LG3CoV12Rxh2Y8+nkyy
	pvM6yasRV7n0oaSE0Bwq4BujN0Xo8KATB12wvZdsu1/ya+FUONoiJdqdZz9gt5k=
X-Google-Smtp-Source: AGHT+IFk6WA0QFBBPEfr+oxwj7x0SWhji/tk64+zlRIENA9+hoq0FUcNrJY4D3BBYjbPQUuMA8Ocbw==
X-Received: by 2002:a05:6870:8289:b0:260:f43e:7d89 with SMTP id 586e51a60fabf-27b82db9750mr1951434fac.2.1725613071057;
        Fri, 06 Sep 2024 01:57:51 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71798286219sm1439166b3a.57.2024.09.06.01.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 01:57:50 -0700 (PDT)
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
Subject: [PATCH v4 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri,  6 Sep 2024 16:57:37 +0800
Message-Id: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_015753_113055_FB2DDEDE 
X-CRM114-Status: UNSURE (   8.08  )
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

This is v4 of the MT8186 Chromebook device tree series.
---
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

 .../devicetree/bindings/arm/mediatek.yaml     | 11 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 24 ++++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1


