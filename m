Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35369C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D534C207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDF10jQ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D534C207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wcH5s9jmZKj1lCRt4LFHwmBBBBBoWyf3pzAYE1w7jt8=; b=YDF10jQ3OvyAAdYCJCnTFlv9T
	d8Vj+Tfk1FCo12KrHv6OqdV9bR7yYjmROIDgZT9IUw19CJJqgFolHKDHHdoodTlIobbkCCtBxq607
	YHH085xMcmc0xX4QhnJBHr5vxx8bv5knuGVN2Lxq9N768uRzDcWi49o24w6vHJ8yTLrY71mI7Q6So
	R10Qk3TNHIoiYtB3jiQOVBpaU1Y32IdAegsyiKdzIeGKCXfhRMRy0TqKKiDn9zG4YKCodT5rPJt0A
	9Z+xXAI0pZ25q76HIDyZSC8Q0CrBy70VOfhlpeMwZ/5gQYgogFbgbmrKAF5mOzvOfZtVb2aMDsjkz
	DMLq6QoiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4UV-00051E-QD; Wed, 22 Jul 2020 02:28:19 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4S8-0003oH-H7; Wed, 22 Jul 2020 02:25:53 +0000
Received: by mail-io1-f65.google.com with SMTP id p205so859242iod.8;
 Tue, 21 Jul 2020 19:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JR3yCDURRRB9CMW6k6M1NZAeXdyv2WOTtRYEb08qPM8=;
 b=tfkp9DrIyLLK4KeelSX5vh6kQ9nA3Yw7qBKNP+K48HJUin1JY1iSo9CbyL3qn/dXz6
 M6XTCOg9lZAnMKsPzARCNEj6xbckhErdXyCxGdjpe72LAfvb3+zaMW3xv5Il0GHthHhE
 fgNm9NBD3Fce+C9/Rl39AHTmLIbl6Vc8M8CnWgtEo4pjyf1QmeNK8gnYI+uOgM5kLFCr
 gIBCKUeNRjjxADXkgwqI2fs1oFvKCMQivHaUeEzhFKO5x+YH9OjNk9YFkUSLDt3LxYWz
 rV+uNZ/hs9AEOQH19p2fBaLmrqKEGXcjCWbht/Pl3mMZBHpJql4b7Y1ErDVw8G3rFRGJ
 K0WA==
X-Gm-Message-State: AOAM531MdSe5j7GNa39qv4/cslqdYVTQwiRxgJKoSm/oFFk6VVpIbsk+
 cSP9/trknnI6v1PNwJUvPA==
X-Google-Smtp-Source: ABdhPJzml2tF082UAvEzJCr4xKgGe/WHUKeAlheKtAfO4iCpGmzBe+KJwCilqQNoTsfj2ulcrePV7A==
X-Received: by 2002:a02:3f41:: with SMTP id c1mr1706694jaf.29.1595384751707;
 Tue, 21 Jul 2020 19:25:51 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:51 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 10/19] PCI: rcar: Use pci_is_root_bus() to check if bus is
 root bus
Date: Tue, 21 Jul 2020 20:25:05 -0600
Message-Id: <20200722022514.1283916-11-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222552_619992_77098948 
X-CRM114-Status: GOOD (  16.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use pci_is_root_bus() rather than tracking the root bus number to
determine if the bus is the root bus or not. This removes storing
duplicated data as well as the need for the host bridge driver to have
to care about the bus numbers in most cases.

Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-rcar-host.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 3a8e749b4904..bf10f1cf04f4 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -54,7 +54,6 @@ struct rcar_pcie_host {
 	struct phy		*phy;
 	void __iomem		*base;
 	struct list_head	resources;
-	int			root_bus_nr;
 	struct clk		*bus_clk;
 	struct			rcar_msi msi;
 	int			(*phy_init_fn)(struct rcar_pcie_host *host);
@@ -100,22 +99,14 @@ static int rcar_pcie_config_access(struct rcar_pcie_host *host,
 		if (dev != 0)
 			return PCIBIOS_DEVICE_NOT_FOUND;
 
-		if (access_type == RCAR_PCI_ACCESS_READ) {
+		if (access_type == RCAR_PCI_ACCESS_READ)
 			*data = rcar_pci_read_reg(pcie, PCICONF(index));
-		} else {
-			/* Keep an eye out for changes to the root bus number */
-			if (pci_is_root_bus(bus) && (reg == PCI_PRIMARY_BUS))
-				host->root_bus_nr = *data & 0xff;
-
+		else
 			rcar_pci_write_reg(pcie, *data, PCICONF(index));
-		}
 
 		return PCIBIOS_SUCCESSFUL;
 	}
 
-	if (host->root_bus_nr < 0)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
 	/* Clear errors */
 	rcar_pci_write_reg(pcie, rcar_pci_read_reg(pcie, PCIEERRFR), PCIEERRFR);
 
@@ -124,7 +115,7 @@ static int rcar_pcie_config_access(struct rcar_pcie_host *host,
 		PCIE_CONF_DEV(dev) | PCIE_CONF_FUNC(func) | reg, PCIECAR);
 
 	/* Enable the configuration access */
-	if (bus->parent->number == host->root_bus_nr)
+	if (pci_is_root_bus(bus->parent))
 		rcar_pci_write_reg(pcie, CONFIG_SEND_ENABLE | TYPE0, PCIECCTLR);
 	else
 		rcar_pci_write_reg(pcie, CONFIG_SEND_ENABLE | TYPE1, PCIECCTLR);
@@ -215,6 +206,7 @@ static struct pci_ops rcar_pcie_ops = {
 static int rcar_pcie_setup(struct list_head *resource,
 			   struct rcar_pcie_host *host)
 {
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
 	struct resource_entry *win;
 	int i = 0;
 
@@ -232,7 +224,7 @@ static int rcar_pcie_setup(struct list_head *resource,
 			i++;
 			break;
 		case IORESOURCE_BUS:
-			host->root_bus_nr = res->start;
+			bridge->busnr = res->start;
 			break;
 		default:
 			continue;
@@ -338,7 +330,6 @@ static int rcar_pcie_enable(struct rcar_pcie_host *host)
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
 	bridge->sysdata = host;
-	bridge->busnr = host->root_bus_nr;
 	bridge->ops = &rcar_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
