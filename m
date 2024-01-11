Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58BAC4725D
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+V4JzjzBqaHzJLZncYnEckgIPzqOvsDKGfGUY3ZauSA=; b=FQhtQqLlKhGvHlujne8aSDlWav
	rm9fIuJb+9hmPsY8o5y/oHB3LCC4n05cx++FbzDAIRrnvwfOZ3kE+CmxJ/EftjsAVMGv/9C64wbvY
	lqnw/okqrX0PeuuAH7KswG2/E/hTN++qJGTT1icecikpi8fA6A0SKKjhUsmfgLSHNr63Pf4MJce3K
	+Lpbco7hUDcq370Awpxu0+VtFK18BEhd0QVi0XBhVS85Xkp/lA2l6paxw1ss9GbmpZCCu2gSh4/lq
	4PEmy12NhdRU4k5Te+cSEYPrhvAW+/pUjTpgJKEGLioYaq+ViGVoZtMq22YJGj5PVZ84WePH0OpXB
	nxHM/CDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNs5k-00Gw41-1Y;
	Thu, 11 Jan 2024 10:15:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNs5f-00Gvxm-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jan 2024 10:15:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3373a30af67so4615642f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 02:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704968109; x=1705572909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+V4JzjzBqaHzJLZncYnEckgIPzqOvsDKGfGUY3ZauSA=;
        b=D3K009Om4gnVByQ/zLlpS7R86wEb4xnOKhIr/+9gWem1Rrw0nei6CYOTOLnq4I2pqH
         6j7shZgACp4ZqFdORJoU6JrFQS0oxDZSsFtYcSC7AhBKOYmheRCH6VpBBk+4yHrVFzmd
         lYpEP/U6glLb/hXwmmPCMHlCJSBZzlXs4h1MdPd5yCKl3fEJsRB5SlztJEWjQNg6F11p
         9qFqoBPk+R4UYJlMdTBERieoRghhJ3OsabMdp1tuzOxHWuE+2Qwnc7YobVO40pFwDZ1I
         IvoD4y6Rquy3dqDuPn/VGmkxPye4Y2XDnNcNi/3Wc94FyJ7odKwdvMMn99o1UTHudAhM
         JIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704968109; x=1705572909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V4JzjzBqaHzJLZncYnEckgIPzqOvsDKGfGUY3ZauSA=;
        b=Y8BG9mNvcnt2j6afJPOZIxEv7zMM88mP0KOL3nwxhjJZX7shakHFaMR9E5BeCWmZs+
         GloghOGhp7MB93h07FSz0LOiYcY7jZJyYod7Divh7dyhwr0qV5KHQZ4gnmNAW2Z7Xyac
         CUOdtZzcq4Pyzk8FENye9eES0Ab2GqfHPJqq0qI4Pjb/DVFLRg4xJQVBJGAF2x/3Q5ta
         ver0Ry7+U1TBsYx8jtiNJaKJxedu5vwn2WiPSU6RaFKjrDvYChrGchHtswC9iJofwkpn
         DbeM4hWS6+aoLraeerAo+9VxyNHIoK4Tb6ogZE66xK9cDmPU+S8aGgAQyEMfXnWpA04p
         G3vQ==
X-Gm-Message-State: AOJu0YyDqOZ6ExW1SUjH9NTesUleLDRi/d0K40DQ870653499SSvr376
	+RWdECQqreyr2mZsy9NHGNj0+sVpMUClkw==
X-Google-Smtp-Source: AGHT+IEm+n9REC3cDZLVtCMBBH7ollyf38bVEHwiAvqjBMBz1qwTcxZsn0pt65qrruZ1CkOufUMg3Q==
X-Received: by 2002:a05:600c:3b1d:b0:40e:6206:a518 with SMTP id m29-20020a05600c3b1d00b0040e6206a518mr68778wms.184.1704968109127;
        Thu, 11 Jan 2024 02:15:09 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm5157758wmq.29.2024.01.11.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:15:08 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 0/2] phy: mtk-mipi-csi: add driver for CSI phy
Date: Thu, 11 Jan 2024 11:14:49 +0100
Message-ID: <20240111101504.468169-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_021511_401536_3EC4C66E 
X-CRM114-Status: GOOD (  20.00  )
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

