Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05239CA5FB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tm4KhT1i9nkviFOM/DKWhqvTQ9rSQZ5LZ/7ePdMtknI=; b=Wpq2mUaqTfYzttZJ0UC1NwR7d9
	X8UmY2NIPnLqSfiR6pjV9UbVJ2UEzS7H4ktyowIAO1BsaigftZul4JQtbQkNL3hqsg0htDQNfWF57
	Ys92Ayx4ZTyems4O9XXpnyrX3W4MYDnDj8ZZf5DI17eZM7YnB1ePNPyhZWY9cleBwpVPgWqEoSUiJ
	vfJ/TmdfLjteu0g5Ta3S8k11mKK+PVY1Hqc2/ocIe4ooX7PF0sf4O2MQ6VMpetjxfiWlOlTq4llC9
	XbdHVMaH6Noe58wyihNMOi/jKeGfg5D/kHLflJuqwy3HzNxk6hvhBgoPjQ2lbABF2xR90tYp/2uHM
	MOy5+jiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs5k-00000005oq0-3dul;
	Wed, 30 Sep 2026 11:03:16 +0000
Received: from mail-qk2-x2b.google.com ([2607:f8b0:4864:34::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs5h-00000005op1-3zgj
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 11:03:15 +0000
Received: by mail-qk2-x2b.google.com with SMTP id d75a77b69052e-5332bdd8296so69629621cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766192; x=1791370992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tm4KhT1i9nkviFOM/DKWhqvTQ9rSQZ5LZ/7ePdMtknI=;
        b=lm0ZeOD/N6TKlCwf0yygiq2qzwajACuO1y/8fK2RynKRHOVTLPkiPtlW+SndR8LR7X
         xps1ERaYD1XvLA4ihA7Mqj0NrZD4jFBiCcDxmc4NlfcXQtX9opXsfRtGq/juQPqhZ5+u
         mnQjZpgZg3H1xGi9WzUXjEyubyc8nlRI2HgrAqZg/gdkgSeQ/1cpQl8JiTU111ICaJWD
         F5Ctw6l5pb2JTEe0HVN1i9XrBk2gxMM6H/FSujJYwkZ6if5psqz0Xanzzm5C7mqrBxR6
         9kOSK3kI5lYiOy2m4grhFJwTXVcVNHO6P2hbDUmkbYIxktkhc0EAHMPcNf4nYghVoKAb
         ORRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766192; x=1791370992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm4KhT1i9nkviFOM/DKWhqvTQ9rSQZ5LZ/7ePdMtknI=;
        b=YtUsvbm5rY7h03xW/W3VFFmaqwhV/CfpFdp+phvbbLN8m0rx6yE6bSEZH/lwexRcRF
         3BVEjwWp1FbS0wi+OZLLprfofw2GSJX7rxrQ9OR80E0GHvEj3KGS7PARzzecZxyrAL0X
         2Be2Ly4FM7l3HtElZC8mDEfv93CM4+2NtiOd+a2GnPg/DLbW5C/9qxl6Ch/PCdQ/odLJ
         tO+bpVd+4XZvJZQ9RJkrskK3afJntJZNkE/tRocsLpBvdx0aY1oYxurwSRvfUrF7Lfr4
         sGHyuJpL5aT+Wr+lMQlYjV7ifFngmWp2PhLtZhBrr7zZUlNKNf7DhEdqX0nJnn8PJK6l
         HnJA==
X-Forwarded-Encrypted: i=1; AKwUvBz3aRDGRYOkx7BkalQQwwbt0Hgfeh8viMIIEGbag4u37ETwk4tAMcl9zpZDdv7cFwNfv6aoyPQqF6CmxSM5wA==@lists.infradead.org
X-Gm-Message-State: AFuF++nabz8Z3G7hogFnDBqYFCqQNoB48VEQEZ5MuV7jBPLRc9wGQXab
	X5x7YEEfPe1KEjtMB31KHvQKs/bkVwhjFXQbChQaErhnDpc4cT3hSncVkZIErjis
X-Gm-Gg: AYBFou28mKf+aYFAnq2WaYuPnHLJLvcV72929yeRC0cHE6YyrWR1bxGx38qes1dRruX
	CLy66XppIxSvKGQsoejTtiQ8R0jPTKJ924JZq7iuqUCunk1ZftvEYcITvh/CdvybEXBQSNxPuUW
	qe5IgJaVlSjCmYvYeNpvoNXwY3aVPnbTPShdZcPUGU2P9ePG4BapAmHB1MFtlnL0eopgAWoIngs
	LRXSx4buuoqLHv8MBw4NflXl9GxgeF+PG7ofvAKaAcG3UZwaYF84TppM+VwOAyxl0c9T7Rt0jkR
	FLO/RoVPKc7yHkd2Di2uhBaEevOMU62LZcVouZ+k97Npa7HwDFLzJdHalyKkW2WFzN8JqAgljN4
	VxmvozX06FC+7Bs8hzc+HWKzdBtF0UADkx/GjnV/eMCZkX4xYmAahKuhjvDWbnuPzv4yOR52SFF
	2mxeQ47Re5a67tIHUIcKv/bbnB87xcuAwB3u2rl6UhLGQHVcdvLEoyWaFpFpgoCvNCZtUd+TuZz
	r3K3S4Jt5nRkxy+LYkR
X-Received: by 2002:a05:7022:91f:b0:144:eaa7:2765 with SMTP id a92af1059eb24-14d3204e73amr1522897c88.18.1790765717951;
        Wed, 30 Sep 2026 03:55:17 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d083fea61sm4295477c88.3.2026.09.30.03.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:55:17 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C3=85=E2=80=9Eski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v2] PCI: mediatek: Fix integer truncation in fls() and clamp size
Date: Wed, 30 Sep 2026 10:54:35 +0000
Message-ID: <20260930105435.3660-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_040314_599294_452CB686 
X-CRM114-Status: GOOD (  12.63  )
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

resource_size() returns a resource_size_t, which is 64-bit on 64-bit
architectures or 32-bit systems with LPAE/PAE enabled. Passing this
directly to fls(), which accepts an unsigned int, implicitly
truncates the upper 32 bits.

Furthermore, AHB2PCIE_SIZE() uses a 5-bit mask GENMASK(4, 0). If a
resource size of 4 GiB or larger is passed, fls64() returns 33 or
greater, which overflows the 5-bit mask and wraps around (e.g. 33 & 31
= 1).

Fix this by using fls64() for 64-bit resource sizes and clamping the
result to a maximum of 31 to fit the 5-bit register field.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a60d1ae076f8..9576fe532b92 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -686,6 +687,8 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	const struct mtk_pcie_soc *soc = port->pcie->soc;
 	u32 val;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -753,8 +756,13 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31)
+		size_order = 31;
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -775,6 +783,8 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	struct resource_entry *entry;
 	u32 val, link_mask;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -829,8 +839,13 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31)
+		size_order = 31;
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0


