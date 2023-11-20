Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDFDC197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umWEKXWFXv0eNP2vzXEwDqh3C4XXm2b3F2YK1OcVyho=; b=O1zeDdL+A7AehpkpiPh2UTO3rh
	EOt/xAArC63WgCHLySD8ETpZu8WIgHi6bFjMe04gEcLnwnp/Kiy7VQIh6lCIaPDpraMIi1tSP7C3s
	q+PNkdBNZAlk2/Crpo/zb3uq4c5AcuWwQkw8+klTW7xdULRcToZhSiAjG/Qc1L1Do7rYssK9b7OxW
	10PbFfkDMQzIfLcTFSfs4Qcjn6waFc1nK1pgYlYXxuY8p8/VJRkZEqSJfEyJ2XQwWph8/dgKKRctR
	DACU11QKbE5J77bjmOTkA7c4EzaOOFQ7f3OMxrJpudaCvVSlSULy5yWoD0IrbMhxq9+KnFpW0Abr4
	/uRr3kGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gK-00CBfT-07;
	Mon, 20 Nov 2023 13:51:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gE-00CBdU-1I;
	Mon, 20 Nov 2023 13:51:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40a46ea95f0so18231135e9.2;
        Mon, 20 Nov 2023 05:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488271; x=1701093071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=umWEKXWFXv0eNP2vzXEwDqh3C4XXm2b3F2YK1OcVyho=;
        b=ePjh6ZZZnE2kqSnPkZnw1mXAvYNo1FDrc11a3JiYVraur8w1epSWpBZn7o6qx7LrFn
         ZiFwvGEtNkY6U/VTsMUUeOu1nT7d8EV8HY/5MVH4LCTldsK9QPW2o3jgnJwyqCA6AnU5
         eOvus09jG1eByhhnmAs3RBMeGrXwoM7SqeWSWtzoaUQoXJEz7ijWpQl6h2RVtrAOe/k5
         Zp7Jn/6PLhXRpJRNYEjgy2P2ioPZmNB5VJLqaVUuChVyHY96V2vlGVF4mdr+VJ0kX0WE
         d4DNgHXhc4fN8wwLbH0HgcnDnlZjq/mUN1Z3uW+HICr4/vKxfharag6CIGD5dE5Ag6oY
         hWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488271; x=1701093071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umWEKXWFXv0eNP2vzXEwDqh3C4XXm2b3F2YK1OcVyho=;
        b=e0iFlsRD+cgYRB6HY3QI1lOQnEpBL1+EOQSH5kzmzDpWsWINnsbR3wPqz0kXcHfREY
         Fy+xILnmkALFy0f7cDtuyB25iIZod7TYK9KAtAau0JrRB9xW42v7i1vctuQ9UoUpscPi
         hiBZmNRICTvT72h1Ecnh0924Q4MvWzH1Eu3UxQCIYVnoZajjoAQDOnIjmcXSQdkkl3lV
         CK/fXvk8ctLCp8rvNCT3Q+xvOCNNLeSUU8gAf/hI1hhoN+gPUSz59ptKB0LXfnk68wt8
         c0Tx/M1yAl/f4qoUaGJF7Hn+Q57iaMjJyxrPj69phkpDS5rRK3WSCqM2QVMimecgXwVc
         cguA==
X-Gm-Message-State: AOJu0YzxDaKL0GLgKEDEdK1DnlZSyTbXd87zTd57qP8LXBURXrjwmfpQ
	/N9y5i+pjtlH5O/wNi572PQ=
X-Google-Smtp-Source: AGHT+IG1J8cbmxkv7bK3mr7U//mrN6TW30Hcy9cOIwzVFGvTJowIC50goBaskga2xCFUBmOawihy0w==
X-Received: by 2002:a05:600c:1392:b0:40a:69f2:3b7c with SMTP id u18-20020a05600c139200b0040a69f23b7cmr7002035wmf.16.1700488270960;
        Mon, 20 Nov 2023 05:51:10 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:10 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 00/14] net: phy: Support DT PHY package
Date: Mon, 20 Nov 2023 14:50:27 +0100
Message-Id: <20231120135041.15259-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055114_462043_4B0C9DD6 
X-CRM114-Status: GOOD (  19.20  )
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

