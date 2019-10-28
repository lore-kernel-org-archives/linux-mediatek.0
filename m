Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56191CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 07:29:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2301E20862
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 07:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ceeuvEO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2301E20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gdbP1xbI+cHPzVjhPB8wjbT5D8OkcgfIksO3oIaigM=; b=ceeuvEO3l6veiv
	o3whHcEDNDER0qgFaraYedBEr60Gb1yYA53txENeQvIQsuHD/YcJq6Bi0Qbg6nIVxEKihbNFk2Cj6
	yUiKpa4OCJHoKAVZQh5tf/QDk/w3YAX+uCJxkVB52Wd6E3KUPO6/e7owweB32DvO50j3xocJBIMkd
	BWirGAX2WiInY/AnTryjq+oe/rV4R59R7T0xTRWgGZDhbUuxw1iGJo/R9+V+HfErqQmDQ0ameTvtx
	UDU8LeAelB2KfaGQJWi+ufR/WzTkDxYrKiL8pakQN7ZAiMjPMPeBrTKWnC3VffQ13MIPbdhQWLAXk
	bvIDFMCkYvBYqg48KoSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOzTC-000229-JL; Mon, 28 Oct 2019 07:29:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOzTA-00021N-80
 for linux-mediatek@lists.infradead.org; Mon, 28 Oct 2019 07:29:41 +0000
X-UUID: dd5a58ff896c49219bb04bdfe8b14dac-20191027
X-UUID: dd5a58ff896c49219bb04bdfe8b14dac-20191027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1819353524; Sun, 27 Oct 2019 23:29:11 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 00:29:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 15:29:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 28 Oct 2019 15:29:14 +0800
From: Eason Yen <eason.yen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/1] soc: mediatek: add SMC fid table for SIP interface
Date: Mon, 28 Oct 2019 15:29:09 +0800
Message-ID: <1572247749-4276-2-git-send-email-eason.yen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1572247749-4276-1-git-send-email-eason.yen@mediatek.com>
References: <1572247749-4276-1-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_002940_289105_43CC92D4 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 Eason Yen <eason.yen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. Add a header file to provide SIP interface to ATF
2. Add AUDIO SMC fid

Change-Id: I218e9f571cea079268a5414725a81e9b35702e33
Signed-off-by: Eason Yen <eason.yen@mediatek.com>
---
 include/linux/soc/mediatek/mtk_sip_svc.h |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
new file mode 100644
index 0000000..00ee0f4
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __MTK_SIP_SVC_H__
+#define __MTK_SIP_SVC_H__
+
+#include <linux/kernel.h>
+
+/* Error Code */
+#define SIP_SVC_E_SUCCESS               0
+#define SIP_SVC_E_NOT_SUPPORTED         -1
+#define SIP_SVC_E_INVALID_PARAMS        -2
+#define SIP_SVC_E_INVALID_Range         -3
+#define SIP_SVC_E_PERMISSION_DENY       -4
+
+#ifdef CONFIG_ARM64
+#define MTK_SIP_SMC_AARCH_BIT			0x40000000
+#else
+#define MTK_SIP_SMC_AARCH_BIT			0x00000000
+#endif
+
+/* AUDIO related SMC call */
+#define MTK_SIP_AUDIO_CONTROL \
+	(0x82000517 | MTK_SIP_SMC_AARCH_BIT)
+#endif
+/* __MTK_SIP_SVC_H__ */
-- 
1.7.9.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
