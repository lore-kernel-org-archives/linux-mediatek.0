Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B9FC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pIyhegJUy9YRyfrt/cSg31WDLrTfgcfT6xmw2/M5Sto=; b=0LgCJWzJycv1ZAK9//qwdi9z0b
	6yA02EgtjWVfK8xAcbG3ndOfBydCuBglNbUrZyYZ33jXRkvkw2ufk7X+IwyTkZKMIkca1K9puVGYG
	v+YNjFIKOFTDTsQa/HQW6N7O9UrhVRUBI31SFTrXNheh/wX3f3SBIBlnibE/w/Vd6wifahdpRkOnB
	XcMQd2vAAyeik/Agw0oSOwoQE1CMTN9+U/hXt/AzswFGgtBMniTwm/+iNAQ/dHjZD5HVdNh4PHy9m
	E9py6dmuO0iD7Qu5rbJyTMG371GYoS4QZVS8GB6a54jbOoS7HiAF2SH/+OAuahTJo56En3Rggdo8Z
	S05PstzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavhC-00AEdM-Cr; Wed, 21 Sep 2022 09:07:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavfE-00ADiL-0n; Wed, 21 Sep 2022 09:05:07 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXXSd3Hz5zlWlg;
	Wed, 21 Sep 2022 17:00:49 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 17:04:55 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<matthias.bgg@gmail.com>, <amcohen@nvidia.com>, <stephen@networkplumber.org>,
	<cuigaosheng1@huawei.com>
CC: <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/5] Remove useless inline functions from net
Date: Wed, 21 Sep 2022 17:04:50 +0800
Message-ID: <20220921090455.752011-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_020504_268883_CE9DEE70 
X-CRM114-Status: UNSURE (   5.93  )
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

This series contains a few cleanup patches, to remove unused
inline functions who's caller have been removed. Thanks!

Gaosheng Cui (5):
  mlxsw: reg: Remove unused inline function mlxsw_reg_sftr2_pack()
  mt76: Remove unused inline function mt76_wcid_mask_test()
  neighbour: Remove unused inline function neigh_key_eq16()
  net: Remove unused inline function sk_nulls_node_init()
  net: Remove unused inline function dst_hold_and_use()

 drivers/net/ethernet/mellanox/mlxsw/reg.h | 16 ----------------
 drivers/net/wireless/mediatek/mt76/util.h |  6 ------
 include/net/dst.h                         |  6 ------
 include/net/neighbour.h                   |  5 -----
 include/net/sock.h                        |  5 -----
 5 files changed, 38 deletions(-)

-- 
2.25.1


