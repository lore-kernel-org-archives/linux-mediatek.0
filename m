Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C4EC77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYwysHzjyxeU89yIXfyyaxHSc4b5rh92IDLtel9ASgo=; b=lJcCHBj76P73zasCKeQCr8OdDb
	lGTSXwTKI2tydEDWXwqYcMMmDoUZvZcxwRSXuLD+s8R3KFdMmabuUeM1uokedItByzN7jrpS9fG0v
	8l5MRcI1Pl5m6GsW1Cg1zibuoEHf6hM7qiC49dEQu5ZB0CTgUnRWWPX+M/eIrJvhiAETCPWXJ7vIb
	dE/h2+LDea5OPY4f2FZT3qAgid3ytb7CkFU0nE0RC1mC/KI1MlgVe6RZiiL0Zm3GOja3Xb4UcNgN4
	mAFY/uM0qwqeJQcchtzlTgKC8D3rBXe3IOfYX65BgcIry2F+sRTBAe6jc+VNaxzLaiQcnJBHcOioc
	d0bPYPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmswI-005WYu-2Z;
	Thu, 13 Apr 2023 09:08:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmswF-005WVp-07;
	Thu, 13 Apr 2023 09:08:20 +0000
X-UUID: b3ca1abed9da11ed8687db9d93187ff1-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rYwysHzjyxeU89yIXfyyaxHSc4b5rh92IDLtel9ASgo=;
	b=LAkbKbrnLSV3Br6/csuQZfRHG/7B2Fe5fC/nKIcbZtMzxQDLbkzHi1gqS3jBScQEx0oqnzz5NTTtErWXBSsePLWwFsfjjdZFfu6xuYcHfok0dq7NCDspY58sdwtn4MdwrRzpadgXJdvEqZiknMrzbuLW9WEDOV2FFszIGgFqW5c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:5b4dfde6-ca88-4a15-8cd8-074e22b85f22,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:d5cb34a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b3ca1abed9da11ed8687db9d93187ff1-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1749276479; Thu, 13 Apr 2023 02:08:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 17:08:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 17:08:03 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yingshiuan Pan
	<yingshiuan.pan@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jades Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>
Subject: [PATCH v1 4/6] soc: mediatek: virt: geniezone: Introduce irqchip for virtual interrupt injection
Date: Thu, 13 Apr 2023 17:07:33 +0800
Message-ID: <20230413090735.4182-5-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230413090735.4182-1-yi-de.wu@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020819_079734_577319FD 
X-CRM114-Status: GOOD (  28.97  )
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

From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>

Enable GenieZone to handle virtual interrupt injection request.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 drivers/soc/mediatek/virt/geniezone/Makefile  |  2 +-
 drivers/soc/mediatek/virt/geniezone/gzvm.h    |  5 +
 .../mediatek/virt/geniezone/gzvm_irqchip.c    | 94 +++++++++++++++++++
 .../soc/mediatek/virt/geniezone/gzvm_vcpu.c   |  6 ++
 drivers/soc/mediatek/virt/geniezone/gzvm_vm.c | 77 +++++++++++++++
 include/uapi/linux/gzvm_common.h              | 32 +++++++
 6 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm_irqchip.c

diff --git a/drivers/soc/mediatek/virt/geniezone/Makefile b/drivers/soc/mediatek/virt/geniezone/Makefile
index e1dfbb9c568d..d2302a3a93fc 100644
--- a/drivers/soc/mediatek/virt/geniezone/Makefile
+++ b/drivers/soc/mediatek/virt/geniezone/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-gzvm-y := gzvm_main.o gzvm_vm.o gzvm_vcpu.o
+gzvm-y := gzvm_main.o gzvm_vm.o gzvm_vcpu.o gzvm_irqchip.o
 
 obj-$(CONFIG_MTK_GZVM) += gzvm.o
