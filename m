Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D43C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/WneAIH4doGZWwalQYiIRIPWbn6dY3tzQchBDy6uq8=; b=caF/Mnh57OcdL6NkSw3XOV0avg
	tIHDNIckErEZndoeYdmY2vpZtMeVwcmSetr6d02+iuJziqQgb1eZqOqvMPpBXFv4L8iHE6u1t3WJv
	UHk3w6cY7vlt5uOwz3L7VxPQuMYFrp3G+U9SL8fYlw9TcVO03xMkgETzurBOA7ByK5koUnWAy01B/
	PW8M9n900+H06LqnhcjD+EknCK7xhRmYeM5mNEEyDulK4ofIaoLCzqnX21F5JWL0ElUtrIEubVOof
	QvAvf+YZETjBRB2LwyaXc5Ed8MEcJ5fJICVeuIQ5hAC5mxXCWCVZiJL5M/c5BRFXHX7gs64iHWNyn
	Esb3aytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWILv-004XUw-6K; Thu, 08 Sep 2022 14:17:59 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWILs-004XRZ-0Q
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 14:17:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id z25so28005869lfr.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Sep 2022 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8/WneAIH4doGZWwalQYiIRIPWbn6dY3tzQchBDy6uq8=;
        b=FW3NoVsk/D0Nf3JbkkTKy/wW5LGJUF6TucHDO5cDKLvBTnSC1Yi10PBSCfzXp5kIvj
         VF/j/gCFY5s6lhqw4xknnQn92Z74hzDmuxlxblmy8IQyrUbpvjuM/VCZsHFnEogQWFPQ
         h5yRCq3kYolxf8LMP759YSutYbxuix/6DjulZfkDB93YBSMqI3vg3S1QlTJtBEDW5Yh8
         Xcb+KZRu70DtccNSnYn57w5eCiCEXMsgze0Nc7XcF6e/8W2d9Z0FiSKY6vhE6XUqTits
         d1jQVqWO5WIwxAecj9clvgBRR6YS8BsnmRFEmFrfs1ALQC9Wdi/fs8MSC0eC9NE0tPvA
         D7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8/WneAIH4doGZWwalQYiIRIPWbn6dY3tzQchBDy6uq8=;
        b=qp8SfG0rCz9YCvbww2eQzSyME90D3FZPikKJLuMOsR32yv9BWfUvyfC0h7TPHRHo0d
         uGEbE9NScj5VpY8Dfir9Hwtn3tf1+cvFO4W9sJLvqQysjjAXVhFHkDLepc+PPq2baQaU
         uYabKJ6Dx8xnnpTYCGdjdqFHcYkSx/uPWVn3S6Uv2Bf9lsiJv0ZtdZXrNaynQOZkree1
         oscJhqgl+dwL/ZzJZv9lwsJ6sfo8KOWRzzGbvw8a4Q2/jnwCp2oYsaHMT4gQvy/tawSq
         N3Au7MWWnmoRXGsb6kp2VfUHY7aswwpUuZ3eWCPN3zjf2CkoD7WBJFES7fzHtk/v4xr9
         VsoA==
X-Gm-Message-State: ACgBeo2a3waL95pkOePixDSEq13yOxJWCtoY9wuNyn7wo6kyiZJ8dTm/
	e/138SHe7LlrVl3NgO8yUlIJsQ==
X-Google-Smtp-Source: AA6agR4mHUGqtjIx4fWu+AWyjmDlfv8bavpAUqYbTfxi3wJ8vaWjQj312qDOFEZGYwmEJx35Mt6jZQ==
X-Received: by 2002:a05:6512:2201:b0:492:f874:39fa with SMTP id h1-20020a056512220100b00492f87439famr2713913lfu.365.1662646670821;
        Thu, 08 Sep 2022 07:17:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k5-20020ac257c5000000b00492e98c27ebsm3049186lfo.91.2022.09.08.07.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:17:50 -0700 (PDT)
Message-ID: <83818ffc-bc38-0d3a-b225-d6671c6a1f3c@linaro.org>
Date: Thu, 8 Sep 2022 16:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] dt-bindings: iommu: mediatek: mt8195: Fix max
 interrupts
Content-Language: en-US
To: matthias.bgg@kernel.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
References: <20220908141529.1478-1-matthias.bgg@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908141529.1478-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_071756_113069_6B5012C1 
X-CRM114-Status: UNSURE (   8.19  )
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

On 08/09/2022 16:15, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The mt8195-iommu-infra has five banks and one interrupt for each.
> Reflect that in the binding.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

