Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518B4C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WBQmbYGyL4gc1PzIv3jQVJPcy5ps1p1+Cq36d7RA3A=; b=eAuOtIhXAm+C7vBNcHVAUyjxpp
	Nk2h5PnE55UbwZNI8ftwqn8L6KNsuey+iXkyWAPm3iCWgw8rWLVFEFIRJft5lb3Gd1/txqZKcIIPt
	Z7cAJ7IAHNpPiT1DrytWQ+M8PGAnhfIF3YofhHBnQMG6Oo7RQFlQrve1GD0teyrHPBZ9eqeQ2pxoM
	TsySJc/iw0XcKiJBAj6ZAZb2/t2pfRJvurj0l9i2wt93Y9uKGeIaecedIXp73r5To1Qfs8Nc9PsYW
	cYfQDjw3PeQqZasnam3jtdhpK4/bACZYZj64ldRg724/U5WC8EmJ3SQ7VUEhxlr1D+ep+otNc0v0x
	1IazwxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEtb-00000003SMq-01St;
	Wed, 29 May 2024 08:42:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEtU-00000003SIu-497V;
	Wed, 29 May 2024 08:42:50 +0000
X-UUID: 6a1dfadc1d9711ef82c84f6416ccf2f3-20240529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4WBQmbYGyL4gc1PzIv3jQVJPcy5ps1p1+Cq36d7RA3A=;
	b=G/N2MAHV+PJ4xazertSQA24xdnzYuLzHvbyuy3+ZK1ijpOmOokm8mmsjv/CVa8eFrMHBRpiB/x3mams+azOhTjXo9WFXImkfir0CQS5I3N+TEJzIGiRe16u8DTI0FMM8TIL4lxXQlYHdOiclCTs6/1JxhEfMmSOQVWCXY4pn35I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:f4bb9a9e-7add-46e2-a0d8-c873ce188c2a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:393d96e,CLOUDID:7c77f243-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6a1dfadc1d9711ef82c84f6416ccf2f3-20240529
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 525850436; Wed, 29 May 2024 01:42:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 16:42:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 16:42:40 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v11 04/21] virt: geniezone: Add GenieZone hypervisor driver
Date: Wed, 29 May 2024 16:42:22 +0800
Message-ID: <20240529084239.11478-5-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
References: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_014249_085205_CFFCF127 
X-CRM114-Status: GOOD (  29.57  )
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

From: Yi-De Wu <yi-de.wu@mediatek.com>

From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>

GenieZone hypervisor(gzvm) is a type-1 hypervisor that supports various
virtual machine types and provides security features such as TEE-like
scenarios and secure boot. It can create guest VMs for security use
cases and has virtualization capabilities for both platform and
interrupt. Although the hypervisor can be booted independently, it
requires the assistance of GenieZone hypervisor kernel driver(gzvm-ko)
to leverage the ability of Linux kernel for vCPU scheduling, memory
management, inter-VM communication and virtio backend support.

Add the basic hypervisor driver. Subsequent patches will add more
supported features to this driver.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 MAINTAINERS                             |  3 +
 arch/arm64/Kbuild                       |  1 +
 arch/arm64/geniezone/Makefile           |  9 +++
 arch/arm64/geniezone/gzvm_arch_common.h | 44 +++++++++++++
 arch/arm64/geniezone/vm.c               | 63 ++++++++++++++++++
 drivers/virt/Kconfig                    |  2 +
 drivers/virt/geniezone/Kconfig          | 16 +++++
 drivers/virt/geniezone/Makefile         |  9 +++
 drivers/virt/geniezone/gzvm_main.c      | 88 +++++++++++++++++++++++++
 include/linux/soc/mediatek/gzvm_drv.h   | 25 +++++++
 10 files changed, 260 insertions(+)
 create mode 100644 arch/arm64/geniezone/Makefile
 create mode 100644 arch/arm64/geniezone/gzvm_arch_common.h
 create mode 100644 arch/arm64/geniezone/vm.c
 create mode 100644 drivers/virt/geniezone/Kconfig
 create mode 100644 drivers/virt/geniezone/Makefile
 create mode 100644 drivers/virt/geniezone/gzvm_main.c
 create mode 100644 include/linux/soc/mediatek/gzvm_drv.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f42bd174caad..db6ba2f1e3ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9276,6 +9276,9 @@ M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
 M:	Liju Chen <liju-clr.chen@mediatek.com>
 F:	Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml
 F:	Documentation/virt/geniezone/
