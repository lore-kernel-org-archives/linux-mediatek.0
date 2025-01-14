Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA042E77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R8zbHHjDHwUKprLOJl/lBp+WlB/iIXKfc0w2QQvt1CM=; b=rap/xjwDNJGZzXqHkUdlUWDHLf
	vi+k27QMomfKz0EDmBpkdjZuKdMWQnohEKQUcGJlZBcja3J4ws00DMJsIELku9u7JAfVd8UALpDzK
	MZ3AtLXLGjiwnuUyLuOBT733Vgj6oYmBKE8QbNZO87u1qdHnDZsHj+3PJB8p5TS+kihmx7YLQIo/k
	yX/zvKUL1Rre1Y04Az+poEq02rByNw+ztS5Cg1Hdk5CryHMwLETcnl1T5+ZsQZaClDRAadUZwqPKf
	UnlTYrtCyXNpW4v7je+WeY8tWU41aozQ/CuyzGnT7BWz+iGdlFYts9hvmN4BESz6fEh11fBZhP6P8
	hZDGmArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnbG-00000009gRG-2ZlW;
	Tue, 14 Jan 2025 20:33:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmYq-00000009XFo-35Vj
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 19:26:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43637977fa4so6341495e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2025 11:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882807; x=1737487607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R8zbHHjDHwUKprLOJl/lBp+WlB/iIXKfc0w2QQvt1CM=;
        b=u9dGA1kv4DmULqg4u+GlRcFYSMuse54M/u/92KZfwJty4nMXz266EzMHwjyV83m6Qb
         khvNvyBOpToINfJW8OWTME8K701wbX/Vk1meUopDKeUuS52qg1n/ScweekFMAaDX6WY2
         tXQMJv28PbXmwFCW8KpSvTSkeqP8AoICR/8lbj5H6JUk40yPa2kIWImxbWwbW9HolYpl
         edYuQXwCWG6sgbyyoiBFLUsB1NjJr+wwpg56eynmWaauNb9wfYgbd1L3yCg2cdZDpbnt
         TjCYId4JU9UKiHZG7hU0iFqjNDqKIJpuoviQaGuqC6LH3V0LOkxNcGjOFuKXtc636VhO
         hYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882807; x=1737487607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8zbHHjDHwUKprLOJl/lBp+WlB/iIXKfc0w2QQvt1CM=;
        b=TkoXSY/2NVR/H0aR7TsiTtxgpzyE2EJ0Regw+97AmRplRvSNiawD1SlImZJujUWTqH
         Ys0pyuvrfb3zJmVsNw/nIPR3QvEV355vSYRZHKi33ayniijtilodNSjS5cmSchZAssnF
         mhB1GtUvcpthRkbD4FR3X+v1ogczSjDvEfupI4oQW7oixoLRUUz6bBJc2g9H+Gsqk9ha
         klYyady81ifdYv72nNAUYNHs9t6xbfR3NtmaA2CchvnSCvv3RM61qKXhZYpX7nLjD301
         1p0yPULlFTOjhL9LYrLCNYSR6sq5CElp1tK8xcQmBIEfrX+euOg4gW2btf+f0TUpZdxc
         p7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVkCgsnAcOTBncqKAT7USlCnkGA9BjUANiuHmOxNYEkoczMjBy6rz1ED46miqQHSqzD/hNOR/9Z0ccb4lkloQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/HC9oJVY0NatMMngLjUMiLHopHn0kRSWps5zBdZA9JtamPv2D
	Q/ifjA95xQV6ygi80HFyc+fPOLSqprVN9i3Dy8mZpUcTACELmL2L/Eq8Te5yEYM=
X-Gm-Gg: ASbGnctuml7RqdmJ3SfBF713peScro6BH1Tn5N1URjzbS9G+JOd9SBhvqyDFwXo0aa1
	tQMkJ+a6Bclo651En0fcF2qo2PulGxF3HhO8I6mYE8iRhhAxEaGgtM2N1VLkULfq3gt3hNDbUzO
	EfINu5euB/EMYZRSHVEAhSsQkPDc0hKGjqjoCZtqJMs4Oy3cxgQVXiUjIFduTz1oAVTyLvvNMQC
	IE5CG0icFvose6/+Rcx+aM0sJDESvXOwSIPDHtnP9ej/VxTo2/3i85w/S9KVWl7EhmBq4U=
