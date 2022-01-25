Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16828C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ImfkU4tHkRx3nI6NAqOAcUPJQR355yfVASPqiIvrYx8=; b=gdW93uBI9YYd7b
	mazgBQu8remALWTVNSMapxsCblwzF8noQpASw9vqnAdlm0WsoC1vbpejyp7cAxCDRnUmVvhcUHuZV
	lubm5DDMQ7rKC/i1YXMrkE8mYuJAZ4IUBBUKrQOhuouWQOH+IKIyDX5KIoUQ0Dmky+bLB94nYL32m
	64+94hpf6ZNtQzEKoKbHvctBf7q2Mf3mQebnQ4WrwiPICX4Pxf20Dwc83ZkqIw2Do3I5nkZ7LjPeb
	wTAIdLDNtUajFukpZWdyyX/KP8PlJnnd20i6DFB2etezL23/MmY1yL2/l8SzKjluRzUMZYTpeGeFr
	2Z0M4ol8ysW1hOyo+GZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCQ2J-0097GS-OX; Tue, 25 Jan 2022 17:55:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCQ2H-0097FW-5V; Tue, 25 Jan 2022 17:55:18 +0000
X-UUID: f61e1182be10441ba72fc59213d6c21d-20220125
X-UUID: f61e1182be10441ba72fc59213d6c21d-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2013332309; Tue, 25 Jan 2022 10:55:13 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 09:55:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 01:54:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 01:54:58 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Kiran
 Kumar S" <kiran.kumar1.s@intel.com>
CC: Miles Chen <miles.chen@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] pinctrl: fix a discarded-qualifiers build error
Date: Wed, 26 Jan 2022 01:54:55 +0800
Message-ID: <20220125175457.23728-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_095517_259257_83E5468A 
X-CRM114-Status: GOOD (  11.75  )
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

Fix COMPILER=gcc ARCH=arm64 DEFCONFIG=allyesconfig build:

log:
drivers/pinctrl/pinctrl-thunderbay.c:815:29: error: assignment discards
'const' qualifier from pointer target type [-Werror=discarded-qualifiers]

Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/pinctrl/pinctrl-thunderbay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
index b5b47f4dd774..4e6d718c03fc 100644
--- a/drivers/pinctrl/pinctrl-thunderbay.c
+++ b/drivers/pinctrl/pinctrl-thunderbay.c
@@ -812,7 +812,7 @@ static int thunderbay_add_functions(struct thunderbay_pinctrl *tpc, struct funct
 				}
 			}
 
-			grp = func->group_names;
+			grp = (const char **)func->group_names;
 			while (*grp)
 				grp++;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
