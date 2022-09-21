Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACBEC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoXt2lUZyVb7e8SXNwXSmBUVYQ1yZRTea9o0QMdQUII=; b=ume3lB7yQDo7sk6ivrrHMxAtvy
	s5pNoek8VqTTzwsUz5I4Xaoiit4AUasWNP5CUFIUctLopSiVGdVyRnGXuMRDIG/DRqdDT8ojDHWST
	4LUXXPqoqAcpz+RWs9vL7BvfHr+QdokTBnw8l0e8TTqsxa4fFtI4+wUYIkYWNBzPVBNpr7OpPouYX
	V2D/VguTYxByTWQa+FxLNtosF4h9bmaySsaU5he9yZcHvDYNFWD8NX8jG4jNzBZMAsFHYw1QRo/f6
	clpk1LO8ApCspyScm/batQ9xSr5xLzxCklulAKAvvQ1KTDOrkm/7lNh4xhm2kpZrky3OlJYcDl8l8
	oXXzMS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavh7-00AEaN-Mz; Wed, 21 Sep 2022 09:07:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavfF-00ADj8-7e; Wed, 21 Sep 2022 09:05:07 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXXSg5lgRzlWrV;
	Wed, 21 Sep 2022 17:00:51 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 17:04:58 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<matthias.bgg@gmail.com>, <amcohen@nvidia.com>, <stephen@networkplumber.org>,
	<cuigaosheng1@huawei.com>
CC: <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 4/5] net: Remove unused inline function sk_nulls_node_init()
Date: Wed, 21 Sep 2022 17:04:54 +0800
Message-ID: <20220921090455.752011-5-cuigaosheng1@huawei.com>
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
X-CRM114-CacheID: sfid-20220921_020505_470318_601C7EEA 
X-CRM114-Status: UNSURE (   7.89  )
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

All uses of sk_nulls_node_init() have
been removed since commit dbca1596bbb0 ("ping: convert to RCU
lookups, get rid of rwlock"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 include/net/sock.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index 96a31026e35d..08038a385ef2 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -744,11 +744,6 @@ static inline void sk_node_init(struct hlist_node *node)
 	node->pprev = NULL;
 }
 
-static inline void sk_nulls_node_init(struct hlist_nulls_node *node)
-{
-	node->pprev = NULL;
-}
-
 static inline void __sk_del_node(struct sock *sk)
 {
 	__hlist_del(&sk->sk_node);
-- 
2.25.1


