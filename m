Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78D0CD5BB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2026 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXek9nCqxBos4vZVBDAOXMfSUabKZ1nUxWxUgnDm8Os=; b=zaj6JQmfDGSceRv+5naZmoMRRL
	LPbw+H2qdwifWo20ph4xtSMCb+nQzGduEw1cXu1EpzM4twE12rS9B4r1QoveAZVv26W1L0rNnBPBd
	ZktgiJIRMR+W22lku4aSjmtx2bdXNXdF6mTs7Ux8vTwstmZmkeRspBDcKJcViz24byu/KXQthut2z
	AhmoDkOiGA+h2ymxyG+NCjTzRLMSz1x4e5vylO8lbTWYZOg1UnzMur+CWIY5coYZ8x0RPAY7RKpuH
	W1z103YDcb3leQVzMbKZ1vqhQAbpdUiwGEj4/UO04pUg2HsxHPtRDY1Mf/GfTol8NKBo26iqVzrD4
	l218VSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW3j-0000000HOPZ-1mzK;
	Mon, 25 May 2026 14:13:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW3h-0000000HOOc-2mGn
	for linux-mediatek@lists.infradead.org;
	Mon, 25 May 2026 14:13:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b9e9a6802aso41378905ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2026 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779718412; x=1780323212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXek9nCqxBos4vZVBDAOXMfSUabKZ1nUxWxUgnDm8Os=;
        b=DSrkB7wGDO26/RR5Pg2dlzg4exXZ5Iz4omQ/JB1NnooO2E35mD31iqYvN9UxCVedCW
         pAXrtOaqVzQG9z7xsHytJVlKSUZNd5Hl6z1qqWzwN2Ip7umx2NRUc14dsbKPV1TO6p/p
         9SmEiQDSCWxvMim7mz5bQmtVnkC+JyxIiQFm/y/S8AyjDd0t25PNkQUS8KhrFw4wckPF
         0SEAsBUAjXQZE/4FR9S++kVmY0PnVe+QiMTJpD9BL4Qpiu0jLf1LsS3X4bhVL+ZPIE22
         urR/5+KV2oMZoaqr0PBidqldojRashKlYgjqpphXHVq7fsbmrW0Te6EUSo2ZOxfyJMd6
         xDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779718412; x=1780323212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXek9nCqxBos4vZVBDAOXMfSUabKZ1nUxWxUgnDm8Os=;
        b=Kmbdjl0BuyIP1xl37mphP3USrkbJ3hc3FbG0+6GnhcquB5peEcDRiARlx6ytAYsCjF
         j4TyhzlQlnFt3kRxvunKaexBU+l+aZOkDKY6sqYviqL+Ea9/L5jmIoQN1rXOuLASwqDX
         GBmkf+cK76p0guhHWfcl7LwyzFygRzzEgksQ+Va0TAJAGLT10B5eycGwijSPpNGBAUM4
         XQcYMYM8WEPFgRkMwD555EwbwGU7L1ucwGTw74Rp0GtcgfgCETOV5tGujYZNAunLX7nx
         b7IzByeWS3BAcFzAgWaBXy86VCoZQBONLntXE9b2fhDHO3V2p+EC2CvfmwPho1JkNUgw
         saeg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y0ranWB+Zp3/axzfahbCfi/blK2prumDzEgk6OqzHytxYb/HXfJ87ZwL6f4JHugqvDolK6uFrwPTQ2vSyyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOiP2cSyP6h+HJb4vWFenTi3+dbfwh4KNGsbqOgCAZVx8n1fqj
	ZEQ84RYeuR0gAGJ9iuTPcAMgcCYMByXL8nq2GNn03sETGdiI5EmxnYJk
X-Gm-Gg: Acq92OFJHN2aExkSCbMP/iXsFHxXNRaj2UjVmexjYoMvb0xQz2hWnYc8EdBtB8KaEXL
	Q/ftBX0df/cYeiL181MhcXYHL0KNanWwgm3ZBeG0t9fbJc1WUPl3Uhr8mHQh2PZHmmxl/ydXnEG
	kOyR8YYyDvj3wKvf2BmNSjgVadp9RrN99fkL9rAkKB0grYhU3WMJbDg8ksPXwy01AQv2RKh1ZJT
	G8cb4wOzlTKgs+6hc2PgCBr1dfPqN8dDrbfpMXkiBm4B0XO95YADYPOOMqoVOTkGgX2XkH9gNbI
	+FNz4GwjN4NvBPLL0iE5cCWWPbFzUCqO48y+hP/PBwGEahaEQsca3GTwoT34yfBCP62IMvWWhfp
	7ICf5+xIYLOjIcTvwS9TC+IHY5vcOZpxLIz44A5Y307ymC7Q196A+OGAzIOUCJHWdMeCX1gZjLx
	EYFtunusH4PmYDnpjNfywfCLYTSqtvARYyoepU+Int7TsP
