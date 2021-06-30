Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69128C11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ACFD617ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ACFD617ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9j/DWh2xfPjjLH0qpyNyBUcX4/S/CWVNI9ygbkAYWPE=; b=dOZsJyavsp1cjo
	hQOeD7fOHbcx6EkOp/mwvlHefmxSyzx3ghZSlIZ8KlTR6X4dd4GWmCHW/nly7CcdrF2Ms/tbZHiaJ
	uCRCzSO/EToTLyrAOr0/7CpKD9L2Gushp/rxMD04uvzV/af7S7AKQjnPBhQ74160V/T37g3eGlBRa
	hZyzYgeQxzs60qTCqx8nrNwCZz6bfZhHEZ2JczFfGKNvm3uH1D5gYP5rfii5AV24Umc0L+wPPfjwC
	iJS3OR1Zy9fieba4eIqLhhu8H71TAFRj9/a6iwHNw4mYjuUKN3C9AQx53CVC04twcIntVfzbK2/Rz
	nnfYqoSmk8Tp50foCnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQW2-00CeH1-Az; Wed, 30 Jun 2021 03:03:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQIf-00CYcr-4N; Wed, 30 Jun 2021 02:50:06 +0000
X-UUID: 2e38682e2ac14cea9cb9e6cd5c9f1115-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=t80dEKXD7tMPHhQ2z3Et1lygDzRV5cyAiW/RvNbWPj4=; 
 b=N2nfnvAU4VUCuHLJh84z54vEhkhvyyKq5EPRVSt/+bYwofIlgEwGegLAX8319x4De57frQ++t3l7xFOdEGSarQ3ydQnSH1xxEYMLcRPXitOq58HM9JQNyvmxC0X8FYGAuGZ6iQWtF4KMvFzXCvjburBEyKn7CtgRHbUYUqn9S2Q=;
X-UUID: 2e38682e2ac14cea9cb9e6cd5c9f1115-20210629
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1911826828; Tue, 29 Jun 2021 19:49:58 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:49:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:49:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:49:53 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Jianjun Wang
 <jianjun.wang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <ot_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski <kw@linux.com>,
 <Ryan-JH.Yu@mediatek.com>
Subject: [PATCH v3 2/2] PCI: mediatek-gen3: Add support for disable dvfsrc
 voltage request
Date: Wed, 30 Jun 2021 10:49:34 +0800
Message-ID: <20210630024934.18903-3-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630024934.18903-1-jianjun.wang@mediatek.com>
References: <20210630024934.18903-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_195005_288675_ADBCD7D2 
X-CRM114-Status: GOOD (  17.30  )
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
ready signal from dvfsrc to decide if the LTSSM can start normally.

When the dvfsrc feature is not implemented, the MAC layer still
assert the voltage request to dvfsrc when exit suspend mode,
but will not receive the voltage ready signal, in this case,
the LTSSM cannot start normally, and the PCIe link will be failed.

Add support for disable dvfsrc voltage request, if the property of
"disable-dvfsrc-vlt-req" is presented in device node, we assume that
the requested voltage is always higher enough to keep the PCIe Gen3
PHY active, and the voltage request to dvfsrc should be disabled.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 31 +++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3c5b97716d40..028014707588 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -79,6 +79,9 @@
 #define PCIE_ICMD_PM_REG		0x198
 #define PCIE_TURN_OFF_LINK		BIT(4)
 
+#define PCIE_MISC_CTRL_REG		0x348
+#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
+
 #define PCIE_TRANS_TABLE_BASE_REG	0x800
 #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
 #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
@@ -297,6 +300,34 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 	val &= ~PCIE_INTX_ENABLE;
 	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
 
+	/*
+	 * PCIe Gen3 PHY layer can not work properly when the requested voltage
+	 * is lower than a specific level(e.g. 0.55V, it's depends on
+	 * the chip manufacturing process).
+	 *
+	 * When the dvfsrc feature is implemented, the requested voltage
+	 * might be reduced to a lower level in suspend mode, hence that
+	 * the MAC layer will assert a HW signal to request the dvfsrc
+	 * to raise voltage to normal mode, and it will wait the voltage
+	 * ready signal from dvfsrc to start the LTSSM normally.
+	 *
+	 * When the dvfsrc feature is not implemented, the MAC layer still
+	 * assert the voltage request to dvfsrc when exit suspend mode,
+	 * but will not get the voltage ready signal, in this case, the LTSSM
+	 * cannot start normally, and the PCIe link will be failed.
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
+	writel_relaxed(val, port->base + PCIE_MISC_CTRL_REG);
+
 	/* Assert all reset signals */
 	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
 	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
