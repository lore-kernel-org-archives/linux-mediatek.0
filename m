Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22581CF2579
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfUb9HJ+s1GLLmxcujXBQ1+8qs5ZhQwuVS6uJsoTo/c=; b=YdLlamKFLYml19bXRiQVsck1hO
	OS9NBWX/AHZwTrqVVBWGH9DcGK5902ItUFhPClGdR9TNlaksZhxSBchTbIK4mWrcdlctIkGFvOOgF
	oKh8N9+U0VyjmmKCHNpxemvywkPA++q9F12THN2z2lcuqEf5XbbzYyokNWVYLhFksC0F7Rsk6kCyh
	cvNSfdo6C/fIkHndgxoDJ+GcNZfRYaGQIg/h6m2tchoj696Bt38vNBhrhyTcBHaw7XXjU9it6jdLH
	Dg5tgAF/pZ8kR2fOXM0xtmLvPr1l0zb7r19iBArnAub/qXyG211VyKB3utDyPvqr9ydO/Y9lNlHVX
	qzBq224A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03oh-000000035VL-4BTb;
	Sun, 13 Oct 2024 18:59:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kd-000000034Y8-45vG;
	Sun, 13 Oct 2024 18:55:37 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a994cd82a3bso529004166b.2;
        Sun, 13 Oct 2024 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845734; x=1729450534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfUb9HJ+s1GLLmxcujXBQ1+8qs5ZhQwuVS6uJsoTo/c=;
        b=KIzX0WpKhF5fxODZyuF//67Sw+AB8xNI1E71a5KEx29oGQqwBxkZ8m91nwggj0Y2UP
         vGsrvdOe059ivc1feiHpr2mEOx/gsZxkmLQkfDu/MJLrqbAeT1aeCIUbiTZSn/qsF80m
         rJxy/tSrTi60kDIn7R3ZQZ/DmHmCqzn5ghMwX3AQkRC8v9rOqvsQwfhFr2wFMhbTZR8f
         lJsJKCgc3spMdren1Aj4Mg2D2EYvkGxEPmmvbvYF8YpojHpopmYvSHHZ23uxvJyIdvLq
         fcpZWY20cPYOAFgle2EJb9x6Lh9gnhDavp6RJoOfNXmbpeLS5WOz3++uTBJ/aa8PsMVe
         Besg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845734; x=1729450534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfUb9HJ+s1GLLmxcujXBQ1+8qs5ZhQwuVS6uJsoTo/c=;
        b=D68ucnzuKoQ82zndnzcEKIVvQZk6utdiMxrAi101wLUHhsjaY4qNfvzYypIEH4lSPT
         uoT2to1+1RmI/B66/1rHH5OlowKd1ybV3l2M50r9wJTLsNiP7nc9qItfkrwHxKlBsiQA
         FhKOjtD8C/9FYMx8w+hmtfsjSh1YlFMkDDGZsDv2J4yFBCwgvcQygNcC/lGjmHehf8tp
         c7jC+6lGN1jLFkAn/3oTlG1krqVDZgCQnIYtCCW5Qi5Jam2TiwXMGe1nw/Ml3bDHL33j
         DBTYY7EReJeww8OsPOWdZ+R8zYhSKWEDR3Xsj6IKwg+ixJSzDUtLu99PAt7aPHAyrk+D
         MNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMiVBDZAVhRxTUA8Aq1hDr0GlLgunYW4rj8/7olBW7WmPak287M8s340YZ3pY8a7TniArJRZpZPsjeQ9qBW6DS@lists.infradead.org, AJvYcCWAzfZi9pLEnk0itIfP0wRlsG0CIziS3u2vLUX1GWCBFYX/48r9zq0QytFKCEj69MrZzuxuMiVINPSh2OuU2Y8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHIsQGV/k4N6fJAXNA45bQCHr2xTxYuOayZusahnvO/PEUQ1Aq
	soNbX5pqxJeCF5gm0CXxeq/bhD2laZuaNKuaiwMxtF7t+P9x/YHW
