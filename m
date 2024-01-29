Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E812C47DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMw2rY0id1kLvdBTzaUucT+yGeT5AxQk5Fa2HF2/eSo=; b=kYBwN/W/DDsxkglu6PGzlbs1a4
	7gcQbKuYeDc1e/vj4/lq0HAW6RJeEZAB/rNOaIrui9/1q3jucqPlTKjdQQxOnwwZIlPncoX4qsJSw
	daWpyO0iswIOWxjOt/daHG7j9ZG5Pz4YtwxMqOfTaRvnowH22NJUBNErOHJKchrUUMT7yVeGsmjPl
	O2TOHBVkZxuO1+BmN51vioZoN33JNglX1MDa37hUepqgyzuJr/hzTtR8QQr0IzlcpJpM663Z7J9HV
	lbi//KbfnwTa6JxvIcYf+GnF3lYrkkTtatDYWQDMcWAE+w+4NdI+OyPg6hWNP78EKL3oENzeFej/7
	1dHh1fqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN60-0000000BnWR-00qL;
	Mon, 29 Jan 2024 08:34:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN4u-0000000Bmq9-2l16;
	Mon, 29 Jan 2024 08:33:18 +0000
X-UUID: 0a5f45f8be8111eea0bf134e88e6c2dc-20240129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nMw2rY0id1kLvdBTzaUucT+yGeT5AxQk5Fa2HF2/eSo=;
	b=BPaBX+dNfhnLhYXVxpJpZCXaczq8eS4YczpaFSi0DxgtDbSvnaMjiwBxReLnAYtGX80UegrBDukcLskhhO1oigHLO6A4oUS8n1pZVi9e8e/MHiDxzJU4cu+Yum1BayoP82+NWNG5Mc+DYk4DCBqcByxsN3MCzpmagjTjaMRFsgc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:b79d45a6-0bf1-4d2f-b1ce-9b9877cd2f0a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6e16cf4,CLOUDID:4545de7f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0a5f45f8be8111eea0bf134e88e6c2dc-20240129
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 208669509; Mon, 29 Jan 2024 01:33:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 16:33:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 16:33:09 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, David Bradil
	<dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, My Chuang
	<my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei
	<peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, Willix
 Yeh <chi-shen.yeh@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: [PATCH v9 19/21] virt: geniezone: Provide individual VM memory statistics within debugfs
Date: Mon, 29 Jan 2024 16:33:00 +0800
Message-ID: <20240129083302.26044-20-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240129083302.26044-1-yi-de.wu@mediatek.com>
References: <20240129083302.26044-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_003316_902350_42885704 
X-CRM114-Status: GOOD (  26.45  )
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

From: "Jerry Wang" <ze-yu.wang@mediatek.com>

Created a dedicated per-VM debugfs folder under gzvm, providing
user-level programs with easy access to per-VM memory statistics for
debugging and profiling purposes. This enables users to effectively
analyze and optimize the memory usage of individual virtual machines.

Two types of information can be obtained:

`cat /sys/kernel/debug/gzvm/<pid>-<vmid>/protected_hyp_mem` shows memory
used by the hypervisor and the size of the stage 2 table in bytes.

`cat /sys/kernel/debug/gzvm/<pid>-<vmid>/protected_shared_mem` gives
memory used by the shared resources of the guest and host in bytes.

For example:
console:/ # cat /sys/kernel/debug/gzvm/3417-15/protected_hyp_mem
180328
console:/ # cat /sys/kernel/debug/gzvm/3417-15/protected_shared_mem
262144
console:/ #

More stats will be added in the future.

Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Liju-Clr Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 arch/arm64/geniezone/gzvm_arch_common.h |   2 +
 arch/arm64/geniezone/vm.c               |  13 +++
 drivers/virt/geniezone/gzvm_main.c      |   6 ++
 drivers/virt/geniezone/gzvm_vm.c        | 137 ++++++++++++++++++++++++
 include/linux/gzvm_drv.h                |  15 +++
 5 files changed, 173 insertions(+)

diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
index 07c5e2df7a74..fbaf2da792a4 100644
--- a/arch/arm64/geniezone/gzvm_arch_common.h
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -26,6 +26,7 @@ enum {
 	GZVM_FUNC_SET_DTB_CONFIG = 16,
 	GZVM_FUNC_MAP_GUEST = 17,
 	GZVM_FUNC_MAP_GUEST_BLOCK = 18,
+	GZVM_FUNC_GET_STATISTICS = 19,
 	NR_GZVM_FUNC,
 };
 
@@ -52,6 +53,7 @@ enum {
 #define MT_HVC_GZVM_SET_DTB_CONFIG	GZVM_HCALL_ID(GZVM_FUNC_SET_DTB_CONFIG)
 #define MT_HVC_GZVM_MAP_GUEST		GZVM_HCALL_ID(GZVM_FUNC_MAP_GUEST)
 #define MT_HVC_GZVM_MAP_GUEST_BLOCK	GZVM_HCALL_ID(GZVM_FUNC_MAP_GUEST_BLOCK)
+#define MT_HVC_GZVM_GET_STATISTICS	GZVM_HCALL_ID(GZVM_FUNC_GET_STATISTICS)
 
 #define GIC_V3_NR_LRS			16
 
diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index 691e6521cc48..571326e70d98 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -412,3 +412,16 @@ int gzvm_arch_map_guest_block(u16 vm_id, int memslot_id, u64 gfn, u64 nr_pages)
 	return gzvm_hypcall_wrapper(MT_HVC_GZVM_MAP_GUEST_BLOCK, vm_id,
 				    memslot_id, gfn, nr_pages, 0, 0, 0, &res);
 }
+
+int gzvm_arch_get_statistics(struct gzvm *gzvm)
+{
+	struct arm_smccc_res res;
+	int ret;
+
+	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_GET_STATISTICS, gzvm->vm_id,
+				   0, 0, 0, 0, 0, 0, &res);
+
+	gzvm->stat.protected_hyp_mem = ((ret == 0) ? res.a1 : 0);
+	gzvm->stat.protected_shared_mem = ((ret == 0) ? res.a2 : 0);
+	return ret;
+}
diff --git a/drivers/virt/geniezone/gzvm_main.c b/drivers/virt/geniezone/gzvm_main.c
index af5ab8949206..da1c0f478b61 100644
--- a/drivers/virt/geniezone/gzvm_main.c
+++ b/drivers/virt/geniezone/gzvm_main.c
@@ -113,6 +113,11 @@ static int gzvm_drv_probe(struct platform_device *pdev)
 	ret = gzvm_drv_irqfd_init();
 	if (ret)
 		return ret;
+
+	ret = gzvm_drv_debug_init();
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -121,6 +126,7 @@ static int gzvm_drv_remove(struct platform_device *pdev)
 	gzvm_drv_irqfd_exit();
 	gzvm_destroy_all_vms();
 	misc_deregister(&gzvm_dev);
+	gzvm_drv_debug_exit();
 	return 0;
 }
 
diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c
index 1af78f161eb3..4861730d555d 100644
--- a/drivers/virt/geniezone/gzvm_vm.c
+++ b/drivers/virt/geniezone/gzvm_vm.c
@@ -11,11 +11,14 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gzvm_drv.h>
+#include <linux/debugfs.h>
 #include "gzvm_common.h"
 
 static DEFINE_MUTEX(gzvm_list_lock);
 static LIST_HEAD(gzvm_list);
 
+static struct dentry *gzvm_debugfs_dir;
+
 u64 gzvm_gfn_to_hva_memslot(struct gzvm_memslot *memslot, u64 gfn)
 {
 	u64 offset = gfn - memslot->base_gfn;
@@ -308,6 +311,12 @@ static void gzvm_destroy_all_ppage(struct gzvm *gzvm)
 	}
 }
 
+static int gzvm_destroy_vm_debugfs(struct gzvm *vm)
+{
+	debugfs_remove_recursive(vm->debug_dir);
+	return 0;
+}
+
 static void gzvm_destroy_vm(struct gzvm *gzvm)
 {
 	size_t allocated_size;
@@ -334,6 +343,8 @@ static void gzvm_destroy_vm(struct gzvm *gzvm)
 	/* No need to lock here becauese it's single-threaded execution */
 	gzvm_destroy_all_ppage(gzvm);
 
+	gzvm_destroy_vm_debugfs(gzvm);
+
 	kfree(gzvm);
 }
 
