Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FA606A31A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bk1AJzzh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6D9gQGF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JVEW9pJr+HD2a1AZwH9+kAj2JVI8SOiPv9NNvo5WXjY=; b=bk1AJzzhNm/wYA
	Qny+msD81Ka6x8H7BRQQSslxF7BMLhAj/BIz7ilccZHLj2RoXPmRXo2PkcYLF5iwoBJiFNfFzQQL6
	28mNj9KSZtEjG5JhOfpJhTgsPrnwYXcV8ygcWv60PF3D7JVKZflxwoOIFhVob/yDzuzImPCb3t80K
	6JJM/f38aHYchzbRRTOlKth77399ZNNhcAd0MRWO2Ej3Do+3Mi3eRuPDtRPABveTctFCdoLBQqsRA
	3D9BX5lvEpyh2ur/N6qmdIxlTqJ9g8MXirJvrL61Q/jtlMf0TOUjMdRAJ8qSpSK963JRXB0UtswVd
	tk0InD6K6cOsB/3K8Dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1H4-00000006ntI-0wvT;
	Wed, 28 Oct 2026 10:52:54 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Gy-00000006nqh-1cnO
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 10:52:52 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-14fc585291cso657503c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184767; x=1793789567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVEW9pJr+HD2a1AZwH9+kAj2JVI8SOiPv9NNvo5WXjY=;
        b=t6D9gQGFRKOGK0U14OV0pw+8SWllcfAICm/UD/giKgChfChjvAodowYsoRvlNNg+M1
         OVS+z7K2qDjWcRPUqOMOikpfpVr72WSpzEzOrz+pFBpEsQt4KecvsH9BowO3pNf4cWCm
         hswj8i7kIepFp2staAjyHSIlbo9bK1PrnphJyov9g05ANRnZTDa7Pz5gd9ItOzF1bWFN
         LHGLrOCKjRhsdHtqiQRSLi8ax7bKweGX7FEgNNAbP4COa6KZLPQP+LimVBDNugJZkMMY
         b35ojikgwb+gaIS2bzAEbRHgG4/6lD3MER23idfqzYY+6nAKx6BEIzV7EcwTxSiL04hP
         Qwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184767; x=1793789567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVEW9pJr+HD2a1AZwH9+kAj2JVI8SOiPv9NNvo5WXjY=;
        b=EnKXihEURy+0i+xEfjzK2dVK1Qks9TB5Nsv5kH0C1tBsBIjv0gk8Xd6LT3nm/pAzgb
         3qRVI6PQIYZKWu1eXePufrR88WFAMDxuobAjhhsD3eNGM7LHSveP3fiPuPHQ/Lr7NaFv
         3d0krReZA3dxYdEBqptSeZjfOVrJbkrRl5ec2fYNqCHlxPJYunKKytv1e2ryIwW9ifqB
         zJ/1Vluz6Ds0sBIK9tqFl5/kcHnsTgw7aUFzuk5nU4hCOCF0ZJX7mWyuZjkfxlhIpXa+
         ZWRdJjWYb7zYoz2w52B5fJ4rP09dhAXWfLv0JNWXlLKU2OtVaItpdwEXmj5jsA9eyDNX
         vSog==
X-Forwarded-Encrypted: i=1; AKwUvBxZypcHDmDsV1MZ+pkns9TdI7n3CHbTI8eK96S7hE31KEy2uXnyrPGGoorWep67zXmoWI6hxvd+WAaNRb4umA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL84bQWxocmLh+X6kIiYir6laKm90HzJ+Ni/R8ba/zy/mqbuwuO
	ebUgMzgrzSEJ3QZr0IuEKCJO2579ppTxE4Ersz1+j3hpHcjIMbBJaIKy
X-Gm-Gg: AYBFou0k698X7+Q+N5QC0NpULk7wfBNo62Oj42M8tvpQlT9fW+dUo62rmNFhGeaUU0e
	czEcOvkYiGvGDjKwJKLAX/0n//7bfN1rx2Z6vgZalBQ3KhI9A20AdOEORDl1l2B9aNydBsGr02j
	zgSZ1a6UaPl6V2qNzUIWOzxQx+2OlUTeNtP4mKhyx4PSWVEGb/dB1g7NJk0u5BX3GLswnidjps5
	LtoU4LCoxw5xOlONd2O9x3E2UFnfIGkmUMQ19QrtzMKx+5/u4K/GGII2rM6FdOkU9BOl418yuPu
	pW/ACDEpJE82oA+0KSRhMMU5TLyyJN0SVSeHYB6nGC/3qYDvirFKrISg0f3tkMIjaSWz2N993Si
	Bozor0LtmXf2YPo0iuHFNfsD4o+ABYqNI1tlLoCS1okrnYDMjB5W4EtI/9LgXp6u6DubV35luHs
	L3fJONcQmwY4Bv22UWQ2RUt2DLYo/xM+gb17Kezp5ceu8BKNiSBexoLytQKPgn2AlFyBdXnHunv
	QuEDJPPRezSHYu5beykKSSmX2KEKM7t+u+oH8GtD434ApLtKwdlx+y22gzWVLmktIQXqhbqHLs/
	OuAZca+x9fcITP59eo/dyjSdnaMd0iMrZkGDa0Q72thRg8632N0=
X-Received: by 2002:a05:7022:1003:b0:19c:c396:37aa with SMTP id a92af1059eb24-1a6ce1136b3mr3280960c88.22.1793184767262;
        Wed, 28 Oct 2026 03:52:47 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm7083152c88.21.2026.10.28.03.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:52:46 -0700 (PDT)
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
Subject: [PATCH v5] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 28 Oct 2026 10:52:11 +0000
Message-ID: <20261028105211.2773-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
References: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_035251_187951_66DDB15A 
X-CRM114-Status: GOOD (  14.70  )
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
index 3a3e91cd0c21..6821452a82b6 100644
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
@@ -753,8 +756,15 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
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
@@ -829,8 +841,15 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0


