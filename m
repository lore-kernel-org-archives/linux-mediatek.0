Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAE9C4345B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:26:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6589207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z9BiTeJL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6589207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=++jtXgOMhH8UKoAaYjqVGi+bDeidmYCkdwJj0wAAAl0=; b=z9BiTeJLNMc7DthgpLGHoRO6N
	J070XfZzcAY/g8YUUsF0NsW4oABofNbE8emj2ATYcMQPkI9iH7GTZx3YctAh0MCqiM8IehJpvIXCq
	QadBAkSRhPZZOkqi2TNx0gvpGUmNTDYzOmBE6pmsM8JuUT7L92flGOjgP20V9IgBN4sUNTg3xuSFC
	jegddplHX/PAuyK4qWF7rlxqjq9tDLfB5+9xIRS7sbHNUEnC7M0uNE89qqGBGb4II28pq89AFoe26
	D59bvhatLTzfdQBMvV0738T4z+RUXcmqs4TVIeAYwLOog8YjI5Dmq0SUizoMAghU7cv9enxdPdjU1
	FLtdvBN9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4SB-0003pc-MU; Wed, 22 Jul 2020 02:25:55 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Rl-0003eS-Bt; Wed, 22 Jul 2020 02:25:30 +0000
Received: by mail-io1-f68.google.com with SMTP id c16so850936ioi.9;
 Tue, 21 Jul 2020 19:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v7XJhzTA6102delF3DpjIqYKFtilWigh34GV7eTcdd0=;
 b=XL6FAtG2fcEb0VAVF4lSJ2+furNzmLpkXP2OmIVmPs9tAbhG+NqAFhn+cVwQQZm51k
 woVrHM8MtpGkDslfj8nBDMEw6aIELk/A4x2Bip2v34iut5Ua0EhUqb6IzdlKftVxMhr7
 ihlmBtdbhBED7hOc9Q89Fc4JjGsH3HWa5Lh6W7KQjWnM8jdnSdOLaT8ExdRGv8hjoDun
 ui8UhloynqJ7/vChs/lf8R1SOPfZBXVJhlORdR4DKCRCTjLG3zQ2JEJlV+bdtwZaaeZk
 c1G/KrZ6t5FbomIL7deBgk30jV4TJzR+68jZPqMqw3WZjpDI1EbDriTcDQd0fVuhKaSQ
 GgmQ==
X-Gm-Message-State: AOAM530rCxKewywGPtVHL2jVhwvfcMwXoOu5qPV0eeeL0sNAMghkPRaD
 EKpJ+N0NPUVoFGoTmoyShA==
X-Google-Smtp-Source: ABdhPJxSDk03cAG57DuYEG85mz4Rz6BjdksKFdm4mcs2hIajP3ovUbTb0I74gMDuOFLmTlQK0dLpMw==
X-Received: by 2002:a92:89da:: with SMTP id w87mr31911370ilk.236.1595384728469; 
 Tue, 21 Jul 2020 19:25:28 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:27 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 03/19] PCI: Drop unnecessary zeroing of bridge fields
Date: Tue, 21 Jul 2020 20:24:58 -0600
Message-Id: <20200722022514.1283916-4-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222529_470983_192C9B24 
X-CRM114-Status: GOOD (  10.93  )
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

The struct pci_host_bridge is 0 initialized when allocated, so there's
no need to explicitly set fields to 0.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-aardvark.c       | 1 -
 drivers/pci/controller/pci-ftpci100.c       | 2 --
 drivers/pci/controller/pci-mvebu.c          | 1 -
 drivers/pci/controller/pci-v3-semi.c        | 2 --
 drivers/pci/controller/pci-versatile.c      | 2 --
 drivers/pci/controller/pci-xgene.c          | 1 -
 drivers/pci/controller/pcie-brcmstb.c       | 1 -
 drivers/pci/controller/pcie-iproc.c         | 1 -
 drivers/pci/controller/pcie-rockchip-host.c | 1 -
 drivers/pci/controller/pcie-xilinx.c        | 1 -
 10 files changed, 13 deletions(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 8210bf88734b..f38663af795c 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1185,7 +1185,6 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = pcie;
-	bridge->busnr = 0;
 	bridge->ops = &advk_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index 5037aa9f6fd8..84b6b5a21a89 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -438,8 +438,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	host->ops = &faraday_pci_ops;
-	host->busnr = 0;
-	host->msi = NULL;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
 	p = pci_host_bridge_priv(host);
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 7be6db851614..db93823a2dcb 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1117,7 +1117,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	pcie->nports = i;
 
 	bridge->sysdata = pcie;
-	bridge->busnr = 0;
 	bridge->ops = &mvebu_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index e8b5e55803b2..d79af39e6e60 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -724,8 +724,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	host->ops = &v3_pci_ops;
-	host->busnr = 0;
-	host->msi = NULL;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
 	v3 = pci_host_bridge_priv(host);
diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index f32ef8072147..80f594beea81 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -155,8 +155,6 @@ static int versatile_pci_probe(struct platform_device *pdev)
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->sysdata = NULL;
-	bridge->busnr = 0;
 	bridge->ops = &pci_versatile_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index fbb461cf8eca..1d3286823c16 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -625,7 +625,6 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	bridge->sysdata = port;
-	bridge->busnr = 0;
 	bridge->ops = &xgene_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 4291a15abdcf..a92b337af20f 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -996,7 +996,6 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		}
 	}
 
-	bridge->busnr = 0;
 	bridge->ops = &brcm_pcie_ops;
 	bridge->sysdata = pcie;
 	bridge->map_irq = of_irq_parse_and_map_pci;
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index cf1cb717c7df..e98dafd0fff4 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1523,7 +1523,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
 		if (iproc_pcie_msi_enable(pcie))
 			dev_info(dev, "not using iProc MSI\n");
 
-	host->busnr = 0;
 	host->ops = &iproc_pcie_ops;
 	host->sysdata = pcie;
 	host->map_irq = pcie->map_irq;
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 4eb79c60d627..fb88030161f2 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -1008,7 +1008,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = rockchip;
-	bridge->busnr = 0;
 	bridge->ops = &rockchip_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 7c0f3268fc5c..cce67cb8fb2b 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -652,7 +652,6 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = port;
-	bridge->busnr = 0;
 	bridge->ops = &xilinx_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
