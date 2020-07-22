Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49122C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E315D207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tlt5u0O9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E315D207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q78f+rfsgJ7ysEHGATO1g79eN/uL8BaRBGR8ASBNQ6s=; b=Tlt5u0O9By73mdY1/xuT8JFZ1
	zP8ISCcxqsbubZCBLbw6lcafCXxViJ3BJcK3ou+kRrhvUl5APHBzeOzVDNm20EaSlIF6ZGvxJj/27
	XS6Du22K+wXxnJbCzlzGOBM821GI8FMJHaskJ1Yb+iCQDfqX3eaFSfezaozNQVTfL0dKDMC9VDY3s
	6tr+n/ZHV28PAzyOl5KV507CiG69/qAQGeQ9BnKAkyxEIdYAkdzOqm4dP6cinziz9bR4MYw+hTbFE
	QblfRlFfIcrvNOMnOMTWTRIM5Zf535qPv3LsAEEiVC9FtNZutQVncpYkdlfd5JNtFh4/6V4QZ3zNo
	pHCdVkIOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4U1-0004hS-3L; Wed, 22 Jul 2020 02:27:49 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4S1-0003lS-OF; Wed, 22 Jul 2020 02:25:46 +0000
Received: by mail-io1-f68.google.com with SMTP id d18so895639ion.0;
 Tue, 21 Jul 2020 19:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDVBFAV1LgRYqxRG53cBTHDmtvye0RECoeUbU3k4QmU=;
 b=Ksre7KUJcVT4nyz8Cfnto782OnchPrI0B3zgEzb+H20H9XB4o58aTQLU5HS5qbJDQR
 Tc2waoVG9uT42VsZAwK9aIDqRrd31p9eQY/QIJ3WVnI4xIY5DYx1GNpsD3ayMm5RlT18
 6GYt26rzgJgWE2xzG5RAspafVOT3dDy0tZOAkU8UZG/uPajlmf99SKCTR9XUgrrY/l9d
 jnSJtcOSGtey8ZTK0qDS7fBMEqoLE4uBHi3eTzYSPDJXPHXGv8RU9huwMQ3NR3MfHEYy
 unAwFoUpTNd+ENGpzYqPlkATEj5RfjncduJoPNiYB/gyzr8aITAuH5jI7PMae4JrudMP
 DvHA==
X-Gm-Message-State: AOAM531IUkCIKWcFzAcdr1PYxxx9F43yDAbxZ1Fyyrm/TjRW3VEcTUD2
 DUGL4m/UDkuMx9zBK57J0g==
X-Google-Smtp-Source: ABdhPJy/sM+kScso9OnqADpgcxe+bbOpc4xZJUnmm8EGIxt611lXsKW60uaDZrA/MwcYgio2CkE47Q==
X-Received: by 2002:a05:6e02:8e4:: with SMTP id
 n4mr28099024ilt.96.1595384745117; 
 Tue, 21 Jul 2020 19:25:45 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:44 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 08/19] PCI: xilinx: Use pci_is_root_bus() to check if bus is
 root bus
Date: Tue, 21 Jul 2020 20:25:03 -0600
Message-Id: <20200722022514.1283916-9-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222545_919690_9BB823D9 
X-CRM114-Status: GOOD (  16.35  )
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

There was also a bug that the root_busno is never set which means the
root bus number is always 0 even if the DT said something else.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-xilinx.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index cce67cb8fb2b..7bf80f68efa9 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -98,7 +98,6 @@
  * @reg_base: IO Mapped Register Base
  * @irq: Interrupt number
  * @msi_pages: MSI pages
- * @root_busno: Root Bus number
  * @dev: Device pointer
  * @msi_domain: MSI IRQ domain pointer
  * @leg_domain: Legacy IRQ domain pointer
@@ -108,7 +107,6 @@ struct xilinx_pcie_port {
 	void __iomem *reg_base;
 	u32 irq;
 	unsigned long msi_pages;
-	u8 root_busno;
 	struct device *dev;
 	struct irq_domain *msi_domain;
 	struct irq_domain *leg_domain;
@@ -162,14 +160,13 @@ static bool xilinx_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
 	struct xilinx_pcie_port *port = bus->sysdata;
 
 	/* Check if link is up when trying to access downstream ports */
-	if (bus->number != port->root_busno)
+	if (!pci_is_root_bus(bus)) {
 		if (!xilinx_pcie_link_up(port))
 			return false;
-
-	/* Only one device down on each root port */
-	if (bus->number == port->root_busno && devfn > 0)
+	} else if (devfn > 0) {
+		/* Only one device down on each root port */
 		return false;
-
+	}
 	return true;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
