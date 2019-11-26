Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11B5C43215
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6108204FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LZGYU+RF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eO9HCBU1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6108204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5byQCsU0M4F/WP5vKessblUIEO66hLMn+Rir8YItxsI=; b=LZGYU+RFDv+4k5
	j3Vy8fHtQXrO9ixclsZcYuJotHTMhdlxA7Q8EMzEjqpXfholZR094DY0QYH15Kx+uzmHfXfSJCPP1
	eO/5uWfWMhic2skXnQX6hTnCB8D8mj0+fY2Jl2Ew4l9Y4tMcR3Y6FlKfnpW1kANNxtfsBovkhWv22
	0wl1B3a3/qYnAf9lVQqQe6D87b2fHM30KTqVxG6R0DMuOu2Sv9Tgs3pxAt7BK9uFcCR/DEUHud0Z4
	ZPV9LfMcVAPMN/FMjwCJ4qrGQ5EOWWuZ/tM8X5QxemPkPkYobNCHZCnsC67pshnotNsXZfWsqPny2
	oMmwh/N4Ws9VxqnI/uWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZTXE-0004Bn-Ak; Tue, 26 Nov 2019 05:37:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZTX9-000479-8i; Tue, 26 Nov 2019 05:37:09 +0000
X-UUID: cf7b56382dfe420a8c9767369ddffd4e-20191125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y1RF2/cLUQF2MNOynB8uR3SFbEklhbVv5kPFp1T7iWo=; 
 b=eO9HCBU1l+JmiIaDsimASO9Oqfu+sN+fpGRyw1ildMRFO9BwouVtSgEP75/KSgLXvQYhXcwBo7o2MeYwCnVTMswB6KtxyhTV9c5YtiJuuTlkocHRBJ/Im/8IaXic2XvWHd7FvcKHg2+EGlr+dnwl+WYvla7Uw8U4lvVrCD2JugU=;
X-UUID: cf7b56382dfe420a8c9767369ddffd4e-20191125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 38576255; Mon, 25 Nov 2019 21:36:48 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 21:35:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 13:34:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 26 Nov 2019 13:34:35 +0800
From: <freddy.hsin@mediatek.com>
To: <sre@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 3/4] soc: mediatek: add reboot-mode header
Date: Tue, 26 Nov 2019 13:34:49 +0800
Message-ID: <1574746490-625-4-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574746490-625-1-git-send-email-freddy.hsin@mediatek.com>
References: <1574746490-625-1-git-send-email-freddy.hsin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_213707_318465_8539D3D2 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: Freddy Hsin <freddy.hsin@mediatek.com>, Chang-An.Chen@mediatek.com,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Freddy Hsin <freddy.hsin@mediatek.com>

Mediatek platform use a RGU (Reset Generation Unit) mapped
register store the reboot mode magic value for bootloader
to use when system reboot.

Add the shared header describing the values firmware expects
for different boot modes.

Signed-off-by: Freddy Hsin <freddy.hsin@mediatek.com>
---
 include/dt-bindings/soc/mediatek,boot-mode.h |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/soc/mediatek,boot-mode.h

diff --git a/include/dt-bindings/soc/mediatek,boot-mode.h b/include/dt-bindings/soc/mediatek,boot-mode.h
new file mode 100644
index 0000000..f7d5107
--- /dev/null
+++ b/include/dt-bindings/soc/mediatek,boot-mode.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+#ifndef __MEDIATEK_BOOT_MODE_H
+#define __MEDIATEK_BOOT_MODE_H
+
+#define BOOT_CHARGER	1
+#define BOOT_RECOVERY	2
+#define BOOT_BOOTLOADER	3
+#define BOOT_DM_VERITY	4
+#define BOOT_KPOC	5
+#define BOOT_DDR_RSVD	6
+#define BOOT_META	7
+#define BOOT_RPMBPK	8
+
+#endif
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
