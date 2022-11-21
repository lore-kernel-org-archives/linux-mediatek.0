Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DC5C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vffrhK9Te14ot6nrYXwRIs5s8kqJmNUxCSUFhBsYZp0=; b=GjHl212zd2MbeyT/klIEY3NEFU
	LYGUqGhmsGTEm2kDZjIF3tDGNJWj97qEHZLRaWep7gBYnlh62s9ZGGEbOPyAAT1xFSy8GxYPJYFjn
	wS/WfcW0FEV68A9KuHiSlU7wiidddP4KA4M39941/3GdJcsPmnEm/pDpdW24m0SCoHgr44BE07FHM
	WXGIBynRjTwJqdjqA9MAOVV4mFfZqPImUoAx6g9yHWZvKLr/M7iqyV9BVwliVAEcGJBYI9Xtz7VEa
	TAeALpZxcdzlY8uxPAfnsfhzAYHnxNR64dJ6YgRULF+XXQF6Jnd1aSvHLnUjRmPrz4TAdnFq/0wZc
	Fi3Lhfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox61b-00Da84-1T; Mon, 21 Nov 2022 12:35:47 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox61I-00DZok-Py
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 12:35:30 +0000
Received: by mail-lf1-x129.google.com with SMTP id b3so18635789lfv.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 04:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vffrhK9Te14ot6nrYXwRIs5s8kqJmNUxCSUFhBsYZp0=;
        b=IdjFTWo+w7W5Kqok9Bj6Sg9Mynfi5Qr/hfkjR0FhAtf1kq+nVcXgiGMQE1bAxE/xuY
         9+s6dWhb8EOV9i0+3j0XYvPIOpRymM1ulkucc1SiruWu71tGr+XHhh0d0EE/J1aNMLkF
         CVOuAU/h6vyI3M0iSXxfqtlnAKUTgwD7xL3Ms017hU1PkrpMNH/mRo/YceeeFdSfEPh/
         jRa04svBQA1FEnXywXPtF5Nt5AZU2MKBoHiWCik2zWGHM0zkecOhni7MfvBlTCl/8Hav
         ccrguLTqYxxmyJJ7+BjdkyqRlr2GwOmPhIPG7yV2WSpH/siApqF1+7xELNwc5IhKoLWz
         4C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vffrhK9Te14ot6nrYXwRIs5s8kqJmNUxCSUFhBsYZp0=;
        b=XlbFFDBr58fnu2x6JOz6pS028IACWI9utbFuF39yTrz6vW7gUmr9U/oWCO6NWfILfh
         1plw4slbAYDjJqBWLNSBjveTvhSNYwraD3O0DgXvG6xiJ1bPVuT1k7AmNW6o6tIssDZQ
         v2elrB2wpTSxlVUxUJNsTRGnno7gMDEQz6Ah4cRc48kQgURYXhNJuxkZKOSoq2lQNZCL
         5Y3ACIdfud6fXINT7ndOcUcl/oZ6wgKh8XW4Vi6cf1xE7/iB2XQVm6ibBCPJn40rIKIe
         Xo41hzYbXfZWIlP/6TKkY22TPo86VWe9xv+488EZxfipwYrzugLTYBmqSXqNFzJx5epK
         Fuhg==
X-Gm-Message-State: ANoB5plnagmEAZVIJ5czJ40Oo4COTh4RMFPno2vwn7I6Gkl7IbCdTriX
	6PPVUcdre5IQywUryDhbHd3Fvw==
X-Google-Smtp-Source: AA0mqf4gmSRKmaoGoiytSGboomRjNdwUktarWK9tIMFu4H+Qm4luOiIDR+475AFqNgf6pDTMP86Nrw==
X-Received: by 2002:a19:7708:0:b0:4a2:6b44:d742 with SMTP id s8-20020a197708000000b004a26b44d742mr6536562lfc.191.1669034124151;
        Mon, 21 Nov 2022 04:35:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h14-20020a19ca4e000000b0048b0696d0b1sm2009320lfj.90.2022.11.21.04.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:35:23 -0800 (PST)
Message-ID: <b07930c1-6ce8-3fa2-aa54-134aad673ebf@linaro.org>
Date: Mon, 21 Nov 2022 13:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] pinctrl: mediatek: common: Remove check for
 pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043528_870247_C8DE955B 
X-CRM114-Status: UNSURE (   8.06  )
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

On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
> Remove the check for the unnecessary pins-are-numbered Devicetree property.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 ------
>  1 file changed, 6 deletions(-)
> 

FWIW:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


