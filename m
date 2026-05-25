Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A85CD5BB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2026 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsqob+RiDvjbp6q4NSt4Su76R5qsKRpEXNucdGH7HTM=; b=i9rsDgp1d+Qp+7eyVpdEHGtPEy
	jAbeeymQ0ak8E1AEfpNhQ0mlqYeekC+uenlfARUeYIVYA3RMdk+fccHvsygq/581tkPxIr6uQpc8G
	mJKO6sb4ohH9vE+iVXMcHPJ1w5aOQy+EuAR5YG1JIL0mj1TUyVnjrb+v0XbwtxF9Ozjl57qKMfB9n
	HghlOKoNfynQlctjVs7oWKDI6pVo9q9uKHDm+g9NbpFWBGtIdYsBFNfi2EEZhkrj4BC8FwSMgEgX7
	Op5Ht6GUD/kO1SJH/+YccFkHihClPmcePbCH4fOzgiLWjfUVERg0UPOap/w04Ec9mJCfmNSX4C0MC
	1/i6c23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXoR-0000000Ha85-0SJl;
	Mon, 25 May 2026 16:05:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXoN-0000000Ha77-3A9S
	for linux-mediatek@lists.infradead.org;
	Mon, 25 May 2026 16:05:52 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so5350514a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2026 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779725151; x=1780329951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsqob+RiDvjbp6q4NSt4Su76R5qsKRpEXNucdGH7HTM=;
        b=UeF0PDBZ0FAt51QfiX53jKjszCHQaT7K+gbGntcfVFX1RgQLJtVvwa4n6jA3YgKXpJ
         y6pYE6udWeqmrGh7CeKJx75cbizFhzRQ7IpJHnkjg+VwRDNNsSv91Uz14RUsgYlQIgTn
         xvA/bX9z50megCNr9Lkrr/5z3PA05YUwfYXC+ybeflv8m0Ei5P7u3AttntNx4D31bSWx
         q3iVb3BkTbFHHlwXYtJ9A2c7DCiuk+fNZBwpeiftMBPy5deTPalLQ6WanYdJ6HKvL4Tx
         4rCje3MSjE+XhGa8VZN1a34ZB/TCf7nddlyesQpr0ww6GRVyaJ25E9KpoBjrxuNpkIFl
         /jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779725151; x=1780329951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsqob+RiDvjbp6q4NSt4Su76R5qsKRpEXNucdGH7HTM=;
        b=lujbf7tUhO1YFeXMN5X/pfn+Ne1usnMotCKLC8v0+N2gVAYsGqkDnsqSw0j715nmQ8
         RNxebRxsSldLMoPxHimHZLoUi61byq7NSv1MP1IYkWdDhJRX4U2hDRCj1Hrq+2k8sKcm
         cOsYukUW8urZjghKibwtQkiW2zXWqysvuKw9zRg2FWdzNudQ3SuBeryg9d+pGf9gRPAT
         l0UXfNLQQsRQ5rqGDFIAjnMc7KKS4I304S9MqTGL3/s2nlU88mAzXQrekFDWhP/PxSqj
         nTVu4Svw6bxOqmJaEqUvUXhGl4X2vcY0W69drGR+w+XBLgbqf4RpQoaVs4EPTasr8C9i
         Ak9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ozT6/tdFHQHW7dS7+gZQcPpp4QjP8NHW+A5tBZAITTJCosWBoFCSCEWn8jBA+z+PxXdSbLTS2ssK6zJlp6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+kgKgLscDpm1n0XdSsM1rlPnq6b3bcQBjvwSJGzvQH2rPoPBt
	A2OzvUKFRbolPNdKFZmT0P0wvv2Wk3S9XZ153Wyi1tw8vwGY3IRzguMm
