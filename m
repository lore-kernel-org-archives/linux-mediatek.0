Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C031D1812A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toAdeYu7YM++Cxc6jEpju3gZivvLZBwOrQ+Xf1nUCvc=; b=QR72h467UxbV3hGtjqRg8ykcMd
	5sVSH1MQktmBiWt54EuxGBCmrbcr/wgWC3QAHsroSnZfLUx8GH7N6tPNeocYc/NRFcCeG6/qRRWE1
	Rs4ZGaHQ+h7tGwTa5/rIhW5+3NfuMUlM2SbLVy2RyucFKvisiui0woSyPMISlMm2jkp20u/KFfbxD
	mCwkrvUDk7dlZKkB1DFkjwBiZu2szTLPWXbglBKmv2+v7xZPh4jn8plYnDzM5jCdvFribp3HR+w+B
	FbHLlbHMxXvgrcKL0MDwyE/gJUSPKcxx4csXl+7b7Za6qxVgTeMHYG4crxrgM+ajEK3UjR+3/YrK8
	02tS8acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0N7k-00000005hIn-3nTz;
	Mon, 14 Oct 2024 15:36:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0MKy-00000005XIo-0Vau;
	Mon, 14 Oct 2024 14:46:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43117fd9afeso6240405e9.2;
        Mon, 14 Oct 2024 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728917177; x=1729521977; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=toAdeYu7YM++Cxc6jEpju3gZivvLZBwOrQ+Xf1nUCvc=;
        b=bbtKKfquIC2/jlv2kJTprL1BM09ZfQmjR6colHkydNoRoB4zqYVwWQJ83qiv4Z3mNq
         LUj9Zj3FrMQ7i0xjVjvE2CI2kmI2uUgLhMrr9LbfTsJrPgB/0xB0wjhP8biIiYIw1hH5
         WomiHCUtp381MUDZQZbHh7LDRsJNHRCCYPgL+ALIJwqYd7YBbz9CWTufD+EgZwyHVvWB
         7bBJTQM3yOiQWkfjifR2RfTO5feGbcV3pYDytZUT6OXQyji3y2Ak0/MtDeTTunyiJqoN
         oLwH0o/w3ohONes6vK+tCedZ0ew3wmQ6GPdbSTeAKjJBiBp+v+9aPZVoiXiqWOHlmHxr
         FhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728917177; x=1729521977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toAdeYu7YM++Cxc6jEpju3gZivvLZBwOrQ+Xf1nUCvc=;
        b=wTMv3Nt6RfFn/tpki+81zf1LeV2p+OpPflvAYirX/TD+s/VyITN6+sc9JGa4rpoXds
         Sfi3Vj9yDfkE6VGMdvNhWZe9u9cALBKL580HVW0eFhgSdDZUUkjdcSCsC8V0v2BSfXVE
         bNFXFYV7w0h8NQd/L4tPSGdUtPRuk8iSAVmWnTbQ8SnQWynAZHM4O0o57v3OkPKYkacp
         6wN7bbfJ+fhUp63rQXTI9TqkxGy+yvr8no+F67zNpSNmOXBMDAM/Za5VRxVUVdJ6JWyz
         /syppleNQqUsGw75ReI9hyxhplidqw93Hvd7Svbb/wEdzy2gASDl3Om4wK+Uu6l9u0ue
         VBqA==
X-Forwarded-Encrypted: i=1; AJvYcCVMndTDfxE3snpsHWaIDdZLBqn1e+9v49haGMtmrN5BcSzjWL1RzvVSmoNmKmDSSg81zU2Loq3DfxHSIUd6dU4=@lists.infradead.org, AJvYcCWNzoLmG/KgSVciSMs0IksWG0+Ce4V8HRtt3vSRrpIfuAH6bbQ723hIy0xxlI92XcibeXEbM5juYa1l1vBJzpyU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2XCDPasHAhbGb198ygDGNlmrsNC5HDYQlIKySv117l+sb3yWt
	m7Kx9ZKCQENQ+j7uhxliq0uEcSSvM6PP8rlRwjJFLo1inB9MeuVg
X-Google-Smtp-Source: AGHT+IHnyoTO36H7Xhyv3DPKerYRmIm0V8WWjqWCmc69d+AosbpQg92p6SCpOjFVzfiFZSzf4BgSUQ==
X-Received: by 2002:a05:600c:358f:b0:42c:bfd6:9d1f with SMTP id 5b1f17b1804b1-4311debbe68mr44024185e9.1.1728917177205;
        Mon, 14 Oct 2024 07:46:17 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431183062ddsm123553365e9.27.2024.10.14.07.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:46:16 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:46:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC v1 net-next 11/12] bridge:
 br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
Message-ID: <20241014144613.mkc62dvfzp3vr7rj@skbuf>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-12-ericwouds@gmail.com>
 <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
 <6209405e-7100-43f9-b415-3be8fbcc6352@blackwall.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6209405e-7100-43f9-b415-3be8fbcc6352@blackwall.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_074620_193422_5B2A49A0 
