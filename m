Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90E8C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:06:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CB36613B3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB36613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/MMUt0j5X7nKit84iSmUHIjVeeITFHtq/bCCOLzCdU=; b=H8eiRLYl5AHTMLQlHeVP6xvUs8
	5Oik2oeTV8jxoPAmS6yCWv5Ljv/BpL80GR22dAKdruNUCvv5509d1mPHzl0x2xMW17LyE9NAKF93Z
	NBQKXzZb1LCqBrGzbsjRUzkQiRQBlpWHNLFxqZKW2v0mePJ3EyHtbVOw6cGBtAccFdneADp0/aoI9
	vRZYIfK3Ya2AePonCKcPFqEol5rh4pRHwhMNuY3J/6FNZEDjZoEJpYGvGCrGmlAiCyM/iVVlsQe1U
	O5MeJGg7jriysO5KfvWPaDrFYYGs9kbowOZGIx727Yv98A/mgD0vJacXJ38IPIinPen57lWO4lIiI
	y/2/TbmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTc2A-001J9f-MD; Tue, 06 Apr 2021 03:05:42 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTc1u-001J5R-Vs; Tue, 06 Apr 2021 03:05:33 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FDslq250BzwR2Z;
 Tue,  6 Apr 2021 11:03:03 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.196) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 11:05:05 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <nbd@nbd.name>, <john@phrozen.org>, <sean.wang@mediatek.com>,
 <Mark-MC.Lee@mediatek.com>, <davem@davemloft.net>, <kuba@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Qiheng Lin" <linqiheng@huawei.com>
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unneeded semicolon
Date: Tue, 6 Apr 2021 11:04:33 +0800
Message-ID: <20210406030433.6540-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.174.176.196]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_040531_603063_74899C87 
X-CRM114-Status: UNSURE (   8.67  )
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

Eliminate the following coccicheck warning:
 drivers/net/ethernet/mediatek/mtk_ppe.c:270:2-3: Unneeded semicolon

Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index a1a9959a2461..71e1ccea6e72 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -267,7 +267,7 @@ int mtk_foe_entry_set_ipv6_tuple(struct mtk_foe_entry *entry,
 	default:
 		WARN_ON_ONCE(1);
 		return -EINVAL;
-	};
+	}
 
 	for (i = 0; i < 4; i++)
 		src[i] = be32_to_cpu(src_addr[i]);
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
