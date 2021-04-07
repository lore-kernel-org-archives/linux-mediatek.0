Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A419C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 03:36:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94410613A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 03:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94410613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gQ9s6/gyxpIee/6Ud06sYKRsPzxrkvjBRzhSQ9kY0Mg=; b=XvzDXth09DHeVFrwlRzBEUjJu
	Jc7sgjla381KqmHNnhhn8lQWqO5LM6GDIu0j9cdYXxGeumzolE8fTDX68Tt1woui/S5MrtSBWZxEg
	Jcoj5+fqtWabgK9rXSHwQO4fPS+4U8hkmGWfqgNlABZZUvozf2DQDld5xEMQGJezjSnDshsKA+7zj
	i1u0mhbEyniwylzmATvTIMwKX/4oszfYA8AS1SfsfYW4MZhcoiGoItswQaVVRamFs0f3HP33/+hrT
	kZqMAs1MgwImVhbFcs7AENjPnmcZmZuMrYabe336pR8rPMj5oQgh6C2cZaP6FkIeEnRjbHZsG0Yyj
	8fE99vXVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTyzE-003xWO-0G; Wed, 07 Apr 2021 03:36:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTyz8-003xVD-G5; Wed, 07 Apr 2021 03:36:09 +0000
X-UUID: 6f7384d7b8fc4bffa52a45c599f5bda1-20210406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/0bsVv/avuvT5OQV7nriKx3RN4+ZrobH247lZ18k9VU=; 
 b=cgv9kHcCNqW5NLUy6upAOCDVrKrc8hTbLLoebjQD/7aS1QVagJSuch9RSHdcvkxiFfHEwC5y4s6DjXTtfohlUuIuhqAodaoC1wJaXdYErXV2JTucEH82d4ZYPDeaY84evM0/+Fsvc5JVVuDKf7b+UimzZfXG2DQF5Y7NRNiDVu8=;
X-UUID: 6f7384d7b8fc4bffa52a45c599f5bda1-20210406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1514061821; Tue, 06 Apr 2021 20:36:02 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 20:28:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 11:28:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Apr 2021 11:28:51 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>
CC: Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH 3/8] dt-bindings: apu: Add MT8192 APU power domain
Date: Wed, 7 Apr 2021 11:28:01 +0800
Message-ID: <1617766086-5502-4-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_043607_748096_01B6B7A9 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Create MT8192 APU power domain bindings.
Add top power domain id.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 include/dt-bindings/power/mt8192-apu-power.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8192-apu-power.h

diff --git a/include/dt-bindings/power/mt8192-apu-power.h b/include/dt-bindings/power/mt8192-apu-power.h
new file mode 100644
index 000000000000..b821bd4811a6
--- /dev/null
+++ b/include/dt-bindings/power/mt8192-apu-power.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8192_APU_POWER_H
+#define _DT_BINDINGS_POWER_MT8192_APU_POWER_H
+
+#define MT8192_POWER_DOMAIN_APUSYS_TOP	0
+
+#endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
