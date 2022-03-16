Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F15AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzmZrajQSwYOtUsAfjJINTtFFYyefFtDaC33JAINCHc=; b=XpYYkWwUomlwMj
	NX8M/8IM7SUybcto+Dv+rkMRxNBDXGB8+Z7/209Qf73lVTD8gXygpPWqVT7BNcu8FxXdP7WYbxi+r
	P4cS37uSfv+UwUIhP0NhJWaghnh1K0u1fhUMBDfyhYZEuN2EBzE9d7cG24BL3BgthUz7kmefqGs+y
	y01f2g37A1/BuXlko74fIS9pX/3ur4fpRSHFhW3y0WEiH87GLPW7aBRkRqnreST4GcI8SlUkX1i4w
	dg5S7NjfQ84kR1QL+GudRaYhyrnsdRPmdjI2Ejjc3T3HTbluP5Qqq0kXy1+aLXI/Eyf1p3oXg+oB/
	jJQgNB2EDJA0myXCoJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUTk-00DDYa-72; Wed, 16 Mar 2022 14:18:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUTK-00DDKs-L3; Wed, 16 Mar 2022 14:17:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E39E6148D;
 Wed, 16 Mar 2022 14:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65703C36AE2;
 Wed, 16 Mar 2022 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647440273;
 bh=+Reu/sFL5kUPHNsKKiXeECII173+QNrgjoZbQTNpzyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J7lnCPYoz/4fYr/ikQCtWzMzwrTyJM+Wob4W9QdIErVC9nf98dSRg+KYdSJHEb40r
 Gmldvl+QPivka4JQfDdd3N6YTuw72hXptZDZqjunweRLHmUweK2QRIA4M0MguVojOz
 K2y9p29zAF18Sac6YVup2vj2rb4tlMzBd8fW3eK3JB3QAQ7KP92I1r6bj/TjK0mAUP
 6Wav+FJNKLvxZcmAi9iTxlyIwRrcVWsJxEBAUyke0HQOlieaPr0z6dCeE4d9Sqe96l
 IkjBIEELFnbkn2mZzRgcqNwDMoRE5ZgyN7LO9lUSTdO35Dr92zRn/ccHscmKmVS++m
 Ox7ZZyte5ftvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lina Wang <lina.wang@mediatek.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Sasha Levin <sashal@kernel.org>, davem@davemloft.net,
 yoshfuji@linux-ipv6.org, dsahern@kernel.org, kuba@kernel.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 2/7] xfrm: fix tunnel model fragmentation behavior
Date: Wed, 16 Mar 2022 10:17:33 -0400
Message-Id: <20220316141738.248513-2-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316141738.248513-1-sashal@kernel.org>
References: <20220316141738.248513-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_071754_831129_7E6621AB 
X-CRM114-Status: GOOD (  19.65  )
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

[ Upstream commit 4ff2980b6bd2aa6b4ded3ce3b7c0ccfab29980af ]

in tunnel mode, if outer interface(ipv4) is less, it is easily to let
inner IPV6 mtu be less than 1280. If so, a Packet Too Big ICMPV6 message
is received. When send again, packets are fragmentized with 1280, they
are still rejected with ICMPV6(Packet Too Big) by xfrmi_xmit2().

According to RFC4213 Section3.2.2:
if (IPv4 path MTU - 20) is less than 1280
	if packet is larger than 1280 bytes
		Send ICMPv6 "packet too big" with MTU=1280
                Drop packet
        else
		Encapsulate but do not set the Don't Fragment
                flag in the IPv4 header.  The resulting IPv4
                packet might be fragmented by the IPv4 layer
                on the encapsulator or by some router along
                the IPv4 path.
	endif
else
	if packet is larger than (IPv4 path MTU - 20)
        	Send ICMPv6 "packet too big" with
                MTU = (IPv4 path MTU - 20).
                Drop packet.
        else
                Encapsulate and set the Don't Fragment flag
                in the IPv4 header.
        endif
