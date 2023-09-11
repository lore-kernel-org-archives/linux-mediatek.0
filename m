Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B384FEEB580
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79Abphj1CKQUA2KFHY92lJArficWoTb5EsDuE5M72Ho=; b=KYd5QFVyN478VybcZz6TZ07LTR
	9XoYyyc6Xay0X+3nlyLBed2BYbBaoiLd8zVsJ9J6E5HyaakUt2K3aiqeG1AERj+bOnGscUHT0geLN
	HmCHVezWBNJ+mopYcnxc5f7LIFh9GFEh34b14r83p0KF3myVEHYrpmsWSvPFClsa7GtIVc04ds47j
	HrJh92idlXjydJQ+45G1hJWF7C5snli+P6/EEo5ArJMKgIYTUN8HJZzOXTbsuS9jDhcPDyidQJUI9
	1+xYRu8zU0nSZedJ28I1rwVv2jDStrNN7QGopPE7nfrvLYfyx6rPiY/1HiiTPY5KPo72nBRvXg9oY
	Aq/1sDqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeZd-000JPK-20;
	Mon, 11 Sep 2023 10:55:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeZZ-000JMF-1s;
	Mon, 11 Sep 2023 10:55:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B8LamS000578;
	Mon, 11 Sep 2023 10:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=79Abphj1CKQUA2KFHY92lJArficWoTb5EsDuE5M72Ho=;
 b=ND0gyuSsJHkj27EE8/ok/c4MQCSGTzP84gF5h5aYc3BI+k1XoB5OyJ+cyDBg1SacMLZ5
 suSe8rxOkApfixM8UE4+P0a+iBmhBdh9w5GQ5fynlkax11gWorgdsbKBG5+ys0zo7WTV
 Zm/lwDvj9jSfBzJdEjaeU5gsh66PIInlMpZeup0flWJaHyT46zZoK2al99Pn2S2cPWgG
 wUR3+JTL6Y/+C3efiA4QRBuAPMSAP2KyB4W/j7QQSBx+FyxW8uxK5mU6t5AsVf0+Q8Q3
 3yl3qOiPmaOB10s5la4Yw3ALvQ7cQIQg3ELedMzr/A4zWDNIb4igLXA58tgeXmACiROf Ww== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1yac8bns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:55:02 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BAt1uM032425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:55:01 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 03:54:27 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <quic_tsoni@quicinc.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [REBASE PATCH v5 02/17] soc: qcom: Add qcom_rproc_minidump module
Date: Mon, 11 Sep 2023 16:23:44 +0530
Message-ID: <1694429639-21484-3-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aTnp-dqfQzyRqJT6j2XQugil-EU68YU2
X-Proofpoint-GUID: aTnp-dqfQzyRqJT6j2XQugil-EU68YU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035517_738055_B15F41B4 
X-CRM114-Status: GOOD (  32.75  )
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

Add qcom_rproc_minidump module in a preparation to remove
minidump specific code from driver/remoteproc/qcom_common.c
and provide needed exported API, this as well helps to
abstract minidump specific data layout from qualcomm's
remoteproc driver.

It is just a copying of qcom_minidump() functionality from
driver/remoteproc/qcom_common.c into a separate file under
qcom_rproc_minidump().

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/soc/qcom/Kconfig                  |  10 +++
 drivers/soc/qcom/Makefile                 |   1 +
 drivers/soc/qcom/qcom_minidump_internal.h |  64 +++++++++++++++++
 drivers/soc/qcom/qcom_rproc_minidump.c    | 111 ++++++++++++++++++++++++++++++
 include/soc/qcom/qcom_minidump.h          |  23 +++++++
 5 files changed, 209 insertions(+)
 create mode 100644 drivers/soc/qcom/qcom_minidump_internal.h
 create mode 100644 drivers/soc/qcom/qcom_rproc_minidump.c
 create mode 100644 include/soc/qcom/qcom_minidump.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 715348869d04..ceca58eaa445 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -291,4 +291,14 @@ config QCOM_INLINE_CRYPTO_ENGINE
 	tristate
 	select QCOM_SCM
 
+config QCOM_RPROC_MINIDUMP
+	tristate "QCOM Remoteproc Minidump Support"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SMEM
+	help
+	  Enablement of core minidump feature is controlled from boot firmware
+	  side, so if it is enabled from firmware, this config allow linux to
+	  query predefined minidump segments associated with the remote processor
+	  and check its validity and end up collecting the dump on remote processor
+	  crash during its recovery.
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index bbca2e1e55bb..838528e7e30a 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -32,3 +32,4 @@ obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
 obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
 qcom_ice-objs			+= ice.o
 obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
