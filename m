Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1A1ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGgxv53dHIjXJ3+5OtXDvsxDbiwWOA/yeZMOpVwR9sE=; b=rHawy/0NdcfIE/KDoLWcY1THSY
	XplD7ixERhP8hDPR6QLE2VaQjF0TuTJetuwhax6OX7ceYXoc4VjxcC3Q/4Lvxge1GM3+0VlPEm83p
	RotJdAO62P2rlthBoF5zgMNPwQBbZRYnZeuDOg9lucoBq/Pk0nigvlvbEYTr1gj3FMo+4SvE5LQkZ
	KXgGLv+IFp6vGaK4/sHe7mSHx5qNbmOztzRq74hwgtHaDEd6fVOlQfn3rWUJTV8X9aR0Vgv8t1ocJ
	3Z7a7BHMVihDPMSTIyCwCFEi6uqksFNBs8iiUVPyok44C4J3I0QXqn5cda1jgsFeeQs0yUG92uFFc
	Qltv4WLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaC14-009wnV-3e; Mon, 19 Sep 2022 08:20:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaC0z-009wfe-OF
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 08:20:31 +0000
Received: by mail-lf1-x131.google.com with SMTP id s6so34481486lfo.7
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SGgxv53dHIjXJ3+5OtXDvsxDbiwWOA/yeZMOpVwR9sE=;
        b=jqS5qrHT/lRc6Hd8Kbl/qm5idbOkccwmou4G3VZ3mR4iMvxTumgDH8KiaZsKZJlE88
         q51YgHccPdTyAs/+I/bA9U5CVUtRRohAdW/yXUyhAM9z4iwUWqtT7JYJTMzOLLdNokti
         KasoRZzYn00duGVXg+mjiMrf4GbL44XCpolWNVRtKzcSmgGt9P4XOnkWwcsRIXxATC9/
         PU53AZt1Nx4wTaXiVsWA1PGqGPcstEQQIKmgC3Ew1I/Q/3XVuZN+QNt1Wi56auoWpRkb
         S/5Ddn5C1q/1zp8r4mEgZaAmNUtt2co86VF+mk1aayC9X5SUcyQaHU60Uqkjl4HYcITQ
         vbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SGgxv53dHIjXJ3+5OtXDvsxDbiwWOA/yeZMOpVwR9sE=;
        b=7AeBqr7gOV3Jsx5l0Xm778WkEy5LzX/2CBCl8bABnF/hibQ4CcuQ2D8nXQFqlfkthI
         Hf8ClI5+HkfhDK+Rbon/Ga7G6mauH22xvlk0sxAhXk4it75ljwgu5gnNInPHecrONNUG
         +nnV8d5mnmFrsBhuJ6DhXnvuv+gySgUTq14C3WlsVK0nSx5nlu4DMTqbh1LO2d6WQCJK
         AzmA0aexyxxwqqJ4hZ8il3QReVFriWo0QocbX2SpQfHrDbzKdU/0tr1BLycKeao4fi1R
         L1YRiEuvXzoJCf1qbR2KK8dXU/sFmHOunG5yF5EdF+WRMqtKcDyqA3V7cehbbSdq0Jnq
         Kalg==
X-Gm-Message-State: ACrzQf1fewZO+XMhZAnMrwOTEeDnvefNO5OUy0g4+zN9oW6wUlywG6k0
	uUTL3gCTCOy0kT89ZiHntwHLQA==
X-Google-Smtp-Source: AMsMyM6bRBZ8G+CT95Fr4CW65i9CBuQ4s3d0bl7vfeGsSGeNKYX/SQ6P9xpSr5c0nP9T6YIDzbL4bg==
X-Received: by 2002:a05:6512:c1:b0:497:a63d:563a with SMTP id c1-20020a05651200c100b00497a63d563amr5680113lfp.366.1663575625819;
        Mon, 19 Sep 2022 01:20:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t2-20020ac243a2000000b00497a8f04905sm5088615lfl.251.2022.09.19.01.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 01:20:25 -0700 (PDT)
Message-ID: <49d6adae-7c44-b349-419c-dcd099374354@linaro.org>
Date: Mon, 19 Sep 2022 10:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] net: dt-bindings: dwmac: add support for mt8188
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919080410.11270-3-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_012029_830159_981B2475 
X-CRM114-Status: GOOD (  14.41  )
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

On 19/09/2022 10:04, Jianguo Zhang wrote:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 61b2fb9e141b..b7d4f956f92e 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -20,6 +20,7 @@ select:
>          enum:
>            - mediatek,mt2712-gmac
>            - mediatek,mt8195-gmac
> +          - mediatek,mt8188-gmac

Won't be needed after comment below.

>    required:
>      - compatible
>  
> @@ -36,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8195-gmac
> +              - mediatek,mt8188-gmac

That's not what your driver change is saying. They are the same or
compatible according to your patch #1.


>            - const: snps,dwmac-5.10a

Best regards,
Krzysztof

