Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF92C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:23:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C54613B5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C54613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VUQU39ZCfO7GoGC/Mlo/aglHlZLfnzrJqZE1WrUD9TQ=; b=UVIwoBM67cXj8jzLG8zA6r90m
	9yOVmUFWJn7yAAZUrvAR3PG0ivQFNqDs0SFdLDOFgaXmYttQnhdiMp5YDa3l06AOKNqWUQ8oasiTu
	Yi9p8zf0mBVELV7gZ8FJLr2QuVOZV+XC1OoGH8Pv8qoJDNaVzDmmqXlpFMIHE1QffRlAvDb220ahU
	knxzZyF4bO8psv1GiX+V1YeaN+zBDiTcnQ0/Q9kj2jKVvO1Gm5IODiraugzsARwRZNvpLhUZ3sZx1
	SM8/Au4wxtk2lyP1zt1qTMuFiyKsnysJ/+hZxkI5uE2Ycm7x5HvdIpkFnlkJMRfx9V7fpw+vq7W21
	i8bZqkZEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhDB0-005rEC-Gj; Thu, 13 May 2021 15:23:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhDAy-005rDk-Hr
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 15:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JPchFjYUjZOX2g5buK/IDjU5s612n8asJo964y6YtRY=; b=UdWWSebjpn5aJdHCEl4P3ZK1e7
 odQbIm/0ErRTe5HC3npWay/4MkIvbaqb6868dGWSWpkGogw/s6PE3Rg9byBnxGblQjR7rPZMpLLYx
 HjEXNnB8WCg9Vo2kZjZdQz82PNqpnTo9xgiRASBJONbrVuOKR5FGhF6JEZbsXvR/a6n9UR4ArHgZx
 PyPxNx5Bre7x5EhA7dCOK5Ejj+OPLjrnMh0Eq5m4iXnzJsnDVEDbswlj4ZNjQ4d/sb645sMO7kVom
 H4KVEYv9/E9roRyZ6+F6S5HRz4yriZihBpz/V+CMpWhsTzTcckn9vIga2ZvDlID/EXzdQ3IODn1im
 2kC62chw==;
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhDAw-00BLyL-2k
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 15:22:59 +0000
Received: by mail-qt1-x832.google.com with SMTP id t20so15704102qtx.8
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JPchFjYUjZOX2g5buK/IDjU5s612n8asJo964y6YtRY=;
 b=iMVPwUOW8ZSt6me+fLPuRlKburXABhJjZ3HwjZvIsSJISRv2OLUTbrRwujwexoBs0I
 Kpg/x2hcScwGtoEuNhKKZ34UlSEPfhWgUcQCOVeSGHzAtVvS4uLkwQJi5cpW+lXT0KZb
 0ghMTnRmCijH1jM/E7B9TWnzhecHKa3B5YAHsQDd9MzWuWJbsC7S40PbELmL0Vat+HAt
 VF1CxzLFt9m3CFL1CKAAo3iui15gqObrDm11wUagXQ62/yzT3TV9IWYtFuX/aVeJlwnT
 AhQeLR6zhNAtUQeaTlU0WAuVj3/xWzrAUkyLJhhCYCiY0smh/w3rlKzfAGqlb1Grt5iS
 2hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=JPchFjYUjZOX2g5buK/IDjU5s612n8asJo964y6YtRY=;
 b=JnjJ+P14oirGxSWscU016qR2A8tzsJVioeCvEHxQ/N7jtkorPAXBXY8ystcY0vTIuY
 BXZFEEsof2Fwh9dgcyP7zxefrJgXGIXJ+fqrSPjTwZHPWfZS8rRCpTUkMOfqTbO9O/cj
 TVzntzueCMr1XcOcOlOcS6XUMpsc9qEkoGuUz8qubMu0cQLkUR0YXUFzhkkpKdCaroGY
 z1lfsKNnp271ljTuXCLm2/DOOfsOmxZc/afEmsSqBtoF7F+Fy3jAowOJtYCLktVE0KBM
 txTis5I3VpDZaHld9g81DuQD7IDUgTyIXrIzl33/Ij2Lp/ptYAE1aDA/T0u138UTDX2L
 0qig==
X-Gm-Message-State: AOAM5330v51319WF2oLsBIXsHbptwH1osJuHWObN1XaoralJ7BcV3efE
 QhjCeoaOpHNPqxWbUqU6zvcxOU8Kem0=
X-Google-Smtp-Source: ABdhPJylOUlSsA5visDiw/NRnf6SzCPTxIHwktzXIKL5dJB0sRutvEgxOQoD5W4PBp21FUvI4A4dew==
X-Received: by 2002:a05:622a:2c1:: with SMTP id
 a1mr15287322qtx.361.1620919377116; 
 Thu, 13 May 2021 08:22:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x194sm2665414qkb.79.2021.05.13.08.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 08:22:56 -0700 (PDT)
Date: Thu, 13 May 2021 08:22:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: mediatek: add support for
 mt6577 SoC
Message-ID: <20210513152255.GB3452915@roeck-us.net>
References: <20210513013515.31329-1-arzamas-16@mail.ee>
 <20210513013515.31329-3-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513013515.31329-3-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_082258_145040_A9A53C9D 
X-CRM114-Status: GOOD (  13.59  )
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

On Thu, May 13, 2021 at 04:35:14AM +0300, Boris Lysov wrote:
> Add support for Mediatek mt6577 SoC to device tree binding
> documentation.
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index e36ba60de829..f5a5404523a3 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -5,6 +5,7 @@ Required properties:
>  - compatible should contain:
>  	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
>  	"mediatek,mt2712-wdt": for MT2712
> +	"mediatek,mt6577-wdt": for MT6577
>  	"mediatek,mt6589-wdt": for MT6589
>  	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> -- 
> 2.20.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
