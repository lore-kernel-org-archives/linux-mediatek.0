Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96E4D3C92A
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4Y2KUB+hbtJn19jSvIIFOnWpC0zAHFrReVOA/qxdR4=; b=MKEDqU+f0byd6W
	UXcgROUg2B7Fgk1tQRl2gQzoFMwHV/woClGHdU1c5ixioNG5H6BxpIN3+Ren7DpPWo8ZTp7QeD+Jp
	XgW8WM/bom4IdX9FyxHwWXmis5CxsmPrjAspdF8EdBE39SwRFODmfR7UUlqz8XdlcKuzWNnjAqx7x
	3JrXDjw1UO5lokDDsnuv5CWzvNgD91ixv5dV0kzblRONoFekQ4jnUwUSmp46NlhKtAHLi8k6adZoV
	Z0vbL5llSOsL9oXp2m2LxZCrNxdnms0x0G7UKFaqOcIyZ4bMg7btBXbjDuqgOF6R60YpBtsDxd2+n
	oM4NploXSWuUbjs0cJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2SBC-00000004g8L-1dK5;
	Sun, 20 Oct 2024 09:24:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2S9i-00000004g0p-3IDF;
	Sun, 20 Oct 2024 09:23:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso515686066b.3;
        Sun, 20 Oct 2024 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729416201; x=1730021001; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W4Y2KUB+hbtJn19jSvIIFOnWpC0zAHFrReVOA/qxdR4=;
        b=h6k79vWY2AzDfX5ina2uEWi+n4sLsaLWds6OOYmQDt2IBSwvNU0e1oCVTJ031d1ZzY
         DVm/6snIDpXQ27lCi5Hl8o50zQum8m2n7+PQsjK08zJZNVJWrPNCWaS9KZjeRe3sc//W
         TlDaF4Y4lhmuAapqZ9hM1jI+5TRfsMlGUE+OvwnV50jRv7sMXWPU3dk0gXzladEQAwbY
         TmCpe9lEG44U3um/WZZvqTnsNokUCIJGKDDY2GpC/YHMSBE3OHuTE4+7/0X31WJ6I5BJ
         auDGY3GIyikz05Uub9vHvfYAPv5kj++zdP8+Qqw8zI8v08hnHUOdiIdTevvY5jzsl+tE
         xM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729416201; x=1730021001;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4Y2KUB+hbtJn19jSvIIFOnWpC0zAHFrReVOA/qxdR4=;
        b=KCgTuRFUVbne3i62qGjo6mHdjlrw9yJIOhaa7iUxmOK76xMUkjoigI9MM4F00aYts8
         vPlnliGpmf/ti9lXtf0YH9tkGxfdC4oVEqF9QLKvmbzVupGsF0IvJHXv1ltLFpN9cfL9
         EKDPIJlnl4M8TztQkbU8+7AK3g2nPtKUZXwo9vxTndk2WAIdxbQcvi4eFyvT+h9zryFh
         5fPoTXr8bYfdVLOH9ZjLSlz+46GiWoDrlCvWk1ULrzZans1puyGJrbPeRidi4AfjA/dh
         z6+pzj9ozBNYrlrIf9HrzIlQ4DyS/YXjyNLPdIvGPS2uYMTTks7fZXh10OLvHXGZ7Dsr
         nCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUegkYH3/CZ+SiIetFKXJjIc1Q/p+kdl2mmLKrHyXhP91qieVNRiVaa+K5KNVJ1qS64lazxlz4fp4V3cbrASHt6@lists.infradead.org, AJvYcCWaKKe80XorxiZS/GzPVedRX2sYDK3MpVyCPt8A/ftvH1ZTFOKAqHqzKXwKVfVh6VneBfsEqzTe7r+NrO8bAbs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhA/GMCA4kX/iGxn8lscDYBxfMTLCmE07UohE0Vqm8B/Wvvm8z
	r4C1N64y04bz8vV86s/ChNtvaecE7TpLXYPX6vmWqrZaZiVS3Xy/
