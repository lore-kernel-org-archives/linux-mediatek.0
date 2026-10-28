Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D43606A322
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XyxDadyj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxwNyqSE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BqcLJCt/Zv6v/NHtTbSxJ0dXgZEQb3K5NLkXSY+SP5Q=; b=XyxDadyjmT6q8I
	VI6T+N/4QrJGTF+NHETgoKnrTtjVoPHVgKgDDXigIRglteSJ6KDxxhxsF0yHoIsWisVnZSwjt6iIn
	Rpitwy0YaFzkCvrAfWHOmcymweQ1VSOolgGc0/C3OBk5nyNidarL4zXWFgIdaO4gWmqu45ivXXOQm
	zqsAbBLhPwxHNIOa7exwSpoxve4H3Sm3tyOHcKnbu91y2BmaI1aOsYnV2bGnxPFc1frLNt7lw2sUp
	PqouKHPV7avlGqULSJGGpNqGqNFocOEXJkjuYQOG8j9hswni30dizqimBltPBk5A1bG+g5lMvQTDL
	ER8baoNEqWuj2RDD+RYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1x9-00000006s2M-0S7L;
	Wed, 28 Oct 2026 11:36:23 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1x5-00000006s0u-3j0Z
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 11:36:22 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1821743eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187379; x=1793792179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqcLJCt/Zv6v/NHtTbSxJ0dXgZEQb3K5NLkXSY+SP5Q=;
        b=NxwNyqSEl7ZvPg708FnK6m6qWkzl4a0ACZyjbFHCwXd9zLoqq4GvWVwN9Vg9Xs2JUT
         SfWw8HMEAcEhDwHQRmKOEhY3kYicKhkgd1a7Ur+w1pkOMY9JuWerrGs9sN5npvezaD86
         LfvZJcTepfkaX2W+8/eId69Xm3pvcfjdjt9WSN3DpushzqEWc/qGgoHzs3IFy9oNL0AB
         5dp0XZAglGGQguA5RoEeNOqF2sYMVtktBQ6BfoRR3nNh4kucb25fB7VWdipvw8mImz2y
         7C75jOVafLzk/r3QkNBDASFt/SjywqNW4s3QA9IUEruRcYPxeJ4J1c9T+Vese4fQFVaP
         5/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187379; x=1793792179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqcLJCt/Zv6v/NHtTbSxJ0dXgZEQb3K5NLkXSY+SP5Q=;
        b=FXuFsZzlmQQ06IlsMj58uFk5rIKqo4HZWS1gX9MLTkK5jiadtdLC5GFP6A6N06rFbi
         llYxAhoH+S0MOZVDIo6wAu6pJpSi1pS435NUhj7Ykf/axZi5vlwB7VmEt9ji+oEkb6nm
         gRapT6s4R3AolqmrwTakCC7ylEmzzvQ+ujeIPgtfaGJw4DbPyMAthpNquEDnL2uzpB2p
         nk6gmC2jdZx28BbsDMKmYFBfkI/jc0EEUOe4b/7cv/Sk2bdTip1C2gdd11FnJrazkOXV
         Nap/zE7xE4gyJfaFo9hPh58pFqF8XMMUl7fppB1X7FQYzgDiupmFjdn9VqxjdHCZeZCC
         4pZA==
X-Forwarded-Encrypted: i=1; AKwUvBwvKCvbX9ovEVMcACBeg3hN8OW8oSoqIhWd4uS/cAG1hyVIWZy0oYzczTH6K93dMWYpLo3AvjZKgOF1J/9s8A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJZ1w21ec9sEQyhvY6hCCOPqn+AgdkNRko4rau4byG4mS9eMvfB
	+st8Gli5MEtwHoWo2n0VmUqIXfzIpe9ZdzBpx3M2FPNam1BclIiPENxwnijz1w==
