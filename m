Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EF4CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=; b=xffD5RDfLPpl3ib9VGC145EAFx
	xdJhzDQN5V/XGaDdG971DWfoLXd1sljnvuOZcE4FKgcZbg9YhshRX7UMbFVbhyIDE+cEjoYbUwg9i
	jpfEeobcTb3/bzsF7yDIU8b3NeBqtjIeKA8byYdbh5bkeFMLjvrdA9FTt/RE79k5zb7ap7z/QXr44
	KACaqOzhXkxt1BB+X+pTBNQRFDPUSLD4PpbNgy217hPHUpWXaeIjxsMXEn+mZ5VU1dXpAbi2rOUE3
	anvdn0KMjNXXTu7H0s5x4Ny3Dd9LET17bPTmb0S9VwppC8am9kGkB9OTUFJJ2gOrqGn9tuaPZFzac
	UGRrD/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpL-0000000F5fk-0m3X;
	Sun, 04 Oct 2026 17:16:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpI-0000000F5dt-20Rz
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 17:16:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6aa850436d3so1050485a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2026 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134199; x=1791738999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=ZRlG1iqIUvGKUmqxzMYHjaOigKTCYbdXMctQ/AWbumY8fS7KS2s85PydcWWZuewFNr
         B+w+eyXhIT9T84jRa5RapC57t9vqMeXtdHLeBEmxR/sJzIYYHvIvYcgXptE6u6zsCHEV
         oT/KPknqJzQl/Fh4kbHXiV+5iiG1XZ/zPFIiyGsZfF3wye0OG9IDI1KgkEz2i9BzY6p2
         uwGip++0dys4q2umgoY1A1jxuDmGcPLQJzLSvedB4KZTyNISXatF/ggWirY6beyxtLBh
         xQne7W79vvHUybLbTkQSp9UFjZlpfQCLObdY5iY24x/uCsxlHL6kry4r/dEKuvHMmVyT
         VPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134199; x=1791738999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=JifzUOFpxD7hfsutyvqckolvhYB16DXrV8F1RgGOUkHOgDqqKafoC1GzsbaQtpWG1J
         OqWC+DK+2PdQMcETmdH6BhiisMHZq8E+QRVrJHPRvkD6aeokMTnvKZsbW9pt9GLg8nMB
         3gD6KKGHbtR2dtnbkOcXpyCQgdtXs4X4RxPr6PRoXqaYJNgqVa013SnVtpwW93WWis2P
         412qhESdsN35c4Mm6k59DSkHh3BKoG9vkzyGa/0zUHIXxQ+TcFC1/i1RNaBl3XudGHqM
         DnNR1HHVjvz4RO2gBVNUACYSa+o/jNDY52rywXNDL0TD2lT59ZErDBVCiFKjxmM+U9xx
         vSQg==
X-Forwarded-Encrypted: i=1; AKwUvBxCDZRymV0fZXbHlwhnv+7y7WRROEqH8zUOURkceTXWn+AKlX6in2G3mn4MIj9ieZr23y90rELHoQCXWWOOUw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJT4U/F3RPE+o0ZCTgAv/LcmJaeMLkuCgdyZuuTAuVtFjWHQCiV
	RXII8QFQqRTEfd1ge/v5edhyrn24yntJccdvX5LQ/RVtrayecvuTnZn8LnXlZ1DnCw==
