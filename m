Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA73CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XQX6NgQWd8GIPUa9BLq/x+QL/Opwsct0lmscHxqwEE=; b=cAr8cUUf2KLKIc
	sK9fattyAPSQL2aOkU30R4ACEWDAYL5UtmVe7u4VVfJ2AoC5xXIULLE85Rsa3x/75WR7tnVNz2AAg
	aKk9IfpV9WBENb/0REuK055m4trpxRsWSKAuXkDEiOICwOjAQPy8YsmUzS0nZRDTvyaE/tLbmuZ9j
	kxA2mKlvQcJ0s4InY2lkDmwZU4kLee+d8fa+WHjBivbEu8d2E3fi/ixQd6tjtF7+e9nS4wBsyfrgo
	SZw2KRVJfaxVKuw4W7mTTcqvaCG3yk+X2S2jxMgP/aVfnUMiWl3LHdXhWdmvNhZOwu+lMRAk5PTI+
	IHKqvhrOnICRG/O0X0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrImF-0020Z2-Az; Wed, 18 May 2022 12:27:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrIly-0020Qp-97; Wed, 18 May 2022 12:27:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E51D0B81FB8;
 Wed, 18 May 2022 12:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA0FC36AE3;
 Wed, 18 May 2022 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652876843;
 bh=kxOZ5QqWCnpmv5KQaoJ4TOsadG16Vztf+q4rTiMkJ3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Umit11Mac3n7EFrWi5vz93Vy/DmAFIE5ZX28dqxdFCNvpjmxYi3gtyh6q+ZMFG3Hy
 WHVb6G1689lubJcoCxpjyvC1YyBfvtv2doUxNJw85CgqF+06CQm/dzDzsNgzYdn9QZ
 6DOqopQyvO0HwZAkCOUGfQ6cWa2gUQ7B/lw0BYpylWX914Iz4OVgUhthM6GdtbkWhP
 BrvsdpTg2xO5f446fEsxAGYSyoeRaSIEq1FvsK/qBz/NtaSz2XByyW4/3ZwWZJgZ8N
 PacclyS9foGpKN5di0JCbXuMBMhN0HvlzOXHejsqq9FrE9pipf5pZ24faJVkjBetgY
 CaeMm1ZRSq4Rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lina Wang <lina.wang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, ilias.apalodimas@linaro.org, vasily.averin@linux.dev,
 luiz.von.dentz@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bpf@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 14/23] net: fix wrong network header length
Date: Wed, 18 May 2022 08:26:27 -0400
Message-Id: <20220518122641.342120-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518122641.342120-1-sashal@kernel.org>
References: <20220518122641.342120-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_052726_673631_C556C44E 
X-CRM114-Status: GOOD (  15.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lina Wang <lina.wang@mediatek.com>

[ Upstream commit cf3ab8d4a797960b4be20565abb3bcd227b18a68 ]

When clatd starts with ebpf offloaing, and NETIF_F_GRO_FRAGLIST is enable,
several skbs are gathered in skb_shinfo(skb)->frag_list. The first skb's
ipv6 header will be changed to ipv4 after bpf_skb_proto_6_to_4,
network_header\transport_header\mac_header have been updated as ipv4 acts,
but other skbs in frag_list didnot update anything, just ipv6 packets.

udp_queue_rcv_skb will call skb_segment_list to traverse other skbs in
frag_list and make sure right udp payload is delivered to user space.
Unfortunately, other skbs in frag_list who are still ipv6 packets are
updated like the first skb and will have wrong transport header length.

e.g.before bpf_skb_proto_6_to_4,the first skb and other skbs in frag_list
has the same network_header(24)& transport_header(64), after
bpf_skb_proto_6_to_4, ipv6 protocol has been changed to ipv4, the first
skb's network_header is 44,transport_header is 64, other skbs in frag_list
didnot change.After skb_segment_list, the other skbs in frag_list has
different network_header(24) and transport_header(44), so there will be 20
bytes different from original,that is difference between ipv6 header and
ipv4 header. Just change transport_header to be the same with original.

Actually, there are two solutions to fix it, one is traversing all skbs
and changing every skb header in bpf_skb_proto_6_to_4, the other is
modifying frag_list skb's header in skb_segment_list. Considering
efficiency, adopt the second one--- when the first skb and other skbs in
frag_list has different network_header length, restore them to make sure
right udp payload is delivered to user space.

Signed-off-by: Lina Wang <lina.wang@mediatek.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/core/skbuff.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 180fa6a26ad4..708cc9b1b176 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3896,7 +3896,7 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 	unsigned int delta_len = 0;
 	struct sk_buff *tail = NULL;
 	struct sk_buff *nskb, *tmp;
-	int err;
+	int len_diff, err;
 
 	skb_push(skb, -skb_network_offset(skb) + offset);
 
@@ -3936,9 +3936,11 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 		skb_push(nskb, -skb_network_offset(nskb) + offset);
 
 		skb_release_head_state(nskb);
+		len_diff = skb_network_header_len(nskb) - skb_network_header_len(skb);
 		__copy_skb_header(nskb, skb);
 
 		skb_headers_offset_update(nskb, skb_headroom(nskb) - skb_headroom(skb));
+		nskb->transport_header += len_diff;
 		skb_copy_from_linear_data_offset(skb, -tnl_hlen,
 						 nskb->data - tnl_hlen,
 						 offset + tnl_hlen);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
