Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456C2C19F32
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2025 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JO19ZBibRl5Dbek15Jjj5QI3hOqKQ5lfbE+tqwKDH60=; b=YBX/MzaCjL3A3v
	zF3uL2jiRTlEHbNuVRSX7idlXT06mTA5VQ4pdQlzI/F6e4vhqv27/kqANoS8qugssEMkEfYf3VWv7
	lNzPo8DmNqNcy89+9qbehVI+W/Sp3mEvYP+4/ItuTc2pjDHnuNTyA9q+zWiwJLbgzHu6TaE0Ls4bi
	PkTkhoX8ccXzmZuFO6LPk3avCcq+gFPm5hIWucjSn6bQGPzWiiMiKo0Xm7eE06I3pET5c0Jmwrb/5
	eZTMqQS1C7p8e6R/YD5LKHnTgfLJ2KmzqOkjYnBMDJ2EyeXq9AYTC9kLxjfuVNfC+ytxTrUZo1skD
	89fZn5qZ87a0Ov+bEmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpsM-00000009SS0-0sf0;
	Fri, 28 Feb 2025 02:13:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpoS-00000009S32-0FLX;
	Fri, 28 Feb 2025 02:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F71B5C4360;
	Fri, 28 Feb 2025 02:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFDDC4CEDD;
	Fri, 28 Feb 2025 02:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740708555;
	bh=7aXQGxqBnGBVomTgWjndFPyhUKxp6YcF8yQM4y03MzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L0th/sWWHGU3L3ZB4L4y9cOzD8ByR6pb7+el6BvGsXLUQ8iqm6AEhKVmCMM0SSSbk
	 yxRLSqd/t3znZTsdxXcUSj3O1jq9dUnMd1m/OcuNnJ3Ke107rfyH8mwXjNpJoIcV7W
	 Iml0gPtdfeIFLn9DFnTYhtlj+UsFUcezC77UgAQ12XwIZOzmL7TG/KQfGrJVv+MS/T
	 CUWT8KIb6lSF7c+Uc2JF3DugJOodiS/lWvBJXFxpza2vn5ZXDMb9xszU4d58GZPuTN
	 FAepguvrmXrScWdc3m25CSbbATulrU+oy5Gd0w9ngI3XOqjq+uvIR4O8xV4AjXuzID
	 Dym3U7UP3jeGA==
Date: Thu, 27 Feb 2025 18:09:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH v7 net-next 03/14] netfilter: bridge: Add conntrack
 double vlan and pppoe
Message-ID: <20250227180913.6248bbd3@kernel.org>
In-Reply-To: <20250225201616.21114-4-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
	<20250225201616.21114-4-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_180916_182178_E71186E2 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Joe Damato <jdamato@fastly.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lobakin <aleksander.lobakin@intel.com>, netfilter-devel@vger.kernel.org, Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 25 Feb 2025 21:16:05 +0100 Eric Woudstra wrote:
> +		struct ppp_hdr {
> +			struct pppoe_hdr hdr;
> +			__be16 proto;
> +		} *ph;

W=1 C=1 GCC build gives us:

net/bridge/netfilter/nf_conntrack_bridge.c: note: in included file (through ../include/linux/if_pppox.h, ../include/uapi/linux/netfilter_bridge.h, ../include/linux/netfilter_bridge.h):
include/uapi/linux/if_pppox.h:153:29: warning: array of flexible structures

I'm guessing it doesn't like that hdr has a zero-length array which
overlaps proto.

Looks like kernel code doesn't current need those arrays.
Could you submit something like the diff below first, and then rebase on top?
CC hardening folks on the submission.

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 2ea4f4890d23..3a800af4e987 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -881,7 +881,7 @@ static int pppoe_sendmsg(struct socket *sock, struct msghdr *m,
        skb->protocol = cpu_to_be16(ETH_P_PPP_SES);
 
        ph = skb_put(skb, total_len + sizeof(struct pppoe_hdr));
-       start = (char *)&ph->tag[0];
+       start = (char *)ph + sizeof(*ph);
 
        error = memcpy_from_msg(start, m, total_len);
        if (error < 0) {
diff --git a/include/uapi/linux/if_pppox.h b/include/uapi/linux/if_pppox.h
index 9abd80dcc46f..29b804aa7474 100644
--- a/include/uapi/linux/if_pppox.h
+++ b/include/uapi/linux/if_pppox.h
@@ -122,7 +122,9 @@ struct sockaddr_pppol2tpv3in6 {
 struct pppoe_tag {
        __be16 tag_type;
        __be16 tag_len;
+#ifndef __KERNEL__
        char tag_data[];
+#endif
 } __attribute__ ((packed));
 
 /* Tag identifiers */
@@ -150,7 +152,9 @@ struct pppoe_hdr {
        __u8 code;
        __be16 sid;
        __be16 length;
+#ifndef __KERNEL__
        struct pppoe_tag tag[];
+#endif
 } __packed;
 
 /* Length of entire PPPoE + PPP header */
-- 
pw-bot: cr

