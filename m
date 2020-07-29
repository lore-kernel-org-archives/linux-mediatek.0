Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B03C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:41:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3640120786
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 06:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zBOyH3iY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mld/gkse"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3640120786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=07eZNQnhFlt0s8gpLEKnGZ02fK5l67yI/GT5sgyXZX0=; b=zBOyH3iYLOLT+yqDzCgBcISzM
	52esjBWtF7uZuyDjfE174lwa+nWdyHxFowUG987Raz/4UL1Bnu/84SnHfnPWXnKO9gXfmY7Sh9PGY
	xWgijhFnmKgqwgL7jylrai27n3iKlnNCZSN/XoH2Pv05AG0QlLXmf6MrPhnJkdMdddSUI2ABDIEk7
	3i1oRi9bWKtujU11HRbfNMPvmdFU5nruPU+SQhuBTJUExrBRgXaSZ9YQuM54Zg6bkyRMWC9qGOpY3
	eo9JZQZTpZnVLVj3U3UsLO50bZQoRbydU4ubfgywc6gBh7eQRTlZIjmNRJbwnOTQy/9bmQbzmdqoH
	GgGu/u6oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0fmU-0003VK-Kz; Wed, 29 Jul 2020 06:41:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0fmL-0003SR-DN; Wed, 29 Jul 2020 06:41:31 +0000
X-UUID: 77d17ef54727420aa5a9413b882e7175-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8tvvtJkUNQwkHhqk8KQuaR8AggmTBYNhX5fZW/pno7U=; 
 b=Mld/gkseXutwsk6fiVrO3dzsUzOhHWWKvByj+bkeBeKg5sIRuwoyzoHmPm+2lsylpi/ERzwLz/FBnwQmiBppaNj+mEL0TqtexereCe9dB/TbjOFDiSqmGHVEhTfqKpHa1YXxhYssFrjKzSFyu/Shb1WdTXn44Y+DthwVUynk4QE=;
X-UUID: 77d17ef54727420aa5a9413b882e7175-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 305232505; Tue, 28 Jul 2020 22:41:24 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 23:31:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:31:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 14:31:21 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2, 2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
Date: Wed, 29 Jul 2020 14:30:48 +0800
Message-ID: <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_024129_591306_E654AC10 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

merge all the reset numbers in one head file.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 include/dt-bindings/reset-controller/mtk-resets.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h

diff --git a/include/dt-bindings/reset-controller/mtk-resets.h b/include/dt-bindings/reset-controller/mtk-resets.h
new file mode 100644
index 0000000..d73a4ba
--- /dev/null
+++ b/include/dt-bindings/reset-controller/mtk-resets.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Mediatek Inc.
+ *
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MTK
+#define _DT_BINDINGS_RESET_CONTROLLER_MTK
+
+#define MT2712_TOPRGU_SW_RST_NUM	11
+#define MT8183_TOPRGU_SW_RST_NUM        19
+
+#endif
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
