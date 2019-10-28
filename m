Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8148ECA9EC2
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57524217D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xe/lyw8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57524217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ps5415j5+gl+7bq/dUqTo8S57oqUNClJZ/D7dKeuGbA=; b=Xe/lyw8xh7Dq8W
	m5chEY4VIwe2N8YsxXCMCTgA8hflJBQFbwaFHr/xyLtEBwFhmTgI1HCw3kMemdRFpF5BoExeVxBZD
	n00b+FkT0kUUAHtW/tvKsDzhRIPJa1sSwNR8/iLzK5K7C2vPisP2wmM73u/wg8kyc/Wso6cOTNA/F
	/u1AslNURcUCrdZglvEhJmkgyb0tW0VuRMNHxwj/zF47F54VKEFw5dHKsv+UiKlPYjRiiKyN+uvF7
	qISKdxRnb7Fza0rajhHtMIX254b5nD4LrS04g9Orm1bjtXAocoNrpNQ5qJugSsLiZHy/LjPFkqeNq
	67NYlqitgI58vMEfA6Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP7xL-0006wh-Nz; Mon, 28 Oct 2019 16:33:23 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7wy-0006eo-Ks; Mon, 28 Oct 2019 16:33:02 +0000
Received: by mail-oi1-f196.google.com with SMTP id m193so1929540oig.0;
 Mon, 28 Oct 2019 09:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S4uLFulX8TejWtV4ZtyYdW8FASYgTH1zgpN3OAUfA44=;
 b=R1Ta4Yi9jOWYwwkvDbiEYXMNbqG3y3PEUeikLEcMZSRM76WDsBcTtOUQ9RGRJspv3+
 gTBXuQBjj5+wqYwd0+NOzao/LgLgHpOjoTUL7CLXzzE6D2ynP+0rPc9Mp0af2X4G7a0R
 f6iyqFsEPeXHuod2m4gC21m0lWhJ01BUcoytY00XkNxuqmqcQ2A7Lyujr5ImPjYY0/Pn
 Y4RjTnumHNoMGqtiv1SbO38Pfna5afka4GBt3t02hOmkrMCT9IbmEc5Py1X3bW3rxq0m
 p1Yy+FWGlc/Darf50c6qp3FKn3yobqWbyD+/W3PsBF1DuBWCLPC8ocQ2xQiOIOQIpeXh
 nJrg==
X-Gm-Message-State: APjAAAUd2dIZOV/np6WNZZCjlTQ9GIgd7mZTh4cyZHshqRsliE9UAPrH
 lYblOKk41hr2Im3nsGCrNA==
X-Google-Smtp-Source: APXvYqyCyIe7/lBj2r50NZZKCcouW4Wf/nGhcgVbzzr1X9sEHMnBAu+xzJCM7OskSMNAePIBybe/OA==
X-Received: by 2002:aca:5015:: with SMTP id e21mr137789oib.174.1572280379222; 
 Mon, 28 Oct 2019 09:32:59 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:32:58 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 00/25] PCI host resource consolidation
Date: Mon, 28 Oct 2019 11:32:31 -0500
Message-Id: <20191028163256.8004-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093300_686644_C13942D6 
X-CRM114-Status: GOOD (  11.00  )
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This started with just dma-ranges parsing consolidation, but has expanded
to converting all host drivers to use pci_parse_request_of_pci_ranges()
rather than devm_of_pci_get_host_bridge_resources(). This series moves
the DT 'dma-ranges' parsing into common helpers utilizing a resource list.
There's no (intended) functional change in this series though I'm also
working on a separate series now in dt/next to improve the handling of
'dma-ranges' and dma masks.

The last patch may need to wait if there's any new users of
devm_of_pci_get_host_bridge_resources.

Only versatile has been tested (on QEMU). The rest is compiled only. A git
branch is here[1].

v3:
- Fix >80 char lines
- Rename resource_list_get_entry_of_type to resource_list_first_type

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-ranges-cleanup-v3


Rob Herring (25):
  resource: Add a resource_list_first_type helper
  PCI: Export pci_parse_request_of_pci_ranges()
  PCI: aardvark: Use pci_parse_request_of_pci_ranges()
  PCI: altera: Use pci_parse_request_of_pci_ranges()
  PCI: dwc: Use pci_parse_request_of_pci_ranges()
  PCI: faraday: Use pci_parse_request_of_pci_ranges()
  PCI: iproc: Use pci_parse_request_of_pci_ranges()
  PCI: mediatek: Use pci_parse_request_of_pci_ranges()
  PCI: mobiveil: Use pci_parse_request_of_pci_ranges()
  PCI: rockchip: Use pci_parse_request_of_pci_ranges()
  PCI: rockchip: Drop storing driver private outbound resource data
  PCI: v3-semi: Use pci_parse_request_of_pci_ranges()
  PCI: xgene: Use pci_parse_request_of_pci_ranges()
  PCI: xilinx: Use pci_parse_request_of_pci_ranges()
  PCI: xilinx-nwl: Use pci_parse_request_of_pci_ranges()
  PCI: versatile: Use pci_parse_request_of_pci_ranges()
  PCI: versatile: Remove usage of PHYS_OFFSET
  PCI: versatile: Enable COMPILE_TEST
  PCI: of: Add inbound resource parsing to helpers
  PCI: ftpci100: Use inbound resources for setup
  PCI: v3-semi: Use inbound resources for setup
  PCI: xgene: Use inbound resources for setup
  PCI: iproc: Use inbound resources for setup
  PCI: rcar: Use inbound resources for setup
  PCI: Make devm_of_pci_get_host_bridge_resources() static

 drivers/pci/controller/Kconfig                |  2 +-
 .../pci/controller/dwc/pcie-designware-host.c | 29 ++----
 drivers/pci/controller/pci-aardvark.c         | 60 +------------
 drivers/pci/controller/pci-ftpci100.c         | 79 +++++-----------
 drivers/pci/controller/pci-host-common.c      |  2 +-
 drivers/pci/controller/pci-v3-semi.c          | 74 +++++----------
 drivers/pci/controller/pci-versatile.c        | 71 ++++-----------
 drivers/pci/controller/pci-xgene.c            | 73 +++++----------
 drivers/pci/controller/pcie-altera.c          | 41 +--------
 drivers/pci/controller/pcie-cadence-host.c    |  2 +-
 drivers/pci/controller/pcie-iproc-platform.c  |  9 +-
 drivers/pci/controller/pcie-iproc.c           | 82 ++++-------------
 drivers/pci/controller/pcie-mediatek.c        | 43 +++------
 drivers/pci/controller/pcie-mobiveil.c        | 27 ++----
 drivers/pci/controller/pcie-rcar.c            | 48 ++++------
 drivers/pci/controller/pcie-rockchip-host.c   | 89 +++++++------------
 drivers/pci/controller/pcie-rockchip.h        |  5 --
 drivers/pci/controller/pcie-xilinx-nwl.c      | 21 ++---
 drivers/pci/controller/pcie-xilinx.c          | 18 +---
 drivers/pci/of.c                              | 51 +++++++++--
 drivers/pci/pci.h                             | 13 ---
 include/linux/pci.h                           |  9 +-
 include/linux/resource_ext.h                  | 12 +++
 23 files changed, 261 insertions(+), 599 deletions(-)

--
2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
