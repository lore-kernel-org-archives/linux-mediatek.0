Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110CAC67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TYgCFyRlI1iTv2tcyJ+PG3jxVx5/GPjyqoQsuNov1k=; b=LfcY4rGNJCchYjGzLkF7rYiKc+
	wUm6lfopUOeyabMYjkn406kaT65Jfw+hHVK+6+g00kBgXABpnjnDqqVdIdaqpZFlfiuHoRLYZxb8j
	aaXDzYFNQ7mNRAAuBxombzFsexCn8qxc9w+hyFSirwETcEcncbGeG/MWrB/U38BmqsdD+39kVNHbC
	j4Eu5XslVWhjfbvKBO9JUoNjv3zigpI8U9860Z9CjaJNjaTddl8rwm7GMHxNtjhRu7QECbtnsn4wG
	ysUdvFUh2zrmUcJSuE7hlouzYuAaid4HtIT6UOgmIOOHLZc1zB/hxUFlXK7WY+V0kLsoHV8gZ6de9
	cKETac6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjkC-0000000EkKi-372M;
	Mon, 08 Apr 2024 07:48:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjk8-0000000EkIJ-2sMF
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 07:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712562519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TYgCFyRlI1iTv2tcyJ+PG3jxVx5/GPjyqoQsuNov1k=;
	b=GZEcPakAoDZuQh52tfqPVCRYFrGzSXDnygxPVQnsVHRhf03StmPxxklsP/DQzqXZ82L91T
	MbfSjhP1d/qVmAKOszfnXFXP3Ffft7jwQbuy20M4elD9JEPl/5nfB4pd8SuyZWZY9s05jK
	viJYQ4RlLbqxwEHoAYXtQsCKTraPWzc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-U1P3lAJsO0-4JT5SjvbyRQ-1; Mon, 08 Apr 2024 03:48:37 -0400
X-MC-Unique: U1P3lAJsO0-4JT5SjvbyRQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-343c86edeb7so2268061f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Apr 2024 00:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562512; x=1713167312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TYgCFyRlI1iTv2tcyJ+PG3jxVx5/GPjyqoQsuNov1k=;
        b=SbYGdNi97KOl1FesKMQzJ16Z48AAYmXDx1ckw5NV4MGxDUz56XeeW0k9iO55AnAxlb
         qjE2bxItu/r0JtJD433t7LMDg+FdiFhy9u0WEVk3a0hAepLNUtSXPfHpiIGfZs6+RYId
         hf729+fA3hPvbIWtYwgBtmTO0p62nJWPP+yPnJ6K3giWkROHRUk3sYsFKCgZZdl/VMSy
         qaEul7m9KWyCQzbKe2Dr/QSputDQuYIGAPcsYetNuh58R74JZkUQsjwCtFub7zyEIg95
         6/jqeUsmf047J8dP+c4KXdoTWe266HBtrsf1UFr4p3/jZFaS4EbqZkfTej8/rj9ohWxO
         xgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cg8Wy3Jrb7pArIHfVVz2SJoMkkKb4G0QL72QGKJxPp33tAiCqBSVeRJ7gXP0FKAMS2BCFa3YF6oRqol7Ana+7lE1t6gjDtNM/CZgL3GV+Nnv
X-Gm-Message-State: AOJu0YyqPmQdWo6XJ5SFMXqEeSGwwen+gP59p1n9sXjyXUmavsbT2PWi
	cRgAWdkK/TotDgSzNjL6ENJvKfDAyEVQpotX3c06xuasXtu4APkc7g40J/FDvKkX6b0oipUykXx
	kp3GAcq9v98F3qHqoKm8ulINm+QbKnW9it/0ISZdt8h+BpEJH0DZybCYWJpvGwc8R9sw5Fg==
X-Received: by 2002:a5d:6048:0:b0:33e:a5e1:eccc with SMTP id j8-20020a5d6048000000b0033ea5e1ecccmr6531795wrt.68.1712562511804;
        Mon, 08 Apr 2024 00:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdSMdusIIBkkxRUY3+EQubBPog0K+ZjLJesgUXee5bP5avEYpbgMpmWO+ePhpK1P9BnrPA5g==
X-Received: by 2002:a5d:6048:0:b0:33e:a5e1:eccc with SMTP id j8-20020a5d6048000000b0033ea5e1ecccmr6531772wrt.68.1712562511220;
        Mon, 08 Apr 2024 00:48:31 -0700 (PDT)
Received: from redhat.com ([2.52.152.188])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d4564000000b00343826878e8sm8278091wrc.38.2024.04.08.00.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:48:30 -0700 (PDT)
Date: Mon, 8 Apr 2024 03:48:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/5] remove page frag implementation in
 vhost_net
Message-ID: <20240408034726-mutt-send-email-mst@kernel.org>
References: <20240228093013.8263-1-linyunsheng@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20240228093013.8263-1-linyunsheng@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_004840_983548_666F5E0C 
X-CRM114-Status: GOOD (  23.95  )
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

