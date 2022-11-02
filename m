Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A82C43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBUgvD/rqAGK+YRqMBW4phcXREVNhOcGxJwJ+qjyr1o=; b=PS+gwvYS+YrmC68RwrRH0aTR13
	xOsW39oLe5g0SYVqQqxF+/P8ESrk1Zpem6Yba7smLece+8Hc/Z4VejUCGaqStb3CmFc3G2gO3XwBp
	X6Yu9YxhVRSeuaxgK2ny+BWsRrcpeIMCzkj2tz1ChSqqXykp0OzbIx4j05bGZQaSwWDXddixwLsVu
	4P+frFbnrJ2f1A0bwoeL6m7laJtYYJR5WwEK9qTPb1I30nspwrWfT/Xap3GdTdi+YlhGMjl3dCR1h
	k+7+BZGTWA3s0/CtIv6EowZhLcwhaGwiIpCYGvRI/HumUDPp8i+CfwIhbVYoExkz3Yu8jE02VbGYB
	GXaXXMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFg9-00BlRd-0a; Wed, 02 Nov 2022 15:29:21 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFfw-00BlMT-Aq
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 15:29:10 +0000
Received: by mail-qv1-xf33.google.com with SMTP id j6so12651561qvn.12
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBUgvD/rqAGK+YRqMBW4phcXREVNhOcGxJwJ+qjyr1o=;
        b=yMiW5wZeRixIDVPx2S6wWqAENq9ui2w590VhU8Q82s5HlMw1OC/McuiTNplTDQerBZ
         nWSDgFKXMGPpg/Vyq4IBU/0iKFeXgMMLykjcp6vdiVFOquqA+fJcbfn5AAWesnG81kKZ
         bO4cPVShoBQEBgH7trb7ygaWpmPMvNlcboYQLzGgzr+RGX9EfdIcTGVgEhUMKKlkvykQ
         oMm4/hr4MrHbfs30mAY1ic8eqwEteKa1JdCpkRwFKznpPqC9QeXpNdUagSFIfHF/zkUq
         DHAeEFI/j6pC7+zh8+Hf8HQHTErRoyTZTDt4ak5Z19NIRN3DRpCM9gzD8sZV+JsvI3WT
         +j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBUgvD/rqAGK+YRqMBW4phcXREVNhOcGxJwJ+qjyr1o=;
        b=pBJZYld0lQrED9jWoOjD8fxNe2fyjOuGXeG4CzZXOP8VgXKuQJ+sKIdQpR5r43tA/l
         ffufmzOpIhzmmmKkKBeIaT7tDQncVQSqBRRP+6/qfkvR51O8WYYjI8DOmuKDVTxTmLLF
         nsU35idrzepvpTygift+OCA7sEX35l+Tis91k3NLTCBTMH+zWNXnQGzKO55aQwqkY9Ah
         sZslgn7xY6EonsyhIpFiWZLIWC2o5xpUg1c9fjCRNPnXduuiTVxCNdSdsXsleJ3eC0MQ
         pxNrzogrH7ZcYXU0tMEFcxrXz1uT1wCR4fSyzw17Nd6iu4KbqszPFQXCilgruIRKNxh1
         Ee2g==
X-Gm-Message-State: ACrzQf10LSP5ClS2WsP2Zf68rIeMIdqSLhkXawRAWFc9o158najR/cTz
	DXH7zU2oWvbhhSDXV10HH1nkvQ==
X-Google-Smtp-Source: AMsMyM4utp2+ndIufDJeNK+726MD7dtGV59X/4aZ5wQsoENyuaC3TKzF03FZtl52mGndJQCeR3Y4dw==
X-Received: by 2002:ad4:5e8b:0:b0:4b9:98bf:92cc with SMTP id jl11-20020ad45e8b000000b004b998bf92ccmr21728371qvb.128.1667402946667;
        Wed, 02 Nov 2022 08:29:06 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id bm8-20020a05620a198800b006ed138e89f2sm8677531qkb.123.2022.11.02.08.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 08:29:06 -0700 (PDT)
Message-ID: <3e374a0e-ab17-432a-67c5-bf8f459193fd@linaro.org>
Date: Wed, 2 Nov 2022 11:29:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] dt-bindings: mailbox: mediatek,gce-mailbox: add
 mt8188 compatible name
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221029105017.20734-1-Elvis.Wang@mediatek.com>
 <20221029105017.20734-3-Elvis.Wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221029105017.20734-3-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_082908_405114_6FC760A4 
X-CRM114-Status: GOOD (  10.53  )
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

On 29/10/2022 06:50, Elvis.Wang wrote:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> Add mt8188 compatible name.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Looks ok, but you need to resend making it a proper patchset. Without
fake tags.

Best regards,
Krzysztof