+obj-$(CONFIG_QCOM_RPROC_MINIDUMP)	+= qcom_rproc_minidump.o
diff --git a/drivers/soc/qcom/qcom_minidump_internal.h b/drivers/soc/qcom/qcom_minidump_internal.h
new file mode 100644
index 000000000000..71709235b196
--- /dev/null
+++ b/drivers/soc/qcom/qcom_minidump_internal.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_MINIDUMP_INTERNAL_H_
+#define _QCOM_MINIDUMP_INTERNAL_H_
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID	   ('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE	   ('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED	   ('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+};
+
+#endif /* _QCOM_MINIDUMP_INTERNAL_H_ */
diff --git a/drivers/soc/qcom/qcom_rproc_minidump.c b/drivers/soc/qcom/qcom_rproc_minidump.c
new file mode 100644
index 000000000000..9bc84cc2536f
--- /dev/null
+++ b/drivers/soc/qcom/qcom_rproc_minidump.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/string.h>
+#include <soc/qcom/qcom_minidump.h>
+
+#include "qcom_minidump_internal.h"
+
+static void qcom_minidump_cleanup(struct rproc *rproc)
+{
+	struct rproc_dump_segment *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
+		list_del(&entry->node);
+		kfree(entry->priv);
+		kfree(entry);
+	}
+}
+
+static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsystem *subsystem,
+			void (*rproc_dumpfn_t)(struct rproc *rproc, struct rproc_dump_segment *segment,
+				void *dest, size_t offset, size_t size))
+{
+	struct minidump_region __iomem *ptr;
+	struct minidump_region region;
+	int seg_cnt, i;
+	dma_addr_t da;
+	size_t size;
+	char *name;
+
+	if (WARN_ON(!list_empty(&rproc->dump_segments))) {
+		dev_err(&rproc->dev, "dump segment list already populated\n");
+		return -EUCLEAN;
+	}
+
+	seg_cnt = le32_to_cpu(subsystem->region_count);
+	ptr = ioremap((unsigned long)le64_to_cpu(subsystem->regions_baseptr),
+		      seg_cnt * sizeof(struct minidump_region));
+	if (!ptr)
+		return -EFAULT;
+
+	for (i = 0; i < seg_cnt; i++) {
+		memcpy_fromio(&region, ptr + i, sizeof(region));
+		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
+			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
+			if (!name) {
+				iounmap(ptr);
+				return -ENOMEM;
+			}
+			da = le64_to_cpu(region.address);
+			size = le64_to_cpu(region.size);
+			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
+		}
+	}
+
+	iounmap(ptr);
+	return 0;
+}
+
+void qcom_rproc_minidump(struct rproc *rproc, unsigned int minidump_id,
+		void (*rproc_dumpfn_t)(struct rproc *rproc,
+		struct rproc_dump_segment *segment, void *dest, size_t offset,
+		size_t size))
+{
+	int ret;
+	struct minidump_subsystem *subsystem;
+	struct minidump_global_toc *toc;
+
+	/* Get Global minidump ToC*/
+	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
+
+	/* check if global table pointer exists and init is set */
+	if (IS_ERR(toc) || !toc->status) {
+		dev_err(&rproc->dev, "Minidump TOC not found in SMEM\n");
+		return;
+	}
+
+	/* Get subsystem table of contents using the minidump id */
+	subsystem = &toc->subsystems[minidump_id];
+
+	/**
+	 * Collect minidump if SS ToC is valid and segment table
+	 * is initialized in memory and encryption status is set.
+	 */
+	if (subsystem->regions_baseptr == 0 ||
+	    le32_to_cpu(subsystem->status) != 1 ||
+	    le32_to_cpu(subsystem->enabled) != MINIDUMP_SS_ENABLED ||
+	    le32_to_cpu(subsystem->encryption_status) != MINIDUMP_SS_ENCR_DONE) {
+		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
+		return;
+	}
+
+	ret = qcom_add_minidump_segments(rproc, subsystem, rproc_dumpfn_t);
+	if (ret) {
+		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
+		goto clean_minidump;
+	}
+	rproc_coredump_using_sections(rproc);
+clean_minidump:
+	qcom_minidump_cleanup(rproc);
+}
+EXPORT_SYMBOL_GPL(qcom_rproc_minidump);
+
+MODULE_DESCRIPTION("Qualcomm remoteproc minidump(smem) helper module");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/qcom/qcom_minidump.h b/include/soc/qcom/qcom_minidump.h
new file mode 100644
index 000000000000..cd87caef919d
--- /dev/null
+++ b/include/soc/qcom/qcom_minidump.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_MINIDUMP_H_
+#define _QCOM_MINIDUMP_H_
+
+struct rproc;
+struct rproc_dump_segment;
+
+#if IS_ENABLED(CONFIG_QCOM_RPROC_MINIDUMP)
+void qcom_rproc_minidump(struct rproc *rproc, unsigned int minidump_id,
+		   void (*rproc_dumpfn_t)(struct rproc *rproc,
+		   struct rproc_dump_segment *segment, void *dest, size_t offset,
+		   size_t size));
+#else
+static inline void qcom_rproc_minidump(struct rproc *rproc, unsigned int minidump_id,
+		   void (*rproc_dumpfn_t)(struct rproc *rproc,
+		   struct rproc_dump_segment *segment, void *dest, size_t offset,
+		   size_t size)) { }
+#endif /* CONFIG_QCOM_RPROC_MINIDUMP */
+#endif /* _QCOM_MINIDUMP_H_ */
-- 
2.7.4


