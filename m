Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C127CF2590
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 06:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zure5lvUwd4y3h6SKiHFc2bGJpvRNoEVud01V6tGSD8=; b=Ro/KVGfVrEI/p0U1Hgc2fEadf5
	Z2CIJPGWhN8F3Ler59Vfo4b6HjIwzrdxhfQls/0NaduMTXGS+53gVSeBTpF6BV8WuBygXhcYtOHBd
	5q3EMNKD8vFn6asGk1lOaAxe42vkD8wwIgwO19qNNHD/VNOnurAluGOlxVCFmtvXJoT/52BGK/A26
	QfPpIDSxfYpPnYKzp0C41p+m1TLUhaqhh/7egYmJL8yG1SY7iiSZEpnYSLLvQoqxz3wD3RIN0uyLe
	uixm6k83J/GGJG87fsL3tD6v0lpQ20Kc6WYJgcjXiINXG0vif/yKArKLGnYhr+j1Tz27+H16sLA02
	CRkeOp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EVd-00000003sh6-47pG;
	Mon, 14 Oct 2024 06:24:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0EPw-00000003rvI-2s5x
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 06:18:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a11e7so1735918a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 23:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1728886734; x=1729491534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zure5lvUwd4y3h6SKiHFc2bGJpvRNoEVud01V6tGSD8=;
        b=hGyVSxNuNJiaOPFf4qLvrMYoj4yFYFumeZeOvMSacjOlOpCumx/heNGSHI4XRKj20y
         qwPznC/KvDv5f7ENj5U4g7JG9CEtVrJZJcxizdhWOA1mXv+QrpQeY0TZRGUDsKeAbAHD
         Tf6HAVrNApPRAM7kni9XF7j70rtD/Fk9cduAghsc97pPoehLEKwpTmq0RAy5Q0vuDBJn
         FtCBbZd3mnsDrU2FzLtVpTQQJSTwNTCaTACM+jFrYTGvIfnvBOrb0YRLOzxa8LzSTCJT
         +eDs9sBoOCKvI1YrUUMQig3B43+oX5SUL9BziYM4ru6UtV/qccOMzWucRVs8IMbOoQp3
         YN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728886734; x=1729491534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zure5lvUwd4y3h6SKiHFc2bGJpvRNoEVud01V6tGSD8=;
        b=jRxbGUGNUHBZKCOjK/LwvFqufa8YDYXTLSoQHfDCWwmdjXRfoUlrepcXmf6RKevOTR
         DFc5zJmD6tRFbZdGqb6k+gBU+FspG+f3AupGraZDVHyjgLO7/rY9Py5VML0xCmP+riNS
         3DFIXy2At7q6GFGWV1hCxNtJ9r6PEAKspf6v2rgvjxDSdQxNXMIl2Rbyyei+2vvToiUP
         gTIOW09EoFEtaHclFSN7hXcu68GTv8grXdPOVsddpUr9nQN5Hn8djIi6rnT+/tx5vm1n
         v+jiapSTf1K7pCJg/pOKlzdQd61ENhPMDW8IrSR24lAEdI3dqY+qIKXIxVIuZD/pUwZJ
         1ppw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ZULoOkMwLVRSahauUUmQWOmWD9jvwSxyV3isrH1EsmCKd6Q3TSk5eK8kqYJg73Xg1aDEFoS1bSrC3O1ejA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDEGrECBo1F1qUdqi8+LQEMVnyV2IqvMpY6UuBlylUj76ypS+C
	dWxXfhDUzIROGka7fiTXIaoRWoXbsv3jBl5PXhfPZp810JUxCpvozPNGfec8tUg=
X-Google-Smtp-Source: AGHT+IEq3aFz947OeC3fnnlhKWldwZ4U2/ijCIgS712duTcB6H5tPdhjhbywyLClV0UUqizNN5JhcQ==
X-Received: by 2002:a17:907:1c03:b0:a99:4ce4:27eb with SMTP id a640c23a62f3a-a99e3e51bb2mr731229266b.46.1728886733995;
        Sun, 13 Oct 2024 23:18:53 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f330496fsm255136366b.26.2024.10.13.23.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:18:53 -0700 (PDT)
