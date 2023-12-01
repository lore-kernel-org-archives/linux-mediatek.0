Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024B7C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ESJ1HuR7rRh2sV+CCCW8Ff2xuMHj92erwwqCVuw6Cpw=; b=EQw/pmYYfQ6bmoS7l7sMyfmKE7
	W/PEx1Tjd5++z9Tj/4ZCL1ylA1QX67dZO1xxngpt4SBwU/sdlg5d0HArjTTmEezKtEo8/hpO3fuGp
	v5y6kP6MwABVRFnIs9WCv8N2pY90nLpBbTyWaOy5mOKn86rnf7i+zAj73rT5nYnjbF2KyCaimWdID
	VPi+2UyODCgHUwDywhPRiprji5leIlFPfSI8IdF2DzoNUV+yYOynzpId6C54LnJjc/rE1MgrZx9cS
	zjEBdX5VCDFm/CVigT2lBFptAf7tX/6btIPV+bN1uLuOulHKhdFANuUtVykhOscnG8i/LxNV10fhg
	2qwHYOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r92E3-00DVcq-28;
	Fri, 01 Dec 2023 12:02:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r92Dz-00DVXL-26;
	Fri, 01 Dec 2023 12:02:29 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ShWmR59KNzsRTC;
	Fri,  1 Dec 2023 19:58:31 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggpemm500005.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Dec 2023 20:02:12 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Yunsheng Lin
	<linyunsheng@huawei.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH RFC 0/6] remove page frag implementation in vhost_net
Date: Fri, 1 Dec 2023 20:02:01 +0800
Message-ID: <20231201120208.15080-1-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_040228_017991_C2314EFE 
X-CRM114-Status: GOOD (  10.19  )
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

Currently there are three implementations for page frag:

1. mm/page_alloc.c: net stack seems to be using it in the
   rx part with 'struct page_frag_cache' and the main API
   being page_frag_alloc_align().
2. net/core/sock.c: net stack seems to be using it in the
   tx part with 'struct page_frag' and the main API being
   skb_page_frag_refill().
3. drivers/vhost/net.c: vhost seems to be using it to build
   xdp frame, and it's implementation seems to be a mix of
   the above two.

This patch tries to unfiy the page frag implementation a
little bit by unifying gfp bit for order 3 page allocation
and replacing page frag implementation in vhost.c with the
one in page_alloc.c.

After this patchset, we are not only able to unify the page
frag implementation a little, but also able to have about
0.5% performance boost testing by using the vhost_net_test
introduced in the last patch.

Before this patchset:
Performance counter stats for './vhost_net_test' (10 runs):

     305325.78 msec task-clock                       #    1.738 CPUs utilized               ( +-  0.12% )
       1048668      context-switches                 #    3.435 K/sec                       ( +-  0.00% )
            11      cpu-migrations                   #    0.036 /sec                        ( +- 17.64% )
            33      page-faults                      #    0.108 /sec                        ( +-  0.49% )
  244651819491      cycles                           #    0.801 GHz                         ( +-  0.43% )  (64)
   64714638024      stalled-cycles-frontend          #   26.45% frontend cycles idle        ( +-  2.19% )  (67)
   30774313491      stalled-cycles-backend           #   12.58% backend cycles idle         ( +-  7.68% )  (70)
  201749748680      instructions                     #    0.82  insn per cycle            
                                              #    0.32  stalled cycles per insn     ( +-  0.41% )  (66.76%)
   65494787909      branches                         #  214.508 M/sec                       ( +-  0.35% )  (64)
    4284111313      branch-misses                    #    6.54% of all branches             ( +-  0.45% )  (66)

       175.699 +- 0.189 seconds time elapsed  ( +-  0.11% )


After this patchset:
Performance counter stats for './virtio_test' (10 runs):

     303974.38 msec task-clock                       #    1.739 CPUs utilized               ( +-  0.14% )
       1048807      context-switches                 #    3.450 K/sec                       ( +-  0.00% )
            14      cpu-migrations                   #    0.046 /sec                        ( +- 12.86% )
            33      page-faults                      #    0.109 /sec                        ( +-  0.46% )
  251289376347      cycles                           #    0.827 GHz                         ( +-  0.32% )  (60)
   67885175415      stalled-cycles-frontend          #   27.01% frontend cycles idle        ( +-  0.48% )  (63)
   27809282600      stalled-cycles-backend           #   11.07% backend cycles idle         ( +-  0.36% )  (71)
  195543234672      instructions                     #    0.78  insn per cycle            
                                              #    0.35  stalled cycles per insn     ( +-  0.29% )  (69.04%)
   62423183552      branches                         #  205.357 M/sec                       ( +-  0.48% )  (67)
    4135666632      branch-misses                    #    6.63% of all branches             ( +-  0.63% )  (67)

       174.764 +- 0.214 seconds time elapsed  ( +-  0.12% )


Yunsheng Lin (6):
  mm/page_alloc: modify page_frag_alloc_align() to accept align as an
    argument
  page_frag: unify gfp bit for order 3 page allocation
  mm/page_alloc: use initial zero offset for page_frag_alloc_align()
  vhost/net: remove vhost_net_page_frag_refill()
  net: introduce page_frag_cache_drain()
  tools: virtio: introduce vhost_net_test

 drivers/net/ethernet/google/gve/gve_main.c |  11 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c |  17 +-
 drivers/nvme/host/tcp.c                    |   7 +-
 drivers/nvme/target/tcp.c                  |   4 +-
 drivers/vhost/net.c                        |  91 ++---
 include/linux/gfp.h                        |   6 +-
 include/linux/skbuff.h                     |  22 +-
 mm/page_alloc.c                            |  48 ++-
 net/core/skbuff.c                          |  14 +-
 net/core/sock.c                            |   2 +-
 tools/virtio/Makefile                      |   8 +-
 tools/virtio/vhost_net_test.c              | 441 +++++++++++++++++++++
 12 files changed, 524 insertions(+), 147 deletions(-)
 create mode 100644 tools/virtio/vhost_net_test.c

-- 
2.33.0


