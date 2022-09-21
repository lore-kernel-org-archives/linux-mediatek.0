Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3329BECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fV/Yw2n4+CeRra7KWcaMBGzyprf42uYHP+rpWc+fuI=; b=xraIMnnYbzbj9qusUWDPKwJPzj
	Rqcg3FcmTa05YXevTpjuZ69LEQe9X4JrVPRVC3TwhIeso48fYVYTRYuSkegBHqqEevw1q1vii6CrP
	BezdFmhuPL+Q8YiwepqJlMqC2/TJhpjlk7EArUnB7X0pZ9KxwOwVhbQ/lLdST1iWGluDwMbFXbnC2
	n0AAk5HHLod+x9CJHSBYp2QFjF447vgh1SRuU8oAFJ0KSr9/xVMhGjPtY8hTbRPVqm5h8Mmxv4cXi
	bQYgRQPfGVqLPvfrsfWlTm/pau6AQAotYpCVKIkjyKOFWqg8+1HI6bIwmCAInyQs9fuMhfExstp0h
	PxWJLXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavhG-00AEgM-84; Wed, 21 Sep 2022 09:07:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavfD-00ADiU-Uq; Wed, 21 Sep 2022 09:05:07 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXXSf0HWWzlWqX;
	Wed, 21 Sep 2022 17:00:50 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 17:04:56 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<matthias.bgg@gmail.com>, <amcohen@nvidia.com>, <stephen@networkplumber.org>,
	<cuigaosheng1@huawei.com>
CC: <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/5] mlxsw: reg: Remove unused inline function mlxsw_reg_sftr2_pack()
Date: Wed, 21 Sep 2022 17:04:51 +0800
Message-ID: <20220921090455.752011-2-cuigaosheng1@huawei.com>
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
X-CRM114-CacheID: sfid-20220921_020504_189530_B4C85492 
X-CRM114-Status: UNSURE (   7.15  )
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

All uses of mlxsw_reg_sftr2_pack() have
been removed since commit 77b7f83d5c25 ("mlxsw: Enable unified
bridge model"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/net/ethernet/mellanox/mlxsw/reg.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/reg.h b/drivers/net/ethernet/mellanox/mlxsw/reg.h
index d71d7f9a20f1..e188497c1b3e 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/reg.h
+++ b/drivers/net/ethernet/mellanox/mlxsw/reg.h
@@ -2272,22 +2272,6 @@ MLXSW_ITEM_BIT_ARRAY(reg, sftr2, port, 0x20, 0x80, 1);
  */
 MLXSW_ITEM_BIT_ARRAY(reg, sftr2, port_mask, 0xA0, 0x80, 1);
 
-static inline void mlxsw_reg_sftr2_pack(char *payload,
-					unsigned int flood_table,
-					unsigned int index,
-					enum mlxsw_flood_table_type table_type,
-					unsigned int range, u16 port, bool set)
-{
-	MLXSW_REG_ZERO(sftr2, payload);
-	mlxsw_reg_sftr2_swid_set(payload, 0);
-	mlxsw_reg_sftr2_flood_table_set(payload, flood_table);
-	mlxsw_reg_sftr2_index_set(payload, index);
-	mlxsw_reg_sftr2_table_type_set(payload, table_type);
-	mlxsw_reg_sftr2_range_set(payload, range);
-	mlxsw_reg_sftr2_port_set(payload, port, set);
-	mlxsw_reg_sftr2_port_mask_set(payload, port, 1);
-}
-
 /* SMID-V2 - Switch Multicast ID Version 2 Register
  * ------------------------------------------------
  * The MID record maps from a MID (Multicast ID), which is a unique identifier
-- 
2.25.1