diff --git a/drivers/soc/mediatek/virt/geniezone/gzvm.h b/drivers/soc/mediatek/virt/geniezone/gzvm.h
index 43f215d4b0da..89cea5441a2d 100644
--- a/drivers/soc/mediatek/virt/geniezone/gzvm.h
+++ b/drivers/soc/mediatek/virt/geniezone/gzvm.h
@@ -98,6 +98,11 @@ int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1, unsigned long a2,
 #define MT_HVC_GZVM_PROBE		GZVM_HCALL_ID(GZVM_FUNC_PROBE)
 #define MT_HVC_GZVM_ENABLE_CAP		GZVM_HCALL_ID(GZVM_FUNC_ENABLE_CAP)
 
+void gzvm_sync_vgic_state(struct gzvm_vcpu *vcpu);
+int gzvm_vgic_inject_irq(struct gzvm *gzvm, unsigned int vcpu_idx, u32 irq_type,
+			 u32 irq, bool level);
+int gzvm_vgic_inject_spi(struct gzvm *gzvm, unsigned int vcpu_idx,
+			 u32 spi_irq, bool level);
 int gz_err_to_errno(unsigned long err);
 
 #endif /* __GZVM_H__ */
diff --git a/drivers/soc/mediatek/virt/geniezone/gzvm_irqchip.c b/drivers/soc/mediatek/virt/geniezone/gzvm_irqchip.c
new file mode 100644
index 000000000000..7aa5868a221c
--- /dev/null
+++ b/drivers/soc/mediatek/virt/geniezone/gzvm_irqchip.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#include <linux/irqchip/arm-gic-v3.h>
+#include <kvm/arm_vgic.h>
+
+#include "gzvm.h"
+
+/**
+ * @brief check all LRs synced from gz hypervisor
+ * Traverse all LRs, see if any EOIed vint, notify_acked_irq if any.
+ * GZ does not fold/unfold everytime KVM_RUN, so we have to traverse all saved
+ * LRs. It will not takes much more time comparing to fold/unfold everytime
+ * GZVM_RUN, because there are only few LRs.
+ */
+void gzvm_sync_vgic_state(struct gzvm_vcpu *vcpu)
+{
+	int i;
+
+	for (i = 0; i < vcpu->hwstate->nr_lrs; i++) {
+		uint64_t lr_val = vcpu->hwstate->lr[i];
+		/* 0 means unused */
+		if (!lr_val)
+			continue;
+	}
+}
+
+/**
+ * @brief Check the irq number and irq_type are matched
+ */
+static bool is_irq_valid(u32 irq, u32 irq_type)
+{
+	switch (irq_type) {
+	case GZVM_IRQ_TYPE_CPU:	/*  0 ~ 15: SGI */
+		if (likely(irq <= GZVM_IRQ_CPU_FIQ))
+			return true;
+		break;
+	case GZVM_IRQ_TYPE_PPI:	/* 16 ~ 31: PPI */
+		if (likely(irq >= VGIC_NR_SGIS && irq < VGIC_NR_PRIVATE_IRQS))
+			return true;
+		break;
+	case GZVM_IRQ_TYPE_SPI:	/* 32 ~ : SPT */
+		if (likely(irq >= VGIC_NR_PRIVATE_IRQS))
+			return true;
+		break;
+	default:
+		return false;
+	}
+	return false;
+}
+
+/**
+ * @brief Inject virtual interrupt to a VM
+ *
+ * @param gzvm
+ * @param vcpu_idx: vcpu index, only valid if PPI
+ * @param irq: irq number
+ * @param irq_type
+ * @param level, true: 1; false: 0
+ */
+int gzvm_vgic_inject_irq(struct gzvm *gzvm, unsigned int vcpu_idx, u32 irq_type,
+			 u32 irq, bool level)
+{
+	unsigned long a1 = assemble_vm_vcpu_tuple(gzvm->vm_id, vcpu_idx);
+	struct arm_smccc_res res;
+
+	if (!unlikely(is_irq_valid(irq, irq_type)))
+		return -EINVAL;
+
+	gzvm_hypcall_wrapper(MT_HVC_GZVM_IRQ_LINE, a1, irq, level,
+			     0, 0, 0, 0, &res);
+	if (res.a0) {
+		pr_err("Failed to set IRQ level (%d) to irq#%u on vcpu %d with ret=%d\n",
+		       level, irq, vcpu_idx, (int)res.a0);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+/**
+ * @brief Inject virtual spi interrupt
+ *
+ * @param spi_irq This is spi interrupt number (starts from 0 instead of 32)
+ * @return 0 succeed, other negative values are error
+ */
+int gzvm_vgic_inject_spi(struct gzvm *gzvm, unsigned int vcpu_idx,
+			 u32 spi_irq, bool level)
+{
+	return gzvm_vgic_inject_irq(gzvm, 0, GZVM_IRQ_TYPE_SPI,
+				    spi_irq + VGIC_NR_PRIVATE_IRQS, level);
+}
diff --git a/drivers/soc/mediatek/virt/geniezone/gzvm_vcpu.c b/drivers/soc/mediatek/virt/geniezone/gzvm_vcpu.c
index 726db866dfcf..5f2e24d13c41 100644
--- a/drivers/soc/mediatek/virt/geniezone/gzvm_vcpu.c
+++ b/drivers/soc/mediatek/virt/geniezone/gzvm_vcpu.c
@@ -67,6 +67,11 @@ static long gzvm_vcpu_update_one_reg(struct gzvm_vcpu *vcpu, void * __user argp,
 	return ret;
 }
 
+static void gzvm_sync_hwstate(struct gzvm_vcpu *vcpu)
+{
+	gzvm_sync_vgic_state(vcpu);
+}
+
 /**
  * @brief Handle vcpu run ioctl, entry point to guest and exit point from guest
  *
@@ -115,6 +120,7 @@ static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void * __user argp)
 			need_userspace = true;
 			goto out;
 		}
+		gzvm_sync_hwstate(vcpu);
 	} while (!need_userspace);
 
 out:
diff --git a/drivers/soc/mediatek/virt/geniezone/gzvm_vm.c b/drivers/soc/mediatek/virt/geniezone/gzvm_vm.c
index df4ccdc3b7f0..7895f40b23eb 100644
--- a/drivers/soc/mediatek/virt/geniezone/gzvm_vm.c
+++ b/drivers/soc/mediatek/virt/geniezone/gzvm_vm.c
@@ -193,6 +193,69 @@ static int gzvm_vm_ioctl_set_memory_region(struct gzvm *gzvm,
 	return register_memslot_addr_range(gzvm, memslot);
 }
 
+static int gzvm_vm_ioctl_irq_line(struct gzvm *gzvm,
+				  struct gzvm_irq_level *irq_level)
+{
+	u32 irq = irq_level->irq;
+	unsigned int irq_type, vcpu_idx, irq_num;
+	bool level = irq_level->level;
+
+	irq_type = (irq >> GZVM_IRQ_TYPE_SHIFT) & GZVM_IRQ_TYPE_MASK;
+	vcpu_idx = (irq >> GZVM_IRQ_VCPU_SHIFT) & GZVM_IRQ_VCPU_MASK;
+	vcpu_idx += ((irq >> GZVM_IRQ_VCPU2_SHIFT) & GZVM_IRQ_VCPU2_MASK) *
+		(GZVM_IRQ_VCPU_MASK + 1);
+	irq_num = (irq >> GZVM_IRQ_NUM_SHIFT) & GZVM_IRQ_NUM_MASK;
+
+	return gzvm_vgic_inject_irq(gzvm, vcpu_idx, irq_num, irq_type, level);
+}
+
+static int gzvm_vm_ioctl_create_device(struct gzvm *gzvm, void __user *argp)
+{
+	struct gzvm_create_device *gzvm_dev;
+	void *dev_data = NULL;
+	struct arm_smccc_res res = {0};
+	int ret;
+
+	gzvm_dev = (struct gzvm_create_device *)alloc_pages_exact(PAGE_SIZE,
+								  GFP_KERNEL);
+	if (!gzvm_dev)
+		return -ENOMEM;
+	if (copy_from_user(gzvm_dev, argp, sizeof(*gzvm_dev))) {
+		ret = -EFAULT;
+		goto err_free_dev;
+	}
+
+	if (gzvm_dev->attr_addr != 0 && gzvm_dev->attr_size != 0) {
+		size_t attr_size = gzvm_dev->attr_size;
+		void __user *attr_addr = (void __user *)gzvm_dev->attr_addr;
+
+		/* Size of device specific data should not be over a page. */
+		if (attr_size > PAGE_SIZE)
+			return -EINVAL;
+
+		dev_data = alloc_pages_exact(attr_size, GFP_KERNEL);
+		if (!dev_data) {
+			ret = -ENOMEM;
+			goto err_free_dev;
+		}
+
+		if (copy_from_user(dev_data, attr_addr, attr_size)) {
+			ret = -EFAULT;
+			goto err_free_dev_data;
+		}
+		gzvm_dev->attr_addr = virt_to_phys(dev_data);
+	}
+
+	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_CREATE_DEVICE, gzvm->vm_id,
+				   virt_to_phys(gzvm_dev), 0, 0, 0, 0, 0, &res);
+err_free_dev_data:
+	if (dev_data)
+		free_pages_exact(dev_data, 0);
+err_free_dev:
+	free_pages_exact(gzvm_dev, 0);
+	return ret;
+}
+
 static int gzvm_vm_enable_cap_hyp(struct gzvm *gzvm,
 				  struct gzvm_enable_cap *cap,
 				  struct arm_smccc_res *res)
