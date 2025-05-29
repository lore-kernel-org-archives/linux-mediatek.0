Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55506C54FB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 May 2025 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=; b=oW+hcjUi9Ex0oitVHekgagfr61
	99vKFO3hsQNj9MVMV75U3mElEeF1YbB/VuB/S7GQjGmJZp+zRNDzgr3gF6UE3qGrUNbNf0XHyH17l
	r4q7FiFEhGD1d9eafFles87zke2TUrubnXSlIrWmQA+qbbwlqVSLepq88hQ+bCkhwdvvqcooFQ5EM
	kJqLgIDfA7EboWRU61m+g2hPmGdWjK06+wZdbSJ0+46y/ughH8tE+ryvQW2wzEjZEXFz9+YBJx9gZ
	+nIjBDlJp7t7+G93dRaeWRgz/mI7lYpwy9LGl1sWWvrMsEGEXtmqFsBiIqriwO6dv0AmEQZ1pgwPE
	9qynA1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbNT-0000000Fboo-2IDs;
	Thu, 29 May 2025 11:24:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKasJ-0000000FYaH-450R
	for linux-mediatek@lists.infradead.org;
	Thu, 29 May 2025 10:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748515958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=;
	b=P/IX6yFQcjgrKQbcu8xkvHQdfQhtgUFHY9sN0cqMN1KlbZ7XP+lBjpuk5b28sjDB9ghWN0
	nvVySOfMZifDLJUwED2CSqRi2P5pqE60gxbfyKHMT54rvheyYJpYLxj1hPBStg36J49YUg
	qeaQqiZ/Aw6mJvPgO4lhSqW/KAipRbs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-lPa-jivHM9-6Jl8cnRcKVg-1; Thu, 29 May 2025 06:52:37 -0400
X-MC-Unique: lPa-jivHM9-6Jl8cnRcKVg-1
X-Mimecast-MFC-AGG-ID: lPa-jivHM9-6Jl8cnRcKVg_1748515956
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso148752f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 29 May 2025 03:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515956; x=1749120756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=;
        b=RDmu2S2HFtCpw9gHbeQUQh8XcI8upZJDyIF2x8v8zSIQIhZlt5WneqbRNrjWCkHbTA
         XT5TcHn8bXSyDsu5hacB8JB3Rza2q3q4FwMvhg9E4Cbn4YmAlmjWY07fwbANsOyLHtf/
         rGCdjDXbkCLW/WqfYkao5LnOmsyTIrixWhX4fl568JTSkfe5b+JEViTtxukdECEbq7Jh
         xjWUmX3jrrKFfuggslNFX6rJ2HcyO05B9MkIVGRGDaqi2gkZ42xM398nM/Ti3gDyVSvi
         Pcv3utqPYFoTm9QGKrjtAkq0djLdNmhBGMN5cSgFPmYMO0LcM43j+LRW3jgLwOuIXlkv
         0DwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQfZIo+z0Zf7SkbsHtHt43Jrtlu1+fobdl7RFTH3zg7tGF+xcLwwP/fTNlJ7EqNJ1yxmRcdbHOwGIi64dnqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YySgTrIAJA+ZfBXCgIvV9mj3ONjvIk6iSzM1sjwLrA3E/yuLvd3
	JGhslRpkd6ezQJ8OfGFIRgKk1B/R5ZtZ5tp2Frllrz0szQUxeWvWBxPy8s8Pk83oZiz8n8tKMGu
	zNI17uWClTKcNhb1M6pQUsmdNxhabEk8EQiOBxFMZBevrrP46UBspOyI3HPpWaW+13v/gz/No4w
	==
X-Gm-Gg: ASbGncttMCFuAi5ZniicEkwaqObKZ6/nF61yH0BYcasvwctf3lEiibR8wFLAbplsUJ2
	5PpI2tU/0X810loi6kOuWl7lAwHKiw7JZ0/kL3sUOePDRMGdcCQVTCg6O2aYN4gLaAJ2DJ591hG
	bcC8Ok9xpE/MdGd+TYTqmQNni0JRCX6bfdzo/lmsVjJOOExCaFLqQ/qxDOFHkNbZNvHwRBaRE+1
	5s4FSmmsfHgCv3FiDFTpB4q0YDAmQjRoLsxg8hMJQ7PQ+IXoJyi3b+XGisu3EHAEddsH7GAPoyx
	qMIiyU8+zS0C4Q7nrZ6jfU/9G2gAaeJWwHacUIP8zE/oWPvZ8FHdpzK4JXg=
