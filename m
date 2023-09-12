Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874ACCA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+qsvhu+tedpf3yTZrlX4HmHQAfKSf/cV53E6IiVQx5c=; b=iodQoHDvoZb29RjrnFHcbHJNmY
	+PXHb5zPsH8lH8qcgFjAzqOiIUFJRt1wjDxZSvcjkc4G8IRknW1/avBoc4tMQUtAI2FarOFOIFSDU
	psybG+NVMU9d1N9a85581esJkKCxQXq1EAwVvqiTQhO2oz+0VgxFQqr7UdQmvG9AS5AXh/+JPHs7Z
	26VzUPfBWg3iWSE2yRcR7dCIlPVIpaNBiOOz+raLsr5rfGarjiKU/b6YzXFYZSiuLZUubYLF76yK9
	s9rAH9enmiy2UHLMipw4NbCLHXmcM1JA2nMZuiSEsoBUn70p2HE05uMxoPjvGf0YDfBF9ZOfn5tQi
	z/Xfv2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyrI-002ahA-1W;
	Tue, 12 Sep 2023 08:34:56 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyrE-002adD-14;
	Tue, 12 Sep 2023 08:34:54 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RlGyD5V9wzMlK5;
	Tue, 12 Sep 2023 16:31:16 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggpemm500005.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 12 Sep 2023 16:34:42 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Yunsheng Lin
	<linyunsheng@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<bpf@vger.kernel.org>
Subject: [PATCH net-next v8 0/6] introduce page_pool_alloc() related API
Date: Tue, 12 Sep 2023 16:31:19 +0800
Message-ID: <20230912083126.65484-1-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_013452_734271_2B0DB1A6 
X-CRM114-Status: GOOD (  15.76  )
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

In [1] & [2] & [3], there are usecases for veth and virtio_net
to use frag support in page pool to reduce memory usage, and it
may request different frag size depending on the head/tail
room space for xdp_frame/shinfo and mtu/packet size. When the
requested frag size is large enough that a single page can not
be split into more than one frag, using frag support only have
performance penalty because of the extra frag count handling
for frag support.

So this patchset provides a page pool API for the driver to
allocate memory with least memory utilization and performance
penalty when it doesn't know the size of memory it need
beforehand.

1. https://patchwork.kernel.org/project/netdevbpf/patch/d3ae6bd3537fbce379382ac6a42f67e22f27ece2.1683896626.git.lorenzo@kernel.org/
2. https://patchwork.kernel.org/project/netdevbpf/patch/20230526054621.18371-3-liangchen.linux@gmail.com/
3. https://github.com/alobakin/linux/tree/iavf-pp-frag

V8: Store the dma addr on a shifted u32 instead of using
    dma_addr_t explicitly for 32-bit arch with 64-bit DMA.
    Update document according to discussion in v7.

V7: Fix a compile error, a few typo and use kernel-doc syntax.

V6: Add a PP_FLAG_PAGE_SPLIT_IN_DRIVER flag to fail the page_pool
    creation for 32-bit arch with 64-bit DMA when driver tries to
    do the page splitting itself, adjust the requested size to
    include head/tail room in veth, and rebased on the latest
    next-net.

v5 RFC: Add a new page_pool_cache_alloc() API, and other minor
        change as discussed in v4. As there seems to be three
        comsumers that might be made use of the new API, so
        repost it as RFC and CC the relevant authors to see
        if the new API fits their need.

V4. Fix a typo and add a patch to update document about frag
    API, PAGE_POOL_DMA_USE_PP_FRAG_COUNT is not renamed yet
    as we may need a different thread to discuss that.

V3: Incorporate changes from the disscusion with Alexander,
    mostly the inline wraper, PAGE_POOL_DMA_USE_PP_FRAG_COUNT
    change split to separate patch and comment change.
V2: Add patch to remove PP_FLAG_PAGE_FRAG flags and mention
    virtio_net usecase in the cover letter.
V1: Drop RFC tag and page_pool_frag patch.

Yunsheng Lin (6):
  page_pool: frag API support for 32-bit arch with 64-bit DMA
  page_pool: unify frag_count handling in page_pool_is_last_frag()
  page_pool: remove PP_FLAG_PAGE_FRAG
  page_pool: introduce page_pool[_cache]_alloc() API
  page_pool: update document about frag API
  net: veth: use newly added page pool API for veth with xdp

 Documentation/networking/page_pool.rst        |   4 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |   2 -
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   |   3 +-
 .../marvell/octeontx2/nic/otx2_common.c       |   2 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |   2 +-
 drivers/net/veth.c                            |  25 +-
 drivers/net/wireless/mediatek/mt76/mac80211.c |   2 +-
 include/linux/mm_types.h                      |  13 +-
 include/net/page_pool/helpers.h               | 225 +++++++++++++++---
 include/net/page_pool/types.h                 |   6 +-
 net/core/page_pool.c                          |  31 ++-
 net/core/skbuff.c                             |   2 +-
 12 files changed, 240 insertions(+), 77 deletions(-)

-- 
2.33.0


