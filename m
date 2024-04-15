Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A701C04FF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHYEz7SzmEby4jGmWMNx7AaV2jSW/Ek3c/x75YvZeuY=; b=uESXuE+EPoZLkAA3AjeufZ2R6L
	+I6mxtqsZQSPmqvjg49ybg6u9DDdrW07bYfAvjoKVNH59tIyIT6Fh2j5w0sZdosLbV/fHtKCYDe8g
	zRrnRciPZIVtzOLL76YbrChUAtJaH4xENsRzHQr+9p2k9opXlZA5XoE21mg/BHztboSpNoyjH9P+1
	FQJyVZ3nIad5cmXCb9uzPrIcO75UNYD8MROD0jgTBdcHoabbhGd9uB9Zb9J0KgDQ0a7Z/fk3vSiWf
	KEAtT92st3IcyBdbWdGDzobhTIx3gskE1MiKWLj3scUo4DL8544R82CqhdJ/pZo40lNxB0zfvP/kC
	GD0yBLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMHa-00000008RYk-3K5R;
	Mon, 15 Apr 2024 13:22:02 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMHW-00000008RWd-0WgE;
	Mon, 15 Apr 2024 13:22:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VJ76Q0FWGz1fxb9;
	Mon, 15 Apr 2024 21:18:54 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (unknown [7.185.36.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C106C180063;
	Mon, 15 Apr 2024 21:21:50 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggpemm500005.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 21:21:50 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Yunsheng Lin
	<linyunsheng@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<bpf@vger.kernel.org>
Subject: [PATCH net-next v2 00/15] First try to replace page_frag with page_frag_cache
Date: Mon, 15 Apr 2024 21:19:25 +0800
Message-ID: <20240415131941.51153-1-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_062158_559700_F7A234A7 
X-CRM114-Status: GOOD (  18.56  )
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

After [1], there are still two implementations for page frag:

1. mm/page_alloc.c: net stack seems to be using it in the
   rx part with 'struct page_frag_cache' and the main API
   being page_frag_alloc_align().
2. net/core/sock.c: net stack seems to be using it in the
   tx part with 'struct page_frag' and the main API being
   skb_page_frag_refill().

This patchset tries to unfiy the page frag implementation
by replacing page_frag with page_frag_cache for sk_page_frag()
first. net_high_order_alloc_disable_key for the implementation
in net/core/sock.c doesn't seems matter that much now have
have pcp support for high-order pages in commit 44042b449872
("mm/page_alloc: allow high-order pages to be stored on the
per-cpu lists").

As the related change is mostly related to networking, so
targeting the net-next. And will try to replace the rest
of page_frag in the follow patchset.

After this patchset:
1. Unify the page frag implementation by taking the best out of
   two the existing implementations: we are able to save some space
   for the 'page_frag_cache' API user, and avoid 'get_page()' for
   the old 'page_frag' API user.
2. Future bugfix and performance can be done in one place, hence
   improving maintainability of page_frag's implementation.

Performance validation:
1. Using micro-benchmark ko added in patch 1, we have about 3.2%
   performance boot for the 'page_frag_cache' after this patchset.

2. Use the below netcat test case, we have about 1.9% performance
   boot for repalcing 'page_frag' with 'page_frag_cache' after this
   patchset.
   server: nc -l -k 1234 > /dev/null
   client: perf stat -r 30 -- head -c 51200000000 /dev/zero | nc -N 127.0.0.1 1234


In order to avoid performance noise as much as possible, the testing
is done in system without any other laod and have enough iterations to
prove the data is stable enogh, complete log for testing is below:

*After* this patchset:
 insmod ./page_frag_test.ko nr_test=99999999
 Performance counter stats for 'insmod ./page_frag_test.ko nr_test=99999999' (30 runs):

             40.09 msec task-clock                       #    0.001 CPUs utilized               ( +-  4.60% )
                 5      context-switches                 #  124.722 /sec                        ( +-  3.45% )
                 1      cpu-migrations                   #   24.944 /sec                        ( +- 12.62% )
               197      page-faults                      #    4.914 K/sec                       ( +-  0.11% )
          10221721      cycles                           #    0.255 GHz                         ( +-  9.05% )  (27.73%)
           2459009      stalled-cycles-frontend          #   24.06% frontend cycles idle        ( +- 10.80% )  (29.05%)
           5148423      stalled-cycles-backend           #   50.37% backend cycles idle         ( +-  7.30% )  (82.47%)
           5889929      instructions                     #    0.58  insn per cycle
                                                  #    0.87  stalled cycles per insn     ( +- 11.85% )  (87.75%)
           1276667      branches                         #   31.846 M/sec                       ( +- 11.48% )  (89.80%)
             50631      branch-misses                    #    3.97% of all branches             ( +-  8.72% )  (83.20%)

            29.341 +- 0.300 seconds time elapsed  ( +-  1.02% )

 perf stat -r 30 -- head -c 51200000000 /dev/zero | nc -N 127.0.0.1 1234
 Performance counter stats for 'head -c 51200000000 /dev/zero' (30 runs):

         107793.53 msec task-clock                       #    0.881 CPUs utilized               ( +-  0.36% )
            380421      context-switches                 #    3.529 K/sec                       ( +-  0.32% )
               374      cpu-migrations                   #    3.470 /sec                        ( +-  1.31% )
                74      page-faults                      #    0.686 /sec                        ( +-  0.28% )
       92758718093      cycles                           #    0.861 GHz                         ( +-  0.48% )  (69.47%)
        7035559641      stalled-cycles-frontend          #    7.58% frontend cycles idle        ( +-  1.19% )  (69.65%)
       33668082825      stalled-cycles-backend           #   36.30% backend cycles idle         ( +-  0.84% )  (70.18%)
       52424770535      instructions                     #    0.57  insn per cycle
                                                  #    0.64  stalled cycles per insn     ( +-  0.26% )  (61.93%)
       13240874953      branches                         #  122.836 M/sec                       ( +-  0.40% )  (60.36%)
         208178019      branch-misses                    #    1.57% of all branches             ( +-  0.65% )  (68.42%)

           122.294 +- 0.402 seconds time elapsed  ( +-  0.33% )


*Before* this patchset:
 insmod ./page_frag_test.ko nr_test=99999999
 Performance counter stats for 'insmod ./page_frag_test.ko nr_test=99999999' (30 runs):

             39.12 msec task-clock                       #    0.001 CPUs utilized               ( +-  4.51% )
                 5      context-switches                 #  127.805 /sec                        ( +-  3.76% )
                 1      cpu-migrations                   #   25.561 /sec                        ( +- 15.52% )
               197      page-faults                      #    5.035 K/sec                       ( +-  0.10% )
          10689913      cycles                           #    0.273 GHz                         ( +-  9.46% )  (72.72%)
           2821237      stalled-cycles-frontend          #   26.39% frontend cycles idle        ( +- 12.04% )  (76.23%)
           5035549      stalled-cycles-backend           #   47.11% backend cycles idle         ( +-  9.69% )  (49.40%)
           5439395      instructions                     #    0.51  insn per cycle
                                                  #    0.93  stalled cycles per insn     ( +- 11.58% )  (51.45%)
           1274419      branches                         #   32.575 M/sec                       ( +- 12.69% )  (77.88%)
             49562      branch-misses                    #    3.89% of all branches             ( +-  9.91% )  (72.32%)

            30.309 +- 0.305 seconds time elapsed  ( +-  1.01% )

 perf stat -r 30 -- head -c 51200000000 /dev/zero | nc -N 127.0.0.1 1234
 Performance counter stats for 'head -c 51200000000 /dev/zero' (30 runs):

         110198.93 msec task-clock                       #    0.884 CPUs utilized               ( +-  0.83% )
            387680      context-switches                 #    3.518 K/sec                       ( +-  0.85% )
               366      cpu-migrations                   #    3.321 /sec                        ( +- 11.38% )
                74      page-faults                      #    0.672 /sec                        ( +-  0.27% )
       92978008685      cycles                           #    0.844 GHz                         ( +-  0.49% )  (64.93%)
        7339938950      stalled-cycles-frontend          #    7.89% frontend cycles idle        ( +-  1.48% )  (67.15%)
       34783792329      stalled-cycles-backend           #   37.41% backend cycles idle         ( +-  1.52% )  (68.96%)
       51704527141      instructions                     #    0.56  insn per cycle
                                                  #    0.67  stalled cycles per insn     ( +-  0.37% )  (68.28%)
       12865503633      branches                         #  116.748 M/sec                       ( +-  0.88% )  (66.11%)
         212414695      branch-misses                    #    1.65% of all branches             ( +-  0.45% )  (64.57%)

           124.664 +- 0.990 seconds time elapsed  ( +-  0.79% )


Note, ipv4-udp, ipv6-tcp and ipv6-udp is also tested with the below script:
nc -u -l -k 1234 > /dev/null
perf stat -r 4 -- head -c 51200000000 /dev/zero | nc -N -u 127.0.0.1 1234

nc -l6 -k 1234 > /dev/null
perf stat -r 4 -- head -c 51200000000 /dev/zero | nc -N ::1 1234

nc -l6 -k -u 1234 > /dev/null
perf stat -r 4 -- head -c 51200000000 /dev/zero | nc -u -N ::1 1234


Change log:
V2:
   1. reorder test module to patch 1.
   2. split doc and maintainer updating to two patches.
   3. refactor the page_frag before moving.
   4. fix a type and 'static' warning in test module.
   5. add a patch for xtensa arch to enable using get_order() in
      BUILD_BUG_ON().
   6. Add test case and performance data for the socket code.

Yunsheng Lin (15):
  mm: page_frag: add a test module for page_frag
  xtensa: remove the get_order() implementation
  mm: page_frag: use free_unref_page() to free page fragment
  mm: move the page fragment allocator from page_alloc into its own file
  mm: page_frag: use initial zero offset for page_frag_alloc_align()
  mm: page_frag: change page_frag_alloc_* API to accept align param
  mm: page_frag: add '_va' suffix to page_frag API
  mm: page_frag: add two inline helper for page_frag API
  mm: page_frag: reuse MSB of 'size' field for pfmemalloc
  mm: page_frag: reuse existing bit field of 'va' for pagecnt_bias
  net: introduce the skb_copy_to_va_nocache() helper
  mm: page_frag: introduce prepare/commit API for page_frag
  net: replace page_frag with page_frag_cache
  mm: page_frag: update documentation for page_frag
  mm: page_frag: add a entry in MAINTAINERS for page_frag

 Documentation/mm/page_frags.rst               | 148 ++++++-
 MAINTAINERS                                   |  11 +
 arch/xtensa/include/asm/page.h                |  18 -
 .../chelsio/inline_crypto/chtls/chtls.h       |   3 -
 .../chelsio/inline_crypto/chtls/chtls_io.c    | 101 ++---
 .../chelsio/inline_crypto/chtls/chtls_main.c  |   3 -
 drivers/net/ethernet/google/gve/gve_rx.c      |   4 +-
 drivers/net/ethernet/intel/ice/ice_txrx.c     |   2 +-
 drivers/net/ethernet/intel/ice/ice_txrx.h     |   2 +-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.c |   2 +-
 .../net/ethernet/intel/ixgbevf/ixgbevf_main.c |   4 +-
 .../marvell/octeontx2/nic/otx2_common.c       |   2 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    |   4 +-
 drivers/net/tun.c                             |  34 +-
 drivers/nvme/host/tcp.c                       |   8 +-
 drivers/nvme/target/tcp.c                     |  22 +-
 drivers/vhost/net.c                           |   6 +-
 include/linux/gfp.h                           |  22 --
 include/linux/mm_types.h                      |  18 -
 include/linux/page_frag_cache.h               | 344 +++++++++++++++++
 include/linux/sched.h                         |   4 +-
 include/linux/skbuff.h                        |  15 +-
 include/net/sock.h                            |  29 +-
 kernel/bpf/cpumap.c                           |   2 +-
 kernel/exit.c                                 |   3 +-
 kernel/fork.c                                 |   2 +-
 mm/Kconfig.debug                              |   8 +
 mm/Makefile                                   |   2 +
 mm/page_alloc.c                               | 136 -------
 mm/page_frag_cache.c                          | 154 ++++++++
 mm/page_frag_test.c                           | 365 ++++++++++++++++++
 net/core/skbuff.c                             |  57 +--
 net/core/skmsg.c                              |  22 +-
 net/core/sock.c                               |  46 ++-
 net/core/xdp.c                                |   2 +-
 net/ipv4/ip_output.c                          |  35 +-
 net/ipv4/tcp.c                                |  35 +-
 net/ipv4/tcp_output.c                         |  28 +-
 net/ipv6/ip6_output.c                         |  35 +-
 net/kcm/kcmsock.c                             |  30 +-
 net/mptcp/protocol.c                          |  74 ++--
 net/rxrpc/txbuf.c                             |  16 +-
 net/sunrpc/svcsock.c                          |   6 +-
 net/tls/tls_device.c                          | 139 ++++---
 44 files changed, 1450 insertions(+), 553 deletions(-)
 create mode 100644 include/linux/page_frag_cache.h
 create mode 100644 mm/page_frag_cache.c
 create mode 100644 mm/page_frag_test.c

-- 
2.33.0