X-Received: by 2002:a05:6000:2905:b0:3a4:cfe3:850f with SMTP id ffacd0b85a97d-3a4cfe3866emr18548903f8f.26.1748515956338;
        Thu, 29 May 2025 03:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd5rBzaY1hUfRsYOE+gTC/pugRVRTJ9nUCAUf9lmcPzrrorgZJVoTSNaWXkDhPqzVybmEIrg==
X-Received: by 2002:a05:6000:2905:b0:3a4:cfe3:850f with SMTP id ffacd0b85a97d-3a4cfe3866emr18548873f8f.26.1748515955955;
        Thu, 29 May 2025 03:52:35 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4? ([2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eebsm1627199f8f.44.2025.05.29.03.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 03:52:35 -0700 (PDT)
Message-ID: <6ae0ad5a-f560-43c5-a581-e4699634b65e@redhat.com>
Date: Thu, 29 May 2025 12:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net v2] net: wwan: t7xx: Fix napi rx poll issue
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sreehari.kancharla@linux.intel.com, ilpo.jarvinen@linux.intel.com
References: <20250528082827.4654-1-jinjian.song@fibocom.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250528082827.4654-1-jinjian.song@fibocom.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k3cD9tJNKVBTdf3jfhYaw2CWE5-Yk33Ddzxq7k8hfaY_1748515956
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_035240_080085_D121C75F 
X-CRM114-Status: GOOD (  17.24  )
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

On 5/28/25 10:28 AM, Jinjian Song wrote:
> When driver handles the napi rx polling requests, the netdev might
> have been released by the dellink logic triggered by the disconnect
> operation on user plane. However, in the logic of processing skb in
> polling, an invalid netdev is still being used, which causes a panic.
> 
> BUG: kernel NULL pointer dereference, address: 00000000000000f1
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:dev_gro_receive+0x3a/0x620
> [...]
> Call Trace:
>  <IRQ>
>  ? __die_body+0x68/0xb0
>  ? page_fault_oops+0x379/0x3e0
>  ? exc_page_fault+0x4f/0xa0
>  ? asm_exc_page_fault+0x22/0x30
>  ? __pfx_t7xx_ccmni_recv_skb+0x10/0x10 [mtk_t7xx (HASH:1400 7)]
>  ? dev_gro_receive+0x3a/0x620
>  napi_gro_receive+0xad/0x170
>  t7xx_ccmni_recv_skb+0x48/0x70 [mtk_t7xx (HASH:1400 7)]
>  t7xx_dpmaif_napi_rx_poll+0x590/0x800 [mtk_t7xx (HASH:1400 7)]
>  net_rx_action+0x103/0x470
>  irq_exit_rcu+0x13a/0x310
>  sysvec_apic_timer_interrupt+0x56/0x90
>  </IRQ>
> 
> Fixes: 5545b7b9f294 ("net: wwan: t7xx: Add NAPI support")
> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
> ---
>  drivers/net/wwan/t7xx/t7xx_netdev.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_netdev.c b/drivers/net/wwan/t7xx/t7xx_netdev.c
> index 91fa082e9cab..48007384c030 100644
> --- a/drivers/net/wwan/t7xx/t7xx_netdev.c
> +++ b/drivers/net/wwan/t7xx/t7xx_netdev.c
> @@ -172,7 +172,7 @@ static void t7xx_ccmni_start(struct t7xx_ccmni_ctrl *ctlb)
>  	int i;
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -192,7 +192,7 @@ static void t7xx_ccmni_pre_stop(struct t7xx_ccmni_ctrl *ctlb)
>  	int i;
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -210,7 +210,7 @@ static void t7xx_ccmni_post_stop(struct t7xx_ccmni_ctrl *ctlb)
>  		t7xx_ccmni_disable_napi(ctlb);
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -302,7 +302,7 @@ static int t7xx_ccmni_wwan_newlink(void *ctxt, struct net_device *dev, u32 if_id
>  	ccmni->ctlb = ctlb;
>  	ccmni->dev = dev;
>  	atomic_set(&ccmni->usage, 0);
> -	ctlb->ccmni_inst[if_id] = ccmni;
> +	WRITE_ONCE(ctlb->ccmni_inst[if_id], ccmni);
>  
>  	ret = register_netdevice(dev);
>  	if (ret)
> @@ -321,9 +321,10 @@ static void t7xx_ccmni_wwan_dellink(void *ctxt, struct net_device *dev, struct l
>  	if (if_id >= ARRAY_SIZE(ctlb->ccmni_inst))
>  		return;
>  
> -	if (WARN_ON(ctlb->ccmni_inst[if_id] != ccmni))
> +	if (WARN_ON(READ_ONCE(ctlb->ccmni_inst[if_id]) != ccmni))

READ_ONCE is only needed when the the lock protecting ctlb->ccmni_inst
is not held. It's not needed here, and likely in pre/post stop operations.

/P