+F:	arch/arm64/geniezone/
+F:	drivers/virt/geniezone/
+F:	include/linux/soc/mediatek/gzvm_drv.h
 
 GENWQE (IBM Generic Workqueue Card)
 M:	Frank Haverkamp <haver@linux.ibm.com>
diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..0c3cca572919 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -4,6 +4,7 @@ obj-$(CONFIG_KVM)	+= kvm/
 obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
 obj-$(CONFIG_CRYPTO)	+= crypto/
+obj-$(CONFIG_MTK_GZVM)	+= geniezone/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/arm64/geniezone/Makefile b/arch/arm64/geniezone/Makefile
new file mode 100644
index 000000000000..2957898cdd05
--- /dev/null
+++ b/arch/arm64/geniezone/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Main Makefile for gzvm, this one includes drivers/virt/geniezone/Makefile
+#
+include $(srctree)/drivers/virt/geniezone/Makefile
+
+gzvm-y += vm.o
+
+obj-$(CONFIG_MTK_GZVM) += gzvm.o
diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
new file mode 100644
index 000000000000..660c7cf3fc18
--- /dev/null
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#ifndef __GZVM_ARCH_COMMON_H__
+#define __GZVM_ARCH_COMMON_H__
+
+#include <linux/arm-smccc.h>
+
+enum {
+	GZVM_FUNC_PROBE = 12,
+	NR_GZVM_FUNC,
+};
+
+#define SMC_ENTITY_MTK			59
+#define GZVM_FUNCID_START		(0x1000)
+#define GZVM_HCALL_ID(func)						\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,	\
+			   SMC_ENTITY_MTK, (GZVM_FUNCID_START + (func)))
+
+#define MT_HVC_GZVM_PROBE		GZVM_HCALL_ID(GZVM_FUNC_PROBE)
+
+/**
+ * gzvm_hypcall_wrapper() - the wrapper for hvc calls
+ * @a0: argument passed in registers 0
+ * @a1: argument passed in registers 1
+ * @a2: argument passed in registers 2
+ * @a3: argument passed in registers 3
+ * @a4: argument passed in registers 4
+ * @a5: argument passed in registers 5
+ * @a6: argument passed in registers 6
+ * @a7: argument passed in registers 7
+ * @res: result values from registers 0 to 3
+ *
+ * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
+ */
+int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
+			 unsigned long a2, unsigned long a3,
+			 unsigned long a4, unsigned long a5,
+			 unsigned long a6, unsigned long a7,
+			 struct arm_smccc_res *res);
+
+#endif /* __GZVM_ARCH_COMMON_H__ */
diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
new file mode 100644
index 000000000000..dce933f0c122
--- /dev/null
+++ b/arch/arm64/geniezone/vm.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/err.h>
+#include <linux/uaccess.h>
+
+#include <linux/soc/mediatek/gzvm_drv.h>
+#include "gzvm_arch_common.h"
+
+/**
+ * gzvm_hypcall_wrapper() - the wrapper for hvc calls
+ * @a0: arguments passed in registers 0
+ * @a1: arguments passed in registers 1
+ * @a2: arguments passed in registers 2
+ * @a3: arguments passed in registers 3
+ * @a4: arguments passed in registers 4
+ * @a5: arguments passed in registers 5
+ * @a6: arguments passed in registers 6
+ * @a7: arguments passed in registers 7
+ * @res: result values from registers 0 to 3
+ *
+ * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
+ */
+int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
+			 unsigned long a2, unsigned long a3,
+			 unsigned long a4, unsigned long a5,
+			 unsigned long a6, unsigned long a7,
+			 struct arm_smccc_res *res)
+{
+	struct arm_smccc_1_2_regs res_1_2;
+	struct arm_smccc_1_2_regs args = {
+		.a0 = a0,
+		.a1 = a1,
+		.a2 = a2,
+		.a3 = a3,
+		.a4 = a4,
+		.a5 = a5,
+		.a6 = a6,
+		.a7 = a7,
+	};
+	arm_smccc_1_2_hvc(&args, &res_1_2);
+	res->a0 = res_1_2.a0;
+	res->a1 = res_1_2.a1;
+	res->a2 = res_1_2.a2;
+	res->a3 = res_1_2.a3;
+
+	return gzvm_err_to_errno(res->a0);
+}
+
+int gzvm_arch_probe(void)
+{
+	struct arm_smccc_res res;
+	int ret;
+
+	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_PROBE, 0, 0, 0, 0, 0, 0, 0, &res);
+	if (ret)
+		return -ENXIO;
+
+	return 0;
+}
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index d8c848cf09a6..848eb97202d1 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -49,4 +49,6 @@ source "drivers/virt/acrn/Kconfig"
 
 source "drivers/virt/coco/Kconfig"
 