Adding a new driver for the MIPI CSI CD-PHY module v 0.5 embedded in
some Mediatek soc, such as the MT8365

This driver was adapted from https://patchwork.kernel.org/project/linux-mediatek/cover/20200708104023.3225-1-louis.kuo@mediatek.com/

v1 can be found here: https://lore.kernel.org/all/20230403071929.360911-1-jstephan@baylibre.com/

v2 can be found here: https://lore.kernel.org/all/20230515090551.1251389-1-jstephan@baylibre.com/

v3 can be found here: https://lore.kernel.org/all/20230524083033.486490-1-jstephan@baylibre.com/

v4 can be found here: https://lore.kernel.org/linux-phy/20230620121928.1231745-1-jstephan@baylibre.com/

Changelog
Changes in v5:
- rebase on latest master scheduled for 6.8-rc1
- sort alphabetically CONFIG_PHY_MTK_MIPI_CSI_0_5 in Kconfig and Makefile
- put lines under 100 chars on one line

Changes in v4:
include/dt-bindings/phy/phy.h:
	- remove commit adding PHY_TYPE_CDPHY definition

Binding file:
	- use the standard phy-type property instead of a custom one so
	  rename mediatek,phy-type -> phy-type
	- phy-type property is made optional: when present, describes the
	  phy type and the operating mode
	- phy-cell is modified to accept a phy argument representing the
	  phy operating mode if phy-type is not specified
	- adding new property num-lanes

Driver:
	- add a custom xlate function to handle phy cells
	- update probe function to retrieve the new value phy-type
	  instead of the mediatek,phy-type
	- remove useless struct define `struct mtk_mipi_dphy;`
	- rename some functin/variable from `xx_dphy_xx` to `xx_cdphy_xx`
	- update probe function to read num-lanes property

Changes in v3:
Binding file:
	- rename compatible string
	  mediatek,phy-mipi-csi-0-5 -> mediatek,mt8365-csi-rx
	- rename binding file to be as compatible string
	- change property mediatek,is_cdphy -> mediatek,phy-type using an
	  enum value instead of boolean for scalability
	- remove status property from example nodes
	- rename example node name 'mipi_rx_csi0: mipi_rx_csi0@11c10000' ->
	  'csi0_rx: phy@11c10000'
	- put reg address in lower case

include/dt-bindings/phy/phy.h:
	- add PHY_TYPE_CDPHY definition

Driver:
	- rename compatible string
	- rename property mediatek,is_cdphy -> mediatek,phy-type
	- rename CSIx* macro to CSIX* (x -> X)
	- fix style issue on the driver data structure
	- update MODULE_DESCRIPTION as suggested by Angelo
	  and update the kconfig module description to match it
	- add dphy /cdphy eq tuning function to factor the code
	  and increase readability
	- fix typo __PHY_MTK__MIPI_CSI__C_0_5_RX_REG_H_ -->
	  __PHY_MTK_MIPI_CSI_V_0_5_RX_REG_H_
	- reword commit message to update my contributions
	- added missing copyright
	- added module name in Kconfig

Changes in v2:
	- fix all comments on bindings
	- move the binding chunk from driver to binding commit
	- fix dt_binding_check error (reported by DT_CHECKER_FLAGS)
	- use a more generic compatible string
	- add a new dt properties to simplify the driver
	  "mediatek,is_cdphy"
	- rename the driver and the corresponding file to include
	  version
	- drop of_match_ptr()
	- use devm_platform_ioremap_resource
	- use phy-mtk-io.h api instead of regmap
	- rework the driver to use dt nodes to declare PHY instead of an
	  array in the driver
	- remove useless define for unused registers
	- remove support for CSI0A/B because it cannot be tested, and it
	  simplifies the driver for a first review
	- edit commit message and bindings to be more descriptive about the
	  hardware

Florian Sylvestre (1):
  dt-bindings: phy: add mediatek MIPI CD-PHY module v0.5

Phi-bang Nguyen (1):
  phy: mtk-mipi-csi: add driver for CSI phy

 .../bindings/phy/mediatek,mt8365-csi-rx.yaml  |  79 +++++
 MAINTAINERS                                   |   7 +
 drivers/phy/mediatek/Kconfig                  |  12 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  62 ++++
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 294 ++++++++++++++++++
 6 files changed, 456 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c

-- 
2.43.0


