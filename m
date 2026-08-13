Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2BCC5B572
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olvOxTrv4YnBNgv+BD/U939Ug/C+Fyeg9JeE5DXp5dQ=; b=bhMw5xTCSEJtNV75kgLj8lP/GI
	KituycnhgIdMa/ET3VWopjxlaee499pc0rXw4JxP5JPHN7/ZujlIvJRF3EkJZ0dxxIPJ8SxnNoZWL
	vVXHAnjEVpHxwmn3svB8Vbqq1A+G15tS/EVPuyCiVa1zHj90fTIOdm2odWqJyjcbdyIq8g2Wp/QZm
	gWIKRef5hz2zFTDKjmqWI8ymqVUN/b/jOmjSw3Y+SYFtyQ5n2yJi2zvAEswj/VRvQt2hXPhYgWhCT
	Hbvw9/c0g2EWqQn3sTPrGdjo2VRqcKsvNsPP6niEsFlAq3di/hVekd6amh635oabIzhFxO9jphfqD
	HQJgRw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRiM-00000000INC-2jS8;
	Thu, 13 Aug 2026 09:27:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRiJ-00000000ILE-0Sm9
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 09:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786613220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olvOxTrv4YnBNgv+BD/U939Ug/C+Fyeg9JeE5DXp5dQ=;
	b=GIJDbwQ3pab4rqNrkHWHPa+kxdX+T/Lgvk1e+Tf1krsgArpwMNyeb16O2s0JyCj0hyjYN8
	51Zpu+Z7VZqMotsHnFoLNJ6yBERMpEeIAZ1hYinQe5mr7eUKT5yoZ0eFUJ1jS0O318pbFB
	7PwIY5u94JJ0S5dgdBjunXv1vgxC+4M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-E7s5e1yUMr61YyLt8_t8iQ-1; Thu, 13 Aug 2026 05:26:58 -0400
X-MC-Unique: E7s5e1yUMr61YyLt8_t8iQ-1
X-Mimecast-MFC-AGG-ID: E7s5e1yUMr61YyLt8_t8iQ_1786613217
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47faa02f707so581138f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613217; x=1787218017;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olvOxTrv4YnBNgv+BD/U939Ug/C+Fyeg9JeE5DXp5dQ=;
        b=rUjhN0zo97Oc2au4fD3h5xSehcsuA10i45ENMXhhgolYvh4/nRp3EDxWFPc0wnFF7G
         pez3+4wk9cFAi5PMRWODiYOsr2yRih9Feqs0TgDCu6coUhDCcSqYIusMWrqrRqOZhnoQ
         HCNY3WgMQnFvp0EhDTaMNKO+UbJFuWNHdLiiPq9XI9BKyHuFrLes5ladMDAzH2OveIZh
         4tIbulg2+TGU6YmQtLSECGEPD2m5qySm/P6BQ2MeBrjmAzNBsPEpZ46wcsTmGDGgDq0U
         q/LEqp6w7FlNjvn3gEUdcxCUt5/keLqcq3wJBYypzREJN5AiJwF8GKF6t+etgexf4Waz
         jKLw==
X-Forwarded-Encrypted: i=1; AHgh+RqAUkMEcbiJbzkKl+dKgxjnXmWyoK1G47nqmfFChfGewgc4sDe6jBrAJUEKBFWbwb5oa3y1Mficv8Zd/KXAbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziGirWASJRPcyTiXXThi9rCUe/fuycIvoiQO3fPUjtnIi1+Dbw
	/Un/2BAVJXhpDs0TThnHSIvorIqiYNdev0GyKFfpJgzhGa7zA36qpfccpkMqwZUDH5WOqNm4+P2
	pDW6db2QvNYiU/JD41BQ4Lg8XfkfXCq0lC8rRdRf60vAAhC5SkwJsSNS+rC+KV84qOFGXoxXOEQ
	==
X-Gm-Gg: AR+sD11g500FM51LA0Eqb/hzFx9yEjLXLnZmIAw79C7y6vqhKBuJPBhgE1F9gJFwwLm
	y1UGZSDXprhLvCM8lOhcR1UQnjl0yk63IJjM0Osa1BUOpFb/zzzBMrS+BlSLXzJpqc3a+oQVLLC
	V6aS09al1w8JtmH+S57Ptcxuk75OkxJ6Cu6oaMMb1eyFMVRMyVSIwFEn68Ia0AClbEE0C3fUNPM
	CiH3JGXPl8evuQwQVcaM7pSrA2rGrxcGNIx80ovFhkd/s9Sddc6F3U7hMKeBbd5YwnB9R828Pi9
	ibuZaQf20reyPU3Z+Fbpy04+ZRfCvYFvTBqjeOrIbpyEaK51CP/eJfYaqMa9y8gVOFLuWa5JaUQ
	CTFoFneNBwRe3x3ajaB/lbSZu7ZgrOnlIXY7ax1jN3jbi163MWS2sXzN8hE+T7GNNAeR59zqd14
	k=
X-Received: by 2002:a05:6000:2210:b0:481:50ae:df9a with SMTP id ffacd0b85a97d-4815a52bce0mr5525475f8f.9.1786613217321;
        Thu, 13 Aug 2026 02:26:57 -0700 (PDT)
X-Received: by 2002:a05:6000:2210:b0:481:50ae:df9a with SMTP id ffacd0b85a97d-4815a52bce0mr5525393f8f.9.1786613216887;
        Thu, 13 Aug 2026 02:26:56 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a56133csm4902762f8f.7.2026.08.13.02.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:26:56 -0700 (PDT)
Message-ID: <60ca9ce8-27d8-4876-b66f-a4bf9824d607@redhat.com>
Date: Thu, 13 Aug 2026 11:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: airoha: add HW GRO offload support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260807-airoha-eth-lro-v4-1-12d11ecb77d4@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260807-airoha-eth-lro-v4-1-12d11ecb77d4@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dyElJFOUM7P2EM3yAqR31NR3ColDEYAKXNtnd-yGHLY_1786613217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022703_226845_33D8BD4B 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

On 8/7/26 11:18 AM, Lorenzo Bianconi wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Add hardware GRO offload support to the airoha_eth driver, leveraging
> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
> queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) so
> it is required to increase the page_pool allocation order to 2 for RX
> queues 24-31 (LRO queues).
> Since HW GRO is configured per-QDMA and shared across all devices using
> it, HW GRO is mutually exclusive with multiple devices bound to the
> same QDMA block. Call netdev_update_features() in airoha_dev_set_qdma()
> so that NETIF_F_GRO_HW availability is re-evaluated whenever the QDMA
> user count changes (device registration and runtime QDMA migration).
> Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
> so that L3-forwarded traffic is correctly handled by the GSO/TSO path
> on the egress device.
> 
> Performance comparison between GRO and HW GRO has been carried out using
> a 10Gbps NIC:
> GRO:    ~2.7 Gbps
> HW GRO: ~8.2 Gbps
> 
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Sashiko nipa has still something to say:

https://netdev-ai.bots.linux.dev/sashiko/#/log/9407

/P



