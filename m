Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13268C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9166233ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9166233ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EiLESg1TatAbaBdS9Cffs8H5AirBerK1tFsUmIQW1X4=; b=rIqBRULpdYDoVSFm41PdMtAEvu
	LNh/f6zHDPB8z/k4vtzLOg49dr+njjfgEfF/8GVYWxnWz+4Q4GVi7JDpKK4Sl/JNL9z8zKj66z50v
	ikp7T0h2JonP3jT+vy0FzaWturq9KewD4yy2pKi2zrUhZRMqtyCWXs0eqEE7iqLcr4UiR+8V9LTZC
	Cqjn+WUeqXqZkxtOy6S4rr9CKmJjeU/ssErSOodfYtc5IZjluZGlgt0XXM+ma6Q+mGwu0mzP3fbX1
	T1dK4Z2YuFttkEIxu6X8L4zE31SPoi0KSmFszzwhr6YPh9K7wi8oal1cdUbRg7fuRlq2dYWP53Vb0
	cMNFEN0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzeg6-0005JO-SV; Wed, 13 Jan 2021 11:51:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzeg0-0005GL-Ig; Wed, 13 Jan 2021 11:51:02 +0000
X-UUID: 8a0018e931c24488b45eb51bee359a3f-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8vWqaVsRERSWc/5seOPLH9VtoeOgkfE/1q/I3bGinJ0=; 
 b=OIjPb/DsF4y+IccpWI5FwsbJ6CtvLE6yf/Wj//SgVvojZ02RU7RBCmqzg+JQN4/jL18A7/KHI6RFv7UZhbRvK4PSqK4tULJYzZD2ePBFnIYX1uGHxEq7ar4bmttMnfZVSP9PrItunRUHcMquJqm9kCJTMAgNkkRm61sXoBQWB0s=;
X-UUID: 8a0018e931c24488b45eb51bee359a3f-20210113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1836470104; Wed, 13 Jan 2021 03:50:56 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 03:40:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 19:40:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 19:40:51 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v7,0/7] PCI: mediatek: Add new generation controller support
Date: Wed, 13 Jan 2021 19:39:54 +0800
Message-ID: <20210113114001.5804-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_065100_757309_51B0FC33 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, anson.chuang@mediatek.com,
 Jianjun Wang <jianjun.wang@mediatek.com>, sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These series patches add pcie-mediatek-gen3.c and dt-bindings file to
support new generation PCIe controller.

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

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 172 ++++
 MAINTAINERS                                   |   1 +
 drivers/pci/controller/Kconfig                |  13 +
 drivers/pci/controller/Makefile               |   1 +
 drivers/pci/controller/pcie-mediatek-gen3.c   | 965 ++++++++++++++++++
 drivers/pci/pci.c                             |   1 +
 6 files changed, 1153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
 create mode 100644 drivers/pci/controller/pcie-mediatek-gen3.c

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
