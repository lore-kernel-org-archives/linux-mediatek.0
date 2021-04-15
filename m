Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA29C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 05:53:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 085C06143D
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 05:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 085C06143D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W/VM9r3viwfkY61MYuNlnr3EY448YD9xBcm93aMJtD4=; b=EQ2EEWPnQ/KLTe0V2EZw6bPq3
	mv1lql8bdWS0EgF5JXXT03CjuN/p89XTUdlvVbc1qNyzBg5ZfXoopT/xNpR+9qRJLQEyHOnaIy5ZK
	v7LVuxaFuGroJuTGmpg3tEpUgFkFQMyFcehxm3KgNT9vcD//Ub7C1KmW4qqvxCPabc9uPG26Blr1x
	eveokoJny0p5yZKe9UM6QK/0EOHueHYALja3AGv4PKjSnRu46guDKBQAKXZJkBMoZaKCpc/OF6E+I
	BmeQoaq6pTH1c3WKjE8xsqQ7fNOpKWQp4x7NLzjeB/gebZ1sBqwvOM8eCMbIfAJ0LYgKVRQeJeKJx
	+pe7eUhDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWuw1-00Exhh-FX; Thu, 15 Apr 2021 05:53:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWuvw-00Exgz-D1; Thu, 15 Apr 2021 05:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=n11nuqtiuD5/PGz0cHUMx094LOQ1tqWofJCUWvEDoh8=; b=nv9cmvU/2VNfIYIkxe3fih8M5d
 gpJIOjS+gMf6rgMzHeMMb5h//nJUwQqzTu1zhx1xogUeW1MxbUXgcCXNefoIdIJKM7clQVLdfWeZV
 eGtY5lYHLIqFIWylFOeEu75lZbFEYf71jK7r2suhgKKktGxJPQaiJdMmD9iE5+KwqZzSSJhJaVOd2
 RzaqAW5OGkOZ9I3cxEKHVKXM4sZkBwDaXKn2VyfxbkMPzceHE6j74MxwMdlvKYozwNSMssf8CesgW
 S5X+yYxdD00Fa4Goo5zExE7jOmgQFp/e0NOSuXSyKyJ+eTyjOEpxkBrxxdPy2Gk7VHvIye7K+k9hD
 cQGYA1dw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWuvt-008I31-3u; Thu, 15 Apr 2021 05:52:54 +0000
X-UUID: 3115353bbb214cfaaf78d50aea9a3b6f-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n11nuqtiuD5/PGz0cHUMx094LOQ1tqWofJCUWvEDoh8=; 
 b=XFlMiMJt4+mXvKDhQVVcG1iK2HFmDqwKkwQ7XgJxygv44K4hTKbF73EkjuwwsYUH/bT9gywPIyR2kECMRSqUNzUcJXfMpC7gZF6mZ8GdJRb+M8UTSTlr/ViyD2hRRUoF4bgInaMKo9QWE51ZOeNQfevumFo/tiPZeHmPSEa1Z6g=;
X-UUID: 3115353bbb214cfaaf78d50aea9a3b6f-20210414
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1667101048; Wed, 14 Apr 2021 22:52:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 22:52:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 13:52:43 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, 
 Chiawen Lee <chiawen.lee@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 1/7] dt-bindings: clock: Add MT8192 APU clock bindings
Date: Thu, 15 Apr 2021 13:52:34 +0800
Message-ID: <1618465960-3013-2-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_225253_185452_D79204D4 
X-CRM114-Status: GOOD (  10.24  )
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

Add clock bindings for APU on MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/mt8192-clk.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/mt8192-clk.h b/include/dt-bindings/clock/mt8192-clk.h
index ece5b4c0356c..71e07858f5dc 100644
--- a/include/dt-bindings/clock/mt8192-clk.h
+++ b/include/dt-bindings/clock/mt8192-clk.h
@@ -164,7 +164,15 @@
 #define CLK_TOP_APLL12_DIV9		152
 #define CLK_TOP_SSUSB_TOP_REF		153
 #define CLK_TOP_SSUSB_PHY_REF		154
-#define CLK_TOP_NR_CLK			155
+#define CLK_TOP_DSP_SEL			155
+#define CLK_TOP_DSP1_SEL		156
+#define CLK_TOP_DSP1_NPUPLL_SEL		157
+#define CLK_TOP_DSP2_SEL		158
+#define CLK_TOP_DSP2_NPUPLL_SEL		159
+#define CLK_TOP_DSP5_SEL		160
+#define CLK_TOP_DSP5_APUPLL_SEL		161
+#define CLK_TOP_IPU_IF_SEL		162
+#define CLK_TOP_NR_CLK			163
 
 /* INFRACFG */
 
@@ -309,7 +317,9 @@
 #define CLK_APMIXED_APLL1		8
 #define CLK_APMIXED_APLL2		9
 #define CLK_APMIXED_MIPID26M		10
-#define CLK_APMIXED_NR_CLK		11
+#define CLK_APMIXED_APUPLL		11
+#define CLK_APMIXED_NPUPLL		12
+#define CLK_APMIXED_NR_CLK		13
 
 /* SCP_ADSP */
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
