Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDAEC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpwShvISTcTE3K551Ap7usqhXOxNcMryVkJfhLZoUUQ=; b=HF194ypfV56haF5HWeMUzbCiQ4
	v/vKKYflrImTDhKivTPoGRCVkssXnfoEj5YMhd1NVhtB6upN8wWxvmJHazvRGS9H4ntsEO+0FLdat
	OpUr7u12WQ+0FakmuMYDcugSOd7jqZwBvR5P7F/ZUVDejUgsG3wm7WY/9S46VexnCZzoSw/r2jrsq
	3atNx5us8tsk7EX0oQ69DQSKKsifva5sc+0y3upxisQDD6C/P552idDBb7FxWdC18ce20oy31eMGL
	PuuZqar+mbiJfbnB1YWiMEv8+t6oDs6ke9gka9cZQu56+9qehvtksu5+ZshB29RIvIUyUsRdt2jJ5
	mrgmdb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEsa-008ivI-2m;
	Fri, 14 Apr 2023 08:34:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEsX-008itD-37
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:33:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5055141a8fdso1657302a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461236; x=1684053236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpwShvISTcTE3K551Ap7usqhXOxNcMryVkJfhLZoUUQ=;
        b=gsiPpWBp2wpRZMjngR/LlRcMXgtQhIJMpe1zxLflCmmCEgZt1OKJwCaaOuy1DRfeG4
         8Btrq6P7SzcRIEwS+LzlJZ7Xy8WKZllnDewpxsObInwk1yG9iMGXgLwLfVQrVvsmQ3l8
         GRnVASeSZv/aJAIJZcH2Tq5EIEKvmGeMwVpgmsKj2nG6SkyJk6BLzVeqL1fq/ClPJpAL
         D2HXXK5q+Sm/lZ+t6o/2LhFPgSoeb9zXxR7qfaDZKOqyccvzAfDms7EFm1rUOy0oT0pa
         S8ZqPM1ighYnFYjjvIwJuXJL4VsoiUOYj9wFcvl7d5v+aT2h15sOyAHO8r3o7TYGV/L8
         GreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461236; x=1684053236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpwShvISTcTE3K551Ap7usqhXOxNcMryVkJfhLZoUUQ=;
        b=Q9Z+0xYCTlM3nfc1MxFcvIRdwO0WdpLUvEMRzz+o6CVNPotC45sqJfnZEYZ2i1QSAl
         lPNGuBpVboBsRwZu105OXT4eEhrW1UTzYjdpto3L0rvZZBc2z862oV0OFaEg2bdxwstK
         FwImTQX74XM4D2yTG7HdQU35h/lPH65wbaDuVMOHeFewZnXaFxAMfTSJaxRODRyH0gnX
         HTdnBBk8Sv4ijQI8cOp0U7hIxywCNsjGaAdy1kg6MgbNZIO+tRoFStczcTS7YafC6/Dl
         oDvTRL/jQgkNOw9VT9gcOybxtScuIf+UgH+0oEVZmV6tVnLf3GJFsHlJOuDUBhdzfkep
         HnqQ==
X-Gm-Message-State: AAQBX9eyMZLDnO9NNS79W8xQY3s/mux9XPuiythlxmnuJK/ApKgjUVs6
	p4GF7DCGoXwgeXGdS2Vmc9B0/A==
X-Google-Smtp-Source: AKy350ak3cqtwXDorNJtScCLcUQuNv92fnfl8eFxO84dV/0O6W4+Gjg7xHm2TDj2lqckrpNVg9kccw==
X-Received: by 2002:aa7:c7d4:0:b0:506:8470:c323 with SMTP id o20-20020aa7c7d4000000b005068470c323mr823188eds.24.1681461236235;
        Fri, 14 Apr 2023 01:33:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906208f00b0094a511b9e6csm2117677ejq.139.2023.04.14.01.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:33:55 -0700 (PDT)
Message-ID: <b573ddb8-3909-998d-f051-6a3c4af1c629@linaro.org>
Date: Fri, 14 Apr 2023 10:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 11/27] dt-bindings: display: mediatek: merge: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_013358_000245_9B407F7F 
X-CRM114-Status: UNSURE (   6.49  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's MERGE block: this
> is the same as MT8173.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


