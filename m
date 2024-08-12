Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76E3C52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 12:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihN0Y1Pxk7Ms6yk1pQW+EMoxHJ1Y74UH7hIRmtsRAlk=; b=FUx+PxAnjCShsp68cI6E4TITvS
	w+gXhaVtuOWVcCWQ5U9wzNFNsm0WofGKsAeCiT1QMGRd2mdh7awmr55IdRWmtz0BOYIo6+z1R9Txi
	fv5jYaFoch627orrfh69OtjwZ+C0BYMLHOBcd2geqp3Iv/cex+n2FI1PYCTBcDirxnW6jD0f9dPHz
	zPTWW1Cj9/3MqvaWPKl/w2gCQZs+7X7AhZbjJvFd0ekKwv/EaRiMSKSPHO5J6t/tikhBMyJsM2ByN
	A0Gsz0c6cxuezJdbY/gjR6JOnxPZPsjGSYddI1uLkab3CE3AbCuTlkd8nEOqpcM5+lIAyhOqdEIxt
	LAHZy+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTvT-00000000EkW-2kRy;
	Mon, 12 Aug 2024 12:13:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTuL-00000000EM9-1zYy;
	Mon, 12 Aug 2024 12:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C6961CE0E0D;
	Mon, 12 Aug 2024 12:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65CFC32782;
	Mon, 12 Aug 2024 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723464734;
	bh=feMZ11amsOB5MfZgo8CW/vk5lh85VqxPxLLtSo9jxdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tgZS0vd2E/r60+JfFvuAq+1P0K0KF3X9jMjOvMu84AUncArQ4UWB6TmYk95FDQ+p9
	 To8wc/6GzDVxex1ZNSyn90kXE8XVM35zel2l4oayqWpzJo8BMu8M8lEejxQSfpV8Ce
	 G1WCdmA9RGSbmy8mX+tYEja9avN1o/YDeriSLvaC5EV7qxNFvj5aBFDpUOF+qqP5S0
	 QzTU5rRf3uBSXZP+/GwCByy22Te7xkMzf/dIoybccO32uBEuASi+9ZYHuZThPpK3EW
	 3RRlD9Q7KDaLwkkV5jxmMcB8nv2vjFyF86xLtU7vRrzK0Sc5iISWkrM6//uFNYxNcf
	 AyEu5vG0dMmQA==
From: Simon Horman <horms@kernel.org>
Date: Mon, 12 Aug 2024 13:11:55 +0100
Subject: [PATCH net-next 1/3] ipv6: Add ipv6_addr_{cpu_to_be32,be32_to_cpu}
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-ipv6_addr-helpers-v1-1-aab5d1f35c40@kernel.org>
References: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
In-Reply-To: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yisen Zhuang <yisen.zhuang@huawei.com>, 
 Salil Mehta <salil.mehta@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_051217_737497_172E4495 
X-CRM114-Status: UNSURE (   8.94  )
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

Add helper to convert an ipv6 addr, expressed as an array
of words, from cpy to big-endian byte order.

No functional change intended.
Compile tested only.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Link: https://lore.kernel.org/netdev/c7684349-535c-45a4-9a74-d47479a50020@lunn.ch/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 include/net/ipv6.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 88a8e554f7a1..e7113855a10f 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1365,4 +1365,16 @@ static inline void ip6_sock_set_recvpktinfo(struct sock *sk)
 	release_sock(sk);
 }
 
+#define IPV6_ADDR_WORDS 4
+
+static inline void ipv6_addr_cpu_to_be32(__be32 *dst, const u32 *src)
+{
+	cpu_to_be32_array(dst, src, IPV6_ADDR_WORDS);
+}
+
+static inline void ipv6_addr_be32_to_cpu(u32 *dst, const __be32 *src)
+{
+	be32_to_cpu_array(dst, src, IPV6_ADDR_WORDS);
+}
+
 #endif /* _NET_IPV6_H */

-- 
2.43.0


