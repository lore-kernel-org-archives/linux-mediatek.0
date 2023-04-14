Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1425BC77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrBCPg/7kEQmQ/S2HJSPkvrLLN8UQjkoca9tiMHDaUE=; b=Hl/RTajpZgHELc1qWADCzwhEEA
	6rie7lasnIKDLLMbWhyKPqZzgFBH+UrohW7914DvxbsZn6cgiQEM02c0y44TzfWHTFIBcnitq0mY+
	VH7XR6aVmLwx7HT8GrEf4+TQA+6ZjG+LtJku5XEizmp4XZv3Bk9jQciio7LL2oSwRjBQRVl0cUeGz
	oJMROrlsnhVcNj2AMhLiWHur1pNDmXM+7wcMquRPUyD0tirRyNS8b76PyChbdyw/it/H9ICmjOFti
	WMpdY8Y+umY1BU3nRc5UapqQtXYFmbYnzUtfFm1AKyTzLw5z+jAuxLf2U+Za/YNU6Vf7u6QiCGCmg
	LgUzAk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEjr-008gLR-3C;
	Fri, 14 Apr 2023 08:25:00 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEjo-008gIR-2c
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:24:58 +0000
Received: by mail-ej1-x62f.google.com with SMTP id xd13so9798613ejb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460695; x=1684052695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrBCPg/7kEQmQ/S2HJSPkvrLLN8UQjkoca9tiMHDaUE=;
        b=iXaoED0tEhQSyqai1EUHpNUUpddB1+3po1KoelJvQpfZqBH4H6WVcBblHREMFFlW5Q
         8Kq1hy2OAtnQfaxolldPzxw6ICb6zFRRhzaPml3lz8Hy+oeQfebpYJH6tAG9Wy344SR/
         u5rm6jiEjAmPA/VfiSMyvGOJJqd02KePv4/h2VpXjdmytS96sbfQirFHcQ88xrLG3JhM
         Ke3b5bnSHYuSx66e2NJRZXo/ltKWw3tpZ27pfDoQ6rrnygFeVi1+5BvD0QTpPzZsCedU
         6rHEsdlUWSHeJWKESndXy+cnXro09stKuckPHDpDO//EeGxxya1i37IAVarJ9zDmIBEw
         xAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460695; x=1684052695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrBCPg/7kEQmQ/S2HJSPkvrLLN8UQjkoca9tiMHDaUE=;
        b=S01nX6DbdM8D55K4Pl7CuYbD3oxNQrBMgFd9fr06oOS1cQasd1Bc6dalGWZOsKDAUT
         oCkPCPF22FVxpYzZshJCVDtOuLfeD8jYHZfPRokMjNqeI6J6SVO8EzfmrsrDqQpStI4s
         HzdZeYiAMEnrnjOTsmfvvToRDp/pFc9Ve9dh3yhsj6EOSzKU9098Wf5OGS4AN0Wntu6n
         2ptm2ZOzOBzM99hoN2yclvEbsjVQfTW7W0/9+KFv6KunnHJhuu9lD0xh1t5EafaqYABi
         osL8lgySWEmKD2yswhFGw9E0JtlFu1yqB5ymsG7Ppco/wEybLxbTMl50/9dX3mkofcbZ
         OsTw==
X-Gm-Message-State: AAQBX9fPbFx1f7QKSdGi7Cfn7LlCLWx2nCvxgCOGuN/6hVTQdvFZOijw
	UdCX+97xcxzAhPcy+JEExDAKxA==
X-Google-Smtp-Source: AKy350YXpqn0+HLdiWaIxk7myrpXbNP2xw+hirOiGiyN4wIw3OtEzEGmrJZjwJmO7o1h3UaPSKK/WQ==
X-Received: by 2002:a17:907:e8c:b0:948:a1ae:b2c4 with SMTP id ho12-20020a1709070e8c00b00948a1aeb2c4mr7740362ejc.6.1681460695443;
        Fri, 14 Apr 2023 01:24:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id x8-20020a170906440800b0094a8f61ef3fsm2119353ejo.173.2023.04.14.01.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:24:55 -0700 (PDT)
Message-ID: <8e629e18-547b-10a0-9be3-157f6ea139fb@linaro.org>
Date: Fri, 14 Apr 2023 10:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 06/27] dt-bindings: display: mediatek: ovl: Add compatible
 for MediaTek MT6795
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
 <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012456_846699_5BAC01BC 
X-CRM114-Status: UNSURE (   7.00  )
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
> Add a compatible string for MediaTek Helio X10 MT6795's OVL block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


