Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009CDC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=404HR8SLHtJzJXgg42LYY1+XwYjrgCgU4R5SDe3mLRw=; b=3yuBxu99zGiOUa2sBfYqVKji0o
	x7xGTq0eiOw0ttV4rvP/30m7C8G6nqxFstYz7jk7CjcRc3GCqu0QmSZEORMFiUvyFpCmqfQILnBob
	poaSL9soJumBUQI1mrDZPlAGOLqpPQCImMp6SCYu4CoPv41l2Ddsb60Gs+uidoUB7RS3SMnfhaVso
	x8BW7+vnzO/Pc+b+yg48H3Q2s0yNKVY/YS3y9SaG7vo/2cN2Ng8sLdrPm8MbdKgqhnm/94F8cmdUy
	J5FfGQvvO2+gWlz/jq1MAUCuTs/ORkb6jplcGAfWLUZj38uyxdjz8hujCp6LnbXmNJXZvokRdn7SQ
	dib0XA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavhA-00AEbo-34; Wed, 21 Sep 2022 09:07:04 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavfE-00ADip-L4; Wed, 21 Sep 2022 09:05:07 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXXSg1gSZzlWpB;
	Wed, 21 Sep 2022 17:00:51 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 17:04:57 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<matthias.bgg@gmail.com>, <amcohen@nvidia.com>, <stephen@networkplumber.org>,
	<cuigaosheng1@huawei.com>
CC: <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/5] neighbour: Remove unused inline function neigh_key_eq16()
Date: Wed, 21 Sep 2022 17:04:53 +0800
Message-ID: <20220921090455.752011-4-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921090455.752011-1-cuigaosheng1@huawei.com>
References: <20220921090455.752011-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_020504_895378_2D0E7E83 
X-CRM114-Status: UNSURE (   7.69  )
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

All uses of neigh_key_eq16() have
been removed since commit 1202cdd66531 ("Remove DECnet support
from kernel"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 include/net/neighbour.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/net/neighbour.h b/include/net/neighbour.h
index 3827a6b395fd..20745cf7ae1a 100644
--- a/include/net/neighbour.h
+++ b/include/net/neighbour.h
@@ -276,11 +276,6 @@ static inline void *neighbour_priv(const struct neighbour *n)
 
 extern const struct nla_policy nda_policy[];
 
-static inline bool neigh_key_eq16(const struct neighbour *n, const void *pkey)
-{
-	return *(const u16 *)n->primary_key == *(const u16 *)pkey;
-}
-
 static inline bool neigh_key_eq32(const struct neighbour *n, const void *pkey)
 {
 	return *(const u32 *)n->primary_key == *(const u32 *)pkey;
-- 
2.25.1


