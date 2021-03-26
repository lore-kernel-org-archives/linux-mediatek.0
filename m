Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F800C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 02:28:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64A8619F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 02:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64A8619F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ubl1QzF+Q+Yv8qJQ8AjoFQHp2srHOdey6MjM9PkF1e0=; b=Ya2KoI9VqHiGCQ6Bdl6JGDnJ/6
	jtwQoitKLKpNJFL2Y6zJOPYHYUhp29O/MhwwS1jweXL58FY4gTxHIA4j0IynzG76LjYdlefnn1RBN
	dZyOKKZm7u48+su8WB9VxgA4MNvoGwGyZ2uht1UOnW1rzEPUL9QW4N/wdsXg0h/PDfg56EmZB5P5N
	VbxrqGuP8FikX30NnI6be5u1vlH/pYTpts19UktBSFzIU0kxMfUzWVFKmOHl6idnDkFG9SSrnI18z
	ZYvdnUGjwGcOsI/hvcy3w3dY8IvwP1xC+7jY/7AOhMJMNlYIM+3/Vmu68oYmJCPTbTS+Lvms1SavI
	dGaJRVSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPcCe-002bmI-Au; Fri, 26 Mar 2021 02:28:00 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPcBo-002bRf-M6; Fri, 26 Mar 2021 02:27:17 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F65QQ2bdsznWpc;
 Fri, 26 Mar 2021 10:24:30 +0800 (CST)
Received: from huawei.com (10.175.104.82) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Mar 2021
 10:26:53 +0800
From: Xu Jia <xujia39@huawei.com>
To: <nbd@nbd.name>, <sean.wang@mediatek.com>, <kuba@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
 <hulkcommits@huawei.com>
Subject: [PATCH net-next] net: ethernet: remove duplicated include
Date: Fri, 26 Mar 2021 10:40:46 +0800
Message-ID: <20210326024046.2800216-1-xujia39@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_022709_635971_DEBB97B9 
X-CRM114-Status: UNSURE (   6.37  )
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

Remove duplicated include from mtk_ppe_offload.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xu Jia <xujia39@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index d0c46786571f..4975106fbc42 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -5,7 +5,6 @@
 
 #include <linux/if_ether.h>
 #include <linux/rhashtable.h>
-#include <linux/if_ether.h>
 #include <linux/ip.h>
 #include <net/flow_offload.h>
 #include <net/pkt_cls.h>
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
