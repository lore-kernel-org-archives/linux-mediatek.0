Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01537C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qjlbl2WUiqxANT3dCdCfH0fzBveAVkguQhejoSB8QE=; b=NwZHJ6vGSNPB3Q
	lWv/4OccNt30rIy9tZZ0sdAq7421FIty31AwDJH52KF4mNk2qsBoZMnFu0QmACiEaLr5bc6qlFwGA
	V+qarZYJccqPMGOaOfKFzupsJcYTh2T1sLc3Tk/437vhRrcVLaLefG83C844TDRYBkhZra2ReMi3Z
	ISqPvxzxFmpPcTFJb/bCgY/bHbPbARjZ2dcFCtt7nA9L4XMGpN/HCuI025RkwKszY8oP8JeP8HUud
	xSkOMTbYhzPx1fc9G4GMtdm5wmMvkK53/qkJpZ0oEHGbELLJeD7KC/qNeFCxnaKs7joiQHwLFOb1S
	1Zm5g9+0eKHzA7fJ2sKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjjQ-00Flh1-94; Fri, 08 Apr 2022 08:12:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjh2-00Fkc9-Vh
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 08:10:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id n6so15655524ejc.13
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 01:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=16qq4T8W7Wb3W3I0GFoxZjqEJT94+MYc2RlGkdbX2ac=;
 b=DHUn3OoULpXK+mm9ySoqW5WNBlp+pqhHBqMvxhOBi/v95ukvoDz09bDR+K4ILGQPxW
 KZra/kNcINrwhQ2t+V3PgKTeZqSs5Z+BXx7BSUsqw/p5/p7AhIhRdWUDjLk44f5JRiy1
 roa+7FL5knMpJNMxTxNhVK3kovdvgEmQ115DQjQmmrKoARK3kWCTzUmEQ/2+NByzAtg5
 XD6m7Wgp99VyLQoorf8GoYIo6DNYMwdAZCJAGMcBGWeXpd9kiKLu2WPIt5yN85m+JlAf
 l/D0BXr604LNNDLQcUA4EcfuSImnq0/txS+smMOdRfajZN0K3EnUgVCQ9MJOgWAuZpAH
 ri6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=16qq4T8W7Wb3W3I0GFoxZjqEJT94+MYc2RlGkdbX2ac=;
 b=4sWUGs+dUMK7Bt1mz5laeCVCQ9rw1+G0r+wA6EnU+KrcmuPvZytkcUMrQ2b4ZGqki5
 3xVhJsaO4RUzA/gJCW8UuoE82aXWVya+6oWG5211QoxanCg+GDCLq83xFWW0gLeq1VtI
 XHjU5RTYvDavKARxlXUHhmfHosvDuuKghOBchMVIDSzMyhJJZemu7YCg/qUhvpDeWC+t
 9mohnEGFw6t3HJ2jUOZG4eR5yxJy9lTO3NCwRftcK+wfIHPOdHCjMvF8RU+EGz0YVSa4
 fH2tOVobXZR5EKqlQmvtrzm2E8rooE5CKBA5vqFT2Fnc+pSQ2edb/WFoAUX61LOxZBbL
 7thg==
X-Gm-Message-State: AOAM5307w7YkhGglf6QGtrSsn52y0hqDlMd/oaleXLOM8014o77/q5Ne
 x49QBSeWVobSkTnGjhip4AHDzw==
X-Google-Smtp-Source: ABdhPJyd+7LeacyRv4S4s8A5mEZaNzMiHeOn8GceZ6A7SUV88bQI8PoI45QiWp3fyzkIiAh8+Qduvg==
X-Received: by 2002:a17:906:acf:b0:6e7:681e:b4b6 with SMTP id
 z15-20020a1709060acf00b006e7681eb4b6mr17535515ejf.61.1649405403553; 
 Fri, 08 Apr 2022 01:10:03 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 u6-20020a17090626c600b006e74ef7f092sm6549148ejc.176.2022.04.08.01.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 01:10:03 -0700 (PDT)
Message-ID: <a171f33c-cda1-8602-ac67-93076b676578@linaro.org>
Date: Fri, 8 Apr 2022 10:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 01/15] dt-bindings: cpufreq: mediatek: Add MediaTek CCI
 property
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408045908.21671-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_011009_065265_F7548E44 
X-CRM114-Status: GOOD (  16.33  )
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

On 08/04/2022 06:58, Rex-BC Chen wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> MediaTek Cache Coherent Interconnect (CCI) uses software devfreq module
> for scaling clock frequency and adjust voltage.
> The phandle could be linked between CPU and MediaTek CCI for some
> MediaTek SoCs, like MT8183 and MT8186.
> Therefore, we add this property in cpufreq-mediatek.txt.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/cpufreq/cpufreq-mediatek.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> index b8233ec91d3d..d1b3d430c25c 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
> @@ -20,6 +20,10 @@ Optional properties:
>  	       Vsram to fit SoC specific needs. When absent, the voltage scaling
>  	       flow is handled by hardware, hence no software "voltage tracking" is
>  	       needed.
> +- cci: MediaTek Cache Coherent Interconnect uses software devfreq module for scaling
> +       clock frequency and adjust voltage.

You need to describe the type. I am a bit confused whether this is a cci
(so cci-control-port property?) or an interconnect (so interconnect
property)... It does not look like a generic property, so you need
vendor prefix.

> +       For details, please refer to
> +       Documentation/devicetree/bindings/devfreq/mtk-cci.yaml

Such file does not exist.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
