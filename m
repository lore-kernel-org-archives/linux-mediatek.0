Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6F2C07E9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 03:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBC46113C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 03:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBC46113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhyjQgIFEwsvotjYaqTPj7Mq+PEnXCpWuCXJf9gfyyE=; b=rB5AAVMkBWVCRW
	7+EnIzbODdn1ePLKO0lUKxwZRxIX0yAS+QH15NjWpwwFZHOz5Dx31+3MIGwndkteDLSVxPR1fKKQV
	VJ1AobLbzLLOLi0Sv0secMhJkyfIVh8YM7k29QDb1k8VPuORZ0fKva91dw5+0/vR4xClNfvybhqG2
	wApTJnimpFXWfZYWj350UfsJPrnqHcLZ+VB/8K9NUbuk4CT5vbSeW4fAd241BZggieGXNngTo2dzS
	SztW9SSZ+Y7/KYM+fagddDXvkPXaelP8gvNtZZyGGRgUW6m/w9yuHIrGzfpbxXmmHfO/bZmgv1eyY
	e2b65YC0No+Re4n3c8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6P6Z-0006TH-Bo; Thu, 22 Jul 2021 03:10:35 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6P6K-0006PF-Tr; Thu, 22 Jul 2021 03:10:22 +0000
Received: by mail-io1-f49.google.com with SMTP id z11so4810455iow.0;
 Wed, 21 Jul 2021 20:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Bv4rf7YQ1serjiyqS/1FiWsb2l7aSamYEyxdIo2VN0=;
 b=TONWONYDI3wjVyYqrExHQzTou00yRPW4B5xbyEaC0yL6FyDmXwRU+OosZ30rl1+UCs
 CUsLmRSghUAxotiCFYkP4wtFRM6hUu0e4kbw+x7mnWqE0+pAN3KZBnWiAKwHUrIv5R68
 HdbY/CEAAQpOIzJqRGYUOuO0A9P57TcNoDGUd6FFAwiPU3d4H7HmTHEledC5vsNXmPtd
 fvDYhpoaTb+6CxphjLmahOik7ENbKmsS6KxzkcNL7ZUo/tnKdi4bLW2BqcGbYYf6gh35
 2ImI1sTej17bLBQ6wBO4r9hErsbpGfQU9+/jPryEhLT+T7Yycg14FzhfhbbupgQtNYgP
 6AGg==
X-Gm-Message-State: AOAM533on6t6lkt2HAOspg4hlZjqx1IXQ2GD58QAVMGKfSRvAi755kqm
 0N63OIKVhXpMZ0Iyw/QoXg==
X-Google-Smtp-Source: ABdhPJzS0tj6zwZdfwCKsNKfxecVmPvK7aFqbnUATzc8tgJajkisHIneWNe1jj3UawV14SFSjg6GHA==
X-Received: by 2002:a5d:8747:: with SMTP id k7mr29857539iol.83.1626923420369; 
 Wed, 21 Jul 2021 20:10:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k19sm14259960ilh.60.2021.07.21.20.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 20:10:19 -0700 (PDT)
Received: (nullmailer pid 3229546 invoked by uid 1000);
 Thu, 22 Jul 2021 03:10:16 -0000
Date: Wed, 21 Jul 2021 21:10:16 -0600
From: Rob Herring <robh@kernel.org>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: wsa@the-dreams.de, matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 yuhan.wei@mediatek.com, ot_daolong.zhu@mediatek.com, liguo.zhang@mediatek.com
Subject: Re: [PATCH v4 5/8] dt-bindings: i2c: add attribute
 default-timing-adjust
Message-ID: <20210722031016.GA3228241@robh.at.kernel.org>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
 <1626517079-9057-6-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626517079-9057-6-git-send-email-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_201021_011362_95426013 
X-CRM114-Status: GOOD (  15.12  )
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

On Sat, Jul 17, 2021 at 06:17:56PM +0800, Kewei Xu wrote:
> Add attribute default-timing-adjust for DT-binding document.
> 
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 7c4915bc4439..7b80a11d4d4c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -33,6 +33,8 @@ Optional properties:
>    - mediatek,have-pmic: platform can control i2c form special pmic side.
>      Only mt6589 and mt8135 support this feature.
>    - mediatek,use-push-pull: IO config use push-pull mode.
> +  - mediatek,default-timing-adjust: use default timing calculation, no timing
> +    adjustment.

'mediatek,use-default-timing' perhaps as it means don't adjust anything.

>  
>  Example:
>  
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