@@ -391,6 +402,113 @@ static void setup_vm_demand_paging(struct gzvm *vm)
 	}
 }
 
+static int debugfs_open(struct inode *inode, struct file *file)
+{
+	file->private_data = inode->i_private;
+	return 0;
+}
+
+/**
+ * hyp_mem_read() - Get size of hypervisor-allocated memory and stage 2 table
+ * @file: Pointer to struct file
+ * @buf: User space buffer for storing the return value
+ * @len: Size of @buf, in bytes
+ * @offset: Pointer to loff_t
+ *
+ * Return: Size of hypervisor-allocated memory and stage 2 table, in bytes
+ */
+static ssize_t hyp_mem_read(struct file *file, char __user *buf, size_t len,
+			    loff_t *offset)
+{
+	char tmp_buffer[GZVM_MAX_DEBUGFS_VALUE_SIZE] = {0};
+	struct gzvm *vm = file->private_data;
+	int ret;
+
+	if (*offset == 0) {
+		ret = gzvm_arch_get_statistics(vm);
+		if (ret)
+			return ret;
+		snprintf(tmp_buffer, sizeof(tmp_buffer), "%llu\n",
+			 vm->stat.protected_hyp_mem);
+		if (copy_to_user(buf, tmp_buffer, sizeof(tmp_buffer)))
+			return -EFAULT;
+		*offset += sizeof(tmp_buffer);
+		return sizeof(tmp_buffer);
+	}
+	return 0;
+}
+
+/**
+ * shared_mem_read() - Get size of memory shared between host and guest
+ * @file: Pointer to struct file
+ * @buf: User space buffer for storing the return value
+ * @len: Size of @buf, in bytes
+ * @offset: Pointer to loff_t
+ *
+ * Return: Size of memory shared between host and guest, in bytes
+ */
+static ssize_t shared_mem_read(struct file *file, char __user *buf, size_t len,
+			       loff_t *offset)
+{
+	char tmp_buffer[GZVM_MAX_DEBUGFS_VALUE_SIZE] = {0};
+	struct gzvm *vm = file->private_data;
+	int ret;
+
+	if (*offset == 0) {
+		ret = gzvm_arch_get_statistics(vm);
+		if (ret)
+			return ret;
+		snprintf(tmp_buffer, sizeof(tmp_buffer), "%llu\n",
+			 vm->stat.protected_shared_mem);
+		if (copy_to_user(buf, tmp_buffer, sizeof(tmp_buffer)))
+			return -EFAULT;
+		*offset += sizeof(tmp_buffer);
+		return sizeof(tmp_buffer);
+	}
+	return 0;
+}
+
+static const struct file_operations hyp_mem_fops = {
+	.owner = THIS_MODULE,
+	.open = debugfs_open,
+	.read = hyp_mem_read,
+	.llseek = no_llseek,
+};
+
+static const struct file_operations shared_mem_fops = {
+	.owner = THIS_MODULE,
+	.open = debugfs_open,
+	.read = shared_mem_read,
+	.llseek = no_llseek,
+};
+
+static int gzvm_create_vm_debugfs(struct gzvm *vm)
+{
+	struct dentry *dent;
+	char dir_name[GZVM_MAX_DEBUGFS_DIR_NAME_SIZE];
+
+	if (vm->debug_dir) {
+		pr_warn("VM debugfs directory is duplicated\n");
+		return 0;
+	}
+
+	snprintf(dir_name, sizeof(dir_name), "%d-%d", task_pid_nr(current), vm->vm_id);
+
+	dent = debugfs_lookup(dir_name, gzvm_debugfs_dir);
+	if (dent) {
+		pr_warn("Debugfs directory is duplicated\n");
+		dput(dent);
+		return 0;
+	}
+	dent = debugfs_create_dir(dir_name, gzvm_debugfs_dir);
+	vm->debug_dir = dent;
+
+	debugfs_create_file("protected_shared_mem", 0444, dent, vm, &shared_mem_fops);
+	debugfs_create_file("protected_hyp_mem", 0444, dent, vm, &hyp_mem_fops);
+
+	return 0;
+}
+
 static struct gzvm *gzvm_create_vm(unsigned long vm_type)
 {
 	int ret;
@@ -432,6 +550,8 @@ static struct gzvm *gzvm_create_vm(unsigned long vm_type)
 	list_add(&gzvm->vm_list, &gzvm_list);
 	mutex_unlock(&gzvm_list_lock);
 
+	gzvm_create_vm_debugfs(gzvm);
+
 	pr_debug("VM-%u is created\n", gzvm->vm_id);
 
 	return gzvm;
@@ -469,3 +589,20 @@ void gzvm_destroy_all_vms(void)
 out:
 	mutex_unlock(&gzvm_list_lock);
 }