X-Google-Smtp-Source: AGHT+IEnD9Q/PlL16atUZuQr3zo7osv/8GJqa0PNvMI0cYgqaJuTOZ+Meucj00enp/jZftDOrIqvJQ==
X-Received: by 2002:a05:600c:3c8f:b0:434:f7f0:189c with SMTP id 5b1f17b1804b1-436e27007e9mr105673595e9.7.1736882807013;
        Tue, 14 Jan 2025 11:26:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8116sm15552826f8f.79.2025.01.14.11.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:26:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] iommu: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:26:42 +0100
Message-ID: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_112648_776400_49E77F76 
X-CRM114-Status: GOOD (  11.63  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ++-
 drivers/iommu/mtk_iommu.c                   | 9 +++++----
 drivers/iommu/mtk_iommu_v1.c                | 3 ++-
 drivers/iommu/rockchip-iommu.c              | 3 ++-
 5 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0e4cbb2c64d7..358072b4e293 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <kunit/visibility.h>
 #include <uapi/linux/iommufd.h>
 
@@ -4321,7 +4322,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	 */
 	if (!!(reg & IDR0_COHACC) != coherent)
 		dev_warn(smmu->dev, "IDR0.COHACC overridden by FW configuration (%s)\n",
-			 coherent ? "true" : "false");
+			 str_true_false(coherent));
 
 	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
 	case IDR0_STALL_MODEL_FORCE:
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 79afc92e1d8b..de205a34ffc6 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -34,6 +34,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/ratelimit.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <linux/fsl/mc.h>
 
@@ -2106,7 +2107,7 @@ static void arm_smmu_rmr_install_bypass_smr(struct arm_smmu_device *smmu)
 	}
 
 	dev_notice(smmu->dev, "\tpreserved %d boot mapping%s\n", cnt,
-		   cnt == 1 ? "" : "s");
+		   str_plural(cnt));
 	iort_put_rmr_sids(dev_fwnode(smmu->dev), &rmr_list);
 }
 
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index ab60901f8f92..034b0e670384 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -29,6 +29,7 @@
 #include <linux/spinlock.h>
 #include <linux/soc/mediatek/infracfg.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
+#include <linux/string_choices.h>
 #include <asm/barrier.h>
 #include <soc/mediatek/smi.h>
 
@@ -510,7 +511,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 			bank->parent_dev,
 			"fault type=0x%x iova=0x%llx pa=0x%llx master=0x%x(larb=%d port=%d) layer=%d %s\n",
 			int_state, fault_iova, fault_pa, regval, fault_larb, fault_port,
-			layer, write ? "write" : "read");
+			layer, str_write_read(write));
 	}
 
 	/* Interrupt clear */
@@ -602,7 +603,7 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 			larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
 		dev_dbg(dev, "%s iommu for larb(%s) port 0x%lx region %d rgn-bank %d.\n",
-			enable ? "enable" : "disable", dev_name(larb_mmu->dev),
+			str_enable_disable(enable), dev_name(larb_mmu->dev),
 			portid_msk, regionid, upper_32_bits(region->iova_base));
 
 		if (enable)
@@ -630,8 +631,8 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 		}
 		if (ret)
 			dev_err(dev, "%s iommu(%s) inframaster 0x%lx fail(%d).\n",
-				enable ? "enable" : "disable",
-				dev_name(data->dev), portid_msk, ret);
+				str_enable_disable(enable), dev_name(data->dev),
+				portid_msk, ret);
 	}
 	return ret;
 }
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index b6de1ca00cef..a565b9e40f4a 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <asm/barrier.h>
 #include <asm/dma-iommu.h>
 #include <dt-bindings/memory/mtk-memory-port.h>
@@ -243,7 +244,7 @@ static void mtk_iommu_v1_config(struct mtk_iommu_v1_data *data,
 		larb_mmu = &data->larb_imu[larbid];
 
 		dev_dbg(dev, "%s iommu port: %d\n",
-			enable ? "enable" : "disable", portid);
+			str_enable_disable(enable), portid);
 
 		if (enable)
 			larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4b369419b32c..323cc665c357 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #include "iommu-pages.h"
 
@@ -611,7 +612,7 @@ static irqreturn_t rk_iommu_irq(int irq, void *dev_id)
 
 			dev_err(iommu->dev, "Page fault at %pad of type %s\n",
 				&iova,
-				(flags == IOMMU_FAULT_WRITE) ? "write" : "read");
+				str_write_read(flags == IOMMU_FAULT_WRITE));
 
 			log_iova(iommu, i, iova);
 
-- 
2.43.0