X-Google-Smtp-Source: AGHT+IEgeEWzgpPx3nVPIrbqvcrJAh2HUIJo7F0NyWd9SDpb4MuFwKVVJY7MiRPCxJBECDErYIC58A==
X-Received: by 2002:a17:907:7da0:b0:a99:5ad9:b672 with SMTP id a640c23a62f3a-a9a69a63330mr775176966b.10.1729416200400;
        Sun, 20 Oct 2024 02:23:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91599362sm69317566b.197.2024.10.20.02.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 02:23:19 -0700 (PDT)
Message-ID: <785f6b7a-1de1-46fe-aa6f-9b20feee5973@gmail.com>
Date: Sun, 20 Oct 2024 11:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 11/12] bridge:
 br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
From: Eric Woudstra <ericwouds@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-12-ericwouds@gmail.com>
 <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
 <6209405e-7100-43f9-b415-3be8fbcc6352@blackwall.org>
 <20241014144613.mkc62dvfzp3vr7rj@skbuf>
 <b919a6b1-1c07-4fc9-b3dc-a7ac2f3645bf@gmail.com>
Content-Language: en-US
In-Reply-To: <b919a6b1-1c07-4fc9-b3dc-a7ac2f3645bf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_022322_869579_E30D0EBC 
X-CRM114-Status: GOOD (  50.59  )
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



