Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B64C07CA9
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ZxXzgcsFa66c5DTc1V1SpwFIJNBC3WpXhfBHmJYop4=; b=KxCevPcU3vc5k3xhpiZLvxzdkA
	yGUpFyE2zABz0hDW2N4SYupvXP61+9LZixp9Qmnm747Q7NnEidFcet4d9sJxn1AyEsh6dyCdJYc8/
	GwA0bazrQc3cotU8OLoQUfz52SiM6XGem4VdocbbCIgjHrUkQx9VLME+m3x9h5oSCGa9ySEUCUsl2
	3oHKoObFLu+/ZxSSFzVwqwd3Fs13WS/GBd+pcew67Ve5kSL5L1iX0ciii2Uw+pUeLy+LcxK0SD/UE
	pg6UByfGT6hhlL7mY2+aQgqbbuBEk/vWNU1trGGEw0qu+A71MUTbNUFEHY5f7H0GsU95Y/cTmTQ8k
	m/eTuuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LP-00A4aZ-2C;
	Sun, 26 Nov 2023 01:53:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LL-00A4Yw-2g;
	Sun, 26 Nov 2023 01:53:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b34563987so17264315e9.1;
        Sat, 25 Nov 2023 17:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963633; x=1701568433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZxXzgcsFa66c5DTc1V1SpwFIJNBC3WpXhfBHmJYop4=;
        b=UtA0OFDUZXCY1sMkodo5G7ifF8qfUQhvjQn3G4/2SoQRJq7P+QQ7agWI6vEd99AS4W
         JfZpTtN0r5fYLqw6uRZEvKBVJZKRPvltp2Wtk0QDARCGO3WX02btRWgyD84bt3zvHwZd
         8J6xZ0LKXZrl956GUE7p/Cqh8mtPYeeBNmOxEZcg4zXD6AxvN710Tlt8kJL5QRDyW9Sf
         2jTm9+SlzXC1wNleZJVp65dBAuNxueUlIwWK1K8Isve51yPawv/7LIQyEQfWfCcEgzhq
         GYKSyxt8D5Gr+jqVmOY+DBx6+hSIzUywUnZj59cDhGY75MpiknpBKZqOKS26pu84aESs
         Ucsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963633; x=1701568433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZxXzgcsFa66c5DTc1V1SpwFIJNBC3WpXhfBHmJYop4=;
        b=vdIkKitS4ee1ZbF/oJNOUoZV9J5jzWIRWRqjotc9v4+/jwsuxmyZwc4z87+LLiK0pW
         ppVjV3aLcPXUxAMyIPfL4+rdy9bsYjfv6fgkQ/C5uVjtJU3XCPuY5S6kQ/9SBKY74h+s
         V3fb0rkJqDa7bKF14ly1T20rm0HiHml8jq3MeAIJ30BxoiQBDvWOfMA/k1MLpIf752OQ
         36ViqSTIhw+cezGiqoqPIUsy6POsVzLzY+ZuqcWG/SdSZDUy6TxSnvvrIisNiepCiV9K
         m53cZUL3s0mao3d3Vv3A5G7Nrcb7ZluB6/ww5OWyd1kim5oeontHkzLvdNfNGGTNuxmq
         1jvA==
X-Gm-Message-State: AOJu0Yxf1jyMrmF6kXGyZSjhN7iAx4uKlQPsKL5kXJI8wzBX5nq+h924
	0JU/tgagYs3JP/3WXXCyH54=
X-Google-Smtp-Source: AGHT+IF3zWcXt6J8ONHbVNqsmKNBZ78aaiUYHOj1FlStaqQ7aY4b1MwjHFFZQlrITxUlZaQzKLppnw==
X-Received: by 2002:a05:600c:4311:b0:40b:3de0:8e1a with SMTP id p17-20020a05600c431100b0040b3de08e1amr4388812wme.8.1700963633053;
        Sat, 25 Nov 2023 17:53:53 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:52 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 0/8] net: phy: Support DT PHY package
Date: Sun, 26 Nov 2023 02:53:38 +0100
Message-Id: <20231126015346.25208-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175355_869296_DB49003E 
X-CRM114-Status: GOOD (  23.06  )
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

This depends on another series for PHY package API change. [1]

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

        ethernet-phy-package@0 {
            compatible = "ethernet-phy-package";
            #address-cells = <1>;
            #size-cells = <0>;

            reg = <0>;
            qcom,package-mode = "qsgmii";

            ethernet-phy@1 {
              reg = <1>;
            };

            phy4: ethernet-phy@4 {
              reg = <4>;
            };
        };

The mdio parse functions are changed to address for this additional
special node, the function is changed to simply detect this node and
search also in this.

If this is detected phy core will join each PHY present in the node and
use (if defined) the additional info in the PHY driver to probe/config
once the PHY package.

I hope this implementation is clean enough as I expect more and more of
these configuration to appear in the future.

(For Andrew, we are looking intro making this in at803x PHY driver and see
what functions can be reused, idea is to move the driver to a dedicated
directory and create something like at803x-common.c as the at803x PHY
driver is too bloated and splitting it it's a better approach)

[1] https://patchwork.kernel.org/project/netdevbpf/patch/20231126003748.9600-1-ansuelsmth@gmail.com/

Changes v3:
- Add back compatible implementation
- Detach patch that can be handled separately (phy_package_mmd, 
  phy_package extended)
- Rework code to new simplified implementation with base addr + offset
- Improve documentation with additional info and description
Changes v2:
- Drop compatible "ethernet-phy-package", use node name prefix matching
  instead
- Improve DT example
- Add reg for ethernet-phy-package
- Drop phy-mode for ethernet-phy-package
- Drop patch for generalization of phy-mode
- Drop global-phy property (handle internally to the PHY driver)
- Rework OF phy package code and PHY driver to handle base address
- Fix missing of_node_put
- Add some missing docs for added variables in struct
- Move some define from dt-bindings include to PHY driver
- Handle qsgmii validation in PHY driver
- Fix wrong include for gpiolib
- Drop reduntant version.h include

Christian Marangi (6):
  dt-bindings: net: document ethernet PHY package nodes
  net: phy: add initial support for PHY package in DT
  net: phy: add support for shared priv data size for PHY package in DT
  net: phy: add support for driver specific PHY package probe/config
  dt-bindings: net: Document Qcom QCA807x PHY package
  net: phy: qca807x: Add support for configurable LED

Robert Marko (2):
  dt-bindings: net: add QCA807x PHY defines
  net: phy: add Qualcom QCA807x driver

 .../bindings/net/ethernet-phy-package.yaml    |   75 +
 .../devicetree/bindings/net/qcom,qca807x.yaml |  136 ++
 drivers/net/mdio/of_mdio.c                    |   68 +-
 drivers/net/phy/Kconfig                       |    7 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/mdio_bus.c                    |   35 +-
 drivers/net/phy/phy_device.c                  |   54 +
 drivers/net/phy/qca807x.c                     | 1315 +++++++++++++++++
 include/dt-bindings/net/qcom-qca807x.h        |   30 +
 include/linux/phy.h                           |   27 +
 10 files changed, 1719 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml
 create mode 100644 drivers/net/phy/qca807x.c
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

-- 
2.40.1