endif
Packets should be fragmentized with ipv4 outer interface, so change it.

After it is fragemtized with ipv4, there will be double fragmenation.
No.48 & No.51 are ipv6 fragment packets, No.48 is double fragmentized,
then tunneled with IPv4(No.49& No.50), which obey spec. And received peer
cannot decrypt it rightly.

48              2002::10        2002::11 1296(length) IPv6 fragment (off=0 more=y ident=0xa20da5bc nxt=50)
49   0x0000 (0) 2002::10        2002::11 1304         IPv6 fragment (off=0 more=y ident=0x7448042c nxt=44)
50   0x0000 (0) 2002::10        2002::11 200          ESP (SPI=0x00035000)
51              2002::10        2002::11 180          Echo (ping) request
52   0x56dc     2002::10        2002::11 248          IPv6 fragment (off=1232 more=n ident=0xa20da5bc nxt=50)

xfrm6_noneed_fragment has fixed above issues. Finally, it acted like below:
1   0x6206 192.168.1.138   192.168.1.1 1316 Fragmented IP protocol (proto=Encap Security Payload 50, off=0, ID=6206) [Reassembled in #2]
2   0x6206 2002::10        2002::11    88   IPv6 fragment (off=0 more=y ident=0x1f440778 nxt=50)
3   0x0000 2002::10        2002::11    248  ICMPv6    Echo (ping) request

Signed-off-by: Lina Wang <lina.wang@mediatek.com>
Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/ipv6/xfrm6_output.c   | 16 ++++++++++++++++
 net/xfrm/xfrm_interface.c |  5 ++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/xfrm6_output.c b/net/ipv6/xfrm6_output.c
index 6b0ed6c593e2..a6f13fab963f 100644
--- a/net/ipv6/xfrm6_output.c
+++ b/net/ipv6/xfrm6_output.c
@@ -140,6 +140,19 @@ static int __xfrm6_output_finish(struct net *net, struct sock *sk, struct sk_buf
 	return __xfrm6_output_state_finish(x, sk, skb);
 }
 
+static int xfrm6_noneed_fragment(struct sk_buff *skb)
+{
+	struct frag_hdr *fh;
+	u8 prevhdr = ipv6_hdr(skb)->nexthdr;
+
+	if (prevhdr != NEXTHDR_FRAGMENT)
+		return 0;
+	fh = (struct frag_hdr *)(skb->data + sizeof(struct ipv6hdr));
+	if (fh->nexthdr == NEXTHDR_ESP || fh->nexthdr == NEXTHDR_AUTH)
+		return 1;
+	return 0;
+}
+
 static int __xfrm6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 {
 	struct dst_entry *dst = skb_dst(skb);
@@ -168,6 +181,9 @@ static int __xfrm6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 		xfrm6_local_rxpmtu(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;
+	} else if (toobig && xfrm6_noneed_fragment(skb)) {
+		skb->ignore_df = 1;
+		goto skip_frag;
 	} else if (!skb->ignore_df && toobig && skb->sk) {
 		xfrm_local_error(skb, mtu);
 		kfree_skb(skb);
diff --git a/net/xfrm/xfrm_interface.c b/net/xfrm/xfrm_interface.c
index 3932d3aaff27..4cfa79e04e3d 100644
--- a/net/xfrm/xfrm_interface.c
+++ b/net/xfrm/xfrm_interface.c
@@ -300,7 +300,10 @@ xfrmi_xmit2(struct sk_buff *skb, struct net_device *dev, struct flowi *fl)
 			if (mtu < IPV6_MIN_MTU)
 				mtu = IPV6_MIN_MTU;
 
-			icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0, mtu);
+			if (skb->len > 1280)
+				icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0, mtu);
+			else
+				goto xmit;
 		} else {
 			if (!(ip_hdr(skb)->frag_off & htons(IP_DF)))
 				goto xmit;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
