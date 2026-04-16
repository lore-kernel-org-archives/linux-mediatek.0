Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19104F8A148
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2026 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeC7oMI9xA1ye20ekpAQ+wRGGOwOATVLAo/K7oEoUak=; b=jnl4k/hkflgNFkHgDHnzkmXQ+u
	VUw7k1OW2iCrU/sTB/El9R3vKNwKtzEQCaYrZklLs3DpVwYiARsPy7rKWNo3Ufzlik3kR3clM/Quw
	fjciFC6M2BEodpaJipHW/CVWxNy7kTaSTYk6FGIybyJRdQ2z6uhKOcZxyKmURRC3pEhyj245PdCWl
	iZBChfVlLs57goVRpqWM01piTPLMJfLhxQWsYDLi2GKwZTpm6ofXU/KpcwRulyAqNGrGLUAqlz9Wc
	9/Q3biuUua7qVZgodTLCLAkMWh0NDmd4EgWSEwIfR2UI8koZCWCLJ9JVKP9HRi7xz9NfRyBAId3od
	3jSl18+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIL4-00000002Bex-0No8;
	Thu, 16 Apr 2026 08:44:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIL0-00000002Bdl-3ouU
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Apr 2026 08:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776329077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qeC7oMI9xA1ye20ekpAQ+wRGGOwOATVLAo/K7oEoUak=;
	b=QfceV0A0EUmk1ILh6tf5xgOrvcaxXklxh7ObZ9ggBgqKYsSTH0lmRa0XDIHp5ZjkOXoGG/
	+jU1Rr5mL6g7RfjB+srhDtSglAMBNB3FYeNK3WfuBryLv+D1RceLEma1CCWalZa0rGMC58
	pGurTlbCur++T4aUiuDeAHzd2qa+gec=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-aTIhZOY2NNyxQ91j9ok2-g-1; Thu, 16 Apr 2026 04:44:36 -0400
X-MC-Unique: aTIhZOY2NNyxQ91j9ok2-g-1
X-Mimecast-MFC-AGG-ID: aTIhZOY2NNyxQ91j9ok2-g_1776329075
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so63833145e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2026 01:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776329075; x=1776933875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeC7oMI9xA1ye20ekpAQ+wRGGOwOATVLAo/K7oEoUak=;
        b=VmVq5bG+Mfd8r9niiYHGqiOB38YnluOt0qfD0ogO9JQU1LQzQ3hoCyjxjaINdLP4cr
         lk2nHSvHUon3ONRV6opOwcFwNah5NBuQ7psKQuFxqVLNcBsDnWeIzw9c/SSP/pNvKWv6
         W0CTPfc1/Q9CXpAlBiz2ymDHwuNHIaemlu30aLuj45XnCjWfiYYgxynhQbcMJ6ws1oDt
         MOtZXVCouxSGlKlvXzlU7tE/ZaFSWOrURF+5Z4iyLD8BpH0tiadShk4HkWek0WXYwF6l
         ++fhsB3OjCaDBKTzzWkc0DLes82q09w0CBivmHeY+Ty+h7yRvNvVWF8zMDC/B59Dj3yz
         eS/A==
X-Forwarded-Encrypted: i=1; AFNElJ9G+WG9HGurofJxcdKyxwhGK2ugM1SQKskTvW4fZ0s/sIukdwjP8IMx6Tfx6KENvRzARunLbpnf1qf6Ax7uIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKDnZX+K0c2hsZuZKhR04R4Y1Ymdbd0mfTY6tlJopTTtE7wCo3
	K0I3VW6brt5/aE87/xPNPTJ3RszC2MvV5dTBlRjRVjDzmW3f/V/yHaGu1CMG42Ezb7PxI4t/gE8
	fRRB/jCQwVniU7/v0zgUy1AyOla69mx7ZFVCOgUmso12vBbQmdeL0Smi2pYIS+h13iEwZK8G1rw
	==
