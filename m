Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545CED30007
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYTC1KKmj1Tx4GZAlIt/vCaAXRaBVXXUSQJlK1KgVeE=; b=sOUskSOGmjoR0sXfTMfM3RIYIq
	2dkd+Q8fOlCH8XCjmLsCXtjMbM/FiWeSAwjzLHTNQtuR07CyLvkjb8lmpiOwYx0vB4Iy4GmU3dNt1
	mLf5tfPRrOH1Jy5hI+TARV2Bl0E2LhZOi8hcLxZ6hvd925q0EKu2wNIWyx57l1mN3/4OX8aZpjtkM
	C/MgGlLmcv4XdIWkUKd94oMj4deaI+C2Dh3YZt9fENW4UKK/Kqwu/mOwlUFpxjTYNCTG0nCAvN0c/
	8b4qz9A8KmVWyWu773GkeIzwra9RU4VHSpZoW9AT9bj6G3ikyMfpDdpfjw8FVm7arDu8MYzDOSQaa
	kUyqLYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mzn-00000000rz2-1Js5;
	Fri, 18 Oct 2024 13:26:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mrf-00000000r5N-2xyA;
	Fri, 18 Oct 2024 13:18:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315ce4d250so2170235e9.2;
        Fri, 18 Oct 2024 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729257478; x=1729862278; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYTC1KKmj1Tx4GZAlIt/vCaAXRaBVXXUSQJlK1KgVeE=;
        b=CLGet90yGRk94hacHz9IJMKJ2e6XHkY4rlat0KhXNd2Eg8h45T0A3sA0Dw1LPBauf8
         Vw3oZCOBWqsCLbXwo96A+sJc43LrdN/LTF7PMywKsIwhB4JfeldikzRGfd65wqVwTczk
         DTXx2GF8oMHJKGrWvO7d0jSIeD8twmjulq3yQ2X1BhD8cAUWOzHxwNzFpob2TPQj+sLl
         1nK37FGzUHeoQkPZn8AuibaaZS641nmWsyPTrazaakbAHFt4badOTC8TpDAL/iCpPEBh
         dhO7v5TI/uA0Nkil9sKZos0r0GXwyK6h55Agc+EX6h4gqTrLgs1c6r+U0QPTXsJ/C2a0
         2o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257478; x=1729862278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYTC1KKmj1Tx4GZAlIt/vCaAXRaBVXXUSQJlK1KgVeE=;
        b=dCMRJQl4dw6zEtG1u0rDC1W4lvnYZEI9vZEE+FelN2z+jr7KfR/HJb5YEicngThpOw
         3gKxmV+ZdEYlNAnYiF4Z/D7l1q/y1RyhjsWXm1NlvyuEBxKtv6r0DX9kUS03ehk0aAkn
         4ii8AtT2JbfdCZ8aY7lOJPEEqSTDNyKPAgbdweSOZG9t0ME8N0ION5uQlmSBnbXlCtqr
         S2k1w4r9lxHH5Fh64Mc5/6AE/VoX9ybPkYIfDMc9QTOLxzZnspfGLoZqC1nQ4w8NYbXz
         ooVJqlyWnF4gxgWB+iK6KiDa/hhw/Npw9qmfYKB1PbajT4CmzehaVlfZOLe4XEPrXOpD
         w7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVB0h3lMVV3qYfLX42uF0xV6CUEq0qa7zgLr74+R7esCnEl7Oh0Q2Mlu7e880gCIy+FlYot0bChr46ksnEo68KE@lists.infradead.org, AJvYcCVepiaCPropAU9y9jCszvdrFmarQJcGcsx7YKMKBWBXXgfhFDBFIlfaZMkDwHg9auGQ4AEV5YJtyA3xDSpfeiA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8tWywOxVnJQPPHIOXvtqUJa9WjrJTLbx2Q2BfKKifQWBKfFRY
	TggFL6joFx5HPqJSCJvBIJWlWhKrbBQMHHWUoZBz2zTjacwCJlf6
X-Google-Smtp-Source: AGHT+IEq019Hq1TIXR/qIFJskJJDma7tgLtYd48CED4u+gZEDmakAyaK8oGFTjQd2kcXyOKjRJnT+g==
X-Received: by 2002:a05:600c:1c08:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-4316168f7f2mr8301575e9.7.1729257477692;
        Fri, 18 Oct 2024 06:17:57 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160695d8fsm27244935e9.27.2024.10.18.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:17:57 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:17:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC v1 net-next 02/12] netfilter: bridge: Add conntrack
 double vlan and pppoe
Message-ID: <20241018131754.ikrrnsspjsu5ppfz@skbuf>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-3-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013185509.4430-3-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_061759_815407_9E0C7CBD 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 13, 2024 at 08:54:58PM +0200, Eric Woudstra wrote:
> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets that are passing a bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---

Whatever you choose to do forward with these patches, please squash this
build fix here (you can drop my authorship info and commit message):

From e73315196c3143de2af2fe39e3b0e95391849d6c Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Fri, 18 Oct 2024 13:59:27 +0300
Subject: [PATCH] netfilter: bridge: fix build failures in nf_ct_bridge_pre()

clang-16 fails to build, stating:

net/bridge/netfilter/nf_conntrack_bridge.c:257:3: error: expected expression
                struct ppp_hdr {
                ^
net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
                data_len = ntohs(ph->hdr.length) - 2;
                                 ^
net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
net/bridge/netfilter/nf_conntrack_bridge.c:262:20: error: use of undeclared identifier 'ph'
net/bridge/netfilter/nf_conntrack_bridge.c:265:11: error: use of undeclared identifier 'ph'
                switch (ph->proto) {
                        ^

net/bridge/netfilter/nf_conntrack_bridge.c:278:3: error: expected expression
                struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
                ^
net/bridge/netfilter/nf_conntrack_bridge.c:283:17: error: use of undeclared identifier 'vhdr'
                inner_proto = vhdr->h_vlan_encapsulated_proto;
                              ^

One cannot have variable declarations placed this way in a switch/case
statement, a new scope must be opened.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 net/bridge/netfilter/nf_conntrack_bridge.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
index fb2f79396aa0..31e2bcd71735 100644
--- a/net/bridge/netfilter/nf_conntrack_bridge.c
+++ b/net/bridge/netfilter/nf_conntrack_bridge.c
@@ -253,7 +253,7 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 		return NF_ACCEPT;
 
 	switch (skb->protocol) {
-	case htons(ETH_P_PPP_SES):
+	case htons(ETH_P_PPP_SES): {
 		struct ppp_hdr {
 			struct pppoe_hdr hdr;
 			__be16 proto;
@@ -273,7 +273,8 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 			return NF_ACCEPT;
 		}
 		break;
-	case htons(ETH_P_8021Q):
+	}
+	case htons(ETH_P_8021Q): {
 		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
 
 		data_len = 0xffffffff;
@@ -281,6 +282,7 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 		outer_proto = skb->protocol;
 		inner_proto = vhdr->h_vlan_encapsulated_proto;
 		break;
+	}
 	default:
 		data_len = 0xffffffff;
 		break;
-- 
2.43.0