X-Gm-Gg: Acq92OH8OYHzN5CRcjgK9YSVjmSfmJN2jGisBhjp+qTubFwb1t3ef8RDFIPxUGCwIy4
	EcuDpnz+b25cX2qXnXH3srioIQQhTvbkt197uozBS5po3tgaDsWlbfvMu0MxVQ7Jba7caykS+N6
	elVF0m52rdusSFjeFMgz/V97R/41NXexYxLeMbROZK/XVyEeG4OHjapxeX29U0Su68fENDzWQRE
	2k2BNNiFq6+ZEI9H5Qn4C0P8LjCIIqJi8kMvZfcdgHkpy0deDs8geBUuHH8BBU84b5PlzWm+Wep
	FA01dSXaonCZ3GE/+yRej0z+cwQll9aCDlsUHPnSK9WZadVUJntgK2UfNd1fecRrTLp9EKt8ili
	5cahOMIsNXDJPbrDagMZenvtVmE5aC83q26Bn7FXu/CnN/3OHc9Sk99WfkjFxITUw8DsDLSSv9Q
	8xmJ5yKMYJECf1zbuyCrGIE/8o49x4pQ==
X-Received: by 2002:a17:90b:2246:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-36a6789ac27mr14909417a91.25.1779725150447;
        Mon, 25 May 2026 09:05:50 -0700 (PDT)
