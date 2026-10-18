Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7DECCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 01:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3poXjPlgrYbaoLZ20pYt73out2gTIqX1HAZG1VT5Dy4=; b=09zHAajNyYfC83R0HtHjyc7Aaq
	568+gTrTZETZkFvTsnxGtOSYp2Gb9j+o3XLritCTv5ZQIY+3zy9cA58Ee/uTOA26nNh0swrKxzX1i
	6ONynrIiiHS3Q/oMpaYiqsiJwIzOXJDzp+T++MRaP92XpGniC20V5FBILRacqRS39LSQwM7i6jJac
	mEcAQRI8uGBK7VN9nfUjMKlMHP4n8fpwlI0dFexQoHezmS/wKY14wv1C1ra1RSt7kzxN30xFFj30Y
	G0fZkZ0a96q9PTBZ2E6iB6tJ3SS8ZpjR0jBYMp+HnA74Tv8aQJM5PcMg9wgxMGCakN2s0EgdCJYqg
	ov0Ovxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIFyP-00000005QEe-41EK;
	Sun, 18 Oct 2026 01:46:05 +0000
Received: from mail.netfilter.org ([217.70.190.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIFyN-00000005QDv-2RoO;
	Sun, 18 Oct 2026 01:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1792287960;
	bh=3poXjPlgrYbaoLZ20pYt73out2gTIqX1HAZG1VT5Dy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGRHu5iAIhla0Zcp/5NsynD5QmwmgyQ3no6QBW/TGZmg1TTg+MI1qvmcK+Mj+TxAf
	 Da6/QRHR5+wSR2DOKmeFJMR9qhX5d+OT1Bs+7kGDk9Fczv+QxwRWEvdl3ofkAAvjSV
	 RPDFiROXYCbakP5/wlOi2/zIlda6fdtH6+R8ygsoMtPfW4Ed2+gvM/eGuFCsQISUfa
	 0djIcEz655r0Ne7rI7rPRu3eeJ+DsNpDCRWP9R9lPVsU01B/fFQfwasxKHFqVMpCOT
	 m8VO9LEgyZHyojjY7CZMlRyW5h5G7tPEKIwR3l0B9UUGLjNpGnXa2PPiWP1aoRUsa1
	 8/+JZAja4jiIA==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id B651460060;
	Sun, 18 Oct 2026 03:46:00 +0200 (CEST)
Date: Sun, 18 Oct 2026 03:45:57 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: fw@strlen.de, phil@nwl.cc, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org, lorenzo@kernel.org,
	nbd@nbd.name, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
	rdunlap@infradead.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, saeedm@nvidia.com,
	leon@kernel.org, tariqt@nvidia.com, mbloch@nvidia.com,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority
 into the offload
Message-ID: <atQk1d8Tv03iPN7d@chamomile>
References: <20261004171636.3545085-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004171636.3545085-1-julius@bairaktaris.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_184603_766429_B6EAC8D8 
X-CRM114-Status: GOOD (  19.45  )
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

On Sun, Oct 04, 2026 at 07:16:33PM +0200, Julius Bairaktaris wrote:
> Packets forwarded by the flowtable skip the ruleset, so a priority set
> with "meta priority set" before "flow add" is lost after the first
> packets. Patch 2 stores skb->priority in the flow, applies it in the
> software fast path and passes it to drivers as FLOW_ACTION_PRIORITY.
> Patch 1 makes mlx5 ignore that action on flowtable flows, so flows it
> offloads today stay offloaded. Patch 3 adds a selftest.
> 
> v2 review asked whether this should be a flowtable attribute instead.
> A per-flow priority covers both one class per flowtable and a class
> chosen per connection, with existing syntax:
> 
>   meta priority set 1:3 flow add @ft
>   udp dport 5060 meta priority set 1:3 flow add @ft
> 
> An attribute needs one flowtable per class. nft rejects a device in
> two flowtables of the same table with -EEXIST, so it also needs one
> table per class. Pablo, is the per-flow approach fine with you?

I don't understand the "one flowtable per class".

> mlx5 maintainers: patch 1 is needed before patch 2 and is meant to go
> through nf-next; an Acked-by would allow that.
> 
> The selftest passes with the series, and its priority checks fail with
> only patch 3 applied (QEMU, three runs). The mlx5, airoha and mtk
> changes are compile-tested only; Lorenzo, a Tested-by on airoha would
> be welcome. struct flow_offload grows by 8 bytes.
> 
> Changes in v3:
> - new patch 1 for mlx5
> - airoha uses the priority for its QoS queue (Lorenzo Bianconi)
> - describe the tc flower effect and the TOS-derived priority
> - rebased onto nf-next
> 
> v2: https://lore.kernel.org/netfilter-devel/20260902155136.4963-1-julius@bairaktaris.de/
> v1: https://lore.kernel.org/netfilter-devel/20260901092632.369248-1-julius@bairaktaris.de/
> 
> Julius Bairaktaris (3):
>   net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
>   netfilter: flowtable: carry a priority into the offload
>   selftests: netfilter: nft_flowtable.sh: check the priority a flow
>     carries
> 
>  Documentation/networking/nf_flowtable.rst     |   4 +-
>  drivers/net/ethernet/airoha/airoha_ppe.c      |   3 +
>  .../net/ethernet/mediatek/mtk_ppe_offload.c   |   1 +
>  .../net/ethernet/mellanox/mlx5/core/Makefile  |   2 +-
>  .../mellanox/mlx5/core/en/tc/act/act.c        |   1 +
>  .../mellanox/mlx5/core/en/tc/act/act.h        |   1 +
>  .../mellanox/mlx5/core/en/tc/act/prio.c       |  22 ++++
>  include/net/netfilter/nf_flow_table.h         |   1 +
>  net/netfilter/nf_flow_table_ip.c              |   6 +
>  net/netfilter/nf_flow_table_offload.c         |  11 ++
>  net/netfilter/nft_flow_offload.c              |   2 +
>  .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
>  12 files changed, 162 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c
> 
> 
> base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
> -- 
> 2.53.0
> 
> 

