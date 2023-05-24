Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6247BC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kffM2qOd8UySQXRHCzIS0BeFu6Pjgruc1iNUigvygb8=; b=n4gIupBeMI+YzpqYjmBQmHG9qW
	HTWl3C56gzhv2W9SeC4rL3021weRJPFw57NbqoBJIWV+7CZLjeXM+53XtHBxse9GjzhHFEu2N2TNM
	pwomDyJe4lh3scViWIVwK2c7UqViTzcPKFcU77nwIMFdubODmE2X8uqr8CUDEETqx5uhisDUPCDIJ
	tRrp7a4NQI+e1LNt78ADuuKxtuhIhShdBMzJeK+6Wgn8bRLckuICOx/UQxaqwbu7RgeiTlODOXvZE
	3IXhmCvmlH4hivAdeKb76DvWxwnK5W2VYmt35T0DoBusZH459s+0k8axbEOey/bsuOrQ8gfuBhYoo
	AxxSnvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kth-00Cz5m-0n;
	Wed, 24 May 2023 09:35:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jtT-00CmYh-2N
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 08:30:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-309550263e0so460901f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684917045; x=1687509045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kffM2qOd8UySQXRHCzIS0BeFu6Pjgruc1iNUigvygb8=;
        b=FyXIAxhzm+oTvcZrc9mqWnaGXVkFBJbMThxfFv3MS6f7ot+O8xjdNSYJkcqGrfXphs
         jbaqhmjI9keROKbCSmuh/otuF7bZVvDCYBkJbXhwvd8418yW7ltpXbuuSzVsa3jNICqk
         VodXyH7FO3BYrd1fSacPj9XHpm5MSJ0za2SHZ50yeVeaIO1wl3jRpnJEnCDlytLiTNVZ
         hyHaIhaNgHXgcShlfCVNVGLDL+p4ERJgHBwdkhLFZu0csf4h16S5V38k+LO3jnA+GPM6
         Gd9eVShRucK/gkiP4bZ5b0BN4+pK/JSyZh+mjpwwyetmEBTHp2p5I9T/acGelSlKucaH
         c3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684917045; x=1687509045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kffM2qOd8UySQXRHCzIS0BeFu6Pjgruc1iNUigvygb8=;
        b=Mh9G3Lynh3mh7FlwABnjkeHCoHktoQT79wyDBawBx/2/ctNUzlyCJBOwMwB3qxFtNx
         eqLsYJRXs/pDQs7tfvs/XWdewLmxNZFmhUU+OY2A57h0hVEIjfoPa83XlUVzucr9EpCp
         MyXxQoZFPDIItwRzMmlgsT2FLLdAFRNIDJlPo8jCOaEDqmoEnAcJTfX5MIEU0vvEHXv5
         IXBYbVNQUXTUm2SBsfTKJu7Y/PhScbC5pp3xrLBDC4ap+LFU9HoEqnrMm3rLauPpewK2
         nHycgkx4F64gSQPE2vjTEqN9p3O8dN15drHGn+3xXKE9o2r65eh6y0Cb//v3HAbJ07La
         e5bw==
X-Gm-Message-State: AC+VfDwlD0JTO8plOvnJzyn0kPve2V1sCw2bqiN928UQH6UcyZitvFmE
	EaBKTtosT0n6GASyuXCM6w770g==
X-Google-Smtp-Source: ACHHUZ6RKUgi2r3+ULkAZkHhThnj59JBpVMuBR0BTeba5BRaxoHn2ulZhXc1hJPCT/6mYxsCf65d+Q==
X-Received: by 2002:adf:f103:0:b0:309:509f:a7ef with SMTP id r3-20020adff103000000b00309509fa7efmr12077478wro.67.1684917044126;
        Wed, 24 May 2023 01:30:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d484b000000b00307c0afc030sm13871832wrs.4.2023.05.24.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:30:43 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: mkorpershoek@baylibre.com,
	khilman@baylibre.com,
	Julien Stephan <jstephan@baylibre.com>,
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
Subject: [PATCH v3 0/3] phy: mtk-mipi-csi: add driver for CSI phy
Date: Wed, 24 May 2023 10:30:29 +0200
Message-Id: <20230524083033.486490-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_013051_774689_65D9F827 
X-CRM114-Status: GOOD (  18.37  )
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

Changelog
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

Julien Stephan (1):
  dt-bindings: phy: add PHY_TYPE_CDPHY definition

Phi-bang Nguyen (1):
  phy: mtk-mipi-csi: add driver for CSI phy

 .../bindings/phy/mediatek,mt8365-csi-rx.yaml  |  68 +++++
 MAINTAINERS                                   |   7 +
 drivers/phy/mediatek/Kconfig                  |   8 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  58 ++++
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 272 ++++++++++++++++++
 include/dt-bindings/phy/phy.h                 |   3 +-
 7 files changed, 417 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c

--
2.40.1

