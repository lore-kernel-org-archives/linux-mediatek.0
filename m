Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C1EC433EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:27:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96B3207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vy8PLweu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96B3207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r6PSbDUTOHFxGQUdvjcesxVn4YINydokZ9NKgB8es4Q=; b=vy8PLweuyzzd85zblZSZ+dI8f
	AUnBiXh6gf0gedDGQ4L5gN/hB59tj4izB0xSPLNJSeEipDZ7hXzSx8a+2eI4NQF1sp58g8pkzenL0
	baDsrDQgJoXprwtPTtAgyMXeWuU01VtUYBBWs53GT0Eky0p2g3t4yCeWzfqpFgJ3SiDJshmpJqf+1
	LXe8x/ee7sUEFdmldOy5+h0ZdbeB6jFa2ins97QZXdmbQNDb/QBOjIOfsb53k3TfVFR0e8vOqk92E
	SyawQhls0+RLnKB25hsOarUbROldKW6HYZ1DmCu3CbXDdFpnJOGmjOLZDr64XHrxBILWV690VIkin
	GI/MusGRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4TX-0004T6-F2; Wed, 22 Jul 2020 02:27:19 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Rz-0003k1-0A; Wed, 22 Jul 2020 02:25:43 +0000
Received: by mail-io1-f67.google.com with SMTP id z6so870200iow.6;
 Tue, 21 Jul 2020 19:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWoYf9yKrwwSCKBsmrxvNwRUkfwXcjhBMBaR+mTZurc=;
 b=bSVnlFy4CB4uxGG0ikRnRFdz5n+FZhJBBi3ZxOQQRrLGXWNQsomJwpug4e5WlV5lDl
 OGM+PEDxxw9hfaP2Qn4qMGgWZ2ba2VW7Tc4VbRykcWV/YwjNCpPTz/jViglb2qTiLwPh
 zSsIA4hUmvR6rpXLBsC3NSwO9L7JBf8rqJ61D86smnjTIArVj8ZpI7+8up42MX9t7mso
 iqFhZcc2ID2cgfLe4gx72ivz4+uFpOUTLX+1wLOVMTPzu8iiYyaUMwThGcRWGUKMqPR7
 o/X2Tfm28h3TD1O3oaewAlQ93FEKbh3f/cMdMv5G8Ai40+pdDiUlUWJcjWjiu5O2Pgw9
 iX8w==
X-Gm-Message-State: AOAM530eEn4xIHACvYn8KWMM0PClYO2O9K1RFye8SH5xExiVAs6dS13l
 cjM+k3Q86s+eJA4TryRAsg==
X-Google-Smtp-Source: ABdhPJwAvhDYvgyKhTqQn/Tiiu6xiBcvCLsNbo3tptKdVnpJdfPGiAGrxhD9aQiTmr7GmGloXhv20w==
X-Received: by 2002:a6b:1449:: with SMTP id 70mr30849393iou.153.1595384742266; 
 Tue, 21 Jul 2020 19:25:42 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:41 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 07/19] PCI: xilinx-nwl: Use pci_is_root_bus() to check if bus
 is root bus
Date: Tue, 21 Jul 2020 20:25:02 -0600
Message-Id: <20200722022514.1283916-8-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222543_106857_303906DD 
X-CRM114-Status: GOOD (  16.72  )
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

There was also a bug that the pci_host_bridge.busnr is set from
root_busno, but root_busno is never set which means the root bus number
is always 0 even if the DT said something else.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-xilinx-nwl.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 3c747aa4b6d1..566165c18fad 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -166,7 +166,6 @@ struct nwl_pcie {
 	int irq_misc;
 	u32 ecam_value;
 	u8 last_busno;
-	u8 root_busno;
 	struct nwl_msi msi;
 	struct irq_domain *legacy_irq_domain;
 	raw_spinlock_t leg_mask_lock;
@@ -217,13 +216,11 @@ static bool nwl_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
 	struct nwl_pcie *pcie = bus->sysdata;
 
 	/* Check link before accessing downstream ports */
-	if (bus->number != pcie->root_busno) {
+	if (!pci_is_root_bus(bus)) {
 		if (!nwl_pcie_link_up(pcie))
 			return false;
-	}
-
-	/* Only one device down on each root port */
-	if (bus->number == pcie->root_busno && devfn > 0)
+	} else if (devfn > 0)
+		/* Only one device down on each root port */
 		return false;
 
 	return true;
@@ -855,7 +852,6 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = pcie;
-	bridge->busnr = pcie->root_busno;
 	bridge->ops = &nwl_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
