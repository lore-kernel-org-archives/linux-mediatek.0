Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08DBCD54B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMJnqTaqk0cC+W7BGuBZRReNA9mlb4C1cqyyl53azJE=; b=VG8ZN0WyZkrQmBKiMwo6wXK7Z/
	bo6mgTjx3Y/Cl2Y0KVhHRnmWvZzuT+9YRLKThNJkW6iTOBQTiqdQPIgm0+vshdia9WoHLcWYKIH/p
	ztGHgDWNzZnZN+6mSfJ0xEtFR4XzRgbNdFTuQuOb+dhHwwL6hMZpPHb1yyChHy22l5EeakIWBWwas
	0gooq5wCuHDkHGNsG79/sXsxFRGMKNRC45yvO1HjE9m/zKH5srkF6NmzT4nx2ODoxYcJ1ALB9IBtw
	azCyJS1OkTvfo5r3lh8W9pNEoqGuz0XXf1s9a3TFksm5hMH91Z/jKjyV4Dlas9i2Z/pojr/gJxoyb
	I5UxJcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYfM-000FAi-0o;
	Tue, 19 Sep 2023 11:13:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYf1-000EsQ-0X;
	Tue, 19 Sep 2023 11:12:59 +0000
X-UUID: 74f48a3856dd11ee9b7791016c24628a-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oMJnqTaqk0cC+W7BGuBZRReNA9mlb4C1cqyyl53azJE=;
	b=eKdRuiHCPlXN7SGYYoSk4nIVmFb1wVMqpUywFQZ9vLLZRtxMFIIwwhcSi++Nkceok29BPOIiA11I0GEr3jxEAARuoRmZvhKiKW1TtYaGhbGZ0ouWfMfTz8HT5oVEK3tZbcmmM1UiGmFoQiP41lcalkPpsHYCGzPvHarYSZ1o7mc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:96736170-9fc5-4bf5-bc7c-16bb155de755,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:462604bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 74f48a3856dd11ee9b7791016c24628a-20230919
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 389761744; Tue, 19 Sep 2023 04:12:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 19:12:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 19:12:41 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Arnd Bergmann <arnd@arndb.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, My
 Chuang <my.chuang@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>, Liju-clr Chen
	<liju-clr.chen@mediatek.com>
Subject: [PATCH v6 12/15] virt: geniezone: Add dtb config support
Date: Tue, 19 Sep 2023 19:12:07 +0800
Message-ID: <20230919111210.19615-13-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230919111210.19615-1-yi-de.wu@mediatek.com>
References: <20230919111210.19615-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_041255_264767_F54B7BA0 
X-CRM114-Status: GOOD (  16.61  )
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

Hypervisor might need to know the accurate address and size of dtb
passed from userspace. And then hypervisor would parse the dtb and get
vm information.

Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Liju-clr Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 arch/arm64/geniezone/gzvm_arch_common.h |  2 ++
 arch/arm64/geniezone/vm.c               |  9 +++++++++
 drivers/virt/geniezone/gzvm_vm.c        | 10 ++++++++++
 include/linux/gzvm_drv.h                |  1 +
 include/uapi/linux/gzvm.h               | 14 ++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
index 321f5dbcd616..82d2c44e819b 100644
--- a/arch/arm64/geniezone/gzvm_arch_common.h
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -23,6 +23,7 @@ enum {
 	GZVM_FUNC_ENABLE_CAP = 13,
 	GZVM_FUNC_INFORM_EXIT = 14,
 	GZVM_FUNC_MEMREGION_PURPOSE = 15,
+	GZVM_FUNC_SET_DTB_CONFIG = 16,
 	NR_GZVM_FUNC,
 };
 
