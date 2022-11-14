Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C41C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fd6JWHYXTEEkVoIaIYliQKMwXcFdw67d/23OBe+aVN0=; b=PSoHFODXW/7YbbKOgcUgQsk99E
	tGAy0/0NfjdDbxOsKWEPXYKblq7uF6v7Nr7Jgly041+aRLtb2CBb/bHeILW9h/RvLmapVMj+oJX8B
	D6jBuQ9BK7qvYB7IQIKEPKTmWMVO45MBTCNdjn5Iu/EF2noHLer7tu/Bi1yjYTVvwvK4GFYtFVzMc
	zLa4vjpwBSSac5t1yIKRsE2ZGKYgiwv8BFIQBZnZVALk7IGn50RQSaQaKUaRX1tRtKSE7HJqxU0Ki
	mk/vBSIwsiJiZMVLKa89qKIdEUX05fum3SKQKFxh/DDID4ULu4F8iEga1P6ZxyYUBC21vQkIJ+atk
	KuBWypVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYng-000sAj-Dp; Mon, 14 Nov 2022 12:42:56 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYnN-000s1E-KV; Mon, 14 Nov 2022 12:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fd6JWHYXTEEkVoIaIYliQKMwXcFdw67d/23OBe+aVN0=; b=jtzURUaH1e7IkKZYFECsI9pNxH
	sUD6fTBIJYr9eGMEC8ZqhHM48K7Pb7eQEGKMVMA+v4BH9W+TWqkSTgdMtkosAeT+C/SUq3DPAKSzY
	YfPUHe/6IJsXZYAMs8FoDI7SchZGemi5T1poOnBur61THaQFB8CNfS6iIMXkmJqyiyEE=;
Received: from p54ae9c3f.dip0.t-ipconnect.de ([84.174.156.63] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1ouYn6-0021wc-UK; Mon, 14 Nov 2022 13:42:21 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 0/4] mtk_eth_soc rx vlan offload improvement + dsa hardware untag support
Date: Mon, 14 Nov 2022 13:42:10 +0100
Message-Id: <20221114124214.58199-1-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_044237_734228_76177112 
X-CRM114-Status: UNSURE (   8.42  )
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

This series improves rx vlan offloading on mtk_eth_soc and extends it to
support hardware DSA untagging where possible.
This improves performance by avoiding calls into the DSA tag driver receive
function, including mangling of skb->data.

This is split out of a previous series, which added other fixes and
multiqueue support

Changes in v4:
 - fix reverse christmas tree in dsa patch
 - use skb_dst_drop to support metadata dst refcounting
 - disable dsa untag offload in mtk_eth_soc if xdp is used

Felix Fietkau (4):
  net: dsa: add support for DSA rx offloading via metadata dst
  net: ethernet: mtk_eth_soc: pass correct VLAN protocol ID to the
    network stack
  net: ethernet: mtk_eth_soc: add support for configuring vlan rx
    offload
  net: ethernet: mtk_eth_soc: enable hardware DSA untagging

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 93 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  8 ++
 net/core/flow_dissector.c                   |  4 +-
 net/dsa/dsa.c                               | 19 ++++-
 4 files changed, 109 insertions(+), 15 deletions(-)

-- 
2.38.1


