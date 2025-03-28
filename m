Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEE0C28B20
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7PIxALzUThwDqo0fWRLExKVz1IpXLXhRjWP7caK9Zsk=; b=Du6FXjorL3981XAoUWSE6wlHiv
	QTW8fJxs3Tp5nT5KM2Q7lmIRaAD9LhJOV1rvyCtKsbw0qv6XV+LdC/DCtmiaewk1RpXC4v9+GE1aZ
	+cIsFVs2XUvjQQJwrgI2E8UhJ5cXjgR0IX8eWrAgvCx6Yi8rOClCijoTTNbtSNHugIxXkDOQ4KlyE
	Rz+bdQbus1xihdi4tQUOPJ+PcNxTNHkz0dqPJnnqLMVB1OcTf+Ps0xtxll/lRIJpDSzFK0kHWIHHC
	oIG1HDnOLQ0npeFrx6Yr5nDMzsvA3xCdtRidC0cJ2JyDjSicxrLFtzIl7yLbKsM6YMSL5kVTdS6MJ
	TrfCyBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2Dt-0000000CdJY-001T;
	Fri, 28 Mar 2025 05:25:41 +0000
Received: from mail.nppct.ru ([195.133.245.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2C6-0000000Cd87-1rDf
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 05:23:54 +0000
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id D147E1C243D
	for <linux-mediatek@lists.infradead.org>; Fri, 28 Mar 2025 08:23:31 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1743139411; x=
	1744003412; bh=rjm2kyFJM/oTTcUQkAvPohHlHqu5acUnY1JM2jMRNdQ=; b=P
	C5sq4aBWAXdm1g7vIxT2Gfj3BufaGmZEpwOsX18zLL2cwY0DqT9CxbJoiQVifaQz
	2baxrxKs8Pkp/70xzYBLhZiSymEX8bjfaDQ5aQnSiexkopQYG5UvirqnYYGgJFBW
	BPxCJYdfPzKkrlkopJAW33Hl4CsIYSht91aAMj6EZI=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dyfZMuEmeLzE for <linux-mediatek@lists.infradead.org>;
	Fri, 28 Mar 2025 08:23:31 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id D49A21C0872;
	Fri, 28 Mar 2025 08:23:20 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bpf@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH 5.10] gso: fix udp gso fraglist segmentation after pull from frag_list
Date: Fri, 28 Mar 2025 05:23:13 +0000
Message-ID: <20250328052315.1205798-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_222351_693374_817BDFE7 
X-CRM114-Status: GOOD (  12.41  )
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

From: Willem de Bruijn <willemb@google.com>

commit a1e40ac5b5e9077fe1f7ae0eb88034db0f9ae1ab upstream.

Detect gso fraglist skbs with corrupted geometry (see below) and
pass these to skb_segment instead of skb_segment_list, as the first
can segment them correctly.

Valid SKB_GSO_FRAGLIST skbs
- consist of two or more segments
- the head_skb holds the protocol headers plus first gso_size
- one or more frag_list skbs hold exactly one segment
- all but the last must be gso_size

Optional datapath hooks such as NAT and BPF (bpf_skb_pull_data) can
modify these skbs, breaking these invariants.

In extreme cases they pull all data into skb linear. For UDP, this
causes a NULL ptr deref in __udpv4_gso_segment_list_csum at
udp_hdr(seg->next)->dest.

Detect invalid geometry due to pull, by checking head_skb size.
Don't just drop, as this may blackhole a destination. Convert to be
able to pass to regular skb_segment.

Link: https://lore.kernel.org/netdev/20240428142913.18666-1-shiming.cheng@mediatek.com/
Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Signed-off-by: Willem de Bruijn <willemb@google.com>
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20241001171752.107580-1-willemdebruijn.kernel@gmail.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 net/ipv4/udp_offload.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index b6952b88b505..515d591d00b9 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -8,6 +8,7 @@
 
 #include <linux/skbuff.h>
 #include <net/udp.h>
+#include <net/ip6_checksum.h>
 #include <net/protocol.h>
 #include <net/inet_common.h>
 
@@ -269,8 +270,26 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
 	__sum16 check;
 	__be16 newlen;
 
-	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST)
-		return __udp_gso_segment_list(gso_skb, features, is_ipv6);
+	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
+		 /* Detect modified geometry and pass those to skb_segment. */
+		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
+			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
+
+		 /* Setup csum, as fraglist skips this in udp4_gro_receive. */
+		gso_skb->csum_start = skb_transport_header(gso_skb) - gso_skb->head;
+		gso_skb->csum_offset = offsetof(struct udphdr, check);
+		gso_skb->ip_summed = CHECKSUM_PARTIAL;
+
+		uh = udp_hdr(gso_skb);
+		if (is_ipv6)
+			uh->check = ~udp_v6_check(gso_skb->len,
+						  &ipv6_hdr(gso_skb)->saddr,
+						  &ipv6_hdr(gso_skb)->daddr, 0);
+		else
+			uh->check = ~udp_v4_check(gso_skb->len,
+						  ip_hdr(gso_skb)->saddr,
+						  ip_hdr(gso_skb)->daddr, 0);
+	}
 
 	mss = skb_shinfo(gso_skb)->gso_size;
 	if (gso_skb->len <= sizeof(*uh) + mss)
-- 
2.43.0


