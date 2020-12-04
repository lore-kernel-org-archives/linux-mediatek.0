Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7149C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:54:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 624A522955
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 624A522955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pgg7g7kFnL2kDseWef34UyxOtorCGk/6Gvw3nbkS+6k=; b=EPWBMRa4vJRJnX41bcumt5S5/
	Z+JzmhG0d35gIUmS3MP2reBiw7UdvGRnLKO+pAhxMfOuvqv2C+0pFWm5YXMgzic0TpL9w19QoWrx7
	MrILztkvwp6dSwNBOeYQ5rg58CIUlQRV6HWr6powmqYimohGwY6ch/HJaTuf4K/TmyvDMLfE+rZSC
	RJGiIplGdgiUrIFC6Nd6fWR/kOjv4iNQLx3CyeZUXq7kwSzioZJRP4DA/hTRxJnxdNMS5BBg00xg3
	UqbYqpqOstRQARvCDKWJSQaX4kJ9/IGDXo4uDpJfF10SiO2MzWw2veJgDBeejchakaMg5g5QUmD6G
	lnZzFQHfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7mk-0002ux-OP; Fri, 04 Dec 2020 09:53:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7mE-0002ac-ON; Fri, 04 Dec 2020 09:53:24 +0000
X-UUID: d1e29975adf542cea6bb1319d6c5270c-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Q/okFsnJzFQQeXGAdmbV00fyZCOuSbe33kWcrZPnFn8=; 
 b=bHzSjvDNkXYnRwIVETb6G8S3xL+MZEEztlLPxg5TQ7TT8BuXq/KoEJX1lSU2KI10dxgNBwJ+PSZAi36K5lpDmhpqMOEEnXIAG/8+34irjVLSnZMkYtH2ivKMsddd/KmJXUfF237uOfXc8sDsgFbe+hjBQTUG9r0hgfNZnNsSU/8=;
X-UUID: d1e29975adf542cea6bb1319d6c5270c-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 625772307; Fri, 04 Dec 2020 01:52:00 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 01:50:08 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 17:50:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Dec 2020 17:50:07 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 8/8] scsi: ufs-mediatek: Introduce event_notify
 implementation
Date: Fri, 4 Dec 2020 17:50:07 +0800
Message-ID: <20201204095007.20639-9-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201204095007.20639-1-stanley.chu@mediatek.com>
References: <20201204095007.20639-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_045323_012528_AA331D79 
X-CRM114-Status: GOOD (  16.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce event_notify implementation on MediaTek UFS platform.

A vendor-specific tracepoint is added that could be used
for debugging purpose.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek-trace.h | 37 +++++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.c       | 10 ++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 drivers/scsi/ufs/ufs-mediatek-trace.h

diff --git a/drivers/scsi/ufs/ufs-mediatek-trace.h b/drivers/scsi/ufs/ufs-mediatek-trace.h
new file mode 100644
index 000000000000..c36ca6de9636
--- /dev/null
+++ b/drivers/scsi/ufs/ufs-mediatek-trace.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM ufs_mtk
+
+#if !defined(_TRACE_EVENT_UFS_MEDIATEK_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_EVENT_UFS_MEDIATEK_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(ufs_mtk_event,
+	TP_PROTO(unsigned int type, int data),
+	TP_ARGS(type, data),
+
+	TP_STRUCT__entry(
+		__field(unsigned int, type)
+		__field(int, data)
+	),
+
+	TP_fast_assign(
+		__entry->type = type;
+		__entry->data = data;
+	),
+
+	TP_printk("ufs:event=%u data=%u",
+		  __entry->type, __entry->data)
+	);
+#endif
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE ufs-mediatek-trace
+#include <trace/define_trace.h>
+
diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 1d3c5cd4592e..b6755aab9a7b 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -24,6 +24,9 @@
 #include "unipro.h"
 #include "ufs-mediatek.h"
 
+#define CREATE_TRACE_POINTS
+#include "ufs-mediatek-trace.h"
+
 #define ufs_mtk_smc(cmd, val, res) \
 	arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
 		      cmd, val, 0, 0, 0, 0, 0, &(res))
@@ -1002,6 +1005,12 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
 }
 
+static void ufs_mtk_event_notify(struct ufs_hba *hba,
+				 enum ufs_event_type evt, void *data)
+{
+	trace_ufs_mtk_event(evt, (int)data);
+}
+
 /*
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
@@ -1021,6 +1030,7 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.resume              = ufs_mtk_resume,
 	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
 	.device_reset        = ufs_mtk_device_reset,
+	.event_notify        = ufs_mtk_event_notify,
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
