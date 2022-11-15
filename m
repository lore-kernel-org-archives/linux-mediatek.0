Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD33C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4Ips1YGy+CHLyynMFYhlMgSLuyCrOKw2tPYJgbqJY4=; b=tAfrxhaVE3PWMsCcLFi43W7p8+
	hY3jUZxJV6U/OJbe7+ihjbmWO/3YSQuIIeNH+piuQJC5GgCeb39B1rudGFir8ShOwgGNIfgb5WDGJ
	y9FieXgSBLqWeAgVclEvOzC3SwT/ecYWKz5mAOONe+mr/9Rg8SBkBslepRfGEmfElV+yROPkvkwHM
	eUAD1wV/00dICSg1s1G8YBSFuZF47ncf/N6oVvAUnv2z+Mgzq3Dx1uC0bY4wTJnkiqkg3rsD+iJES
	MZtdbUbDFh3woPuilOvzrdg54hFtF40WS31G7XqyR1QVo+lNi9XXwCPOR9JyBDKjcUpE5K/uihzKM
	0uLZTKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousfX-009d3D-HK; Tue, 15 Nov 2022 09:55:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousUP-009Wsb-Br
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:44:22 +0000
Received: by mail-lj1-x232.google.com with SMTP id d20so16745795ljc.12
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4Ips1YGy+CHLyynMFYhlMgSLuyCrOKw2tPYJgbqJY4=;
        b=NYq7B521o3+lx3bjT+9ZWWyhf+ndDyFYtrcc08K9F1XcPZFOubB/b10S7HPmEJFK87
         NvReoIrl0pXUnqZ/NCz57RKnrfBThapX6rPe6YGRq42lcG6UgOrSDJEV+0CRfE4AbZG3
         iTjM+An+M3MSaE0NHZQiqyyeyvCfklX7WvY7eN5ADaUn11fjYAdXAXmTBSGSvPNUbUp4
         ZjhzQdXVvw0WIV7t+F291nrJeGpKyyCJCMQSCqXjEsjEsiH58DPH00mLs3Sw1fA4HBlF
         r0ZGvrK/hhvLa+jx8l6VAQ9ieNYNMbyJHypbEpMLYqEeFuD2G0RnB/ekBskLjYMxs/kI
         B0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4Ips1YGy+CHLyynMFYhlMgSLuyCrOKw2tPYJgbqJY4=;
        b=ygGlCjX69Q8PXekF8uYx0lGgJC7l55qmbiR8Tx90GRnyWynCMnLbtQK+B7CTu3s/Ov
         36fMtq3Bm0vdXtSfyd9WUSnl2z9PqchUcEh6fsBfaeVJdRObAlrSxAi8iSg9W8tu1T3Q
         qqBOTGg5Z4i45VQ5Cb7FiIKBQ+2lKW/AX6smpk1WRf9kI+I8uzEkb3MNJs5Uk2/d2Wnj
         qAU1lxqG4HXSrwWqGcMz4ieX78ubbMXDduJR69hqfumTzIUNjgwLq46cXuEf5I8c5aoY
         ZoEP2jhfUDGio3Veie9CBiHiEjdmko7R8EtDG1O2E07IW/MWByt0oxv0HzsKGc4DB8Yl
         Tt2Q==
X-Gm-Message-State: ANoB5pl/T0tX7NIV63G0gcMQa2JekdazboiWIj9CF+pWW8BjPJfRRLNM
	MclV1qjHqg0ZwKAEZpiQe6pc/A==
X-Google-Smtp-Source: AA0mqf6u4AeCi7RO3VOcejjZExMxdA7pzHStUekHmSISGlloupdeeNGR4Qq/SbkkH5VWHZ5DE0PGyw==
X-Received: by 2002:a2e:9316:0:b0:277:831:3970 with SMTP id e22-20020a2e9316000000b0027708313970mr5188812ljh.331.1668505456145;
        Tue, 15 Nov 2022 01:44:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m20-20020a056512359400b00498fc3d4cfdsm2155447lfr.189.2022.11.15.01.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:44:15 -0800 (PST)
Message-ID: <b32baf1c-e00b-ca1d-2294-bde11c61e5cd@linaro.org>
Date: Tue, 15 Nov 2022 10:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/15] dt-bindings: usb: mediatek,mtk-xhci: add MT8365
 SoC bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-7-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-7-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014421_427965_E9D5F641 
X-CRM114-Status: GOOD (  11.39  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 SoC.
> 

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Also:
Drop second, redundant "bindings" from subject.

Best regards,
Krzysztof


