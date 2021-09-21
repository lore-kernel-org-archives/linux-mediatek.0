Return-Path: <SRS0=xNtl=OL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC06CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FBC60FDA
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 20:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3FBC60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWv0Up0XWCk+nOHX/ZBj9WBuseiE28UUegXG28qdYL8=; b=u73a0k6CaS4q0/
	gJHhSNDRmNm9Hz1hKs5LQ6klP8Xh9ZsdA7wH0S3ZwIMavh7K3u5XuKhCSZ/WC76mfYAWinIXEQ1OR
	H15o6ki1y3l45sDqHYWbs6pcoAigbBVBvHJddvRVP4F+HO7LOFtaXODrspRkryZkRre1iEzMXohe3
	KGZpNjSvB8sZg7PWRsizNje/EWLcjNhdBop0p1NdNqLHCD2y5PcHQhfBePxfCBnD2TKEBZFV+Tqsv
	9PPc4ZcUM1s00mBvezyfH/rYU+UJ3s7249fjEb+n7YiRgBsRekZatUKSg0EYCCY9j3qToL99F/GM7
	ohTuA5RzlzGFqRKVmmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSmVe-005hmk-J1; Tue, 21 Sep 2021 20:36:58 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSmVS-005hl5-8L; Tue, 21 Sep 2021 20:36:47 +0000
Received: by mail-oi1-f179.google.com with SMTP id t189so1013038oie.7;
 Tue, 21 Sep 2021 13:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=74OhYUyeQYysi/TzRlJJ051fes4I/adprkYFLTi5Sdw=;
 b=1st56EVTM0YkNdSrTzqZlcO1B2urZgd/DiG480WtLr9N3vWTS4by9kzk0UhRp//Eui
 S+Vl6LPneyTxX1M35x7SRXs9FXPuua4K7hnEgcYngmIH62bV0WjE50mjN7CbKEvGKjVv
 MKRE0gXMBrwYQi3sVMrYj28P4LVY14pXJw5nPdXYo156zUlqYm1U0MqFLcCMVhZv2gxG
 dTdqg0pYZ/n4fy6puz4pAmpztrw3eAK2A6AEQ8xHvVH4cksRvQs47SAweIPF4JqzFUPX
 UF2MFS1KQFMzhm8EfpHt+q6hRAi9b1Vm96L6Xx/kHtRJKMFzsiDPiTOgTm2RJGUrn+6F
 3kHg==
X-Gm-Message-State: AOAM531Us23CwuvvGfPU4LqT2DjvlzLfIux+vLNXY9wBwEMqkJ+7/1g/
 1nXz40FlJltSi7FNPqDvDA==
X-Google-Smtp-Source: ABdhPJzpj/fzNJ7BMj74jnTQOWdAXExqWcupsGQA5m5n6ary5zeQWefviZyc6aAk8QOZVNYAsL3+Tg==
X-Received: by 2002:a05:6808:1481:: with SMTP id
 e1mr5210840oiw.5.1632256605224; 
 Tue, 21 Sep 2021 13:36:45 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com.
 [192.154.179.36])
 by smtp.gmail.com with ESMTPSA id v19sm16599oic.31.2021.09.21.13.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:36:44 -0700 (PDT)
Received: (nullmailer pid 3285894 invoked by uid 1000);
 Tue, 21 Sep 2021 20:36:42 -0000
Date: Tue, 21 Sep 2021 15:36:42 -0500
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 youlin.pei@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com, anan.sun@mediatek.com,
 Tomasz Figa <tfiga@chromium.org>, ming-fan.chen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 anthony.huang@mediatek.com, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: memory: mediatek: Add mt8195 smi
 sub common
Message-ID: <YUpCWib8Tpf0wfif@robh.at.kernel.org>
References: <20210914113703.31466-1-yong.wu@mediatek.com>
 <20210914113703.31466-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914113703.31466-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_133646_344884_3608FDE4 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 14 Sep 2021 19:36:52 +0800, Yong Wu wrote:
> Add the binding for smi-sub-common. The SMI block diagram like this:
> 
>         IOMMU
>          |  |
>       smi-common
>   ------------------
>   |      ....      |
>  larb0           larb7   <-max is 8
> 
> The smi-common connects with smi-larb and IOMMU. The maximum larbs number
> that connects with a smi-common is 8. If the engines number is over 8,
> sometimes we use a smi-sub-common which is nearly same with smi-common.
> It supports up to 8 input and 1 output(smi-common has 2 output)
> 
> Something like:
> 
>         IOMMU
>          |  |
>       smi-common
>   ---------------------
>   |      |          ...
> larb0  sub-common   ...   <-max is 8
>       -----------
>        |    |    ...   <-max is 8 too.
>      larb2 larb5
> 
> We don't need extra SW setting for smi-sub-common, only the sub-common has
> special clocks need to enable when the engines access dram.
> 
> If it is sub-common, it should have a "mediatek,smi" phandle to point to
> its smi-common. meanwhile the sub-common only has one gals clock.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> change note: add "else mediatek,smi: false".
> ---
>  .../mediatek,smi-common.yaml                  | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
