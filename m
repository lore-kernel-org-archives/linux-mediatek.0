Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80230C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:08:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCEED6140F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCEED6140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Amz9edL9c8fD4tWQA6dCjjGlrrQdOl6LdDccr0HGgYc=; b=GRCH4c+bQnmaKcfvc1XxwTEw3
	PZoRHwCpX9NnBPsmDSK4zK3o6vUzLR6ymq1a6yccOA7v7/Y0hkUQLfmwKqSTwii+SFtKZLBhawa1f
	JGw4Ge5iKvIoUQPZGTkM0NR3VnfEDCpHMnFsjz52ZKwAQUFeXUjbPLW6Ujd8UB36QPoNef1UaeyuH
	JdjcDP2vCOx6b4PvstK4+Lt8CJRAdQXT57FSaOIYXe1ruIb5pFxxEaOFqlW6oRR/FBLUfuIZrf12j
	xcb/t1ErlrK0Zq70iDOFSc53nTu6WZiGQ0ubJePVTOp7PGTzKKL3hKexDMV/h7w0GU7+b3ntxVPR+
	omVDpm4FQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhRvR-007MPI-EY; Fri, 14 May 2021 07:07:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhRvO-007MOZ-IM; Fri, 14 May 2021 07:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=4dHFcci0l8BtbdbggnHFP823Wd6LiEnwxGKZ8+gK0Rg=; b=zfiKInQxYUBw1sDPKBT7VrFh3P
 McFXTwgxVBYARiEppadz7Fim6rCNwzdRAYZDB94KtTAIKFD2a0ukbnYf46IaTP87P42yPQBGjtzPg
 XMNreRMsH393uM+uOMC0CP58TlSK1aONmngkFB2EytnQhEr/iVgo6lXfA1pG+okWDEbVZUWI5W4Je
 Xxo0eEIYUCchMiY7svVkJmfIp3+3MnIi1NrzjAJ/G1R/9noDpHk2qIYLcz2wxyTFQ0pYtYr+H4N/A
 ELFwrt22ndQ5gYsVNgP8oIFyPFYX+ynFyJU1iFJMAyeUYENN8WIv52/r1YNdfStCcAth1QIGkAwBt
 7YMXgO/Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhRvL-00Blaf-Tn; Fri, 14 May 2021 07:07:53 +0000
X-UUID: 9c4e6ed00c07438fb2e04fce80e461c0-20210514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4dHFcci0l8BtbdbggnHFP823Wd6LiEnwxGKZ8+gK0Rg=; 
 b=Haaj6fjL7qcvlYBKznkcrXDZ8Lrm5SPWf9aRPQ2/YTvX1JfmzmhY1S90jUegLbCXAaU36dEULLvfR/VSTzTEP9VraTUVCic7RjoeuvpY8sv5/vwIG0W610RElMQKQ6GTXHRbKCRG9JngKVkP4Nmtx5dMPo9erHffqZDk03FIVh4=;
X-UUID: 9c4e6ed00c07438fb2e04fce80e461c0-20210514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 443070332; Fri, 14 May 2021 00:07:45 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 23:59:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 May 2021 14:59:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 May 2021 14:59:51 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski <kw@linux.com>,
 <Ryan-JH.Yu@mediatek.com>
Subject: [PATCH 2/2] PCI: mediatek-gen3: Add support for disable dvfsrc
 voltage request
Date: Fri, 14 May 2021 14:59:27 +0800
Message-ID: <20210514065927.20774-3-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210514065927.20774-1-jianjun.wang@mediatek.com>
References: <20210514065927.20774-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_000751_991316_F1CC4FE7 
X-CRM114-Status: GOOD (  16.27  )
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

PCIe Gen3 PHY layer cannot work properly when the requested voltage
is lower than a specific level(e.g. 0.55V, it's depends on
the chip manufacturing process).

When the dvfsrc feature is implemented, the requested voltage
may be reduced to a lower level in suspend mode, hence that
the MAC layer will assert a HW signal to request the dvfsrc
to raise voltage to normal mode, and it will wait the voltage
ready signal which is derived from dvfsrc to determine whether
the LTSSM can start normally.

When the dvfsrc feature is not implemented, the MAC layer still
assert the voltage request to dvfsrc when exit suspend mode,
but will not receive the voltage ready signal, in this case,
the LTSSM cannot start normally, and the PCIe link will be failed.

Add support for disable dvfsrc voltage request. If the property of
"disable-dvfsrc-vlt-req" is presented in device node, we assume that
the requested voltage is always higher enough to keep the PCIe Gen3
PHY active, and the voltage request to dvfsrc should be disabled.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 20165e4a75b2..d1864303217e 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -68,6 +68,9 @@
 #define PCIE_MSI_SET_ENABLE_REG		0x190
 #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
 
+#define PCIE_MISC_CTRL_REG		0x348
+#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
+
 #define PCIE_MSI_SET_BASE_REG		0xc00
 #define PCIE_MSI_SET_OFFSET		0x10
 #define PCIE_MSI_SET_STATUS_OFFSET	0x04
@@ -297,6 +300,35 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 	val &= ~PCIE_INTX_ENABLE;
 	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
 
+	/*
+	 * PCIe Gen3 PHY layer can not work properly when the requested voltage
+	 * is lower than a specific level(e.g. 0.55V, it's depends on
+	 * the chip manufacturing process).
+	 *
+	 * When the dvfsrc feature is implemented, the requested voltage
+	 * may be reduced to a lower level in suspend mode, hence that
+	 * the MAC layer will assert a HW signal to request the dvfsrc
+	 * to raise voltage to normal mode, and it will wait the voltage
+	 * ready signal which is derived from dvfsrc to determine whether
+	 * the LTSSM can start normally.
+	 *
+	 * When the dvfsrc feature is not implemented, the MAC layer still
+	 * assert the voltage request to dvfsrc when exit suspend mode,
+	 * but will not receive the voltage ready signal, in this case,
+	 * the LTSSM cannot start normally, and the PCIe link will be failed.
+	 *
+	 * If the property of "disable-dvfsrc-vlt-req" is presented
+	 * in device node, we assume that the requested voltage is always
+	 * higher enough to keep the PCIe Gen3 PHY active, and the voltage
+	 * request to dvfsrc should be disabled.
+	 */
+	val = readl_relaxed(port->base + PCIE_MISC_CTRL_REG);
+	val &= ~PCIE_DISABLE_DVFSRC_VLT_REQ;
+	if (of_property_read_bool(port->dev->of_node, "disable-dvfsrc-vlt-req"))
+		val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
+
+	writel(val, port->base + PCIE_MISC_CTRL_REG);
+
 	/* Assert all reset signals */
 	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
 	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