X-Gm-Gg: AYBFou2E+LcP/Cfo0Q9z9ZG1Ud4JxBxfyZKynlTbqKOJEBXoz1c4rBcMdk2OLQN48Yx
	Q+Fpj7QFvSDXpCDp5InEx4ZZBWn0SdhIvnTkQoCP7nVch4q/lJQbrGb3xe1AVRwaudUXSooYAu7
	nDgtL0DxU+LPVYPiES1jZ8ye/Svfq6TMO7TAk/ZvgCVi/EifbCSSuuPJXXrXQdpDixgDzZhtGa/
	gSRiI7MwuXAzv3+hZUVEAZU5xT6aaYl2VZuZIIxnE+GVNs5qSUrtvAdQP/dNpfg0iiTcMeLiLhp
	ByL25WFP06ZuluTsXWTMmSZ7239eAUkoGsSVD+woznVgUJ2qEiZESRlqr+LYjRFW6PjKAMclfkv
	c869FUEDE20zdazx/h+31zJ7wjpXX8qnSm1eFqRzZnYbCUhR8XNVwvvUNzr+ypMTRLF3lhQzIMD
	Bk6eYeSuBC257Cn7i+8M2kBYohj2vZbb/PlGXjEv/XfwOVbh62IqWU/yoyjNIa7EcY0mamrm730
	eQrvxRi8T/jKLpBFy7VQw4I3KwyIgb3esKCLoXaUH1jQX4JJ7xmUy+wDx2IcZk9AwhrGyu7yMQe
	HsQfbsoHma8hu/fUoPAxhp0YsxsPsL/yTIwUEyqP46HLKhhfy9Ye9pHuY9KgUeybbFAiKTQb8Ex
	wGOZLIkw1aS4v1xxYKuFG66fCTm3D6OF6GNcNy0ClBxc3ZqkubGQxyJoHWXdKWPCq60H735njwu
	VxSwJEsQU78vkxgPe62F9OMYk=
X-Received: by 2002:a05:6402:2709:b0:6af:a64f:bd44 with SMTP id 4fb4d7f45d1cf-6afada35853mr4633290a12.45.1791134198617;
        Sun, 04 Oct 2026 10:16:38 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:37 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun,  4 Oct 2026 19:16:33 +0200
Message-ID: <20261004171636.3545085-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101640_531864_F118037F 
X-CRM114-Status: GOOD (  11.62  )
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

Packets forwarded by the flowtable skip the ruleset, so a priority set
with "meta priority set" before "flow add" is lost after the first
packets. Patch 2 stores skb->priority in the flow, applies it in the
software fast path and passes it to drivers as FLOW_ACTION_PRIORITY.
Patch 1 makes mlx5 ignore that action on flowtable flows, so flows it
offloads today stay offloaded. Patch 3 adds a selftest.

v2 review asked whether this should be a flowtable attribute instead.
A per-flow priority covers both one class per flowtable and a class
chosen per connection, with existing syntax:

  meta priority set 1:3 flow add @ft
  udp dport 5060 meta priority set 1:3 flow add @ft

An attribute needs one flowtable per class. nft rejects a device in
two flowtables of the same table with -EEXIST, so it also needs one
table per class. Pablo, is the per-flow approach fine with you?

mlx5 maintainers: patch 1 is needed before patch 2 and is meant to go
through nf-next; an Acked-by would allow that.

The selftest passes with the series, and its priority checks fail with
only patch 3 applied (QEMU, three runs). The mlx5, airoha and mtk
changes are compile-tested only; Lorenzo, a Tested-by on airoha would
be welcome. struct flow_offload grows by 8 bytes.

Changes in v3:
- new patch 1 for mlx5
- airoha uses the priority for its QoS queue (Lorenzo Bianconi)
- describe the tc flower effect and the TOS-derived priority
- rebased onto nf-next

v2: https://lore.kernel.org/netfilter-devel/20260902155136.4963-1-julius@bairaktaris.de/
v1: https://lore.kernel.org/netfilter-devel/20260901092632.369248-1-julius@bairaktaris.de/

Julius Bairaktaris (3):
  net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
  netfilter: flowtable: carry a priority into the offload
  selftests: netfilter: nft_flowtable.sh: check the priority a flow
    carries

 Documentation/networking/nf_flowtable.rst     |   4 +-
 drivers/net/ethernet/airoha/airoha_ppe.c      |   3 +
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   1 +
 .../net/ethernet/mellanox/mlx5/core/Makefile  |   2 +-
 .../mellanox/mlx5/core/en/tc/act/act.c        |   1 +
 .../mellanox/mlx5/core/en/tc/act/act.h        |   1 +
 .../mellanox/mlx5/core/en/tc/act/prio.c       |  22 ++++
 include/net/netfilter/nf_flow_table.h         |   1 +
 net/netfilter/nf_flow_table_ip.c              |   6 +
 net/netfilter/nf_flow_table_offload.c         |  11 ++
 net/netfilter/nft_flow_offload.c              |   2 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
 12 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.53.0