Received: from [192.168.89.2] ([119.214.48.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36ac208877fsm1934386a91.7.2026.05.25.09.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 09:05:49 -0700 (PDT)
Message-ID: <82d0e4a5-76b1-4c86-a153-2500c60e8063@gmail.com>
Date: Tue, 26 May 2026 01:05:46 +0900
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
 <ahQDon-nio0STA4E@lore-desk> <a08289e7-641c-489e-8d89-6eae9f092f90@gmail.com>
 <ahRonGRDCqdFTBQm@lore-desk>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <ahRonGRDCqdFTBQm@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_090551_816534_708B6E0C 
X-CRM114-Status: GOOD (  34.21  )
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



On 5/26/26 00:19, Lorenzo Bianconi wrote:
>>
>>
>> On 5/25/26 17:09, Lorenzo Bianconi wrote:
>>>> The Linux bridge FDB can resolve a destination station to WDMA even when
>>>> the Airoha PPE driver's L2 offload cache has no entry for that MAC pair.
>>>> The normal bind path only checks the PPE driver's L2 offload cache, so an
>>>> unbound PPE hit for WLAN egress can stay unbound even though the bridge
>>>> already knows the right output path, unless a later offload event fills
>>>> that PPE driver cache.
>>>>
>>>> This matters for bridge-visible WLAN egress, such as wired-to-WLAN
>>>> forwarding or WLAN peer forwarding across another BSS, radio or MLO link.
>>>> Same-link or same-radio intra-BSS forwarding can stay inside the WLAN
>>>> datapath and is not covered.
>>>
>>> Hi Jihong,
>>
>> Hi, Lorenzo.
>>
>>>
>>> In order to offload L2 flows, I assume you are using the OpenWrt bridger
>>> package, right?
>>
>> Actually, no.
>>
>> I am using Fanboy's OpenWrt `test` build for the Lumen W1700K2,
>> together with several of my other patches. It does not include the
>> bridger package specifically. It now uses native nft-based offloading
>> with `kmod-br-netfilter`.
> 
> according to my understanding this is not merged yet, right? I guess the
> patches should be based on official/accepted code.
> 

Yes, you are right. I just checked current net-next and realized that the
bridge/L2 nft_flow_offload pieces used in my test environment are not
merged upstream yet. Sorry, I should have checked this before submitting
the patch.

Since I cannot properly test the current upstream code plus bridger at the
moment, I will put this patch on hold.

I will also check whether this should instead be fixed on the
nft_flow_offload side.


Sincerely,
Jihong Min

>>
>>> IIUC the issue you want to resolve is we are not adding PPE L2 entries for
>>> the specified cases (same-link or same-radio intra-BSS forwarding), correct?
>>
>> No. As written in the patch message, this specifically addresses
>> bridge-visible WLAN egress, such as:
>>
>> 1. wired-to-WLAN forwarding
>> 2. WLAN peer forwarding across another BSS, radio, or MLO link
>>
>> Same-link or same-radio intra-BSS forwarding can stay inside the WLAN
>> datapath and is not covered by this patch, although it did show poor
>> performance, whether that is due to shared airtime or not. That case
>> appears to belong to the Wi-Fi stack/driver datapath, such as the
>> mac80211/mt76/mt7996 path, rather than to this Airoha PPE fallback path.
> 
> according to my understanding the l2 nft-based offloading solution should
> add the missing info to PPE flow-table. As I pointed out, it should be
> in-sync with hw flow-table. It seems a bug in the nft code to me.
> 
>>
>>> Using this approach, we are breaking the assumption PPE flow-table and hw
>>> flow-table are in sync. If the issue is the one described above, why not
>>> fixing the problem directly in the bridger package?
>>
>> Again, this problem exists in an environment without bridger.
> 
> In order to offload L2 traffic bridger is mandatory. Do you mean the issue
> occurs even on L3 scenario?
> 
>>
>>> Moreover, I see you developed the patch using Codex:gpt-5.5. Have you tested it
>>> on a real hw?
>>
>> Yes. This has been tested on my Lumen W1700K2 with the environment
>> described above. MLO Wi-Fi P2P communication and some wired-to-WLAN
>> cases were indeed left unbound by PPE. CPU usage was high, and the
>> unbound throughput was close to 50% of what this patch achieves now.
> 
> ack
> 
> Regards,
> Lorenzo
> 
>>
>>>
>>> Some comments inline.
>>>
>>> Regards,
>>> Lorenzo
>>>>>
>>>> Before touching the PPE table, resolve the destination MAC through the
>>>> bridge device above the ingress netdev. If the PPE driver's L2 offload
>>>> cache lookup misses, bind the hardware flow to the resolved CDM4/WDMA
>>>> path.
>>>>
>>>> Assisted-by: Codex:gpt-5.5
>>>> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
>>>> ---
>>>>  drivers/net/ethernet/airoha/airoha_ppe.c | 138 +++++++++++++++++++----
>>>>  1 file changed, 119 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
>>>> index 26da519236bf..ea932e6d87f6 100644
>>>> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
>>>> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
>>>> @@ -803,65 +803,163 @@ static void airoha_ppe_foe_flow_remove_entry(struct airoha_ppe *ppe,
>>>>  }
>>>>  
>>>>  static int
>>>> -airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
>>>> -				    struct airoha_flow_table_entry *e,
>>>> -				    u32 hash, bool rx_wlan)
>>>> +airoha_ppe_foe_commit_subflow(struct airoha_ppe *ppe,
>>>> +			      const struct airoha_foe_entry *bridge,
>>>
>>> maybe l2_hwe instead of bridge?
>>>
>>>> +			      u32 hash, bool rx_wlan)
>>>>  {
>>>>  	u32 mask = AIROHA_FOE_IB1_BIND_PACKET_TYPE | AIROHA_FOE_IB1_BIND_UDP;
>>>>  	struct airoha_foe_entry *hwe_p, hwe;
>>>> -	struct airoha_flow_table_entry *f;
>>>>  	int type;
>>>>  
>>>>  	hwe_p = airoha_ppe_foe_get_entry_locked(ppe, hash);
>>>>  	if (!hwe_p)
>>>>  		return -EINVAL;
>>>>  
>>>> -	f = kzalloc_obj(*f, GFP_ATOMIC);
>>>> -	if (!f)
>>>> -		return -ENOMEM;
>>>> -
>>>> -	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
>>>> -	f->type = FLOW_TYPE_L2_SUBFLOW;
>>>> -	f->hash = hash;
>>>> -
>>>>  	memcpy(&hwe, hwe_p, sizeof(*hwe_p));
>>>> -	hwe.ib1 = (hwe.ib1 & mask) | (e->data.ib1 & ~mask);
>>>> +	hwe.ib1 = (hwe.ib1 & mask) | (bridge->ib1 & ~mask);
>>>>  
>>>>  	type = FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe.ib1);
>>>>  	if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
>>>> -		memcpy(&hwe.ipv6.l2, &e->data.bridge.l2, sizeof(hwe.ipv6.l2));
>>>> -		hwe.ipv6.ib2 = e->data.bridge.ib2;
>>>> +		memcpy(&hwe.ipv6.l2, &bridge->bridge.l2,
>>>> +		       sizeof(hwe.ipv6.l2));
>>>> +		hwe.ipv6.ib2 = bridge->bridge.ib2;
>>>>  		/* setting smac_id to 0xf instruct the hw to keep original
>>>>  		 * source mac address
>>>>  		 */
>>>>  		hwe.ipv6.l2.src_mac_hi = FIELD_PREP(AIROHA_FOE_MAC_SMAC_ID,
>>>>  						    0xf);
>>>>  	} else {
>>>> -		memcpy(&hwe.bridge.l2, &e->data.bridge.l2,
>>>> +		memcpy(&hwe.bridge.l2, &bridge->bridge.l2,
>>>>  		       sizeof(hwe.bridge.l2));
>>>> -		hwe.bridge.ib2 = e->data.bridge.ib2;
>>>> +		hwe.bridge.ib2 = bridge->bridge.ib2;
>>>>  		if (type == PPE_PKT_TYPE_IPV4_HNAPT)
>>>>  			memcpy(&hwe.ipv4.new_tuple, &hwe.ipv4.orig_tuple,
>>>>  			       sizeof(hwe.ipv4.new_tuple));
>>>>  	}
>>>>  
>>>> -	hwe.bridge.data = e->data.bridge.data;
>>>> -	airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
>>>> +	hwe.bridge.data = bridge->bridge.data;
>>>> +
>>>> +	return airoha_ppe_foe_commit_entry(ppe, &hwe, hash, rx_wlan);
>>>> +}
>>>> +
>>>> +static int
>>>> +airoha_ppe_foe_commit_subflow_entry(struct airoha_ppe *ppe,
>>>> +				    struct airoha_flow_table_entry *e,
>>>> +				    u32 hash, bool rx_wlan)
>>>> +{
>>>> +	struct airoha_flow_table_entry *f;
>>>> +	int err;
>>>> +
>>>> +	f = kzalloc_obj(*f, GFP_ATOMIC);
>>>> +	if (!f)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	err = airoha_ppe_foe_commit_subflow(ppe, &e->data, hash, rx_wlan);
>>>> +	if (err) {
>>>> +		kfree(f);
>>>> +		return err;
>>>> +	}
>>>> +
>>>> +	hlist_add_head(&f->l2_subflow_node, &e->l2_flows);
>>>> +	f->type = FLOW_TYPE_L2_SUBFLOW;
>>>> +	f->hash = hash;
>>>>  
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static bool
>>>> +airoha_ppe_foe_prepare_wdma_subflow_dev(struct airoha_ppe *ppe,
>>>> +					struct net_device *dev,
>>>> +					struct airoha_flow_data *data,
>>>> +					struct airoha_foe_entry *hwe)
>>>> +{
>>>> +	u32 pse_port;
>>>> +	int err;
>>>> +
>>>> +	err = airoha_ppe_foe_entry_prepare(ppe->eth, hwe, dev,
>>>> +					   PPE_PKT_TYPE_BRIDGE, data, 0);
>>>> +	if (err)
>>>> +		return false;
>>>> +
>>>> +	pse_port = FIELD_GET(AIROHA_FOE_IB2_PSE_PORT, hwe->bridge.ib2);
>>>> +	if (pse_port != FE_PSE_PORT_CDM4)
>>>> +		return false;
>>>> +
>>>> +	return true;
>>>
>>> 	return pse_port == FE_PSE_PORT_CDM4;
>>>
>>>> +}
>>>> +
>>>> +static struct net_device *
>>>> +airoha_ppe_foe_get_bridge_master(struct net_device *dev)
>>>> +{
>>>> +	struct net_device *master = NULL;
>>>> +
>>>> +	rcu_read_lock();
>>>> +	master = netdev_master_upper_dev_get_rcu(dev);
>>>> +	if (master && netif_is_bridge_master(master))
>>>> +		dev_hold(master);
>>>> +	else
>>>> +		master = NULL;
>>>> +	rcu_read_unlock();
>>>> +
>>>> +	return master;
>>>> +}
>>>> +
>>>> +static bool
>>>> +airoha_ppe_foe_prepare_wdma_subflow(struct airoha_ppe *ppe,
>>>> +				    struct sk_buff *skb,
>>>> +				    struct airoha_foe_entry *hwe)
>>>> +{
>>>> +	struct ethhdr *eh = eth_hdr(skb);
>>>> +	struct airoha_flow_data data = {};
>>>> +	struct net_device *master;
>>>> +
>>>> +	if (!is_valid_ether_addr(eh->h_source) ||
>>>> +	    !is_valid_ether_addr(eh->h_dest))
>>>> +		return false;
>>>> +
>>>> +	ether_addr_copy(data.eth.h_dest, eh->h_dest);
>>>> +	ether_addr_copy(data.eth.h_source, eh->h_source);
>>>> +
>>>> +	if (!skb->dev)
>>>> +		return false;
>>>> +
>>>> +	/* WLAN egress unbound hits can arrive before flowtable creates the
>>>> +	 * L2 master flow normally used for subflow binding. Resolve only
>>>> +	 * through the bridge master so dev_fill_forward_path() must use the
>>>> +	 * bridge FDB for the destination MAC. Calling the ingress AP netdev
>>>> +	 * directly can describe the source station's WDMA path and would
>>>> +	 * corrupt Wi-Fi-to-wired flows whose real egress is not WDMA.
>>>> +	 */
>>>> +	master = airoha_ppe_foe_get_bridge_master(skb->dev);
>>>> +	if (!master)
>>>> +		return false;
>>>> +
>>>> +	if (airoha_ppe_foe_prepare_wdma_subflow_dev(ppe, master, &data,
>>>> +						    hwe)) {
>>>> +		dev_put(master);
>>>> +		return true;
>>>> +	}
>>>> +
>>>> +	dev_put(master);
>>>> +	return false;
>>>
>>> maybe something like:
>>>
>>> 	ret = airoha_ppe_foe_prepare_wdma_subflow_dev();
>>> 	dev_put(master);
>>>
>>> 	return ret;
>>>
>>>> +}
>>>> +
>>>>  static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
>>>>  					struct sk_buff *skb,
>>>>  					u32 hash, bool rx_wlan)
>>>>  {
>>>> +	struct airoha_foe_entry wdma_hwe = {};
>>>>  	struct airoha_flow_table_entry *e;
>>>>  	struct airoha_foe_bridge br = {};
>>>>  	struct airoha_foe_entry *hwe;
>>>>  	bool commit_done = false;
>>>> +	bool wdma_ready = false;
>>>>  	struct hlist_node *n;
>>>>  	u32 index, state;
>>>>  
>>>> +	wdma_ready = airoha_ppe_foe_prepare_wdma_subflow(ppe, skb,
>>>> +							 &wdma_hwe);
>>>> +
>>>>  	spin_lock_bh(&ppe_lock);
>>>>  
>>>>  	hwe = airoha_ppe_foe_get_entry_locked(ppe, hash);
>>>> @@ -899,6 +997,8 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
>>>>  				   airoha_l2_flow_table_params);
>>>>  	if (e)
>>>>  		airoha_ppe_foe_commit_subflow_entry(ppe, e, hash, rx_wlan);
>>>> +	else if (wdma_ready)
>>>> +		airoha_ppe_foe_commit_subflow(ppe, &wdma_hwe, hash, rx_wlan);
>>>>  unlock:
>>>>  	spin_unlock_bh(&ppe_lock);
>>>>  }
>>>> -- 
>>>> 2.53.0
>>>>
>>
>> All inline code-style review comments will be addressed in the next
>> submission of the patch set, together with the responses to Sashiko's
>> review, if any.


