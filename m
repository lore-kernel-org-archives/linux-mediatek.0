Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF175C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeKbENUxmd2WUYZ+dYFPnXfL0in2+nAAuXdgeXP9GwU=; b=BoC13ErqiBltNy
	fnwNR/GmP4l+vCvPFGkfauR+bHZHCOLWGnNqlcStF9IE9tkRMwPWx91ts8q4Cuy+DDbgqHZJFKxQD
	3fABYdbfDR3tecEz8hr145pza3zeZY9ea4H6xmbuff6FNFB9KdnsH3uRgs9h66qgHu9FKyGXmq8E+
	9c55d6WFIRW0k3745P7NXRzADJv14LwWa0TOXDO83UncMEVqR1u+9PIjK/1mOlfM0V+9CpLZyEmM2
	ZXJp4EQkczcfC55lKqZU84pos237MmeAOz9B/KVXJqwqIKvBEjtyK2A7GT92ILyu4Sqj37poMyhE/
	QKOw9TJC0YhvnPgOq/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhx5h-001mEt-TJ; Fri, 22 Apr 2022 17:29:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhx3N-001lCI-Ur
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 17:26:48 +0000
Received: by mail-ed1-x52b.google.com with SMTP id d6so6146453ede.8
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 10:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HNZdGuTlB4ZyqdNx0zZ57VA5IMyL05uRbRN7pIK/unU=;
 b=Cpl1dt70H22hHb3a2k1F/gZybtWw8PyK4eyMjsQQl0/ADKOTqNg2NeU3zNTfbl72Mi
 RFz6P9DN+6K2ISa+Al6MARv2R6WgSTO+ScXPKeDRNEzeGHrSIVYBdykS//l8W8Jmld75
 xX20GzzptN1Wq7caPyUSIX2LosdIWn3JaaXt/SzsrV23qvimMx90F6gaQiY6wd6Y4789
 TFkVxrJEEublyn1TvmLSC/WmlH2eVPq9Ynp4dQ36X6QRA7AbFbh8GhiwkqrTCif1WXAO
 QFBkGmWaozknYFoz1garLCKHmerRkgk5+voQnFGvZlkziiZpjMhHZ04gYNP+JVt21KNT
 t7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HNZdGuTlB4ZyqdNx0zZ57VA5IMyL05uRbRN7pIK/unU=;
 b=qUbayQswe+5CrKzHRb2lZD2OugMKyWfLX2DXdDGyyGNpVwiVvo9FXTixfPTj1o25hz
 QtMe2b+GepwtfJOJZziOazpzseX81fqrC9xJqVEl3nUpFL6rdWMsuPz1XwpzP53zMbtC
 tMuqiPUiCtmJaddMV23bJKHOdX6BQ/PQoayae4sOLEQF2DQ7CLeBYiypB1GPOszg54oi
 Fm9DfBDY4fDbqXJl9PE2N4yFfPzZtg+TB98Hjky290jkAl60qXKDAkqYvzC5nWBPwJoe
 Oifk8rHlMmMYt+1gAAWl2Fia+w7EP+TYsEu36jrC4qhaGKz9S1s27831Ja7cKg9mAuDF
 clRQ==
X-Gm-Message-State: AOAM533qoBZyUYjMFg9OjeqzJzEuu6pkjV8XQrIpmN1kFbfKDwR3RH0c
 w6bA+OsaZTeBjg/KhlslsHg0DQ==
X-Google-Smtp-Source: ABdhPJwuFz3R4GDMR+B6w7XF06kzjDOus8Sj9fbqhs9sCpzbm0EvLdbLOHqYo8h0m41JFU4Qqn4CYg==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id
 g12-20020a056402090c00b00415d3404ae2mr6053079edz.331.1650648402270; 
 Fri, 22 Apr 2022 10:26:42 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 h7-20020a1709066d8700b006d4b4d137fbsm944012ejt.50.2022.04.22.10.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 10:26:41 -0700 (PDT)
Message-ID: <f2e5a34b-ed02-91a1-bc7b-fecaa95e227e@linaro.org>
Date: Fri, 22 Apr 2022 19:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 01/14] dt-bindings: cpufreq: mediatek: Add MediaTek CCI
 property
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, angelogioacchino.delregno@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422075239.16437-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_102646_146318_076DB758 
X-CRM114-Status: GOOD (  17.83  )
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

On 22/04/2022 09:52, Rex-BC Chen wrote:
> MediaTek Cache Coherent Interconnect (CCI) uses software devfreq module
> for scaling clock frequency and adjust voltage.
> The phandle could be linked between CPU and MediaTek CCI for some
> MediaTek SoCs, like MT8183 and MT8186.
> Therefore, we add this property in cpufreq-mediatek.txt.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/cpufreq/cpufreq-mediatek.txt         | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> index b8233ec91d3d..3387e1e2a2df 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> @@ -20,6 +20,11 @@ Optional properties:
>  	       Vsram to fit SoC specific needs. When absent, the voltage scaling
>  	       flow is handled by hardware, hence no software "voltage tracking" is
>  	       needed.
> +- mediatek,cci:
> +	MediaTek Cache Coherent Interconnect (CCI) uses the software devfreq module to
> +	scale the clock frequency and adjust the voltage.

Devfreq is a SW mechanism, it should not be part of bindings description.

> +	For details, please refer to
> +	Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml

Since the file does not exist, I have troubles reviewing it. First of
all, you already have "mediatek,cci-control" property in DT, so why
using different name?

Second, it looks like you want to put devfreq into bindings instead of
using proper interconnect bindings.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
