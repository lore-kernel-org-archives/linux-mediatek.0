Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5F7C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zg08WXWOXsJ2QVUn2MD0H7hbFnvg8gqIUMqRHXTyYHs=; b=ph8oWQy+RV8WJsiqhOQdKhtsIW
	VwF34aUgiqS3CJnm+cvmZSM6BYO5XGq++c74QFD+5zsLWWnKxlLxq1xaYMCJ0eVWU8N5XWF2CT78H
	m28bBHEzRKxYAJ0e9aZcd4kJoFlg3f0ucHeNtuF02h5376Hx15Bvr8rGcpdT7oxQakyw+6phQ7w9R
	fWwM7oyXTgj/fD2vkQnsxusoAu+z6y3aQkDViSv1u4HjfFYhS8LC6ZYloQC1TH2wvajuLVoEzJIMY
	W76mx4s+RIOBBJkuxmFaMODBwEDE4BVksNpCaHTNh46fnqYTh35EBAslCTjKzCnvW+wGu2H9oy4WN
	kvjIbgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qZ-0000000HEFk-0cQ6;
	Thu, 03 Sep 2026 11:43:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qV-0000000HEDa-2aW0
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 11:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788435786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zg08WXWOXsJ2QVUn2MD0H7hbFnvg8gqIUMqRHXTyYHs=;
	b=R5bMt+bEvzfVcccNix6PClZLSVoDu3HBgyM6fuWy5USxRBvrN45DfGRCMN8LrgVtUdgBFm
	M+KWXhjrDSpapz8skw1Q3xKIfSj2S19Ecq8QjIoXTpQVPQ9qgeS2Nsx3hOnROqRX9vYvEM
	c7ZhsvbIi3xwlb5oRlXJmq47sDD1IuE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-tNP8FOklNoqVOf0ImIWCNQ-1; Thu, 03 Sep 2026 07:43:03 -0400
X-MC-Unique: tNP8FOklNoqVOf0ImIWCNQ-1
X-Mimecast-MFC-AGG-ID: tNP8FOklNoqVOf0ImIWCNQ_1788435782
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so26449135e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 04:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435782; x=1789040582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zg08WXWOXsJ2QVUn2MD0H7hbFnvg8gqIUMqRHXTyYHs=;
        b=Vzp+myaEcitRfsEpfy9yImwZnCPthJdIhtunlVM1wky3t/ynbL18ujIp5ZtjQ2WjL4
         iGR/qFUNk6dCqnuiyQIWZ8TOMfi2kIfHKZQujs0TUdjUU+6o+ohd6ixU6y91s3enI9ql
         +Kxn6kI4hjPpJ6hfIyjGP8/BldOR/WpkEzo5Q7Mp/yZiOy6MVYWrEVYMQQP61TxTQ3Wy
         dsZu6B193yJN3BZC1Nyq2GdzqZD2mZ932DVNcQmnm7t8jtbhtIpi1c1/vRHj6HgOA+Jp
         mHZf70uklFWFbz5d6zfmDXzPUbqDBqraFwuNytIoSRVUV9/3q0oDboY5Vk7saCAYre0p
         Gbpg==
X-Forwarded-Encrypted: i=1; AKwUvBxB3Ujv/6OoiNL7AsokyYMcDTLBt7YWUEeIFcsfB+WDTSACymrkWh6FyR0JcxfB3D1XFnNL2NHhEseZ2lZzgw==@lists.infradead.org
X-Gm-Message-State: AFuF++kGjgzjiMn9zmPsZWXuIes0Lggk1NJT4TGkhW+4ADBSVNlLaaiV
	pTy5/IBefPTn6KDvZB49kku3hFtCW30DW80LLCUAhZTcFDGJgDTMZtnTFeRGBBuCzAeDftCJjRy
	UlFDyys+71vyaYOKg+FwZw9AKeIlzbdFQs7LrzYsxhm6SkVrRMJSOaMOPnf+1rgdjKc9Nm64K+Q
	==
X-Gm-Gg: AYBFou0BlPqLdy9maVCVI99QTJVVrKTxcKNbe9iG5g6Jnqz8asFd8wGorp4gGYOZQex
	UeA+rDyrz01muQlyEEAzI5R5Nlj8qwt6b6aBK32y19pELa8587P4u0Uuh+TKrZkhO20eCCTkOGE
	IMtjc4loBwud41otwzCREHLA1znARpL9eFmiMWT0TRkianWQSKGVjAWRwIeV3pHB1rv1KGVMjKx
	AZGVMrEJQFZq0LgAGwXduV1s123+O66lcBne14nPCJKYaAKVYFHNafUVLBL9TzoYXV4FH/oq1xm
	7oLwyuvB+6I1eiBJxJ4a7kLxzvzZiKjzkllEfkFcReXjRrPjvqwl46/15PTewv0/2v/CYPMRRZk
	ORQJpuIDcRnetfW8bhl8iiRqxX5lg/oaEz2ROk3hboQQ4HiS/55XyOvsLGDcPdDwSLwlTB13w1A
	==
X-Received: by 2002:a05:600c:4743:b0:49c:e3b1:d826 with SMTP id 5b1f17b1804b1-49ce58195b0mr176370315e9.13.1788435781729;
        Thu, 03 Sep 2026 04:43:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4743:b0:49c:e3b1:d826 with SMTP id 5b1f17b1804b1-49ce58195b0mr176369365e9.13.1788435781291;
        Thu, 03 Sep 2026 04:43:01 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7f8f9sm13297052f8f.9.2026.09.03.04.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:42:59 -0700 (PDT)
Message-ID: <fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
Date: Thu, 3 Sep 2026 13:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] net: airoha: add HW GRO offload support
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rlErfs66YJz7Uq_2pN8KTFq4OHDF24i4VvmlNc6XClA_1788435782
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_044307_735011_6A81239B 
X-CRM114-Status: GOOD (  12.10  )
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

On 8/31/26 8:34 AM, Lorenzo Bianconi wrote:
> Add hardware GRO offload support to the airoha_eth driver, leveraging
> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
> queues 24-31. HW GRO offloading does not support Scatter-Gather (SG) so
> it is required to increase the page_pool allocation order to 2 for RX
> queues 24-31 (LRO queues).
> Since HW GRO is configured per-QDMA and shared across all devices using
> it, HW GRO is mutually exclusive with multiple devices bound to the
> same QDMA block. Call airoha_update_netdev_features() in
> airoha_dev_set_qdma() so that NETIF_F_GRO_HW availability is re-evaluated
> whenever the QDMA user count changes (device registration and runtime QDMA
> migration).
> Set CHECKSUM_PARTIAL with pseudo-header checksum on aggregated packets
> so that L3-forwarded traffic is correctly handled by the GSO/TSO path
> on the egress device.
> The HW does not report the per-segment MSS (msg3[31:16] only reports
> the max aggregated size), so the gso_size of an aggregated packet is
> just an approximation computed as DIV_ROUND_UP(data_len, agg_count).

What is the <max aggregated size> exactly? I read it as the maximum size
of the aggregated segments, am I correct?

Also any more details on how the aggregation engine works? i.e. can it
aggregate "random" segment sizes (i.e. 200 - 300 - 400) or does it
respect HW_GRO layout? (i.e. all segments except the last one must have
equal size, the can be smaller).

In the 'good' scenario, than by definition gso_size == <max aggregated
size> - <total hdr len>, and you are better off computing the gso_size
from <max aggregated size>.

Otherwise I think we can't call this HW_GRO - even if it would be more
convenient for the driver.

/P