+source "drivers/virt/geniezone/Kconfig"
+
 endif
diff --git a/drivers/virt/geniezone/Kconfig b/drivers/virt/geniezone/Kconfig
new file mode 100644
index 000000000000..b17c06c91074
--- /dev/null
+++ b/drivers/virt/geniezone/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config MTK_GZVM
+	tristate "GenieZone Hypervisor driver for guest VM operation"
+	depends on ARM64 && EVENTFD
+	help
+	  This driver, gzvm, enables to run guest VMs on MTK GenieZone
+	  hypervisor. It exports kvm-like interfaces for VMM (e.g., crosvm) in
+	  order to operate guest VMs on GenieZone hypervisor.
+
+	  GenieZone hypervisor now only supports MediaTek SoC and arm64
+	  architecture.
+
+	  Select M if you want it be built as a module (gzvm.ko).
+
+	  If unsure, say N.
diff --git a/drivers/virt/geniezone/Makefile b/drivers/virt/geniezone/Makefile
new file mode 100644
index 000000000000..3a82e5fddf90
--- /dev/null
+++ b/drivers/virt/geniezone/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for GenieZone driver, this file should be include in arch's
+# to avoid two ko being generated.
+#
+
+GZVM_DIR ?= ../../../drivers/virt/geniezone
+
+gzvm-y := $(GZVM_DIR)/gzvm_main.o
diff --git a/drivers/virt/geniezone/gzvm_main.c b/drivers/virt/geniezone/gzvm_main.c
new file mode 100644
index 000000000000..efd42b5ab871
--- /dev/null
+++ b/drivers/virt/geniezone/gzvm_main.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/kdev_t.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/gzvm_drv.h>
+
+/**
+ * gzvm_err_to_errno() - Convert geniezone return value to standard errno
+ *
+ * @err: Return value from geniezone function return
+ *
+ * Return: Standard errno
+ */
+int gzvm_err_to_errno(unsigned long err)
+{
+	int gz_err = (int)err;
+
+	switch (gz_err) {
+	case 0:
+		return 0;
+	case ERR_NO_MEMORY:
+		return -ENOMEM;
+	case ERR_NOT_SUPPORTED:
+		fallthrough;
+	case ERR_NOT_IMPLEMENTED:
+		return -EOPNOTSUPP;
+	case ERR_FAULT:
+		return -EFAULT;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct file_operations gzvm_chardev_ops = {
+	.llseek		= noop_llseek,
+};
+
+static struct miscdevice gzvm_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = KBUILD_MODNAME,
+	.fops = &gzvm_chardev_ops,
+};
+
+static int gzvm_drv_probe(struct platform_device *pdev)
+{
+	if (gzvm_arch_probe() != 0) {
+		dev_err(&pdev->dev, "Not found available conduit\n");
+		return -ENODEV;
+	}
+
+	return misc_register(&gzvm_dev);
+}
+
+static int gzvm_drv_remove(struct platform_device *pdev)
+{
+	misc_deregister(&gzvm_dev);
+	return 0;
+}
+
+static const struct of_device_id gzvm_of_match[] = {
+	{ .compatible = "mediatek,geniezone" },
+	{/* sentinel */},
+};
+
+static struct platform_driver gzvm_driver = {
+	.probe = gzvm_drv_probe,
+	.remove = gzvm_drv_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = gzvm_of_match,
+	},
+};
+
+module_platform_driver(gzvm_driver);
+
+MODULE_DEVICE_TABLE(of, gzvm_of_match);
+MODULE_AUTHOR("MediaTek");
+MODULE_DESCRIPTION("GenieZone interface for VMM");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
new file mode 100644
index 000000000000..907f2f984de9
--- /dev/null
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#ifndef __GZVM_DRV_H__
+#define __GZVM_DRV_H__
+
+/*
+ * These are the definitions of APIs between GenieZone hypervisor and driver,
+ * there's no need to be visible to uapi. Furthermore, we need GenieZone
+ * specific error code in order to map to Linux errno
+ */
+#define NO_ERROR                (0)
+#define ERR_NO_MEMORY           (-5)
+#define ERR_NOT_SUPPORTED       (-24)
+#define ERR_NOT_IMPLEMENTED     (-27)
+#define ERR_FAULT               (-40)
+
+int gzvm_err_to_errno(unsigned long err);
+
+/* arch-dependant functions */
+int gzvm_arch_probe(void);
+
+#endif /* __GZVM_DRV_H__ */
-- 
2.18.0


