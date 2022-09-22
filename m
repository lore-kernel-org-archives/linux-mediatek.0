Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAF0C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=izlE/aJ3tDw6HksH+z4lflER9+HiUmnIUkOpIUcTTxE=; b=dim+IS/fCznSw/IEWKaSnBUAOK
	01DQy3ZlGxvzLv00/IgcymmRNaKFZou7RtHZRkj5m2ySDoAR0ex10+sbsKijEyEV/RuHu7VSdKGRc
	sXNupznRHkZ9yyxWvsEKXjNf++SlKzt/5SeS7gp9GoI6S0GsLwH8VXhELBbHFawwNP2fEyhaSFsWf
	Cl/MJw4k1aPXvL+VEXgsJajiC615h4PefXW57WzA0mVipFMF5rsxkTQg40apMwOHhshhaWnxs3ZTO
	i+gYz8KfPoYjyKP7WVVJdeH79O2WaxsEQal29tpu3pNyngndUM4s/6DH9OqRHZFKPdrJhc+vnmybO
	ZOEHPt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGvg-00Dwfq-IX; Thu, 22 Sep 2022 07:47:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGvV-00Dwaz-SU; Thu, 22 Sep 2022 07:47:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MY6hS38qjzlVwB;
	Thu, 22 Sep 2022 15:43:04 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 15:47:12 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <matthias.bgg@gmail.com>, <cuigaosheng1@huawei.com>
CC: <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] wifi: mt76: Remove unused inline function mt76_wcid_mask_test()
Date: Thu, 22 Sep 2022 15:47:11 +0800
Message-ID: <20220922074711.1408385-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_004718_107589_9C4ABE3B 
X-CRM114-Status: UNSURE (   7.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

All uses of mt76_wcid_mask_test() have
been removed since commit 8950a62f19c9 ("mt76: get rid of
mt76_wcid_hw routine"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
v2:
- taking the patch out of the series: "Remove useless inline functions from net".
- add wifi: prefix to the subject, thanks!
v1:
- links: https://patchwork.kernel.org/project/linux-mediatek/patch/20220921090455.752011-3-cuigaosheng1@huawei.com/
 drivers/net/wireless/mediatek/mt76/util.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/util.h b/drivers/net/wireless/mediatek/mt76/util.h
index 49c52d781f40..260965dde94c 100644
--- a/drivers/net/wireless/mediatek/mt76/util.h
+++ b/drivers/net/wireless/mediatek/mt76/util.h
@@ -29,12 +29,6 @@ enum {
 
 int mt76_wcid_alloc(u32 *mask, int size);
 
-static inline bool
-mt76_wcid_mask_test(u32 *mask, int idx)
-{
-	return mask[idx / 32] & BIT(idx % 32);
-}
-
 static inline void
 mt76_wcid_mask_set(u32 *mask, int idx)
 {
-- 
2.25.1


