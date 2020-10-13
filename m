Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87FFC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 06:00:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09211208D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 06:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNkRfiTX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afO4cpR+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09211208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RBPDQhVbiZD5Px8nigC2DcDhBeL3sJS5mQIGF8wdLxs=; b=PNkRfiTXYQxZ/xmtsp6/taGah
	ZpNhTj/n/9u3fZItA9ult/qXkT9O1xCCDNcARwY2Q3+ETPun3Axa3RnO52FQNafo3/++FlrDQGGRP
	N6uSxACvu6sZ311ojwhwadapfOcQJ6nBoZ47xv4j3a2PfNJyUmQlpjaoWBM5BlcM5VwjdVjsX706U
	ROqZV21lkAA9Pw/I91Ek9KGjt2upi7n5JIwVZAKllObQjBv0Q5AEHeB1BTKPSwAunWC6gryGoguw+
	M+NsB9xDgvzFPLDs9RR3Q65HS7hFzQJbYEhIIpx9ESZne9jlWixUz7EPyIJnPm2gfFCUCfp1nWrEb
	CXdA2V+pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSDMP-0004H2-AL; Tue, 13 Oct 2020 06:00:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSDMM-0004G1-7F; Tue, 13 Oct 2020 06:00:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id j136so20454634wmj.2;
 Mon, 12 Oct 2020 23:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jnS/x8SlmHpjDOqz9A1uOS6RzTrMehpndh0O6FN/G6U=;
 b=afO4cpR+LHdQnJ28NOXE/mkii7qViCz8wl0LWS29yyhmyfzSYeWlV5OrtqJNRvLqvh
 N5pE8eULXJVrqWaSoNcf4dPPx9VihMP44Ff5NW5KCmaFH6Qznlvr7c7UR5RGcKPVgbHG
 WWJSVCJ/n2aWcIgf5QTFrrYAA1/6UO3YLFbVjU4IHnSM1M6mWdMXpA0lJ6Hq8+x+TPe3
 JgpHVTrNcbRbH8UcCxML/8g6tFgPkKJn6WkQRYxt2RFlzxaGANYQHP86Ohl9u82sYGCp
 Hx7JrEinVP3XbzKd9i4F3gEl5LCii7VuV75Bq8aBLL/YIQQETQF4HJ8hrywejIFH+5oy
 EzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jnS/x8SlmHpjDOqz9A1uOS6RzTrMehpndh0O6FN/G6U=;
 b=L1ewHiL4Qsmdr1p6mJM/00f0pousWccIN1m8f7Dud3UBWEhuNnGsYqwTcqSJi/Q9x+
 Rr2IE+PEhCq3o+KckVAcpr1bHyAMOyPD4q0iNbfjtDURTUO1r08ZwYLvawFVuzaYt+m8
 Ef7qfAjfxhV9LztmzF+78D5kzwQiI/scV6A+haDiu6U8gFgqtq47lO8O3GPOB07aI/iS
 yro8bs8f/lZ3P6VYmSSkmq8VbjI3vk38qI6ZQhn/LS0u5SJlOW5UZJ5kBrwj+B/NXl/F
 zrFxozMCGffXr59LgqP+lb6Lh2zb35luCn/nHTr8lw9LOdxP7Z1I/GLtWbciOlozd4QJ
 nF6g==
X-Gm-Message-State: AOAM532QsLj82vHiA59+2LmrJQ2MvtPCrqyA2e8iFdrBGSJmPSJsDqgG
 64iDyx6AI4Zbf+2TcGe7XTI=
X-Google-Smtp-Source: ABdhPJwV3SrDoUWfGVUiifjwE7icpnVDk1AWT+ES8MylI3PskKn0pFqjnIKUIusVGkaOQkyFSOovvg==
X-Received: by 2002:a7b:c401:: with SMTP id k1mr13535636wmi.120.1602568827375; 
 Mon, 12 Oct 2020 23:00:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id l8sm18052242wrn.28.2020.10.12.23.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 23:00:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: auxadc: add doc for MT8516 SoC
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org
References: <20201012205218.3010868-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5ac4afb0-3950-3b11-1f5c-01bbf74e64a4@gmail.com>
Date: Tue, 13 Oct 2020 08:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012205218.3010868-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_020030_304814_34C41465 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: jic23@kernel.org, robh+dt@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net,
 knaack.h@gmx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/10/2020 22:52, Fabien Parent wrote:
> Add documentation for the auxadc binding for MT8516 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> index 78c06e05c8e5..1b7ff9e5615a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> @@ -17,6 +17,7 @@ Required properties:
>       - "mediatek,mt7622-auxadc": For MT7622 family of SoCs
>       - "mediatek,mt8173-auxadc": For MT8173 family of SoCs
>       - "mediatek,mt8183-auxadc", "mediatek,mt8173-auxadc": For MT8183 family of SoCs
> +    - "mediatek,mt8516-auxadc", "mediatek,mt8173-auxadc": For MT8516 family of SoCs
>     - reg: Address range of the AUXADC unit.
>     - clocks: Should contain a clock specifier for each entry in clock-names
>     - clock-names: Should contain "main".
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
