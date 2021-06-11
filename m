Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240FAC48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 13:56:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C3161181
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 13:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C3161181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OgFGfvJSqV/AnyFZwMNwE8ZhfJpeRQLd3r77EcXMp1I=; b=BN04+smg3+lI4ZP91QIkZRGIb7
	or7EM1ehintBrXcikdVfTNIoB4ffjictsuQz4Hs5773lkEaoLdi8LLqpJNRcndc/OCCJHrYLbRyvi
	meAb/xYgWVrJKbmnFeTaGtUwkg0F66tVVgwP/rYIujau6dsncEGDxTxfMTRHOWQngLzV9cG0vPykX
	syl1IcJ6wYH87QUMw3G9Db//j3QsW9Nd/0oUzSkv4dg6qkJt7jJRe2fPSDz7o43Yiz1XIODzVZRVP
	Z92LlrQbSKw8SGHGjMBy6qZxYmyMmDz000kDHnMO9NOCicLZb0yu1LEZQY8u5q2mcj2kGaBv1k6AK
	3ndGYMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrheF-005VVQ-2D; Fri, 11 Jun 2021 13:56:35 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrhda-005VF4-EJ; Fri, 11 Jun 2021 13:55:55 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6408324wmc.1; 
 Fri, 11 Jun 2021 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t4GhLZNbe4X2F3Nkr5l8ySaeJ4eizRMsuR8A0/1Zt0Y=;
 b=a/f8+4vbE1r6uJlb7Fjan9+4imWd4Zedf0Xckjd0d4AB2QSBHX5peJ7wmUNKD6RqI+
 to/2lPyvcfU4XkwCX1knG7AuwfjX7/O2OISnaQPZ87aakBd6RbyLw4/U7RX49QraOXlq
 QfLh4HN4i3aXmH2Ho1av8xEWIPTj/5AC3Myk3hLxEyLEmLS1IFpJ0UJssFbeGA2vAQ48
 f6RIU2Tg+qkYwbz1YGFE2faT4qXVsIjz43HqDnXCDFi/AC/y3IdrajUzl6YjzxwxkJPz
 e1RASmN2Y/FUn76nkutOI1G//cDXb97TqWLuuFECkcD3Pv2EU49R9fhmMV08LGh6AlGI
 KWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t4GhLZNbe4X2F3Nkr5l8ySaeJ4eizRMsuR8A0/1Zt0Y=;
 b=OcGkdFB1AdipRkDpuJBPNAELpUymfJtl09bgH5h2pO1EJR5m0frDYtay5iGSRVxVyk
 PlxsrNfXpVSbpDcxcNGm2X6TzrPFItO4tTwsaVnznNSn0TfhXjNmJdNl+fIFyfLIchFD
 xfxQGAzfVVp9dfPXFWAM0P0ebBbndHZecSE7CkLfpPl2dBiFf8rKB0wvSSEkxzyUXVkR
 FSuPi58QtIyeblOcVGalivvgb+wvrN2cQPKjpkdGEwGc/MMF76snJe2ZVNNy9YmeobU/
 MTZYLAemb6/K0+zgB2ZMmvV2I7NDXjNU2m1L/A5z+jP6ExV4zNjCq8AwYTQUDtPSEm1f
 VYBQ==
X-Gm-Message-State: AOAM530qBKLMOpSw5mltHmk59nrOBZ+Hh2QNJQmXmD44rLSrRJteeg3f
 W31s0QlXcGq/6mglk/My4kZLLTG72py8Ig==
X-Google-Smtp-Source: ABdhPJwGotQnlGnQ6Y9vwgx6pMAyzR0pOVPeMeus0XIW6adAlKXjSYCF3sSJwsvgh9y7r9m7GBGYrQ==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr4074792wmd.126.1623419693316; 
 Fri, 11 Jun 2021 06:54:53 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id d15sm7025666wri.58.2021.06.11.06.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 06:54:52 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
To: Mason Zhang <mason.zhang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 hanks.chen@mediatek.com, linux-kernel@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1623413625.22727.10.camel@mbjsdccf07>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a00f4055-4f44-9acf-5a0f-579c300bd5c0@gmail.com>
Date: Fri, 11 Jun 2021 15:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1623413625.22727.10.camel@mbjsdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_065554_557732_75BFCE4F 
X-CRM114-Status: GOOD (  21.80  )
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

Hi Mason,

On 11/06/2021 14:13, Mason Zhang wrote:
> 
> this patch update spi document for MT6779 SOC.
> 
> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
> index 9e43721fa7d6..7bae7eef26c7 100644
> --- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
> @@ -13,6 +13,7 @@ Required properties:
>      - mediatek,mt8183-spi: for mt8183 platforms
>      - "mediatek,mt8192-spi", "mediatek,mt6765-spi": for mt8192 platforms
>      - "mediatek,mt8516-spi", "mediatek,mt2712-spi": for mt8516 platforms
> +    - "mediatek,mt6779-spi", "mediatek,mt6765-spi": for mt6779 platforms
>  
>  - #address-cells: should be 1.
>  
> 
> Hi Matthias:
> 	
> 	I'm sorry to disturb you, this patch is stay here for a long time, Do
> you have any suggestions about this patch? 
> 	We hope this patch will be merged as soon as possible,If you have any
> concern, I will fix it in time.
> 
> 	Looking forward to your reply~  
> 
> Thanks
> Mason
> 

Please put any comments below --- but before the diff, otherwise you break the
patch.

This patch was already upstreamed by:
260864f797f2 ("spi: mt6779: update spi document")


Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