Idea of this big series is to introduce the concept of PHY package in DT
and generalize the support of it by PHY driver.

The concept of PHY package is nothing new and is already a thing in the
kernel with the API phy_package_join/leave/read/write.

The main idea of those API is to permit the PHY to have a shared global
data and to run probe/config only once for the PHY package. There are
various example of this already in the kernel with the mscc, bcm54140
mediatek ge and micrle driver and they all follow the same pattern.

What is currently lacking is describing this in DT and better reference
the PHY in charge of global configuration of the PHY package. For the
already present PHY, the implementation is simple enough with only one
PHY having the required regs to apply global configuration.

This can be ok for simple PHY package but some Qcom PHY package on
""modern"" SoC have more complex implementation. One example is the PHY
for qca807x where some global regs are present in the so-called "combo"
port and everything about psgmii calibration is placed in a 5th port in
the PHY package.

Given these additional thing, the original phy_package API are extended
with support for multiple global PHY for configuration. Each PHY driver
will have an enum of the ID for the global PHY to reference and is
required to pass to the read/write function.

On top of this, it's added correct DT support for describing PHY
package.

One example is this:

        ethernet-phy-package {
            compatible = "ethernet-phy-package";
            #address-cells = <1>;
            #size-cells = <0>;

            global-phys = <&phy4>;
            global-phy-names = "base";

            ethernet-phy@1 {
              compatible = "ethernet-phy-ieee802.3-c22";
              reg = <1>;
            };

            phy4: ethernet-phy@4 {
              compatible = "ethernet-phy-ieee802.3-c22";
              reg = <4>;
            };
        };

The mdio parse functions are changed to address for this additional
special node, the function is changed to simply detect this node and
search also in this.

If this is detected phy core will join each PHY present in the node and
use (if defined) the additional info in the PHY driver to probe/config
once the PHY package.

Some PHY package also supports a single phy-mode for every PHY in the
PHY package. This is also supported and can be described in DT by
defining the phy-mode in the PHY package node.

I hope this implementation is clean enough as I expect more and more of
these configuration to appear in the future.

Christian Marangi (12):
  net: phy: extend PHY package API to support multiple global address
  dt-bindings: net: move PHY modes to common PHY mode types definition
  dt-bindings: net: document ethernet PHY package nodes
  net: phy: add initial support for PHY package in DT
  net: phy: add support for named global PHY in DT PHY package
  net: phy: add support for shared priv data size for PHY package in DT
  net: phy: add support for driver specific PHY package probe/config
  net: phy: add support for PHY package interface mode
  net: phy: move mmd_phy_indirect to generic header
  net: phy: add support for PHY package MMD read/write
  dt-bindings: net: Document Qcom QCA807x PHY package
  net: phy: qca807x: Add support for configurable LED

Robert Marko (2):
  dt-bindings: net: add QCA807x PHY defines
  net: phy: add Qualcom QCA807x driver

 .../bindings/net/ethernet-controller.yaml     |   47 +-
 .../bindings/net/ethernet-phy-mode-types.yaml |  132 ++
 .../bindings/net/ethernet-phy-package.yaml    |   86 ++
 .../devicetree/bindings/net/qcom,qca807x.yaml |  143 ++
 drivers/net/mdio/of_mdio.c                    |   60 +-
 drivers/net/phy/Kconfig                       |    7 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/bcm54140.c                    |   23 +-
 drivers/net/phy/mdio_bus.c                    |   33 +-
 drivers/net/phy/mediatek-ge-soc.c             |   11 +-
 drivers/net/phy/micrel.c                      |   13 +-
 drivers/net/phy/mscc/mscc.h                   |    7 +
 drivers/net/phy/mscc/mscc_main.c              |   16 +-
 drivers/net/phy/phy-core.c                    |   14 -
 drivers/net/phy/phy_device.c                  |  218 ++-
 drivers/net/phy/qca807x.c                     | 1232 +++++++++++++++++
 include/dt-bindings/net/qcom-qca807x.h        |   45 +
 include/linux/phy.h                           |  178 ++-
 18 files changed, 2119 insertions(+), 147 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml
 create mode 100644 drivers/net/phy/qca807x.c
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

-- 
2.40.1