X-Received: by 2002:a17:903:11c6:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2beb065b6edmr161039305ad.29.1779718412299;
        Mon, 25 May 2026 07:13:32 -0700 (PDT)
Received: from [192.168.89.2] ([112.179.160.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f54sm100830745ad.10.2026.05.25.07.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 07:13:31 -0700 (PDT)
Message-ID: <a08289e7-641c-489e-8d89-6eae9f092f90@gmail.com>
Date: Mon, 25 May 2026 23:13:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: airoha: bind WLAN-bound flows on PPE driver
 L2 cache miss
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260524224330.3995807-1-hurryman2212@gmail.com>
 <ahQDon-nio0STA4E@lore-desk>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <ahQDon-nio0STA4E@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_071333_719378_63BAB7FC 
X-CRM114-Status: GOOD (  31.25  )
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



On 5/25/26 17:09, Lorenzo Bianconi wrote:
>> The Linux bridge FDB can resolve a destination station to WDMA even when
>> the Airoha PPE driver's L2 offload cache has no entry for that MAC pair.
>> The normal bind path only checks the PPE driver's L2 offload cache, so an
>> unbound PPE hit for WLAN egress can stay unbound even though the bridge
>> already knows the right output path, unless a later offload event fills
>> that PPE driver cache.
>>
>> This matters for bridge-visible WLAN egress, such as wired-to-WLAN
>> forwarding or WLAN peer forwarding across another BSS, radio or MLO link.
>> Same-link or same-radio intra-BSS forwarding can stay inside the WLAN
>> datapath and is not covered.
> 
> Hi Jihong,

Hi, Lorenzo.

> 
> In order to offload L2 flows, I assume you are using the OpenWrt bridger
> package, right?

Actually, no.

I am using Fanboy's OpenWrt `test` build for the Lumen W1700K2,
together with several of my other patches. It does not include the
bridger package specifically. It now uses native nft-based offloading
with `kmod-br-netfilter`.

> IIUC the issue you want to resolve is we are not adding PPE L2 entries for
> the specified cases (same-link or same-radio intra-BSS forwarding), correct?

No. As written in the patch message, this specifically addresses
bridge-visible WLAN egress, such as:

1. wired-to-WLAN forwarding
2. WLAN peer forwarding across another BSS, radio, or MLO link

Same-link or same-radio intra-BSS forwarding can stay inside the WLAN
datapath and is not covered by this patch, although it did show poor
performance, whether that is due to shared airtime or not. That case
appears to belong to the Wi-Fi stack/driver datapath, such as the
mac80211/mt76/mt7996 path, rather than to this Airoha PPE fallback path.

> Using this approach, we are breaking the assumption PPE flow-table and hw
> flow-table are in sync. If the issue is the one described above, why not
> fixing the problem directly in the bridger package?

Again, this problem exists in an environment without bridger.

> Moreover, I see you developed the patch using Codex:gpt-5.5. Have you tested it
> on a real hw?

Yes. This has been tested on my Lumen W1700K2 with the environment
described above. MLO Wi-Fi P2P communication and some wired-to-WLAN
cases were indeed left unbound by PPE. CPU usage was high, and the
unbound throughput was close to 50% of what this patch achieves now.

> 
> Some comments inline.
> 
> Regards,
> Lorenzo
> >>
>> Before touching the PPE table, resolve the destination MAC through the
>> bridge device above the ingress netdev. If the PPE driver's L2 offload
>> cache lookup misses, bind the hardware flow to the resolved CDM4/WDMA
>> path.
>>
>> Assisted-by: Codex:gpt-5.5
>> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
>> ---
>>  drivers/net/ethernet/airoha/airoha_ppe.c | 138 +++++++++++++++++++----
>>  1 file changed, 119 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
>> index 26da519236bf..ea932e6d87f6 100644
>> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
>> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
>> @@ -803,65 +803,163 @@ static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
>>  }
>>  
>>  static int
>> -airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
>> -				    struct airoha_flow_table_entry *e,
>> -				    u32 hash, bool rx_wlan)
>> +airoha_ppe_foe_commit_subflow(struct airoha_ppe *ppe,
>> +			      const struct airoha_foe_entry *bridge,
> 
> maybe l2_hwe instead of bridge?
> 
>> +			      u32 hash, bool rx_wlan)
>>  {
>>  	u32 mask = AIROHA_FOE_IB1_BIND_PACKET_TYPE | AIROHA_FOE_IB1_BIND_UDP;
>>  	struct airoha_foe_entry *hwe_p, hwe;
>> -	struct airoha_flow_table_entry *f;
>>  	int type;
>>  
>>  	hwe_p = airoha_ppe_foe_get_entry_locked(ppe, hash);
>>  	if (!hwe_p)
>>  		return -EINVAL;
>>  
>> -	f = kzalloc_obj(*f, GFP_ATOMIC);
>> -	if (!f)
>> -		return -ENOMEM;
>> -
>> -	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
>> -	f->type = FLOW_TYPE_L2_SUBFLOW;
>> -	f->hash = hash;
>> -
>>  	memcpy(&hwe, hwe_p, sizeof(*hwe_p));
>> -	hwe.ib1 = (hwe.ib1 & mask) | (e->data.ib1 & ~mask);
>> +	hwe.ib1 = (hwe.ib1 & mask) | (bridge->ib1 & ~mask);
>>  
>>  	type = FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe.ib1);
>>  	if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
>> -		memcpy(&hwe.ipv6.l2, &e->data.bridge.l2, sizeof(hwe.ipv6.l2));
>> -		hwe.ipv6.ib2 = e->data.bridge.ib2;
>> +		memcpy(&hwe.ipv6.l2, &bridge->bridge.l2,
>> +		       sizeof(hwe.ipv6.l2));
>> +		hwe.ipv6.ib2 = bridge->bridge.ib2;
>>  		/* setting smac_id to 0xf instruct the hw to keep original
>>  		 * source mac address
>>  		 */
>>  		hwe.ipv6.l2.src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID,
>>  						    0xf);
>>  	} else {
>> -		memcpy(&hwe.bridge.l2, &e->data.bridge.l2,
>> +		memcpy(&hwe.bridge.l2, &bridge->bridge.l2,
>>  		       sizeof(hwe.bridge.l2));
>> -		hwe.bridge.ib2 = e->data.bridge.ib2;
>> +		hwe.bridge.ib2 = bridge->bridge.ib2;
>>  		if (type == PPE_PKT_TYPE_IPV4_HNAPT)
>>  			memcpy(&hwe.ipv4.new_tuple, &hwe.ipv4.orig_tuple,
>>  			       sizeof(hwe.ipv4.new_tuple));
>>  	}
>>  
>> -	hwe.bridge.data = e->data.bridge.data;
>> -	airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
>> +	hwe.bridge.data = bridge->bridge.data;
>> +
>> +	return airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
>> +}
>> +
>> +static int
>> +airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
>> +				    struct airoha_flow_table_entry *e,
>> +				    u32 hash, bool rx_wlan)
>> +{
>> +	struct airoha_flow_table_entry *f;
>> +	int err;
>> +
>> +	f = kzalloc_obj(*f, GFP_ATOMIC);
>> +	if (!f)
>> +		return -ENOMEM;
>> +
>> +	err = airoha_ppe_foe_commit_subflow(ppe, &e->data, hash, rx_wlan);
>> +	if (err) {
>> +		kfree(f);
>> +		return err;
>> +	}
>> +
>> +	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
>> +	f->type = FLOW_TYPE_L2_SUBFLOW;
>> +	f->hash = hash;
>>  
>>  	return 0;
>>  }
>>  
>> +static bool
>> +airoha_ppe_foe_prepare_wdma_subflow_dev(struct airoha_ppe *ppe,
>> +					struct net_device *dev,
>> +					struct airoha_flow_data *data,
>> +					struct airoha_foe_entry *hwe)
>> +{
>> +	u32 pse_port;
>> +	int err;
>> +
>> +	err = airoha_ppe_foe_entry_prepare(ppe->eth, hwe, dev,
>> +					   PPE_PKT_TYPE_BRIDGE, data, 0);
>> +	if (err)
>> +		return false;
>> +
>> +	pse_port = FIELD_GET(AIROHA_FOE_IB2_PSE_PORT, hwe->bridge.ib2);
>> +	if (pse_port != FE_PSE_PORT_CDM4)
>> +		return false;
>> +
>> +	return true;
> 
> 	return pse_port == FE_PSE_PORT_CDM4;
> 
>> +}
>> +
>> +static struct net_device *
>> +airoha_ppe_foe_get_bridge_master(struct net_device *dev)
>> +{
>> +	struct net_device *master = NULL;
>> +
>> +	rcu_read_lock();
>> +	master = netdev_master_upper_dev_get_rcu(dev);
>> +	if (master && netif_is_bridge_master(master))
>> +		dev_hold(master);
>> +	else
>> +		master = NULL;
>> +	rcu_read_unlock();
>> +
>> +	return master;
>> +}
>> +
>> +static bool
>> +airoha_ppe_foe_prepare_wdma_subflow(struct airoha_ppe *ppe,
>> +				    struct sk_buff *skb,
>> +				    struct airoha_foe_entry *hwe)
>> +{
>> +	struct ethhdr *eh = eth_hdr(skb);
>> +	struct airoha_flow_data data = {};
>> +	struct net_device *master;
>> +
>> +	if (!is_valid_ether_addr(eh->h_source) ||
>> +	    !is_valid_ether_addr(eh->h_dest))
>> +		return false;
>> +
>> +	ether_addr_copy(data.eth.h_dest, eh->h_dest);
>> +	ether_addr_copy(data.eth.h_source, eh->h_source);
>> +
>> +	if (!skb->dev)
>> +		return false;
>> +
>> +	/* WLAN egress unbound hits can arrive before flowtable creates the
>> +	 * L2 master flow normally used for subflow binding. Resolve only
>> +	 * through the bridge master so dev_fill_forward_path() must use the
>> +	 * bridge FDB for the destination MAC. Calling the ingress AP netdev
>> +	 * directly can describe the source station's WDMA path and would
>> +	 * corrupt Wi-Fi-to-wired flows whose real egress is not WDMA.
>> +	 */
>> +	master = airoha_ppe_foe_get_bridge_master(skb->dev);
>> +	if (!master)
>> +		return false;
>> +
>> +	if (airoha_ppe_foe_prepare_wdma_subflow_dev(ppe, master, &data,
>> +						    hwe)) {
>> +		dev_put(master);
>> +		return true;
>> +	}
>> +
>> +	dev_put(master);
>> +	return false;
> 
> maybe something like:
> 
> 	ret = airoha_ppe_foe_prepare_wdma_subflow_dev();
> 	dev_put(master);
> 
> 	return ret;
> 
>> +}
>> +
>>  static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
>>  					struct sk_buff *skb,
>>  					u32 hash, bool rx_wlan)
>>  {
>> +	struct airoha_foe_entry wdma_hwe = {};
>>  	struct airoha_flow_table_entry *e;
>>  	struct airoha_foe_bridge br = {};
>>  	struct airoha_foe_entry *hwe;
>>  	bool commit_done = false;
>> +	bool wdma_ready = false;
>>  	struct hlist_node *n;
>>  	u32 index, state;
>>  
>> +	wdma_ready = airoha_ppe_foe_prepare_wdma_subflow(ppe, skb,
>> +							 &wdma_hwe);
>> +
>>  	spin_lock_bh(&ppe_lock);
>>  
>>  	hwe = airoha_ppe_foe_get_entry_locked(ppe, hash);
>> @@ -899,6 +997,8 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
>>  				   airoha_l2_flow_table_params);
>>  	if (e)
>>  		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash, rx_wlan);
>> +	else if (wdma_ready)
>> +		airoha_ppe_foe_commit_subflow(ppe, &wdma_hwe, hash, rx_wlan);
>>  unlock:
>>  	spin_unlock_bh(&ppe_lock);
>>  }
>> -- 
>> 2.53.0
>>

All inline code-style review comments will be addressed in the next
submission of the patch set, together with the responses to Sashiko's
review, if any.

