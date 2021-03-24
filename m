Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621BDC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 03:06:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF806619D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 03:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF806619D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hQSYFYT5t6zYIvOjo3jReUe8xQbmZ1Zrsy1CWmoNE4E=; b=ap0yaF7adGuC8yqkc4/rbtjX0e
	H6YkucLOH5a1bYIHqXmYV1d4XZGPYYn/Ifp8XGaww8prH57EYXuVNbAavjQO9MwCrSqe+6lPLguzS
	tAeX78DBMo6mey2osQ7mhHngmJpAqdxmdOohEia4iLg6c68m82Xk4soNfZoZMsWHeUflBfncfh8xI
	isHSP+IwWvOzJ+kZwxH0qVo0MJLjhCpVTBp8F/JnICIu4MP7bM/mINbcNuUaWpEshNVYF64U4tYIs
	ATGIAijM4X49sj0W/cu32H3rpK7bJLbLGXdxBWDxtnYI3jdRCfTwX/ZQ3EXPnHxpmQB1lbH2tIR3f
	HWT0cKwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOtqO-00GBtB-Cz; Wed, 24 Mar 2021 03:06:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOtqG-00GBqC-VT; Wed, 24 Mar 2021 03:06:02 +0000
X-UUID: ac781c3ccc804420ba1e415156cb6e99-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Sh/F60L55ZdXX/WlqYlBoNOfLGFSk+jjo/ihbK5DmNg=; 
 b=pwIX4ALGVoN6If0vvLo3hd+duqBKKF9c7oaoCj7v9ntXrYlqGPmSnEGy9kVe3j9td8qNwxjjsFjQ4st5sCuR18RZo4FauSvqetBvo7vh63ERDHsqZU3CHGQ1GPNsfuR0JCmt1IvVa8R2ZId8ZXOMf57Ko7npCa7U2MIJUE3OKkg=;
X-UUID: ac781c3ccc804420ba1e415156cb6e99-20210323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 44575615; Tue, 23 Mar 2021 19:05:46 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 20:05:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 11:05:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Mar 2021 11:05:41 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ryder Lee <ryder.lee@mediatek.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [v9,0/7] PCI: mediatek: Add new generation controller support
Date: Wed, 24 Mar 2021 11:05:03 +0800
Message-ID: <20210324030510.29177-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_030557_580439_77CC5C90 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These series patches add pcie-mediatek-gen3.c and dt-bindings file to
support new generation PCIe controller.

Changes in v9:
1. Use mtk_pcie_parse_port() to get the hw resources;
2. Remove unnecessary logs;
3. Add local IRQ enable status save/restore instead of
   the enable/disable callbacks for suspend/resume;
4. Fix typos.

Changes in v8:
1. Add irq_clock to protect IRQ register access;
2. Mask all INTx interrupt when startup port;
3. Remove activate/deactivate callbacks from bottom_domain_ops;
4. Add unmask/mask callbacks in mtk_msi_bottom_irq_chip;
5. Add property information for reg-names.

Changes in v7:
1. Split the driver patch to core PCIe, INTx, MSI and PM patches;
2. Reshape MSI init and handle flow, use msi_bottom_domain to cover all sets;
3. Replace readl/writel with their relaxed version;
4. Add MSI description in binding document;
5. Add pl_250m clock in binding document.

Changes in v6:
1. Export pci_pio_to_address() to support compiling as kernel module;
2. Replace usleep_range(100 * 1000, 120 * 1000) with msleep(100);
3. Replace dev_notice with dev_err;
4. Fix MSI get hwirq flow;
5. Fix warning for possible recursive locking in mtk_pcie_set_affinity.

Changes in v5:
1. Remove unused macros
2. Modify the config read/write callbacks, set the config byte field
   in TLP header and use pci_generic_config_read32/write32
   to access the config space
3. Fix the settings of translation window, both MEM and IO regions
   works properly
4. Fix typos

Changes in v4:
1. Fix PCIe power up/down flow
2. Use "mac" and "phy" for reset names
3. Add clock names
4. Fix the variables type

Changes in v3:
1. Remove standard property in binding document
2. Return error number when get_optional* API throws an error
3. Use the bulk clk APIs

Changes in v2:
1. Fix the typo of dt-bindings patch
2. Remove the unnecessary properties in binding document
3. dispos the irq mappings of msi top domain when irq teardown

Jianjun Wang (7):
  dt-bindings: PCI: mediatek-gen3: Add YAML schema
  PCI: Export pci_pio_to_address() for module use
  PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
  PCI: mediatek-gen3: Add INTx support
  PCI: mediatek-gen3: Add MSI support
  PCI: mediatek-gen3: Add system PM support
  MAINTAINERS: Add Jianjun Wang as MediaTek PCI co-maintainer

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  181 +++
 MAINTAINERS                                   |    1 +
 drivers/pci/controller/Kconfig                |   13 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-mediatek-gen3.c   | 1025 +++++++++++++++++
 drivers/pci/pci.c                             |    1 +
 6 files changed, 1222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
 create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
