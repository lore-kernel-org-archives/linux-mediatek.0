Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18175C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 20:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C27F961101
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 20:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C27F961101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JAyAGELNf2N73jKXq8+3v5oiFvXFqHxEv2GL7I+BnAc=; b=AXK5HDFeqDqYIDwg/lksMdoT1G
	FKvCtFEdIiHP5ktMw1eu+Mqf5A5KPq5iTDmxYAathtZU0eFSOeX8QNj+qNsqxladWRd9dg3opUN3d
	CjwalXKHYmmefe7sF8TQ0Raka6cwuu8Rf2emQYzctf0DkWoesc2tLzsd6wCOX0mxEcw+NaL0NGbga
	pSuAY/nlNNJjASRf4a739YfYv7FQ9ACjRPBnNRSmpmZ6Rb7FzUjt75jSfDa0tABv2yFWnW8CIs7ZT
	382vo6n642R6bciJPlht4DFuMLT2lm41z+kvHAqbR7QHw9f1XyvNiZmLmIkeaoNEW4Mm9KmSrT+pw
	zws6OLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGSNr-006dbi-BY; Wed, 18 Aug 2021 20:41:59 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGSNl-006dau-Mw
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 20:41:57 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 9390041EFE
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629319303;
 bh=UOE20OlnZGDBI1w8hzaIpuPN6xfmK8WguChjFrKnZuU=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=AMPMxxlzH93EbqKkvvLs1/DuQFC7yPashajwqCWDTb5Z9STiD2KQD41p3+feaJbPp
 /cavtIUhM2VD1MxPW7G9Pv9TOz0eUjj1uCFo4t/f6c0z0V4e7J1eWINFZGX4DmGZwg
 /V9g9bFGwUVunKivZPtwf+GOK3tvuP0OLH7ybfssKcqx9c51xRFTvCHxFn73IFxyHJ
 xCOGkA/NksndsMW8fZQ6Abiu+eVTqGyJJ3lttmpJQ6IDjMTDMSWp5pOczdmsfKLXsn
 elTPpgn1cjxoz4n6IVIyL+lyUFHLky2PUsVs/GC/3m11yuONC2thZ7mTLXMiewr1Vx
 WFBrpiBsD0KsA==
Received: by mail-ed1-f69.google.com with SMTP id
 ec47-20020a0564020d6fb02903be5e0a8cd2so1687940edb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 13:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UOE20OlnZGDBI1w8hzaIpuPN6xfmK8WguChjFrKnZuU=;
 b=IIz6PurUXCHSBmfJ2aV0K1/twJpbUOBUbzgnU1s/71rexeMtQspnBEL3NcEiy6cW1i
 QX51mr8R8fvuHS1RO959+Np206NjhgDVAuILo8CRXWGJxOnbQpeaNfc9ZFafrWCAzAQs
 halA7+J3GQJQbfIKfftoEnNetMOo2QgkptEhNFCX9cjwhkYdYp6NAY60F8ocO+yXaAtO
 18f7n0q+f1Z4HDSnSqBhhaeLfTdI3mxTcpoBg1XDf+AzuUZRln5iXZb8SH94djp57L3W
 V9QGGmNLj5Egwh44Qs8bnzzmRb87V75LDf2BdGbbP74qblCekQ8pVZpREwnuw58J3mx3
 CPig==
X-Gm-Message-State: AOAM531uSP81bzYUpc5ootPk/rt9RBUmMbv7TzzS1QRaC24xKrKptL+J
 LEgg5Gkn9ofodzaTEJQvZokc8RvbgBDotRmNvd2RnfZLQFNLk4S10ccwBEanfD/qPyxpsEs0EsH
 w0zrTZfLr9AWkSzK8LxgsmaV33BqSgFlxhJ3hIscvwmMlwC6ryA==
X-Received: by 2002:a17:906:bc81:: with SMTP id
 lv1mr11590288ejb.393.1629319303179; 
 Wed, 18 Aug 2021 13:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuYU3uP7y//yQFosQFGT8VE96LJF4E5eKGo52ons6ugHXq2GC+IHUQY+3g7aV0U22I95MmCg==
X-Received: by 2002:a17:906:bc81:: with SMTP id
 lv1mr11590254ejb.393.1629319302920; 
 Wed, 18 Aug 2021 13:41:42 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id kv4sm360228ejc.35.2021.08.18.13.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 13:41:42 -0700 (PDT)
Subject: Re: [PATCH v3 00/13] MT8195 SMI support
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, Ikjoon Jang <ikjn@chromium.org>
References: <20210810080859.29511-1-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1a160afd-ceeb-04a3-8213-fe781ec18e30@canonical.com>
Date: Wed, 18 Aug 2021 22:41:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810080859.29511-1-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_134153_956912_FC75E6B7 
X-CRM114-Status: GOOD (  17.84  )
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

On 10/08/2021 10:08, Yong Wu wrote:
> This patchset mainly adds SMI support for mt8195.
> 
> Comparing with the previous version, add two new functions:
> a) add smi sub common
> b) add initial setting for smi-common and smi-larb.
> 
> Change note:
> v3:1) In the dt-binding:
>        a. Change mediatek,smi type from phandle-array to phandle from Rob.
>        b. Add a new bool property (mediatek,smi_sub_common)
>           to indicate if this is smi-sub-common.
>    2) Change the clock using bulk parting.
>       keep the smi-common's has_gals flag. more strict.
>    3) More comment about larb initial setting.
>    4) Add a maintain patch

The patchset looks good to me but I saw now comments from Rob, so I
expect a resend. Therefore there is also time for additional review -
maybe continued by Ikjoon Jang?

If you sent a v4 with fixes rather soon and get ack from Rob, I could
still try to get it into next merge window. After this weekend I won't
be taking patches for this cycle and it will wait for the merge window
to finish.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