X-Gm-Gg: AYBFou3+gw1aTRuPllKC+fqQ4eVibIYcFw3p8Pk+0M2re2z7ZCmnivhGQlx0FO4i96R
	AGcKPvekRgblyfvXTGI6R44VU18WVIchb4rPvOuTb9jwFMxwi2oDBU9Rzn8vzV1PWdSNMa48GD9
	8Wt1C6CcqiU8tSV70BmnFQcTdwNZ6L6MSSqTAUwZaTRrM3O+YePFkrd7ydJrXts1YtDcBk7kwte
	532KET48a28PLTQwLK5cqeJG8yMdH9uB69kStkdnjSnBSJekcZuYR9389TMi1dIiTk6u2La0P4l
	Xr9uVNfxUHcuajeYu/s+FwI94iUH3y6Wo/0h/9l1yDQpXQyKgAajgIMERDelV8CGgsM8EcniC+I
	aNi4H8drs4Ci+7A3UWYG0/LQgmo4SwAyNKaMu2lCGyiThB8Vyov8o3LS3+c5EopodJoRrNiKMMx
	8LyNdqWAK+B6vaGOjx3SA/jaqb8fvn2ZtoryBR5E0VdQ4onxTTWOTmLke5MvgY8l6+YgD3q3GxI
	XxSXtJ9IGKqaBEj8HpiCyXbnDoC1DBkTOjVmD8hIUsW/dHCVdwRkM9zNM5gbKI9RKr92dsLTiuC
	E7+5/yLXvx1Pkm1t6PT6fN3NQkA+Y9OO6RcPQfSMx9xTlE4H+z0=
X-Received: by 2002:a05:693c:401a:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a20477909mr3084505eec.28.1793187378627;
        Wed, 28 Oct 2026 04:36:18 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238d9a21sm6623522eec.4.2026.10.28.04.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:36:17 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	ryder.lee@mediatek.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH v6] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 28 Oct 2026 11:34:53 +0000
Message-ID: <20261028113453.2599-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
References: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_043620_210535_1912CF28 
X-CRM114-Status: GOOD (  15.65  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

resource_size() returns a resource_size_t, which can be 64-bit on
64-bit architectures or 32-bit systems with LPAE/PAE enabled.
Passing this directly to fls(), which accepts an unsigned int,
implicitly truncates the upper bits.

Furthermore, AHB2PCIE_SIZE() uses a 5-bit mask GENMASK(4, 0). If
the size order exceeds the range representable by this field,
higher bits are discarded by the mask. This can leave the hardware
translation window smaller than the OS resource, causing bus
errors when accessing BARs in the unmapped upper region.

Fix this by using fls64(size) to calculate the size order without
truncating the resource size, and return -EINVAL if the size order
exceeds the supported range.

Changelog:

- v6: Move oversized resource validation before hardware
  initialization to avoid leaving interrupts unmasked on
  the error path.
- v5: Use fls64(size) instead of fls64(size - 1) and remove the
  redundant zero-size check.
- v4: Fix struct device pointer access (pcie->dev) for dev_err().
  Verified build and passed Sashiko review checks.
  [Subject: PCI: mediatek: Fix integer truncation and handle
  oversized resources]
- v3: Replace clamping logic with strict size validation
  (size_order > 31 returns -EINVAL), add a zero-size check,
  and update size calculation to fls64(size - 1).
  [Subject: PCI: mediatek: Fix integer truncation and handle
  oversized resources]
- v2: Add size clamping for size_order > 31 to prevent overflowing
  the 5-bit AHB2PCIE_SIZE() macro mask.
  [Subject: PCI: mediatek: Fix integer truncation in fls()
  and clamp size]
- v1: Initial submission using fls64() to handle 64-bit resource
  sizes and prevent integer truncation.
  [Subject: PCI: mediatek: Fix integer truncation in fls()
  for resource size]

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 3a3e91cd0c21..cc04a7b862f0 100644
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
@@ -693,6 +696,13 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	if (!mem)
 		return -EINVAL;
 
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	/* MT7622 platforms need to enable LTSSM and ASPM from PCIe subsys */
 	if (pcie->base) {
 		val = readl(pcie->base + PCIE_SYS_CFG_V2);
@@ -754,7 +764,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -775,6 +785,8 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	struct resource_entry *entry;
 	u32 val, link_mask;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -782,6 +794,13 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	if (!mem)
 		return -EINVAL;
 
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	if (!pcie->cfg) {
 		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
 		return -EINVAL;
@@ -830,7 +849,7 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0


