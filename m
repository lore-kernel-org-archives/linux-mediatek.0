Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA219C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMzKXjGsVMugCAytOxa8extRrpSkEtM+HWq+Z7rl8oI=; b=ZYrcymQL9mlfTI9hg7YJAd1y+u
	hUktWnGGqZHMHMdzzvQ7/os5faaaAVW9cyKeLZe8GuxWGmx3GCfuMzGYt7hVAn3Nk3VJjlKUWWu3U
	7Hu8CHWlnR6quctBzyLP2FaYzZKrpRodoE2iFVm24JBnlL/BoJhpZIXrivuefw8UEWvrqb4XqSIHL
	8Gcae5DNk9Mykd631ldbNJelwEZu2UzXP+y0+FuPwAV+17V0MuKGOyzwLv628So0k06zYyABXzF2+
	E8NV5Bq+pXXRUcPgbNl7aPGe5TzzJmiiJDjpcPQmXgLUXUCVPy/4pMd5YbboIj6F3Dza+D7sCVoQJ
	4Ne7uoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousZe-009a3i-GW; Tue, 15 Nov 2022 09:49:46 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousSQ-009VgZ-1r
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:42:20 +0000
Received: by mail-lj1-x22e.google.com with SMTP id x21so16762521ljg.10
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMzKXjGsVMugCAytOxa8extRrpSkEtM+HWq+Z7rl8oI=;
        b=v1k/Tib4SpE9+bH8z1OIQgCuvoTL/7XEAPTxAepEpzFyJIWwCbMtulyGu2NI3ngMW7
         r8bQxXW30XsDuxK9Zr5xqqSHyAFUQmLn26SngozDdBfBWVmNghj7lEf1XJCipGfNqLCb
         xwtst9LgS997HnGpNEwdvpHJb9d9bPpseRQEwB5LuEywjMQDbpRSxa0KDFh6Snsp/5/f
         ofhingFVVlUqzk9wkfVrDMYqakKyJ01NgDfiJ/sqXunc7Znya8RBuix1WH6fbu/EEoXG
         9s4cMXeXp0owyE1a9v/h7c8uNosMRtqmGPoB4ArgsmutJAVyFU9VKQus2fmkfAwdY/+5
         U3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMzKXjGsVMugCAytOxa8extRrpSkEtM+HWq+Z7rl8oI=;
        b=igGwMXLn83UGutZzz3HUgZd+bXFFfSnErcwBBudNYBv/IbmJqgnIEXUJvEbHBmTdhh
         i0FKOcVQMCaQWMcUmbn826RnXmHwlbpFQcTg1VC1b3wMwjPdGZTEe9PHvg6X9797fs/y
         RCA7+88IQOG/HUZyafEVMFFeP2BRSNnJ1ddVW08/kcaZtUynWl/j49cio7iduW+fK+GR
         r6NegkzLnnToJtRJwnBz4y1abtW1+x7s6ee0lxNmEEDlfjyLyx+RT7VPQr86Frz8sno+
         WgDqBoQBsPi2o5MGsOr9YGtqYeQtRUufCHgLNAVcEO5599OnAOEdtYKyNSpwrwpmXkwZ
         PkvA==
X-Gm-Message-State: ANoB5pmcwWnBWV6crDtuD2EhQFijq3qtJamIgSU40EqLCPYQlknh4W8t
	vhUfLCh4110GMnBgG6hfSTn87g==
X-Google-Smtp-Source: AA0mqf42bPJe4yOYo4MLR41ZxVfwGTa0roWNela7uuCIY8LNKB6Bovwl4shixK+gcLYgDzk/m43Fdw==
X-Received: by 2002:a2e:9048:0:b0:278:a696:2781 with SMTP id n8-20020a2e9048000000b00278a6962781mr5291013ljg.401.1668505334238;
        Tue, 15 Nov 2022 01:42:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b004979e231fafsm2141669lfg.38.2022.11.15.01.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:42:13 -0800 (PST)
Message-ID: <37cd1ee9-7633-09c4-8229-4c8ba7b0d056@linaro.org>
Date: Tue, 15 Nov 2022 10:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/15] dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-3-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014218_128038_42907DB0 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

Drop second, redundant "bindings" from subject.

With that:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>



Best regards,
Krzysztof


