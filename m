Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6978BCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ImhlWRXvbZcIMYBECVTU9j9TO6/b3RTKXFtC3mkjsj8=; b=ty/4KZ9VaVEaXxjIDd4dm9aEq4
	tSYKi2xkM5qTjQr8vnKDjuljm2PzftSX1u0G1N6Cx1ha42Sbh7tcKBE3rj7basV6GyEOKaa8p/ou4
	soKoIB8ZqQ2cQhLg3dv4BypHnWQOzsUG1aotkakl80u4pV4DhL1Wp4lnBF4SN8fz1E5ektae5ODcu
	qE/aW6jGWvZS+Sk54nKbRN0KrFSpqLlhM9GmPmRYcPXKyv2b18i30NzbG9E7ne0+vqQsKHRsR1as5
	zlvrUYCfCUmn5MJyiyJ19FFNTkccRhnHGX960eeZVU+Aa/oWfK8u4CYHUZ1adUsCSMhg3qvjdH1Vi
	7HWD+3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppzx-0000000E971-09Ou;
	Thu, 28 Mar 2024 13:40:53 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppzs-0000000E93w-1eea;
	Thu, 28 Mar 2024 13:40:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V54Ng4jTvz1R88n;
	Thu, 28 Mar 2024 21:37:55 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (unknown [7.185.36.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 83CC11402CA;
	Thu, 28 Mar 2024 21:40:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggpemm500005.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 21:40:36 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Yunsheng Lin
	<linyunsheng@huawei.com>, Alexander Duyck <alexander.duyck@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<bpf@vger.kernel.org>
Subject: [PATCH RFC 00/10] First try to replace page_frag with page_frag_cache
Date: Thu, 28 Mar 2024 21:38:29 +0800
Message-ID: <20240328133839.13620-1-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_064048_865503_C950F7E9 
X-CRM114-Status: GOOD (  14.20  )
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

After [1], Only there are two implementations for page frag:

1. mm/page_alloc.c: net stack seems to be using it in the
   rx part with 'struct page_frag_cache' and the main API
   being page_frag_alloc_align().
2. net/core/sock.c: net stack seems to be using it in the
   tx part with 'struct page_frag' and the main API being
   skb_page_frag_refill().

This patchset tries to unfiy the page frag implementation
by replacing page_frag with page_frag_cache for sk_page_frag()
first. And will try to replace the rest of page_frag in the
follow patchset.

After this patchset, we are not only able to unify the page
frag implementation a little, but seems able to have about
0.5% performance boost testing by using the vhost_net_test
introduced in [1] too.

Before this patch:
Performance counter stats for './vhost_net_test' (10 runs):

         603027.29 msec task-clock                       #    1.756 CPUs utilized               ( +-  0.04% )
           2097713      context-switches                 #    3.479 K/sec                       ( +-  0.00% )
               212      cpu-migrations                   #    0.352 /sec                        ( +-  4.72% )
                40      page-faults                      #    0.066 /sec                        ( +-  1.18% )
      467215266413      cycles                           #    0.775 GHz                         ( +-  0.12% )  (66.02%)
      131736729037      stalled-cycles-frontend          #   28.20% frontend cycles idle        ( +-  2.38% )  (64.34%)
       77728393294      stalled-cycles-backend           #   16.64% backend cycles idle         ( +-  3.98% )  (65.42%)
      345874254764      instructions                     #    0.74  insn per cycle
                                                  #    0.38  stalled cycles per insn     ( +-  0.75% )  (70.28%)
      105166217892      branches                         #  174.397 M/sec                       ( +-  0.65% )  (68.56%)
        9649321070      branch-misses                    #    9.18% of all branches             ( +-  0.69% )  (65.38%)

           343.376 +- 0.147 seconds time elapsed  ( +-  0.04% )


After this patch:
Performance counter stats for './vhost_net_test' (10 runs):

         598081.02 msec task-clock                       #    1.752 CPUs utilized               ( +-  0.11% )
           2097738      context-switches                 #    3.507 K/sec                       ( +-  0.00% )
               220      cpu-migrations                   #    0.368 /sec                        ( +-  6.58% )
                40      page-faults                      #    0.067 /sec                        ( +-  0.92% )
      469788205101      cycles                           #    0.785 GHz                         ( +-  0.27% )  (64.86%)
      137108509582      stalled-cycles-frontend          #   29.19% frontend cycles idle        ( +-  0.96% )  (63.62%)
       75499065401      stalled-cycles-backend           #   16.07% backend cycles idle         ( +-  1.04% )  (65.86%)
      345469451681      instructions                     #    0.74  insn per cycle
                                                  #    0.40  stalled cycles per insn     ( +-  0.37% )  (70.16%)
      102782224964      branches                         #  171.853 M/sec                       ( +-  0.62% )  (69.28%)
        9295357532      branch-misses                    #    9.04% of all branches             ( +-  1.08% )  (66.21%)

           341.466 +- 0.305 seconds time elapsed  ( +-  0.09% )

CC: Alexander Duyck <alexander.duyck@gmail.com>

1. https://lore.kernel.org/all/20240228093013.8263-1-linyunsheng@huawei.com/

Yunsheng Lin (10):
  mm: Move the page fragment allocator from page_alloc into its own file
  mm: page_frag: use initial zero offset for page_frag_alloc_align()
  mm: page_frag: change page_frag_alloc_* API to accept align param
  mm: page_frag: add '_va' suffix to page_frag API
  mm: page_frag: add two inline helper for page_frag API
  mm: page_frag: reuse MSB of 'size' field for pfmemalloc
  mm: page_frag: reuse existing bit field of 'va' for pagecnt_bias
  net: introduce the skb_copy_to_va_nocache() helper
  mm: page_frag: introduce prepare/commit API for page_frag
  net: replace page_frag with page_frag_cache

 drivers/net/ethernet/google/gve/gve_rx.c      |   4 +-
 drivers/net/ethernet/intel/ice/ice_txrx.c     |   2 +-
 drivers/net/ethernet/intel/ice/ice_txrx.h     |   2 +-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.c |   2 +-
 .../net/ethernet/intel/ixgbevf/ixgbevf_main.c |   4 +-
 .../marvell/octeontx2/nic/otx2_common.c       |   2 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    |   4 +-
 drivers/net/tun.c                             |  36 ++---
 drivers/nvme/host/tcp.c                       |   8 +-
 drivers/nvme/target/tcp.c                     |  22 +--
 drivers/vhost/net.c                           |   6 +-
 include/linux/gfp.h                           |  22 ---
 include/linux/mm_types.h                      |  18 ---
 include/linux/page_frag_cache.h               | 142 ++++++++++++++++
 include/linux/sched.h                         |   5 +-
 include/linux/skbuff.h                        |  15 +-
 include/net/sock.h                            |  22 ++-
 kernel/bpf/cpumap.c                           |   2 +-
 kernel/exit.c                                 |   3 +-
 kernel/fork.c                                 |   2 +-
 mm/Makefile                                   |   1 +
 mm/page_alloc.c                               | 136 ----------------
 mm/page_frag_alloc.c                          | 152 ++++++++++++++++++
 net/core/skbuff.c                             |  54 ++++---
 net/core/skmsg.c                              |  24 +--
 net/core/sock.c                               |  24 +--
 net/core/xdp.c                                |   2 +-
 net/ipv4/ip_output.c                          |  37 +++--
 net/ipv4/tcp.c                                |  33 ++--
 net/ipv4/tcp_output.c                         |  30 ++--
 net/ipv6/ip6_output.c                         |  37 +++--
 net/kcm/kcmsock.c                             |  28 ++--
 net/mptcp/protocol.c                          |  72 ++++++---
 net/rxrpc/txbuf.c                             |  16 +-
 net/sunrpc/svcsock.c                          |   4 +-
 net/tls/tls_device.c                          | 139 +++++++++-------
 36 files changed, 661 insertions(+), 451 deletions(-)
 create mode 100644 include/linux/page_frag_cache.h
 create mode 100644 mm/page_frag_alloc.c

-- 
2.33.0


