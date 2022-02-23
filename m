Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHlJ+zkHro35SaNeFlPWVEVx03iRIo3FPGLQ2R3xWgI=; b=2ace/7e/nQRd4v
	d28B0SvJIsqLuHOpiN+4vZBNsVuUmNdhTfhm/NMzLCSqT1Oe1jVQbVjLfjuC/5XLu5DNxtwZPT6A6
	be66FcpbDsiqVRPxUz2F3zw5mthTHcX5mg0sKoyGN/4mnhnjhSBdEjkWl6tk0+/o1Pd+wluTOexZ4
	nxz8C7L+gZ6Xfq0rXXO60N5PDzS3ZWy1M/kkW2Rh/tQH5WP0TKk0xsi7MrB5FHXWYz2nOpUPwtQya
	GCN6/szbbLvzexVDFY0YQT8T/DMwSeRxhKMWHdUZPY3CCh8rhzrcUZweGa9uAguuGFq9xhdI1ZZlU
	AkCTMGiqkps9tiKZRhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnkP-00DRtE-Qw; Wed, 23 Feb 2022 09:15:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnkK-00DRrF-Cv
 for linux-mediatek@lists.infradead.org; Wed, 23 Feb 2022 09:15:44 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DA3B33F1D9
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645607738;
 bh=6E8LpkVcd+7AGHgdYAkEZe+ycoMDPekcdYSjpmTWlKw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=F3Md2UK0jpLf/OAzfbgKmFCBwBeke1DULmZlJ+CpuvEBrveuQrKO0kOEqUVL0StUy
 lkUq7kXNy6I8pevlTsgN3BqPKhTgTT95dIvTRTKuyNqrE9w4pQQDJqy3cngBW6lMGW
 su7jAVHqovTNaTRMfxbz9R60w2v+DWUPXvEW6v6rcBys1/x4okiEKoT7OerWFfFpOw
 r5/1kj4kelVPuYOTK00H8+1KzucfdrgLftkrJ/uVNdYE28AyCmBFn4U4yzZc9lIyjx
 qadjT4uBgOAsoXRjJD0HaYVqlw3wAd+nqAiPIw7m3da5qKl1YPdVk7v/7JRLfNPXpj
 HAM4mz1qVEHeA==
Received: by mail-ej1-f70.google.com with SMTP id
 k16-20020a17090632d000b006ae1cdb0f07so6830261ejk.16
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 01:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6E8LpkVcd+7AGHgdYAkEZe+ycoMDPekcdYSjpmTWlKw=;
 b=Jwy5Nhh71i/1KmRIEXKOvay6Q+d9NlURrdPBLUg0ckrndcQ9gQDbrkV08xnjUzdzrS
 zXMFxj9D3GWQddjfIhRk5qIGO+MwPdNGxvcVBasVpccZ18XQGIHfkf+99CjXCDC4Cdrg
 8CJFIYL7vdkkfif0xHLwSU5QIg7PfB4MDdr7nkHvMROvHatPXbqDvfsLZYiCxcFUiaNc
 X9qgN1oxIQKEU3Eqo0G8rG/gmvwERz2hSVZ+Osehvk4oQYsKDqRxFTwHKMQwsfKyTAAz
 eXnILzXBPXdeojh4scZpkUq3nkK5JpGqzQZFElwAqzQIJjdwOhVaGtGSePSUxdl09RbA
 wnJw==
X-Gm-Message-State: AOAM533Nm/iRekPB1MIVHChKHW2RPGI3fxISXlXsW15OWfU4OkygsdgL
 TH2kflx3AlXMdaZH3mwvQI6VSy3hM9mHLcjNZ2knm191qJHIUfC1+ZNWttwICelL5tzE8OW3z3X
 Tl5W4JeyFfCHYmt0goe5VcH8aPhkyKOjXlVQmy6i0Tzx6kqEDCw==
X-Received: by 2002:a17:906:a2d7:b0:6d3:45dd:bdf0 with SMTP id
 by23-20020a170906a2d700b006d345ddbdf0mr4297325ejb.104.1645607738099; 
 Wed, 23 Feb 2022 01:15:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+9RnhMOLjSidBg/q3fUtt63PE3LgnR/AR0rH4GmRR5w77qD1Ua2aWMA7kqobhEoIkxmVgRg==
X-Received: by 2002:a17:906:a2d7:b0:6d3:45dd:bdf0 with SMTP id
 by23-20020a170906a2d700b006d345ddbdf0mr4297297ejb.104.1645607737804; 
 Wed, 23 Feb 2022 01:15:37 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id el5sm10993751edb.71.2022.02.23.01.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:15:37 -0800 (PST)
Message-ID: <455a8a87-63e7-7864-f765-142be18d1fa8@canonical.com>
Date: Wed, 23 Feb 2022 10:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Yaniv Gardi <ygardi@codeaurora.org>,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
 <YhUodbzxx4wbr+gy@ripper>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhUodbzxx4wbr+gy@ripper>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_011540_681614_6BE5E49A 
X-CRM114-Status: GOOD (  23.26  )
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

On 22/02/2022 19:16, Bjorn Andersson wrote:
> On Tue 22 Feb 06:58 PST 2022, Krzysztof Kozlowski wrote:
> 
>> The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
>> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
>>
> 
> Patch looks good in itself, but why don't we use opp-table to describe
> the performance states?
> 
> In particular looking at the two columns of frequencies for various
> Qualcomm boards they require different performance-states.
> 
> A concrete example is sm8350.dtsi, which specifies 75MHz and 300MHz as
> the first frequency pair. The lower level requires the VDD_CX power rail
> to be at least &rpmhpd_opp_low_svs, the higher frequency has a
> required-opps of &rpmhpd_opp_nom.
> 
> 
> As this isn't possible to express in the current binding we've just been
> forced to always run at a higher voltage level and kept this in the todo
> list.
> 
> But rather than migrating freq-table-hz to freq-table and then having to
> introduce an opp table to express the power constraints, could we
> perhaps skip the intermediate step?
> 
> Or would you have any other suggestion about how we can represent the
> required-opps level together with the freq-table (if that's what we want
> to stick with).

Usage of OPP tables is interesting solution. It would solve your problem
of power rail levels. This would need several opp-tables - one for each
clock, which is not a big problem.

The problem is that I do not have any UFS hardware (none of my Samsung
Exynos boards have UFS... I don't have even arm64 Exynos chips :( ), so
implementing it theoretically will be painful.
OTOH, I believe that having a working dtschema is very useful. Having
dtschema without errors/warnings is even worth some churn/intermediary work.

The intermediary work is also not that big. Once proper OPP is
implemented, we will have "just" two deprecated properties in the bindings.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
