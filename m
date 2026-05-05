Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADF3CD3427
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=svEpIf1Kcmml3y0QJfTwkzjkdFGohK0EUwGv35/HraY=; b=oDY62lR85n+RPJ
	Wa6A+E/wx4f/uSu/FjpFAi4EClFV2bhKSHTaryIpEQZrpmCPn51U/LVUIoSKGl3VLspHiaWo91big
	yP4fkjX7LLjpZeI2cx5QYkFl4ZWytDKfVo22vV/yFJhhMln447YcFD2yJ9QK+iYD9XrK9MTCh5b2i
	azZd/fLFI1I1jNcnqUp5lXgxPdJKMPp6gFx1VuMoLA+c1qtoh0ro45+RCAqsf/QoJ2rON6sIkwlN2
	eR0qYfiJgBFrw4iq1p9Db2ejIIEqWdpqpf+xpXXAzPNBj2hIIu34eNCszDQEw96gcwxiBOCXMW4eI
	0Uwjw+sBszD7TmAUwUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH5z-0000000GZ4U-25io;
	Tue, 05 May 2026 14:49:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH5y-0000000GZ49-1Zb0;
	Tue, 05 May 2026 14:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71191601EE;
	Tue,  5 May 2026 14:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E58C2BCC7;
	Tue,  5 May 2026 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777992597;
	bh=dZ/+jnil6Pu/MzChOQY4FGpZ4ETygGepo3YkBb//DOU=;
	h=From:Subject:Date:To:Cc:From;
	b=qCdgi/kqpOSKIkcN2M2bOppgyEmBdd3gB+Uy93hCkGXWyulcXhIxs69MYZwKoSWA+
	 4bnGly2PdGxR+1M1uAYvBdIZiPRaYND3dZL/XQgxC3YZNfMbXnThkWFIxYn285si6J
	 fsPms9mTVUNo1Ra1F/HawX204kqO0TSDqOegf8UFPlvzMercqjLMnkTmBMZEFvCpMd
	 wgY1Gt3/pfxDWglSfS5ec3X12vpjxeTauazkHCzlT2sI9Wr5b9Uoggjunpml6uY2Az
	 uZHtwdIJkCyF6Xf4Yc8usR7qBBeRViVwk8iLP4m6bxJRkykef5zFF+oYwXLa3vxE9K
	 CF61PbXkLrnxw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH nf-next 0/4] Add IPv4 over IPv6 flowtable SW acceleration
Date: Tue, 05 May 2026 16:49:22 +0200
Message-Id: <20260505-b4-flowtable-sw-accel-ip6ip-v1-0-9ac39ccc9ea9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqFIBAA0KvErBsY+1bQVaKF2VgDYqLxC6K7J
 y3f5t2QOQlnGKobEv8lyx4KVF2B3UxYGWUphoaajlpqcdbo/H4eZvaM+URjLXuU2EnEXpGin7a
 L0j2UISZ2cn37CMFh4OuA6XlelXqnD3YAAAA=
X-Change-ID: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 linux-kselftest@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Similar to IPIP and IP6I6 tunnels, introduce sw acceleration for IPv4 over
IPv6 tunnels in the netfilter flowtable infrastructure.

---
Lorenzo Bianconi (4):
      net: netfilter: Add ether_type to net_device_path_ctx
      net: netfilter: Add encap_proto to flow_offload_tunnel
      net: netfilter: Add IPv4 over IPv6 tunnel flowtable acceleration
      selftests: netfilter: nft_flowtable.sh: Add IPv4 over IPv6 flowtable selftest

 drivers/net/ethernet/airoha/airoha_ppe.c           |  14 ++-
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c    |  13 ++-
 include/linux/netdevice.h                          |   5 +-
 include/net/netfilter/nf_flow_table.h              |   1 +
 net/core/dev.c                                     |   6 +-
 net/ipv4/ipip.c                                    |   1 +
 net/ipv6/ip6_tunnel.c                              |   6 +-
 net/netfilter/nf_flow_table_core.c                 |  14 ++-
 net/netfilter/nf_flow_table_ip.c                   | 129 ++++++++++++++++-----
 net/netfilter/nf_flow_table_path.c                 |  16 +--
 .../selftests/net/netfilter/nft_flowtable.sh       |  26 +++++
 11 files changed, 174 insertions(+), 57 deletions(-)
---
base-commit: c1e5127b577c6b88fa48e532616932ae978528d5
change-id: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


