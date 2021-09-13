Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCCEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 03:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB986109D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 03:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCB986109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQCy5yQSPDYB2SMzWeiepeuU9n7wdae8vVIT1f4zMDU=; b=dKUTBBUyWRf9FP
	zOhX5D8YHp0WKehCBXk5L2iGf6fKbupyHVNosyH2HKid8dFeSVZf1wkVRiuGygATSmTKvyLl/XmOX
	6HaKollO6qUIiemkuuHiEeFFDFG/5w2us5qNwO3aBNmBsNyXI3B3htfBp3AX8X4ZZyDUp+i2EXelf
	mYhTSIMHr2LnDIU3/deb3tK5cOxksxJ031/aZwVxRFOiABr5YcteXrmFFvopUltUKy5USMh5JUtsX
	O2DzxebtNjSP5+P5Yq2XB/W536ExSSr5lmWfwLvYYZET3lVvUfJ0/tKLimu2lWS9yrWU4Ig6dkMZP
	mYzi76Fi7jkCe8zYWCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPcKS-000C4e-9F; Mon, 13 Sep 2021 03:08:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPcKM-000C40-BJ; Mon, 13 Sep 2021 03:08:17 +0000
X-UUID: 5a49f1b156be4e56b1df96c8f55d3f64-20210912
X-UUID: 5a49f1b156be4e56b1df96c8f55d3f64-20210912
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 150546979; Sun, 12 Sep 2021 20:08:09 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Sep 2021 20:06:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 11:06:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 13 Sep 2021 11:06:26 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
 <jszhang@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>
Subject: [PATCH] scripts/sorttable: riscv: fix undelcred identifier 'EM_RISCV'
 error
Date: Mon, 13 Sep 2021 11:06:25 +0800
Message-ID: <20210913030625.4525-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_200814_439897_9F1835E3 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

Fix the following build break by adding a conditional definition
of EM_RISCV in order to allow cross-compilation on machines
which do not have EM_RISCV definition in their host.

build break log from [1]:
scripts/sorttable.c:352:7: error: use of undeclared identifier 'EM_RISCV'

[1] https://lore.kernel.org/lkml/e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com/

Cc: Jisheng Zhang <jszhang@kernel.org>
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Fixes: 54fed35fd393 ("riscv: Enable BUILDTIME_TABLE_SORT")
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 scripts/sorttable.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index f355869c65cd..6ee4fa882919 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -54,6 +54,10 @@
 #define EM_ARCV2	195
 #endif
 
+#ifndef EM_RISCV
+#define EM_RISCV	243
+#endif
+
 static uint32_t (*r)(const uint32_t *);
 static uint16_t (*r2)(const uint16_t *);
 static uint64_t (*r8)(const uint64_t *);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
