Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5B0CF2576
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi0AlNa47OjnLX+zdNkH8pnYspHiUC9rPn7VlkLtCao=; b=kZX37lnWgGQHN5DYeTTTyy7JEp
	5F/J05keQEp50lFmtgjOGprCF37VJaAwvlUM6hOUckxzGHMlAeC+TlojM5LuR0ySKKEibEjsHJiqA
	6mDGT3rKrN1FF1cJzoElEOTXZ9xZUmtlEJYWNGyRP14WtU3SYFhn9+xsLSsUUXNiGxtBWSXr9O8WV
	nQHdOKHrYtjUcj2r5bs/0CQSwcZX9iX+9buqj90eAC80EeJdHYrEe9xyTodPfDphWozoBGPUBoBCU
	jZUuyR25dEGlbwMCeySZqRYS7RWZFf769hORJ+KUFdVyMgl2M9csnsJ/2VpbsKfKMis+PhgV1IzBt
	y3znZadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03q5-000000035l0-03TJ;
	Sun, 13 Oct 2024 19:01:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kf-000000034Yc-2Ixz;
	Sun, 13 Oct 2024 18:55:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a99d1b7b5f5so240947466b.0;
        Sun, 13 Oct 2024 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845736; x=1729450536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi0AlNa47OjnLX+zdNkH8pnYspHiUC9rPn7VlkLtCao=;
        b=BGKZHjBVFYINb203U1CSV6H3jsQUQ+Y4cmR2x153TGNO/mbDdtuL+4uZiKPPFIZIn/
         m/lEmly5CBhqm1gARd8r+g1+1uBfaBHCwGEe/tHfHLmzDWtjP4SLS+jLUkhP4Cjj+hkb
         XzQxf+2fWia6ntXbtIAXfi5QXjO8VQYhokkwgLVGmbher81RifhL0GBRNG9COQ0GO1aZ
         nge27BfuaYFxm8wfmwy3JSEI1uA5oylUkLx3gbjzVGKfGjWbF13Z9RS8C/axKzkH+MEI
         JTKPin3qUIY90acEy4KJ/ps3/BEJLiXfCzppOZvRK5ltAxDLJNO5KYuIBmGXndi/jqpg
         wDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845736; x=1729450536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi0AlNa47OjnLX+zdNkH8pnYspHiUC9rPn7VlkLtCao=;
        b=TomJ8s0DFsLlE7Bzp7tV278GOKznq5AENwZsL9Mk45iCPQl3UrfBWEULOzmXBcieuk
         MnEU9w1AlOM4FSF2tFbtDeMs46VQeL6xdQsjmDAj28NmtB9ELdNItkHBP3SEDhh+d0uS
         PrucziC7lQhgqIBSsQ94y4BG3a4L8IrZfalZM578Vb8O5rHi3Gb1xZBBdrfcmc6kEjuY
         xnMWelHQlZtTkkqv6/bzJoIu4MNd/Pzrcz4b41zktjYrKU/vR72/PnIE2N7PgpizICOT
         JGQUw3S7VRx0dkj28Mr4Ne9cb2pCaBLfgtB23/hQZLg/hEfgUyq0jqfVvP586o5ooqOo
         1bHA==
X-Forwarded-Encrypted: i=1; AJvYcCVXi11wYluS84IU30Bm3HYAPj2iC3AL/utnln3d8CAArIHVO9m+LAYWBpLOfIxt9n3um4C34RJzUeKXFINy6iA=@lists.infradead.org, AJvYcCX90PyUWR6eTLvqU9njlPM21NYxpMjl+9hGQO0Wbug1BYf9ckf0tNumeOz8vVUqH3d2lnrUgGvATeGQDqeYmHES@lists.infradead.org
X-Gm-Message-State: AOJu0YzUO0uZHdZc0fcePiVhK93a8QHYBtsHSrIgA7rL2CZHR1MI4JOI
	Fyh/XY9sdZZzJWv0aTM+wuiXDJB7CcvY/68Ie24hsXqnNSuh8miJ
X-Google-Smtp-Source: AGHT+IHVDWLkh2asCKPkqAFL6v1zfW7f+2znEwYnsBE2sJ/tzUwV2TxOCxBYdSzOWLcdLwlQKhvF3w==
X-Received: by 2002:a17:907:2da4:b0:a99:ffb5:1db6 with SMTP id a640c23a62f3a-a99ffb55507mr289530366b.24.1728845735564;
        Sun, 13 Oct 2024 11:55:35 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:35 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC v1 net-next 03/12] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Sun, 13 Oct 2024 20:54:59 +0200
Message-ID: <20241013185509.4430-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115537_616820_573C87A7 
X-CRM114-Status: GOOD (  11.64  )
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

This adds the capability to evaluate 802.1ad, QinQ, PPPoE and PPPoE-in-Q
packets in the bridge filter chain.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_chain_filter.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_chain_filter.c b/net/netfilter/nft_chain_filter.c
index 7010541fcca6..91aa3fa43d31 100644
--- a/net/netfilter/nft_chain_filter.c
+++ b/net/netfilter/nft_chain_filter.c
@@ -232,11 +232,27 @@ nft_do_chain_bridge(void *priv,
 		    struct sk_buff *skb,
 		    const struct nf_hook_state *state)
 {
+	struct ethhdr *ethh = eth_hdr(skb);
 	struct nft_pktinfo pkt;
+	int thoff;
 
 	nft_set_pktinfo(&pkt, skb, state);
 
-	switch (eth_hdr(skb)->h_proto) {
+	switch (ethh->h_proto) {
+	case htons(ETH_P_PPP_SES):
+		thoff = PPPOE_SES_HLEN;
+		ethh += thoff;
+		break;
+	case htons(ETH_P_8021Q):
+		thoff = VLAN_HLEN;
+		ethh += thoff;
+		break;
+	default:
+		thoff = 0;
+		break;
+	}
+
+	switch (ethh->h_proto) {
 	case htons(ETH_P_IP):
 		nft_set_pktinfo_ipv4_validate(&pkt);
 		break;
@@ -248,6 +264,8 @@ nft_do_chain_bridge(void *priv,
 		break;
 	}
 
+	pkt.thoff += thoff;
+
 	return nft_do_chain(&pkt, priv);
 }
 
-- 
2.45.2