@@ -46,6 +47,7 @@ enum {
 #define MT_HVC_GZVM_ENABLE_CAP		GZVM_HCALL_ID(GZVM_FUNC_ENABLE_CAP)
 #define MT_HVC_GZVM_INFORM_EXIT		GZVM_HCALL_ID(GZVM_FUNC_INFORM_EXIT)
 #define MT_HVC_GZVM_MEMREGION_PURPOSE	GZVM_HCALL_ID(GZVM_FUNC_MEMREGION_PURPOSE)
+#define MT_HVC_GZVM_SET_DTB_CONFIG	GZVM_HCALL_ID(GZVM_FUNC_SET_DTB_CONFIG)
 
 #define GIC_V3_NR_LRS			16
 
diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index 1198f32f4785..cf18b607bc81 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -114,6 +114,15 @@ int gzvm_arch_memregion_purpose(struct gzvm *gzvm,
 				    mem->flags, 0, 0, 0, &res);
 }
 
+int gzvm_arch_set_dtb_config(struct gzvm *gzvm, struct gzvm_dtb_config *cfg)
+{
+	struct arm_smccc_res res;
+
+	return gzvm_hypcall_wrapper(MT_HVC_GZVM_SET_DTB_CONFIG, gzvm->vm_id,
+				    cfg->dtb_addr, cfg->dtb_size, 0, 0, 0, 0,
+				    &res);
+}
+
 static int gzvm_vm_arch_enable_cap(struct gzvm *gzvm,
 				   struct gzvm_enable_cap *cap,
 				   struct arm_smccc_res *res)
diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c
index dfa03e850e8a..79fe6eb4196f 100644
--- a/drivers/virt/geniezone/gzvm_vm.c
+++ b/drivers/virt/geniezone/gzvm_vm.c
@@ -322,6 +322,16 @@ static long gzvm_vm_ioctl(struct file *filp, unsigned int ioctl,
 		ret = gzvm_vm_ioctl_enable_cap(gzvm, &cap, argp);
 		break;
 	}
+	case GZVM_SET_DTB_CONFIG: {
+		struct gzvm_dtb_config cfg;
+
+		if (copy_from_user(&cfg, argp, sizeof(cfg))) {
+			ret = -EFAULT;
+			goto out;
+		}
+		ret = gzvm_arch_set_dtb_config(gzvm, &cfg);
+		break;
+	}
 	default:
 		ret = -ENOTTY;
 	}
diff --git a/include/linux/gzvm_drv.h b/include/linux/gzvm_drv.h
index d35ca179b688..43d85dc5d7c0 100644
--- a/include/linux/gzvm_drv.h
+++ b/include/linux/gzvm_drv.h
@@ -154,6 +154,7 @@ void gzvm_vm_irqfd_release(struct gzvm *gzvm);
 
 int gzvm_arch_memregion_purpose(struct gzvm *gzvm,
 				struct gzvm_userspace_memory_region *mem);
+int gzvm_arch_set_dtb_config(struct gzvm *gzvm, struct gzvm_dtb_config *args);
 
 int gzvm_init_ioeventfd(struct gzvm *gzvm);
 int gzvm_ioeventfd(struct gzvm *gzvm, struct gzvm_ioeventfd *args);
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index ef433e311fa7..f4f04403d5b3 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -360,4 +360,18 @@ struct gzvm_ioeventfd {
 
 #define GZVM_IOEVENTFD	_IOW(GZVM_IOC_MAGIC, 0x79, struct gzvm_ioeventfd)
 
+/**
+ * struct gzvm_dtb_config: store address and size of dtb passed from userspace
+ *
+ * @dtb_addr: dtb address set by VMM (guset memory)
+ * @dtb_size: dtb size
+ */
+struct gzvm_dtb_config {
+	__u64 dtb_addr;
+	__u64 dtb_size;
+};
+
+#define GZVM_SET_DTB_CONFIG       _IOW(GZVM_IOC_MAGIC, 0xff, \
+				       struct gzvm_dtb_config)
+
 #endif /* __GZVM_H__ */
-- 
2.18.0