Message-ID: <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
Date: Mon, 14 Oct 2024 09:18:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 11/12] bridge:
 br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
To: Eric Woudstra <ericwouds@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-12-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241013185509.4430-12-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_231857_023558_8CA058FB 
X-CRM114-Status: GOOD (  26.55  )
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

On 13/10/2024 21:55, Eric Woudstra wrote:
> In network setup as below:
> 
>              fastpath bypass
>  .----------------------------------------.
> /                                          \
> |                        IP - forwarding    |
> |                       /                \  v
> |                      /                  wan ...
> |                     /
> |                     |
> |                     |
> |                   brlan.1
> |                     |
> |    +-------------------------------+
> |    |           vlan 1              |
> |    |                               |
> |    |     brlan (vlan-filtering)    |
> |    |               +---------------+
> |    |               |  DSA-SWITCH   |
> |    |    vlan 1     |               |
> |    |      to       |               |
> |    |   untagged    1     vlan 1    |
> |    +---------------+---------------+
> .         /                   \
>  ----->wlan1                 lan0
>        .                       .
>        .                       ^
>        ^                     vlan 1 tagged packets
>      untagged packets
> 
> Now that DEV_PATH_MTK_WDMA is added to nft_dev_path_info() the forward
> path is filled also when ending with the mediatek wlan1, info.indev not
> NULL now in nft_dev_forward_path(). This results in a direct transmit
> instead of a neighbor transmit. This is how it should be, But this fails.
> 
> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
> filling in from brlan.1 towards wlan1. But it should be set to
> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
> is not correct. The dsa switchdev adds it as a foreign port.
> 
> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG is
> set when there is a dsa-switch inside the bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/br_private.h |  1 +
>  net/bridge/br_vlan.c    | 18 +++++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
> index 8da7798f9368..7d427214cc7c 100644
> --- a/net/bridge/br_private.h
> +++ b/net/bridge/br_private.h
> @@ -180,6 +180,7 @@ enum {
>  	BR_VLFLAG_MCAST_ENABLED = BIT(2),
>  	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
>  	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
> +	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
>  };
>  
>  /**
> diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
> index 1830d7d617cd..b7877724b969 100644
> --- a/net/bridge/br_vlan.c
> +++ b/net/bridge/br_vlan.c
> @@ -3,6 +3,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/rtnetlink.h>
>  #include <linux/slab.h>
> +#include <net/dsa.h>
>  #include <net/switchdev.h>
>  
>  #include "br_private.h"
> @@ -100,6 +101,19 @@ static void __vlan_flags_commit(struct net_bridge_vlan *v, u16 flags)
>  	__vlan_flags_update(v, flags, true);
>  }
>  
> +static inline bool br_vlan_tagging_by_switchdev(struct net_bridge *br)

no inline in .c files and also constify br

> +{
> +#if IS_ENABLED(CONFIG_NET_DSA)
> +	struct net_bridge_port *p;
> +
> +	list_for_each_entry(p, &br->port_list, list) {
> +		if (dsa_user_dev_check(p->dev))

I don't think this can change at runtime, so please keep a counter in
the bridge and don't walk the port list on every vlan add.

> +			return false;
> +	}
> +#endif
> +	return true;
> +}
> +
>  static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>  			  struct net_bridge_vlan *v, u16 flags,
>  			  struct netlink_ext_ack *extack)
> @@ -113,6 +127,8 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
>  	if (err == -EOPNOTSUPP)
>  		return vlan_vid_add(dev, br->vlan_proto, v->vid);
>  	v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV;
> +	if (br_vlan_tagging_by_switchdev(br))
> +		v->priv_flags |= BR_VLFLAG_TAGGING_BY_SWITCHDEV;
>  	return err;
>  }
>  
> @@ -1491,7 +1507,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
>  
>  	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
> -	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
> +	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
>  	else
>  		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;