On 10/15/24 12:26 PM, Eric Woudstra wrote:
> 
> 
> On 10/14/24 4:46 PM, Vladimir Oltean wrote:
>> Keeping the full email body untrimmed for extra context for the newly
>> added people.
>>
>> On Mon, Oct 14, 2024 at 09:22:07AM +0300, Nikolay Aleksandrov wrote:
>>> On 14/10/2024 09:18, Nikolay Aleksandrov wrote:
>>>> On 13/10/2024 21:55, Eric Woudstra wrote:
>>>>> In network setup as below:
>>>>>
>>>>>              fastpath bypass
>>>>>  .----------------------------------------.
>>>>> /                                          \
>>>>> |                        IP - forwarding    |
>>>>> |                       /                \  v
>>>>> |                      /                  wan ...
>>>>> |                     /
>>>>> |                     |
>>>>> |                     |
>>>>> |                   brlan.1
>>>>> |                     |
>>>>> |    +-------------------------------+
>>>>> |    |           vlan 1              |
>>>>> |    |                               |
>>>>> |    |     brlan (vlan-filtering)    |
>>>>> |    |               +---------------+
>>>>> |    |               |  DSA-SWITCH   |
>>>>> |    |    vlan 1     |               |
>>>>> |    |      to       |               |
>>>>> |    |   untagged    1     vlan 1    |
>>>>> |    +---------------+---------------+
>>>>> .         /                   \
>>>>>  ----->wlan1                 lan0
>>>>>        .                       .
>>>>>        .                       ^
>>>>>        ^                     vlan 1 tagged packets
>>>>>      untagged packets
>>>>>
>>>>> Now that DEV_PATH_MTK_WDMA is added to nft_dev_path_info() the forward
>>>>> path is filled also when ending with the mediatek wlan1, info.indev not
>>>>> NULL now in nft_dev_forward_path(). This results in a direct transmit
>>>>> instead of a neighbor transmit. This is how it should be, But this fails.
>>>>>
>>>>> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
>>>>> filling in from brlan.1 towards wlan1. But it should be set to
>>>>> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
>>>>> is not correct. The dsa switchdev adds it as a foreign port.
>>>>>
>>>>> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG is
>>>>> set when there is a dsa-switch inside the bridge.
>>>>>
>>>>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>>>>> ---
>>>>>  net/bridge/br_private.h |  1 +
>>>>>  net/bridge/br_vlan.c    | 18 +++++++++++++++++-
>>>>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
>>>>> index 8da7798f9368..7d427214cc7c 100644
>>>>> --- a/net/bridge/br_private.h
>>>>> +++ b/net/bridge/br_private.h
>>>>> @@ -180,6 +180,7 @@ enum {
>>>>>  	BR_VLFLAG_MCAST_ENABLED = BIT(2),
>>>>>  	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
>>>>>  	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
>>>>> +	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
>>>>>  };
>>>>>  
>>>>>  /**
>>>>> diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
>>>>> index 1830d7d617cd..b7877724b969 100644
>>>>> --- a/net/bridge/br_vlan.c
>>>>> +++ b/net/bridge/br_vlan.c
>>>>> @@ -3,6 +3,7 @@
>>>>>  #include <linux/netdevice.h>
>>>>>  #include <linux/rtnetlink.h>
>>>>>  #include <linux/slab.h>
>>>>> +#include <net/dsa.h>
>>>>>  #include <net/switchdev.h>
>>>>>  
>>>>>  #include "br_private.h"
>>>>> @@ -100,6 +101,19 @@ static void __vlan_flags_commit(struct net_bridge_vlan *v, u16 flags)
>>>>>  	__vlan_flags_update(v, flags, true);
>>>>>  }
>>>>>  
>>>>> +static inline bool br_vlan_tagging_by_switchdev(struct net_bridge *br)
>>>>
>>>> no inline in .c files and also constify br
>>>>
>>>>> +{
>>>>> +#if IS_ENABLED(CONFIG_NET_DSA)
>>>>> +	struct net_bridge_port *p;
>>>>> +
>>>>> +	list_for_each_entry(p, &br->port_list, list) {
>>>>> +		if (dsa_user_dev_check(p->dev))
>>>>
>>>> I don't think this can change at runtime, so please keep a counter in
>>>> the bridge and don't walk the port list on every vlan add.
>>>>
>>>
>>> you can use an internal bridge opt (check br_private.h) with a private opt
>>> that's set when such device is added as a port, no need for a full counter
>>> obviously
>>
>> To continue on Nikolay's line of thought...
>>
>> Can you abstractly describe which functional behavior do you need the
>> bridge port to perform, rather than "it needs to be a DSA user port"?
> 
> Hello Vladimir,
> 
> This has to do with the sequence of events, when dealing with vlan
> tagging in a bridge. When looking at the ingress of untaggged packets,
> that will be tagged by a certain port of that bridge, it depends when
> this tagging happens, in respect to the netfilter hook. This describes
> the existing code:
> 
> Because we are using dev_fill_forward_path(), we know in all cases that
> untagged packets arive and are tagged by the bridge.
> 
> In the case (#1) off a switchdev, the tagging is done before the packet
> reaches the netfilter hook. Then the software fastpath code needs to
> handle the packet, as if it is incoming tagged, remembering that this
> tag was tagged at ingress (tuple->in_vlan_ingress). We need to remember
> this, because dealing with hardware offloaded fastpath we then need to
> skip this vlan tag in the hardware offloaded fastpath in
> nf_flow_rule_match() and nf_flow_rule_route_common().
> 
> In all other cases (#2), 'normal' ports (ports without switchdev and
> dsa-user-ports) the tagging is done after packet reaches the
> netfilter-hook. Then the software fastpath code needs to handle the
> packet, as incoming untagged.
> 
> (Of course the dsa-user-port is more complicated, but it all handled by
> the dsa architecture so that it can be used as a 'normal' port.)
> 
> In both cases #1 and #2 also the other direction is taken into account.
> 
> To decide which case to apply, the code looks at
> BR_VLFLAG_ADDED_BY_SWITCHDEV, which was actually used for something
> else, but it is easily available in the code at that point and seemed to
> work, so far...
> 
> But as it turns out, this flag is also set for foreign ports added to
> the dsa-switchdev. This means that case #1 is applied to the foreign dsa
> port. This breaks the software fastpath and, with packets not reaching
> their destination, also the hardware offloaded fastpath does not start.
> We need to apply case #2.
> 
> So actually we need to know, inside br_vlan_fill_forward_path_mode(),
> whether or not net_bridge_port *dst is a foreign port added to the dsa
> switchdev. Or perhaps there is another way to find out we have to apply
> case #2.
> 

So after doing some more reading, at creation of the code using
BR_VLFLAG_ADDED_BY_SWITCHDEV would have been without problems.

After the switchdev was altered so that objects from foreign devices can
be added, it is problematic in br_vlan_fill_forward_path_mode(). I have
tested and indeed any foreign device does have this problem.

So we need a way to distinguish in br_vlan_fill_forward_path_mode()
whether or not we are dealing with a (dsa) foreign device on the switchdev.

I have come up with something, but this is most likely to crude to be
accepted, but for the sake of 'rfc' discussing it may lead to a proper
solution. So what does work is the following patch, so that
netif_has_dsa_foreign_vlan() can be used inside
br_vlan_fill_forward_path_mode().

Any suggestions on how this could be implemented properly would be
greatly appreciated.

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9d80f650345e75..3fb67312428a1f 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1839,6 +1839,7 @@ enum netdev_reg_state {
  *
  *	@vlan_info:	VLAN info
  *	@dsa_ptr:	dsa specific data
+ *	@dsa_foreign_vlan:	Counter, number of dsa foreign vlans added
  *	@tipc_ptr:	TIPC specific data
  *	@atalk_ptr:	AppleTalk link
  *	@ip_ptr:	IPv4 specific data
@@ -2214,6 +2215,7 @@ struct net_device {
 #endif
 #if IS_ENABLED(CONFIG_NET_DSA)
 	struct dsa_port		*dsa_ptr;
+	unsigned int		dsa_foreign_vlan;
 #endif
 #if IS_ENABLED(CONFIG_TIPC)
 	struct tipc_bearer __rcu *tipc_ptr;
@@ -5135,6 +5137,15 @@ static inline bool netif_is_lag_port(const struct
net_device *dev)
 	return netif_is_bond_slave(dev) || netif_is_team_port(dev);
 }

+static inline bool netif_has_dsa_foreign_vlan(const struct net_device *dev)
+{
+#if IS_ENABLED(CONFIG_NET_DSA)
+	return !!dev->dsa_foreign_vlan;
+#else
+	return false;
+#endif
+}
+
 static inline bool netif_is_rxfh_configured(const struct net_device *dev)
 {
 	return dev->priv_flags & IFF_RXFH_CONFIGURED;
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 74eda9b30608e6..775f6346120ed6 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -737,6 +737,8 @@ static int dsa_user_host_vlan_add(struct net_device
*dev,
 		return 0;
 	}

+	obj->orig_dev->dsa_foreign_vlan++;
+
 	vlan = *SWITCHDEV_OBJ_PORT_VLAN(obj);

 	/* Even though drivers often handle CPU membership in special ways,
@@ -824,6 +826,8 @@ static int dsa_user_host_vlan_del(struct net_device
*dev,
 	if (dsa_port_skip_vlan_configuration(dp))
 		return 0;

+	obj->orig_dev->dsa_foreign_vlan--;
+
 	vlan = SWITCHDEV_OBJ_PORT_VLAN(obj);

 	return dsa_port_host_vlan_del(dp, vlan);



>> switchdev_bridge_port_offload() has a mechanism to inform the bridge
>> core of extra abilities (like tx_fwd_offload). Perhaps you could modify
>> the DSA drivers you need to set a similar bit to inform the bridge of
>> their presence and ability. That would also work when the bridge port is
>> a LAG over a DSA user port.
>>
>> Also, please also CC DSA maintainers when you use DSA API outside
>> net/dsa/ and drivers/net/dsa/. I am in the process of revamping the
>> public DSA API and would like to be in touch with changes as they are
>> made.
>>
>>>>> +			return false;
>>>>> +	}
>>>>> +#endif
>>>>> +	return true;
>>>>> +}
>>>>> +
>>>>>  static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>>>>>  			  struct net_bridge_vlan *v, u16 flags,
>>>>>  			  struct netlink_ext_ack *extack)
>>>>> @@ -113,6 +127,8 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>>>>>  	if (err == -EOPNOTSUPP)
>>>>>  		return vlan_vid_add(dev, br->vlan_proto, v->vid);
>>>>>  	v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV;
>>>>> +	if (br_vlan_tagging_by_switchdev(br))
>>>>> +		v->priv_flags |= BR_VLFLAG_TAGGING_BY_SWITCHDEV;
>>>>>  	return err;
>>>>>  }
>>>>>  
>>>>> @@ -1491,7 +1507,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
>>>>>  
>>>>>  	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
>>>>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
>>>>> -	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
>>>>> +	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
>>>>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
>>>>>  	else
>>>>>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
>>>>

