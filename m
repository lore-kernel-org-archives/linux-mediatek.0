Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872EAC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:54:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FEF207F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wJOffKQA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlUH8kBa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FEF207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=48+EBTH7Sbtashr4Y5q3gMnFdveGO2a85b5kN6vHF4Q=; b=wJOffKQAkjYy5sDI0nYcdk98Q
	NPbN86ZUka/XoLDizk5WqaRG3h0b/rhcZamOhx/0SQLdrD4zvMgHcbFDtIzZvwe12oLD+OjyZVF5i
	nuKzBOUpTUwllqXwAI7fc8DZWL2vfSkVbal9KXbOQjqXzlNcUvBBCtvDc/6Ngv3JUa5ns37UoSBIt
	4GEv+U9f3dzDHSOCHQUV5lWLO6Lys3xUkDudZ5z0xMkeSxsg0epb3IgkxWJMxlp6i1vwGaFfIw/vD
	RCVzUlPF4OrojZBqK/h4DVSLlSYh71qjYgR1HWsUMgqzusXfaXOpnUTxhlWbDyc3XSnJ5HEwBHdlo
	AxZ7P9pRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0gua-0005bE-Fh; Wed, 29 Jul 2020 07:54:04 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0guY-0005am-Cu; Wed, 29 Jul 2020 07:54:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id c80so1830827wme.0;
 Wed, 29 Jul 2020 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/AF3ziGdsv+yHT1fe3PUelS/2zrWYP4f9GP8YSs/IPc=;
 b=MlUH8kBaFu79dJ7zTA7AxHX5vZnH3atVoFmXTrsQVk0XGmsKLFztoB8RZ+7l9NxADa
 heVEVjCRrLpA09FB0tMRmlYRxowPetxVox4fUGfZlhrkAWkhm5XbMuQR/wR4mC99k+g9
 gFlPUjreBiXvEg0CpWWx3HKClpA7t1wc1xde5lfEYfBQGgoSl+5QdqvsXm6bZ/8xqP0t
 wuw4MIhFh7v1oBZaAATh83lNhwaaRouCuYSFSUOsI89temx6LA2/4iMgieU5TMqAMf9N
 lRmg4rK+i0Ak753bQsVyCR1z76g1RZK7xAnLuGr5TD/feaWW7SY+keMpaAmcuFQyRJQT
 AKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/AF3ziGdsv+yHT1fe3PUelS/2zrWYP4f9GP8YSs/IPc=;
 b=HKmcpQ8a7RtMpUOAB5YlamWdenvtdzvz9TN8s/S8wSk6/WWDOWiwVRVd5WWtsbVePX
 wXaU5Y7xicmzWz3CWdeR8OyNf+CPtDyV+7QgZwa+Cg+j8mKSY7Bt78YGrKUOAKqj1ocW
 QI9pCI5sEa08VkcvRo2xq+Wc5FUrkVvNT8R9727mXT80wWQTALZXsgXEDT5x2cpvNd4r
 tf1jL9T9bO3yjMt/grbhzf8vTxKWdQt6SGBYe9C5oi2jb7lK0zV7cpW9FTNdgJE/KS+h
 rD7kfNfVDKSUzwToqNkff4Y1SddHBMQr1T/Vk92qH8Ue8PudybL5ymWTYuReABfOIDWI
 EkiQ==
X-Gm-Message-State: AOAM531nYSfVx19c3alqDKTwbkziCLGOznsXeCnbMNg6yat9YbgbAAdE
 4tKygBaLa0IXqbJg4W9cJHU=
X-Google-Smtp-Source: ABdhPJxamnrbfIgoOPs5700FsQ5inek8s3ZEJ1uxRNAQLfIqnK+Jz1/HzqUtD7rdjPAG/HH75zH4Gg==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr7199927wmb.53.1596009241124; 
 Wed, 29 Jul 2020 00:54:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id t13sm3207810wru.65.2020.07.29.00.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 00:54:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
To: Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20200729074415.28393-1-krzk@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
Date: Wed, 29 Jul 2020 09:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200729074415.28393-1-krzk@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_035402_533346_9C81B646 
X-CRM114-Status: GOOD (  19.10  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2020 09:44, Krzysztof Kozlowski wrote:
> Fix W=1 compile warnings (invalid kerneldoc):
> 
>      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
>      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Queued for v5.9-next/soc

Thanks
Matthias

> ---
>   drivers/soc/mediatek/mtk-infracfg.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
> index 341c7ac250e3..4a123796aad3 100644
> --- a/drivers/soc/mediatek/mtk-infracfg.c
> +++ b/drivers/soc/mediatek/mtk-infracfg.c
> @@ -19,7 +19,7 @@
>   
>   /**
>    * mtk_infracfg_set_bus_protection - enable bus protection
> - * @regmap: The infracfg regmap
> + * @infracfg: The infracfg regmap
>    * @mask: The mask containing the protection bits to be enabled.
>    * @reg_update: The boolean flag determines to set the protection bits
>    *              by regmap_update_bits with enable register(PROTECTEN) or
> @@ -50,7 +50,7 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
>   
>   /**
>    * mtk_infracfg_clear_bus_protection - disable bus protection
> - * @regmap: The infracfg regmap
> + * @infracfg: The infracfg regmap
>    * @mask: The mask containing the protection bits to be disabled.
>    * @reg_update: The boolean flag determines to clear the protection bits
>    *              by regmap_update_bits with enable register(PROTECTEN) or
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
