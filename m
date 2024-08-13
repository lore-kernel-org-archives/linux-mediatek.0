Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2EC52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6EPKwrT4ori3ntgqdkScaZpq6ueIlHv48FI7TH0CXA=; b=LNp91OfokupqtL1s+3wPzS7nNC
	qX9h2ajeHZWXZXDGIlgcu8Lap5kyLrItog1xQw43H9n5zQ4Lq4IlFZaCTdpmJDxbOvsIO/QfmzGoz
	PqOs+Y1VP8CSBkpE/Afmc1GvKJCmEiHPQ0vl19yk3s/BsdYVUM6KI7tsVEcsaOj2hDyfDKG32bB2h
	Qk9/zfav5hkyYubgjQf/qksyvw8AngkKniNjgQVUprd0WJJecZE0IF0CYTQTGPUJmtKs9mRL5krWw
	/Wsr64IGsagz6qMwaQx6VREaWkfgH2YG5py4Lvh/V3JE/iYd50TAVfJ81qRsVy2+ZK2MhyK2+zr+E
	Ry+o0v6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdsmF-000000044D0-1Yl2;
	Tue, 13 Aug 2024 14:45:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrf1-00000003t8h-3b2T;
	Tue, 13 Aug 2024 13:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AEC2CCE139B;
	Tue, 13 Aug 2024 13:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C13C4AF0B;
	Tue, 13 Aug 2024 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723556041;
	bh=YjUeMGxUokPWbR1FpTGedLaSX1C6UavzEGCHc8VtbR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q/+VatEtPTBjkcOq0MBnr6OXIJnKVOTEx3h+Yq7EBHNuSom/YOwF8j+XP/D2B2ov3
	 XfuKY2e/uxf16cjp4pksVT+3uipxuLeGmF1WC3+/B+171i4ACPwkdI/oR8/HQvslsb
	 HpyTDZW1mNs0yiSp+BBSoUDTQj32Kwejtn6oepGUzH1XfAjXAR6QOsugLADwacQnIO
	 DcVpPfnpngTQ3YzBG4Aovfiu/yJdr4gaZXlnZPlPKMTEd8akxDOtFBU0ap3/H7QY9v
	 FWWgg16rytcSUqiQT8OF4H7WjK0tqxgI1V5+NEUOVdUuAd/jcoMGT+TYBTSoqG3iCg
	 KBnsuFGpYJhSA==
From: Simon Horman <horms@kernel.org>
Date: Tue, 13 Aug 2024 14:33:47 +0100
Subject: [PATCH net-next v2 1/3] ipv6: Add
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-ipv6_addr-helpers-v2-1-5c974f8cca3e@kernel.org>
References: <20240813-ipv6_addr-helpers-v2-0-5c974f8cca3e@kernel.org>
In-Reply-To: <20240813-ipv6_addr-helpers-v2-0-5c974f8cca3e@kernel.org>
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
X-CRM114-CacheID: sfid-20240813_063404_153326_2DC18224 
X-CRM114-Status: UNSURE (   8.53  )
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

Add helpers to convert an ipv6 addr, expressed as an array
of words, from CPU to big-endian byte order, and vice versa.

No functional change intended.
Compile tested only.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Link: https://lore.kernel.org/netdev/c7684349-535c-45a4-9a74-d47479a50020@lunn.ch/
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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


