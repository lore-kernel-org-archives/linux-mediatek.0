Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB34C433F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB6B20714
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aV2C5FPa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB6B20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FmGclOxsuk6ZImQCSRENOv74Lg4pU2rsVTrAzCIl4P0=; b=aV2C5FPa7Q506GaVopGJ3Yz2i
	EB9cOMedzaULOaBJuL9wkNV8RC7VCpnccwXmqh+gvnHrGpi7Vus7MYrVWCKdCFXxtDfMN13Py2cPl
	PsCW90ERN11ezo1kLFTvDw8lHDVTfwIiyU6xO0S+KTkXxV4jmqfQBcjiFcXZERKaXKWoFDXN7psH4
	hjf030olAv1FLspEVRAgoL2GF5Wm2TXw7BT9ZePpHOb2D3GTysCW3JwniuuLNYRfFu/MeKzNHPN9H
	eKMBjY0TEK2fD3RkWc+IczfzYEVM1WPRmkZJ+UVpQ4J4otvCa4QQsCagm5UKxBkSs4Nmh95nCz6BP
	d2AcRvYmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4Rm-0003f4-2n; Wed, 22 Jul 2020 02:25:30 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Re-0003cn-Aw; Wed, 22 Jul 2020 02:25:23 +0000
Received: by mail-io1-f65.google.com with SMTP id k23so840210iom.10;
 Tue, 21 Jul 2020 19:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MyXhb4el16fajsxGsXz/wV6IH5NaMinhka6PcK2IANE=;
 b=bJ9YB9kuYHqDEUpqFAPnxWvf2p3klXPPJVYvb0qsfgPZu1uDUlhFqZwQ+rQdjAzrOt
 mW7WnVscn5jpjYuI2WnE9gGBdW6ssk/7hHnh/AgVSUTA/w++bnZYh+f5mC4iZYJdlwlj
 73kdWF4r+CLJmSm3pCiGOh4tHYX8Owe7hcmiijCn1HtctXDNL8Q8wopos4lFVDy9bUVG
 b6uy5N8tlmPDSDQ3dF5e7Ngq+f94zkudxisw82MkPoauSOnDJMrTfAguhQeFpYcDBCBL
 sAAG5+p1uYmqmlKxG5D4GdF0Bt3LZAoOc8xuiFiB54RtQButS2QZP8rs+5/XMDu0Gghr
 LuoA==
X-Gm-Message-State: AOAM532io5CVwaDm1Vzp7wAXhryQuh1c0JAthp/djTRGYrmsewSFb2Kf
 1/GNrADv97Dl7sV0iJ9V0Q==
X-Google-Smtp-Source: ABdhPJw9sjN4i3hv+EUnrvTU0N7EMYRicG7AaP+J+lzghrPkKVyl1hYVs6jl+PQuS8VRc9FqhQnCxg==
X-Received: by 2002:a5d:9c44:: with SMTP id 4mr30944438iof.15.1595384721474;
 Tue, 21 Jul 2020 19:25:21 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:20 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 01/19] PCI: versatile: Drop flag PCI_ENABLE_PROC_DOMAINS
Date: Tue, 21 Jul 2020 20:24:56 -0600
Message-Id: <20200722022514.1283916-2-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222522_414986_037C0031 
X-CRM114-Status: GOOD (  11.92  )
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

PCI_ENABLE_PROC_DOMAINS is only used on powerpc and doesn't do anything
for the Versatile host driver, so let's drop it. I'm not sure how or why
I had this to begin with. PCI_ENABLE_PROC_DOMAINS was never used on ARM.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-versatile.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index e90f0cc65c73..6e55cc59999b 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -153,7 +153,6 @@ static int versatile_pci_probe(struct platform_device *pdev)
 	 */
 	writel(0, versatile_cfg_base[0] + PCI_INTERRUPT_LINE);

-	pci_add_flags(PCI_ENABLE_PROC_DOMAINS);
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);

 	bridge->dev.parent = dev;
--
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