On Wed, Feb 28, 2024 at 05:30:07PM +0800, Yunsheng Lin wrote:
> Currently there are three implementations for page frag:
> 
> 1. mm/page_alloc.c: net stack seems to be using it in the
>    rx part with 'struct page_frag_cache' and the main API
>    being page_frag_alloc_align().
> 2. net/core/sock.c: net stack seems to be using it in the
>    tx part with 'struct page_frag' and the main API being
>    skb_page_frag_refill().
> 3. drivers/vhost/net.c: vhost seems to be using it to build
>    xdp frame, and it's implementation seems to be a mix of
>    the above two.
> 
> This patchset tries to unfiy the page frag implementation a
> little bit by unifying gfp bit for order 3 page allocation
> and replacing page frag implementation in vhost.c with the
> one in page_alloc.c.
> 
> After this patchset, we are not only able to unify the page
> frag implementation a little, but also able to have about
> 0.5% performance boost testing by using the vhost_net_test
> introduced in the last patch.
> 
> Before this patchset:
> Performance counter stats for './vhost_net_test' (10 runs):
> 
>      305325.78 msec task-clock                       #    1.738 CPUs utilized               ( +-  0.12% )
>        1048668      context-switches                 #    3.435 K/sec                       ( +-  0.00% )
>             11      cpu-migrations                   #    0.036 /sec                        ( +- 17.64% )
>             33      page-faults                      #    0.108 /sec                        ( +-  0.49% )
>   244651819491      cycles                           #    0.801 GHz                         ( +-  0.43% )  (64)
>    64714638024      stalled-cycles-frontend          #   26.45% frontend cycles idle        ( +-  2.19% )  (67)
>    30774313491      stalled-cycles-backend           #   12.58% backend cycles idle         ( +-  7.68% )  (70)
>   201749748680      instructions                     #    0.82  insn per cycle
>                                               #    0.32  stalled cycles per insn     ( +-  0.41% )  (66.76%)
>    65494787909      branches                         #  214.508 M/sec                       ( +-  0.35% )  (64)
>     4284111313      branch-misses                    #    6.54% of all branches             ( +-  0.45% )  (66)
> 
>        175.699 +- 0.189 seconds time elapsed  ( +-  0.11% )
> 
> 
> After this patchset:
> Performance counter stats for './vhost_net_test' (10 runs):
> 
>      303974.38 msec task-clock                       #    1.739 CPUs utilized               ( +-  0.14% )
>        1048807      context-switches                 #    3.450 K/sec                       ( +-  0.00% )
>             14      cpu-migrations                   #    0.046 /sec                        ( +- 12.86% )
>             33      page-faults                      #    0.109 /sec                        ( +-  0.46% )
>   251289376347      cycles                           #    0.827 GHz                         ( +-  0.32% )  (60)
>    67885175415      stalled-cycles-frontend          #   27.01% frontend cycles idle        ( +-  0.48% )  (63)
>    27809282600      stalled-cycles-backend           #   11.07% backend cycles idle         ( +-  0.36% )  (71)
>   195543234672      instructions                     #    0.78  insn per cycle
>                                               #    0.35  stalled cycles per insn     ( +-  0.29% )  (69.04%)
>    62423183552      branches                         #  205.357 M/sec                       ( +-  0.48% )  (67)
>     4135666632      branch-misses                    #    6.63% of all branches             ( +-  0.63% )  (67)
> 
>        174.764 +- 0.214 seconds time elapsed  ( +-  0.12% )

The perf diff is in the noise, but the cleanup is nice.
Thanks!

Acked-by: Michael S. Tsirkin <mst@redhat.com>



> Changelog:
> V6: Add timeout for poll() and simplify some logic as suggested
>     by Jason.
> 
> V5: Address the comment from jason in vhost_net_test.c and the
>     comment about leaving out the gfp change for page frag in
>     sock.c as suggested by Paolo.
> 
> V4: Resend based on latest net-next branch.
> 
> V3:
> 1. Add __page_frag_alloc_align() which is passed with the align mask
>    the original function expected as suggested by Alexander.
> 2. Drop patch 3 in v2 suggested by Alexander.
> 3. Reorder patch 4 & 5 in v2 suggested by Alexander.
> 
> Note that placing this gfp flags handing for order 3 page in an inline
> function is not considered, as we may be able to unify the page_frag
> and page_frag_cache handling.
> 
> V2: Change 'xor'd' to 'masked off', add vhost tx testing for
>     vhost_net_test.
> 
> V1: Fix some typo, drop RFC tag and rebase on latest net-next.
> 
> Yunsheng Lin (5):
>   mm/page_alloc: modify page_frag_alloc_align() to accept align as an
>     argument
>   page_frag: unify gfp bits for order 3 page allocation
>   net: introduce page_frag_cache_drain()
>   vhost/net: remove vhost_net_page_frag_refill()
>   tools: virtio: introduce vhost_net_test
> 
>  drivers/net/ethernet/google/gve/gve_main.c |  11 +-
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c |  17 +-
>  drivers/nvme/host/tcp.c                    |   7 +-
>  drivers/nvme/target/tcp.c                  |   4 +-
>  drivers/vhost/net.c                        |  91 ++--
>  include/linux/gfp.h                        |  16 +-
>  mm/page_alloc.c                            |  22 +-
>  net/core/skbuff.c                          |   9 +-
>  tools/virtio/.gitignore                    |   1 +
>  tools/virtio/Makefile                      |   8 +-
>  tools/virtio/linux/virtio_config.h         |   4 +
>  tools/virtio/vhost_net_test.c              | 532 +++++++++++++++++++++
>  12 files changed, 609 insertions(+), 113 deletions(-)
>  create mode 100644 tools/virtio/vhost_net_test.c
> 
> -- 
> 2.33.0
> 


