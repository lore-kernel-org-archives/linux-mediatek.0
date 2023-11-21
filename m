Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42986C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 00:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:To:From:Subject:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LbrVvLvyLjW1PVT2QUs7hez6cFIiMaOwkqYMRmollso=; b=37Uk38ix/zIm8pdE4bWH/W+d6D
	uFhm7nQQIaGqzGei0xiiR4/jvGaYUR3nzsUnJjZ/N6qJC9RqOdXu3tR4H0FSDLxinrhlVsGxJsnyq
	6VH45ilaghlAWXFkA71YY41K+GSWOF226ADAU7ULJVVmklm2FCXYjixfaleYak17htmmqzSpgpLW5
	Ho+M8PGPQhoJLDq1Df8p2wbU6+p2OQVNNnB/rHQSoX1SRnHzITW/OgqY44lxzwMGtyuFa+0QI7K3y
	/xevXbSnFcCf1heNN5fG1iPm35OyUzwwDDSv+DUYvDCcXlVBD5q2Mo46RhT9ZegmrzGmnSzdKwV4L
	L5hCoXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5EDK-00FCzy-0K;
	Tue, 21 Nov 2023 00:02:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5EDG-00FCz9-1B;
	Tue, 21 Nov 2023 00:01:59 +0000
Received: from skinsburskii. (c-67-170-100-148.hsd1.wa.comcast.net [67.170.100.148])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1FACF20B74C0;
	Mon, 20 Nov 2023 16:01:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1FACF20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1700524917;
	bh=LbrVvLvyLjW1PVT2QUs7hez6cFIiMaOwkqYMRmollso=;
	h=Subject:From:To:Date:From;
	b=O45wvQ3vvuq9iNaS0teRoPVL7nECUXTI70YwQLreF0959qLn7RV5tpYl49RKuREOP
	 5NY6F2gksTgl+aOZ1/EVXWivqWkJA3l1AB8AL+QYYO7hOS+2oSTwYD1lJj2NmKDw6m
	 pco2+BMxjqKBdPxU7p+o+cWUSRZNpYfxxxMHIlUk=
Subject: [PATCH v2] PCI: mediatek: Fix sparse warning caused to virt_to_phys()
 prototype change
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
 kw@linux.com, robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 20 Nov 2023 16:01:56 -0800
Message-ID: <170052491316.21557.13173111699965824301.stgit@skinsburskii.>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_160158_427273_2C8EAB76 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Explicitly cast __iomem pointer to const void* with __force to fix the
following warning:

  warning: incorrect type in argument 1 (different address spaces)
     expected void const volatile *address
     got void [noderef] __iomem *

Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311161120.BgyxTBMQ-lkp@intel.com/
---
 drivers/pci/controller/pcie-mediatek.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 66a8f73296fc..27f0f79810a1 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -397,7 +397,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	phys_addr_t addr;
 
 	/* MT2712/MT7622 only support 32-bit MSI addresses */
-	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	addr = virt_to_phys((__force const void *)port->base + PCIE_MSI_VECTOR);
 	msg->address_hi = 0;
 	msg->address_lo = lower_32_bits(addr);
 
@@ -520,7 +520,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
 	u32 val;
 	phys_addr_t msg_addr;
 
-	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	msg_addr = virt_to_phys((__force const void *)port->base + PCIE_MSI_VECTOR);
 	val = lower_32_bits(msg_addr);
 	writel(val, port->base + PCIE_IMSI_ADDR);
 



