Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2ECECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vDacvRJANf+6I21akccnQEzT2eu7EXjp1V7l4KzxZE=; b=vbX/Zt2NhBaSZDjE3zCcXrG3Rp
	ViUAnCdXtuArP0hTV6XL46oLSyZHyltF8ZEvDCVecPRJELd1MArriDR9F8Iu2mKSgPqiSOMhk4MuL
	28VwzicJUzIaL33m2g4zNMFLakNKmoj/SraroiVeA8nVt0KjndpFASzEtFNZLSCbaY/Rsw1OU2+Sk
	R/C7Fd+Av7Bt8JSJih0kmqoYoJghTpCQxARbXQgzZMJdTKZbw0QKMe5NA9huHxzH3V5HlnrD8PTJx
	dweQZ99Eycp1v8qwJF0f8gT69eLlPpEWJMdyt4zOBEre7omZAMx5/qkHIchNcE29gaYWmR2ePazS9
	zp+dIm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavi7-00AFCk-NH; Wed, 21 Sep 2022 09:08:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavfJ-00ADnu-AO; Wed, 21 Sep 2022 09:05:16 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXXSh2kq6zlWsV;
	Wed, 21 Sep 2022 17:00:52 +0800 (CST)
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
Subject: [PATCH 5/5] net: Remove unused inline function dst_hold_and_use()
Date: Wed, 21 Sep 2022 17:04:55 +0800
Message-ID: <20220921090455.752011-6-cuigaosheng1@huawei.com>
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
X-CRM114-CacheID: sfid-20220921_020509_584436_4906BAB4 
X-CRM114-Status: UNSURE (   7.37  )
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

All uses of dst_hold_and_use() have
been removed since commit 1202cdd66531 ("Remove DECnet support
from kernel"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 include/net/dst.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/net/dst.h b/include/net/dst.h
index 6aa252c3fc55..00b479ce6b99 100644
--- a/include/net/dst.h
+++ b/include/net/dst.h
@@ -239,12 +239,6 @@ static inline void dst_use_noref(struct dst_entry *dst, unsigned long time)
 	}
 }
 
-static inline void dst_hold_and_use(struct dst_entry *dst, unsigned long time)
-{
-	dst_hold(dst);
-	dst_use_noref(dst, time);
-}
-
 static inline struct dst_entry *dst_clone(struct dst_entry *dst)
 {
 	if (dst)
-- 
2.25.1