X-Google-Smtp-Source: AGHT+IH+8DzpaIYRj4WDn5wY606h6B8yn6VPFaENvcSZa4TDlxRT2Jmn8BI4I5TivbHspBA60sKu/Q==
X-Received: by 2002:a17:907:6d14:b0:a8d:5472:b591 with SMTP id a640c23a62f3a-a99b93a86b0mr765431566b.5.1728845734027;
        Sun, 13 Oct 2024 11:55:34 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:33 -0700 (PDT)
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
Subject: [PATCH RFC v1 net-next 02/12] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Sun, 13 Oct 2024 20:54:58 +0200
Message-ID: <20241013185509.4430-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115536_036022_200E12D0 
X-CRM114-Status: GOOD (  13.47  )
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

This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
packets that are passing a bridge.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/netfilter/nf_conntrack_bridge.c | 86 ++++++++++++++++++----
 1 file changed, 73 insertions(+), 13 deletions(-)

diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
index 816bb0fde718..fb2f79396aa0 100644
--- a/net/bridge/netfilter/nf_conntrack_bridge.c
+++ b/net/bridge/netfilter/nf_conntrack_bridge.c
@@ -241,56 +241,116 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 				     const struct nf_hook_state *state)
 {
 	struct nf_hook_state bridge_state = *state;
+	__be16 outer_proto, inner_proto;
 	enum ip_conntrack_info ctinfo;
+	int ret, offset = 0;
 	struct nf_conn *ct;
-	u32 len;
-	int ret;
+	u32 len, data_len;
 
 	ct = nf_ct_get(skb, &ctinfo);
 	if ((ct && !nf_ct_is_template(ct)) ||
 	    ctinfo == IP_CT_UNTRACKED)
 		return NF_ACCEPT;
 
+	switch (skb->protocol) {
+	case htons(ETH_P_PPP_SES):
+		struct ppp_hdr {
+			struct pppoe_hdr hdr;
+			__be16 proto;
+		} *ph = (struct ppp_hdr *)(skb->data);
+
+		data_len = ntohs(ph->hdr.length) - 2;
+		offset = PPPOE_SES_HLEN;
+		outer_proto = skb->protocol;
+		switch (ph->proto) {
+		case htons(PPP_IP):
+			inner_proto = htons(ETH_P_IP);
+			break;
+		case htons(PPP_IPV6):
+			inner_proto = htons(ETH_P_IPV6);
+			break;
+		default:
+			return NF_ACCEPT;
+		}
+		break;
+	case htons(ETH_P_8021Q):
+		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
+
+		data_len = 0xffffffff;
+		offset = VLAN_HLEN;
+		outer_proto = skb->protocol;
+		inner_proto = vhdr->h_vlan_encapsulated_proto;
+		break;
+	default:
+		data_len = 0xffffffff;
+		break;
+	}
+
+	if (offset) {
+		switch (inner_proto) {
+		case htons(ETH_P_IP):
+		case htons(ETH_P_IPV6):
+			if (!pskb_may_pull(skb, offset))
+				return NF_ACCEPT;
+			skb_pull_rcsum(skb, offset);
+			skb_reset_network_header(skb);
+			skb->protocol = inner_proto;
+			break;
+		default:
+			return NF_ACCEPT;
+		}
+	}
+
+	ret = NF_ACCEPT;
 	switch (skb->protocol) {
 	case htons(ETH_P_IP):
 		if (!pskb_may_pull(skb, sizeof(struct iphdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = skb_ip_totlen(skb);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ip_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV4;
 		ret = nf_ct_br_defrag4(skb, &bridge_state);
 		break;
 	case htons(ETH_P_IPV6):
 		if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = sizeof(struct ipv6hdr) + ntohs(ipv6_hdr(skb)->payload_len);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ipv6_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV6;
 		ret = nf_ct_br_defrag6(skb, &bridge_state);
 		break;
 	default:
 		nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
-		return NF_ACCEPT;
+		goto do_not_track;
 	}
 
-	if (ret != NF_ACCEPT)
-		return ret;
+	if (ret == NF_ACCEPT)
+		ret = nf_conntrack_in(skb, &bridge_state);
 
-	return nf_conntrack_in(skb, &bridge_state);
+do_not_track:
+	if (offset) {
+		skb_push_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		skb->protocol = outer_proto;
+	}
+	return ret;
 }
-
 static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
 				    const struct nf_hook_state *state)
 {
-- 
2.45.2