@@ -300,6 +363,20 @@ static long gzvm_vm_ioctl(struct file *filp, unsigned int ioctl,
 		ret = gzvm_vm_ioctl_set_memory_region(gzvm, &userspace_mem);
 		break;
 	}
+	case GZVM_IRQ_LINE: {
+		struct gzvm_irq_level irq_event;
+
+		ret = -EFAULT;
+		if (copy_from_user(&irq_event, argp, sizeof(irq_event)))
+			goto out;
+
+		ret = gzvm_vm_ioctl_irq_line(gzvm, &irq_event);
+		break;
+	}
+	case GZVM_CREATE_DEVICE: {
+		ret = gzvm_vm_ioctl_create_device(gzvm, argp);
+		break;
+	}
 	case GZVM_ENABLE_CAP: {
 		struct gzvm_enable_cap cap;
 
diff --git a/include/uapi/linux/gzvm_common.h b/include/uapi/linux/gzvm_common.h
index aa97438bab8c..6808cfe59450 100644
--- a/include/uapi/linux/gzvm_common.h
+++ b/include/uapi/linux/gzvm_common.h
@@ -183,6 +183,38 @@ struct gzvm_userspace_memory_region {
 #define GZVM_IRQ_CPU_IRQ		0
 #define GZVM_IRQ_CPU_FIQ		1
 
+struct gzvm_irq_level {
+	union {
+		__u32 irq;
+		__s32 status;
+	};
+	__u32 level;
+};
+#define GZVM_IRQ_LINE              _IOW(GZVM_IOC_MAGIC,  0x61, \
+					struct gzvm_irq_level)
+
+enum gzvm_device_type {
+	GZVM_DEV_TYPE_ARM_VGIC_V3_DIST,
+	GZVM_DEV_TYPE_ARM_VGIC_V3_REDIST,
+	GZVM_DEV_TYPE_MAX,
+};
+
+struct gzvm_create_device {
+	__u32 dev_type;			/* device type */
+	__u32 id;			/* out: device id */
+	__u64 flags;			/* device specific flags */
+	__u64 dev_addr;			/* device ipa address in VM's view */
+	__u64 dev_reg_size;		/* device register range size */
+	/*
+	 * If user -> kernel, this is user virtual address of device specific
+	 * attributes (if needed). If kernel->hypervisor, this is ipa.
+	 */
+	__u64 attr_addr;
+	__u64 attr_size;		/* size of device specific attributes */
+};
+#define GZVM_CREATE_DEVICE	   _IOWR(GZVM_IOC_MAGIC,  0xe0, \
+					struct gzvm_create_device)
+
 /*
  * ioctls for vcpu fds
  */
-- 
2.18.0