X-Gm-Gg: AeBDiesALi65bs+/dKk+6ySTpJRRV/9AO7k1h3BP20yVal7mNeNEk+HD6nqmyvzax3t
	Fkog1N0ceUxK0mbZ+M5TGBxDWhRqGI77wSDUxazA7SLySDrfRldn8Y0fmhXAkGe3F+Y5V50KIL5
	eLmDLDvm5WOkKeILOKw3WAGhpqowPMx631RXHsBINS5v0GVRuK6fYqG0E3x6Tz6TGOWadinqEqz
	G1mz9pZwRMkSNnIUT2/8NmR/hA1qbk8cqde0vbQl/K1gSIp8gLXRabAGKR6RraMOerZsc2YqP8s
	VRERdCw+y39VLmjOCTbRyqgwWdRzF1LMl5YRI1+z2Y7etL//zeCgBcpbB+F+1nUduTorDI7r+Mn
	u4toT8XZ5hBbIH3KxII/pf0RXOpgovTPE3CVO9Uh9Pz7OwaF61WLoyIX6/eQA6JLidao=
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr323665105e9.1.1776329074617;
        Thu, 16 Apr 2026 01:44:34 -0700 (PDT)
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr323664795e9.1.1776329074141;
        Thu, 16 Apr 2026 01:44:34 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f584e306sm42442665e9.11.2026.04.16.01.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:44:33 -0700 (PDT)
Message-ID: <f3315f5a-c5cc-4001-bbd3-bfb4aed080e4@redhat.com>
Date: Thu, 16 Apr 2026 10:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix possible TX queue stall in
 airoha_qdma_tx_napi_poll()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260413-airoha-txq-potential-stall-v1-1-7830363b1543@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260413-airoha-txq-potential-stall-v1-1-7830363b1543@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kVWa__I3ACQ0msZrVwtBEK2uIrJSnRlN2pVWdYvK_NU_1776329075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_014439_032333_7F784284 
X-CRM114-Status: GOOD (  20.79  )
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

On 4/13/26 10:29 AM, Lorenzo Bianconi wrote:
> Since multiple net_device TX queues can share the same hw QDMA TX queue,
> there is no guarantee we have inflight packets queued in hw belonging to a
> net_device TX queue stopped in the xmit path because hw QDMA TX queue
> can be full. In this corner case the net_device TX queue will never be
> re-activated. In order to avoid any potential net_device TX queue stall,
> we need to wake all the net_device TX queues feeding the same hw QDMA TX
> queue in airoha_qdma_tx_napi_poll routine.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 9e995094c32a..e7610f36b8e4 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -855,6 +855,19 @@ static int airoha_qdma_init_rx(struct airoha_qdma *qdma)
>  	return 0;
>  }
>  
> +static void airoha_qdma_wake_tx_queues(struct airoha_qdma *qdma)
> +{
> +	struct airoha_eth *eth = qdma->eth;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
> +		struct airoha_gdm_port *port = eth->ports[i];
> +
> +		if (port && port->qdma == qdma)
> +			netif_tx_wake_all_queues(port->dev);
> +	}
> +}
> +
>  static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
>  {
>  	struct airoha_tx_irq_queue *irq_q;
> @@ -931,12 +944,21 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
>  
>  			txq = netdev_get_tx_queue(skb->dev, queue);
>  			netdev_tx_completed_queue(txq, 1, skb->len);
> -			if (netif_tx_queue_stopped(txq) &&
> -			    q->ndesc - q->queued >= q->free_thr)
> -				netif_tx_wake_queue(txq);
> -
>  			dev_kfree_skb_any(skb);
>  		}
> +
> +		if (q->ndesc - q->queued == q->free_thr) {

Sashiko says:

---
Can this exact equality check cause a permanent TX queue stall?
The previous logic checked if the free space was greater than or equal
to q->free_thr. If the xmit path stops the queue because the free space
drops to exactly q->free_thr, the hardware queue will have exactly
q->free_thr free slots.
When the NAPI poll routine subsequently reaps a completed descriptor,
q->queued is decremented, increasing the free space to q->free_thr + 1.
Since the free space is no longer exactly equal to the threshold, this
condition evaluates to false.
As NAPI continues to reap more descriptors, the free space strictly
increases, meaning the exact equality check will never evaluate to true
and the netdev TX queue will remain permanently stalled.
---

Please, try to triage sashiko comments proactively. Especially on NIC
drivers, validating the AI statements is extremely cumbersome for the
maintainers.

Thanks,

Paolo


