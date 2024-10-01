Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E371CEACD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iojT1xfY/iXMYZ4HclXjt5wJyv9eCNn2RMRvon4kbuU=; b=zfnTXo4jAv+SZcv7fmHLujVAlc
	yQ2SFPDOuwDy+5s1P0Da5BM8vhaNPrh19bct5r4qNk3/WOK5gVQ8JMyzHYa9mfNR9eLlu1pZk1JGM
	1HmrNZTbGY2yZ/x2hMgmgnJUe6UTGjDoM6Oa5U/+4w2A4NG3Oz72/zDVK4FRrDeG2jRbVeoXWJHPo
	pSxWRhn4JMUtFhgvb64FaFO/Vz4AGuNRPLqyBWZLhLFCxg8Bo4FXbWa4E/5jVLalpmVHwaLdmXERx
	HRR7b3m2Ciz+ZoAVgTH93rUufk0wtVbQAO09Bodyvts0qcWTDtF5xcoCCfUt2x4N6M49Qs1wpWqQl
	+huLgbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sveKf-00000003Dgr-3sRU;
	Tue, 01 Oct 2024 14:58:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcza-00000002xVz-3s1f
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 13:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727789561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iojT1xfY/iXMYZ4HclXjt5wJyv9eCNn2RMRvon4kbuU=;
	b=GSSiOv69fNEJVwQ+K86InxXSXuNnKs2jBvWLFV+Ti5gJlurZKFYaUQ/SXfKUgL9gtpi0tx
	SOo9d1m91pGGgF+6dOwfB9KNX/TWKKkrA6DHWIxMiKGSTxjKO8saZ4vYORC8BbP7kSyIuX
	e9SbSCkY6I6j8CTCPMrZvnr4ipbfyM4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-MzZ3XVhTMDmvxKBEguZcRw-1; Tue, 01 Oct 2024 09:32:40 -0400
X-MC-Unique: MzZ3XVhTMDmvxKBEguZcRw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42caca7215dso31498695e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789559; x=1728394359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iojT1xfY/iXMYZ4HclXjt5wJyv9eCNn2RMRvon4kbuU=;
        b=HVIsMvL/8YyV3tq/z7nOx0TEZ7B3BJlmKIclO1gy371qxSmvqUDXywYFIZTiZjNBVp
         L3V6OvingCv+bq9ESNTiUcx1wrpnVt/c6l0SpG9rBht+FO6l4wnsTIFpj/5KnmDsvWWR
         9iMqDhEXp/58iCFSUlRXK1UA+fvMTYOsx18cQhpXwGftFFkpkqxSSV4wv4cIDBLkV2tI
         ldqcbAOkzyxSH3MVCNdjrVCUcXJvO9zn65kNEkpJeca5MdMMOtRXTajiVga242ixLvEx
         xazoZDPIkgAgDBTskwY18pzCVXAMLV1Uth7uzKaSsgUEKFmf73O2hcPczS7ezvHqNUAw
         gjig==
X-Forwarded-Encrypted: i=1; AJvYcCXlNtlzKcZlfc5rxvRLl313nY7v8cTAS0SVZ3p2rmAZ2UYf7jcA3z2t9YQA0mpxJGqjoB5eI5b9/IHeW4DPuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkij49KdIIfAcWUGWg2v9wSzokVw+xgTd0c3/ENrPr8V45dMUN
	cUKjWNVyjZyT2bxkbru8M8S7Oe8Br+dtrIWdFE2EOFVNjZCOzdOTxyYYTRENJ8PTBlFjVFxS3Uf
	ks1RKSufsTeX4zE4Ra7a77CKXCLSkUUZG8h40oAFs4Q4rUGYz4FZHuR4Z1/Po+NjI80Se/w==
X-Received: by 2002:a05:600c:a02:b0:426:66e9:b844 with SMTP id 5b1f17b1804b1-42f584339aemr130160405e9.8.1727789559079;
        Tue, 01 Oct 2024 06:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDiutjjZjFmvjKmZCcGrKni3t0abnQlYsETvEbcK9G6gugyRexKg3WBxo9lrKH5Dul5fJhqA==
X-Received: by 2002:a05:600c:a02:b0:426:66e9:b844 with SMTP id 5b1f17b1804b1-42f584339aemr130159935e9.8.1727789558576;
        Tue, 01 Oct 2024 06:32:38 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b088:b810::f71? ([2a0d:3341:b088:b810::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13a1dsm136324005e9.32.2024.10.01.06.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 06:32:37 -0700 (PDT)
Message-ID: <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
Date: Tue, 1 Oct 2024 15:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 kuba@kernel.org
Cc: liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240925075707.3970187-3-linyunsheng@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_063243_075727_69E9B1C8 
X-CRM114-Status: GOOD (  22.03  )
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

On 9/25/24 09:57, Yunsheng Lin wrote:
> Networking driver with page_pool support may hand over page
> still with dma mapping to network stack and try to reuse that
> page after network stack is done with it and passes it back
> to page_pool to avoid the penalty of dma mapping/unmapping.
> With all the caching in the network stack, some pages may be
> held in the network stack without returning to the page_pool
> soon enough, and with VF disable causing the driver unbound,
> the page_pool does not stop the driver from doing it's
> unbounding work, instead page_pool uses workqueue to check
> if there is some pages coming back from the network stack
> periodically, if there is any, it will do the dma unmmapping
> related cleanup work.
> 
> As mentioned in [1], attempting DMA unmaps after the driver
> has already unbound may leak resources or at worst corrupt
> memory. Fundamentally, the page pool code cannot allow DMA
> mappings to outlive the driver they belong to.
> 
> Currently it seems there are at least two cases that the page
> is not released fast enough causing dma unmmapping done after
> driver has already unbound:
> 1. ipv4 packet defragmentation timeout: this seems to cause
>     delay up to 30 secs.
> 2. skb_defer_free_flush(): this may cause infinite delay if
>     there is no triggering for net_rx_action().
> 
> In order not to do the dma unmmapping after driver has already
> unbound and stall the unloading of the networking driver, add
> the pool->items array to record all the pages including the ones
> which are handed over to network stack, so the page_pool can
> do the dma unmmapping for those pages when page_pool_destroy()
> is called. As the pool->items need to be large enough to avoid
> performance degradation, add a 'item_full' stat to indicate the
> allocation failure due to unavailability of pool->items.

This looks really invasive, with room for potentially large performance 
regressions or worse. At very least it does not look suitable for net.

Is the problem only tied to VFs drivers? It's a pity all the page_pool 
users will have to pay a bill for it...

/P


