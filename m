Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47E5EEB59F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1stBqhmyGv3At6lM7XjLumiofL3xIeySle3Ks00Qc4Y=; b=cfSEdUGs4PrbeV5cFLIzju8n8W
	h+kl66SukgWpx7jXVR2psh8FNd47kyniuVH9ppN95dXqK7MPQc03kIsG+OrEGNpFvHgReEHA2xl50
	slOUYvHE5flq8GJ47BdTd8Zb4pL7C4ZSqHCV2alAlpwUgXrEVWwwAPktxhrB73/FmhC2xuliyg4DN
	paI+/jjGznUGuK7BgskT4H9CwiJNPnkybC38MA+e8PXRx3eUWPiPMAK2KApXNRwb3593xb/iypft7
	FN1DlXBNYkA5A+xF4WdZxbQYS2IewycVjd6Q4FXU7N48oDpgXl7VBK376AVcK95vaBQ1hPGjEBnOX
	U61pj87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sojKw-0000000D6me-0cpN;
	Thu, 12 Sep 2024 12:54:14 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sojI2-0000000D5wS-0re6;
	Thu, 12 Sep 2024 12:51:16 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X4HP64kk6z1xxGS;
	Thu, 12 Sep 2024 20:51:06 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id A6C811400D4;
	Thu, 12 Sep 2024 20:51:07 +0800 (CST)
Received: from localhost.localdomain (10.90.30.45) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 12 Sep 2024 20:51:07 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <liuyonglong@huawei.com>, <fanghaiqing@huawei.com>, Yunsheng Lin
	<linyunsheng@huawei.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
	Robin Murphy <robin.murphy@arm.com>, Alexander Duyck
	<alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <netdev@vger.kernel.org>,
	<intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [RFC 0/2] fix two bugs related to page_pool
Date: Thu, 12 Sep 2024 20:45:11 +0800
Message-ID: <20240912124514.2329991-1-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_055114_523470_25C367ED 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Patch 1 fix a possible time window problem for pagw_pool.
Patch 2 fix the kernel crash problem at iommu_get_dma_domain
reported in [1].

1. https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/

CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Robin Murphy <robin.murphy@arm.com>
CC: Alexander Duyck <alexander.duyck@gmail.com>
CC: IOMMU <iommu@lists.linux.dev>

Yunsheng Lin (2):
  page_pool: fix timing for checking and disabling napi_local
  page_pool: fix IOMMU crash when driver has already unbound

 drivers/net/ethernet/freescale/fec_main.c     |   8 +-
 drivers/net/ethernet/intel/iavf/iavf_txrx.c   |   6 +-
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   |  14 +-
 drivers/net/ethernet/intel/libeth/rx.c        |   2 +-
 .../net/ethernet/mellanox/mlx5/core/en/xdp.c  |   3 +-
 drivers/net/netdevsim/netdev.c                |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   2 +-
 include/linux/mm_types.h                      |   2 +-
 include/linux/skbuff.h                        |   1 +
 include/net/libeth/rx.h                       |   3 +-
 include/net/netmem.h                          |   2 +-
 include/net/page_pool/helpers.h               |  11 ++
 include/net/page_pool/types.h                 |  15 +-
 net/core/devmem.c                             |   2 +-
 net/core/page_pool.c                          | 176 +++++++++++++++---
 net/core/page_pool_priv.h                     |   9 +-
 net/core/skbuff.c                             |   3 +-
 net/core/xdp.c                                |   3 +-
 18 files changed, 219 insertions(+), 49 deletions(-)

-- 
2.33.0