X-CRM114-Status: GOOD (  34.51  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Keeping the full email body untrimmed for extra context for the newly
added people.

On Mon, Oct 14, 2024 at 09:22:07AM +0300, Nikolay Aleksandrov wrote:
> On 14/10/2024 09:18, Nikolay Aleksandrov wrote:
> > On 13/10/2024 21:55, Eric Woudstra wrote:
> >> In network setup as below:
> >>
> >>              fastpath bypass
> >>  .----------------------------------------.
> >> /                                          \
> >> |                        IP - forwarding    |
> >> |                       /                \  v
> >> |                      /                  wan ...
> >> |                     /
> >> |                     |
> >> |                     |
> >> |                   brlan.1
> >> |                     |
> >> |    +-------------------------------+
> >> |    |           vlan 1              |
> >> |    |                               |
> >> |    |     brlan (vlan-filtering)    |
> >> |    |               +---------------+
> >> |    |               |  DSA-SWITCH   |
> >> |    |    vlan 1     |               |
> >> |    |      to       |               |
> >> |    |   untagged    1     vlan 1    |
> >> |    +---------------+---------------+
> >> .         /                   \
> >>  ----->wlan1                 lan0
> >>        .                       .
> >>        .                       ^
> >>        ^                     vlan 1 tagged packets
> >>      untagged packets
> >>
> >> Now that DEV_PATH_MTK_WDMA is added to nft_dev_path_info() the forward
> >> path is filled also when ending with the mediatek wlan1, info.indev not
> >> NULL now in nft_dev_forward_path(). This results in a direct transmit
> >> instead of a neighbor transmit. This is how it should be, But this fails.
> >>
> >> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
> >> filling in from brlan.1 towards wlan1. But it should be set to
> >> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
> >> is not correct. The dsa switchdev adds it as a foreign port.
> >>
> >> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG is
> >> set when there is a dsa-switch inside the bridge.
> >>
> >> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> >> ---
> >>  net/bridge/br_private.h |  1 +
> >>  net/bridge/br_vlan.c    | 18 +++++++++++++++++-
> >>  2 files changed, 18 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
> >> index 8da7798f9368..7d427214cc7c 100644
> >> --- a/net/bridge/br_private.h
> >> +++ b/net/bridge/br_private.h
> >> @@ -180,6 +180,7 @@ enum {
> >>  	BR_VLFLAG_MCAST_ENABLED = BIT(2),
> >>  	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
> >>  	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
> >> +	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
> >>  };
> >>  
> >>  /**
> >> diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
> >> index 1830d7d617cd..b7877724b969 100644
> >> --- a/net/bridge/br_vlan.c
> >> +++ b/net/bridge/br_vlan.c
> >> @@ -3,6 +3,7 @@
> >>  #include <linux/netdevice.h>
> >>  #include <linux/rtnetlink.h>
> >>  #include <linux/slab.h>
> >> +#include <net/dsa.h>
> >>  #include <net/switchdev.h>
> >>  
> >>  #include "br_private.h"
> >> @@ -100,6 +101,19 @@ static void __vlan_flags_commit(struct net_bridge_vlan *v, u16 flags)
> >>  	__vlan_flags_update(v, flags, true);
> >>  }
> >>  
> >> +static inline bool br_vlan_tagging_by_switchdev(struct net_bridge *br)
> > 
> > no inline in .c files and also constify br
> > 
> >> +{
> >> +#if IS_ENABLED(CONFIG_NET_DSA)
> >> +	struct net_bridge_port *p;
> >> +
> >> +	list_for_each_entry(p, &br->port_list, list) {
> >> +		if (dsa_user_dev_check(p->dev))
> > 
> > I don't think this can change at runtime, so please keep a counter in
> > the bridge and don't walk the port list on every vlan add.
> > 
> 
> you can use an internal bridge opt (check br_private.h) with a private opt
> that's set when such device is added as a port, no need for a full counter
> obviously

To continue on Nikolay's line of thought...

Can you abstractly describe which functional behavior do you need the
bridge port to perform, rather than "it needs to be a DSA user port"?

switchdev_bridge_port_offload() has a mechanism to inform the bridge
core of extra abilities (like tx_fwd_offload). Perhaps you could modify
the DSA drivers you need to set a similar bit to inform the bridge of
their presence and ability. That would also work when the bridge port is
a LAG over a DSA user port.

Also, please also CC DSA maintainers when you use DSA API outside
net/dsa/ and drivers/net/dsa/. I am in the process of revamping the
public DSA API and would like to be in touch with changes as they are
made.

> >> +			return false;
> >> +	}
> >> +#endif
> >> +	return true;
> >> +}
> >> +
> >>  static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
> >>  			  struct net_bridge_vlan *v, u16 flags,
> >>  			  struct netlink_ext_ack *extack)
> >> @@ -113,6 +127,8 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
> >>  	if (err == -EOPNOTSUPP)
> >>  		return vlan_vid_add(dev, br->vlan_proto, v->vid);
> >>  	v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV;
> >> +	if (br_vlan_tagging_by_switchdev(br))
> >> +		v->priv_flags |= BR_VLFLAG_TAGGING_BY_SWITCHDEV;
> >>  	return err;
> >>  }
> >>  
> >> @@ -1491,7 +1507,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
> >>  
> >>  	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
> >>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
> >> -	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
> >> +	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
> >>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
> >>  	else
> >>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
> > 

