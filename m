Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DF3C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Cc:To:From:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kBNKNTOrMmmpmm92m7K9B/lNmOkmW5YxSpr4SlRmJSU=; b=FLv3KD6LTBPvoyYY/EqEaLUhRN
	+sD+iK6QoVRwQF6HqEsxcIF2x0g/M3aw70tmGdcnn3b6wys3bTdw+vSi32eXowf2BF5cvl5X+bI4a
	+f4WokLCA5G02SqxZodBRIcn+qFKp9yyJ5n0y4xp83+u6q2L+FS2UzxRcfSUkIYLcRw38w2LB0i6H
	KR6/9TBdSKGvooprLhjEi3QhIvxzOewuJJeI75xWYtBfSNaBnKBNQqrmb+O6pdJdjh4OUL7uB/h0t
	UQn/GUYCE26K6Kw+IkA686ekAO7yMuKBfM0aJrDdZjFrdQknYH/Y7UOni8PI7AI+pUsc1L2SJft82
	plE9Cjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Dsi-00F4iX-2m;
	Mon, 20 Nov 2023 23:40:44 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Dsc-00F4hV-0K;
	Mon, 20 Nov 2023 23:40:42 +0000
Received: from skinsburskii. (c-67-170-100-148.hsd1.wa.comcast.net [67.170.100.148])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4C5EF20B74C0;
	Mon, 20 Nov 2023 15:40:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4C5EF20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1700523634;
	bh=kBNKNTOrMmmpmm92m7K9B/lNmOkmW5YxSpr4SlRmJSU=;
	h=Subject:From:To:Cc:Date:From;
	b=iRk6psZ1bwoNZfgS9az/eot+ankMIak28Fo+cDfzEmWQSHUUEzYWtV/XNvoId2DVW
	 eEHmDnIkXfNAat1XGSmHQNdb7EuQesbEESVmDF84wT/pKSJN2yKhxjQXQD/s7Igo7+
	 B+cAlTFhs5XLZsZRBVLvq6ueJnm3ywkbiOQ0aVAM=
Subject: [PATCH] PCI: mediatek: Fix sparse warning caused to virt_to_phys()
 prototype change
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
 kw@linux.com, robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: skinsburskii@gmail.com
Date: Mon, 20 Nov 2023 15:40:33 -0800
Message-ID: <170052362584.21270.8345708191142620624.stgit@skinsburskii.>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_154038_270559_12853C52 
X-CRM114-Status: UNSURE (   9.66  )
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
 