+
+int gzvm_drv_debug_init(void)
+{
+	if (!debugfs_initialized())
+		return 0;
+
+	if (!gzvm_debugfs_dir && !debugfs_lookup("gzvm", gzvm_debugfs_dir))
+		gzvm_debugfs_dir = debugfs_create_dir("gzvm", NULL);
+
+	return 0;
+}
+
+void gzvm_drv_debug_exit(void)
+{
+	if (gzvm_debugfs_dir && debugfs_lookup("gzvm", gzvm_debugfs_dir))
+		debugfs_remove_recursive(gzvm_debugfs_dir);
+}
diff --git a/include/linux/gzvm_drv.h b/include/linux/gzvm_drv.h
index 2e50ee3011e8..d532d2d31d43 100644
--- a/include/linux/gzvm_drv.h
+++ b/include/linux/gzvm_drv.h
@@ -47,6 +47,9 @@
 
 #define GZVM_BLOCK_BASED_DEMAND_PAGE_SIZE	(2 * 1024 * 1024) /* 2MB */
 
+#define GZVM_MAX_DEBUGFS_DIR_NAME_SIZE  20
+#define GZVM_MAX_DEBUGFS_VALUE_SIZE	20
+
 /* struct mem_region_addr_range - Identical to ffa memory constituent */
 struct mem_region_addr_range {
 	/* the base IPA of the constituent memory region, aligned to 4 kiB */
@@ -89,6 +92,11 @@ struct gzvm_pinned_page {
 	u64 ipa;
 };
 
+struct gzvm_vm_stat {
+	u64 protected_hyp_mem;
+	u64 protected_shared_mem;
+};
+
 struct gzvm {
 	struct gzvm_vcpu *vcpus[GZVM_MAX_VCPUS];
 	/* userspace tied to this vm */
@@ -133,6 +141,9 @@ struct gzvm {
 	struct rb_root pinned_pages;
 	/* lock for memory operations */
 	struct mutex mem_lock;
+
+	struct gzvm_vm_stat stat;
+	struct dentry *debug_dir;
 };
 
 long gzvm_dev_ioctl_check_extension(struct gzvm *gzvm, unsigned long args);
@@ -154,6 +165,7 @@ int gzvm_arch_destroy_vm(u16 vm_id);
 int gzvm_arch_map_guest(u16 vm_id, int memslot_id, u64 pfn, u64 gfn,
 			u64 nr_pages);
 int gzvm_arch_map_guest_block(u16 vm_id, int memslot_id, u64 gfn, u64 nr_pages);
+int gzvm_arch_get_statistics(struct gzvm *gzvm);
 int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 				  struct gzvm_enable_cap *cap,
 				  void __user *argp);
@@ -175,6 +187,9 @@ int gzvm_arch_vcpu_run(struct gzvm_vcpu *vcpu, __u64 *exit_reason);
 int gzvm_arch_destroy_vcpu(u16 vm_id, int vcpuid);
 int gzvm_arch_inform_exit(u16 vm_id);
 
+int gzvm_drv_debug_init(void);
+void gzvm_drv_debug_exit(void);
+
 int gzvm_find_memslot(struct gzvm *vm, u64 gpa);
 int gzvm_handle_page_fault(struct gzvm_vcpu *vcpu);
 bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu);
-- 
2.18.0


