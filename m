Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE942C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 19:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Is585OfxMU8hCEsN80JrZl4sFH9ONOqGs8f0Npf98F4=; b=KRs6XVuIVBAaCz
	iGYwxOOGKtuQjKVSkVmv3BU6R95EzAK8YGrwOMlN2SiJe5wA3Yxwjgpb0m5iPU4roqOAYlT4wf2Bx
	hgeGaKIiZVtDFPbH+2E4Hul9JUqqvI4m1nwuJMDS6NPjzOmyz29X6/aTBcNlUxPK0cyS0TnqSntj3
	EFKVP0BASNfR+siHXBi8iMHu1WBKd3YjWMGBsWu1jgF3DXvdU8qu8V2xa/W8pXrKUUabwgOtxE3QJ
	+ke+rzAjezqxeTg6RRRgsfDzt/T/7HISEcl7G7Fz8vf3KplXfjL9DtZO2OcW1TgdDNK0riM4JICYG
	TmMzPCOP4PXy3Wzs0TBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRIaU-001HNe-Mc; Mon, 07 Mar 2022 19:00:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRIZz-001HA0-I7
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 18:59:37 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 78EA33F7E1
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646679573;
 bh=sFr5I+WRledcILsCjq370DCSnN0kDkpnKS2SgkWGsqU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=vhWjr9pNsg/w2Wq5aMYuOsaes9kiXvFOhvNJX9dpYIoaqZuwy3jmG0J4EDOsVwtOm
 sEPxj5v7YUzvlwuKIDS5/LapDBiAQ4UdXtBtSo2Y3z2orUqELwmjMoj1YpU288W0bk
 9Pr7D/YBRCDx520W1aiY+iWi2kswzeKYGVlA00Zw86wWo8ZDJlmVLXwt75EnS2yg1Q
 L/PbQOE+920THxDhOifFJcH4hZqfqTTameNll6lRha2R/BrzIaNvabOaA3R6I6dUkC
 rkM0nngQGD50PKhofgCmcY/ONeBQfMyWnRweGeSOnUNC+RSvBQAnnlE4FPhJh3MtUu
 ilgJjPGqRmI9g==
Received: by mail-ej1-f69.google.com with SMTP id
 hx13-20020a170906846d00b006db02e1a307so2343844ejc.2
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 10:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sFr5I+WRledcILsCjq370DCSnN0kDkpnKS2SgkWGsqU=;
 b=RNLYqvX3gNj3AZpkXFt4664ODdrCUUkSEg5osHpfQMVHXzC0rXDklxLSUqKkF2zSTe
 JW+RGNXsScpqmX9m8/4S7AWH6Q8QfUrzzN6gYQqKPrBWX+HcembWtQbvqqpHq4FfhyTs
 sgh5lENKO1XaqB554MYgQ5eTkWVwZ+mPLRd9zc0vT9jaVRO/VJTmPjxCFAGtZm+Ucn9U
 LHimKs39YOpNCuItKA49+Vw1ljqhl669CoLYeHjasL3AR+UHMnVNc6j4RCbMkhJ4JvWv
 1YpjV4t3YpDaK8C4vA+T/4aBK3ejo6FCSa47yiqqBbWerPw8tgwefVgOVXiNKsc/lepa
 z3CQ==
X-Gm-Message-State: AOAM533nv7foPkMJLqatjmUF7HGRGYmWpAjAJQ637dbes5qUoQanJO3/
 iOtUeVW+/Ie/pJ/tAz+ZF5p+bYKp/MlYPG0uCg+5ZVAX3nVsQ+s/v0N0WFvTgbxjWl5n9hTiBCW
 wu/HzuomvJWI1rnSi8p4N4A2a2Bs0M926TX/s8kimFXYDSm3xnw==
X-Received: by 2002:a50:d550:0:b0:416:2ac8:b98e with SMTP id
 f16-20020a50d550000000b004162ac8b98emr10828138edj.236.1646679571235; 
 Mon, 07 Mar 2022 10:59:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXu0txwJE4+P5FIEK6e4oUCg8E1spjxcK+3rVXWuN/ncPvZuceRX30s52MHzZGh58AtN0qkg==
X-Received: by 2002:a50:d550:0:b0:416:2ac8:b98e with SMTP id
 f16-20020a50d550000000b004162ac8b98emr10828096edj.236.1646679570975; 
 Mon, 07 Mar 2022 10:59:30 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p24-20020a1709061b5800b006da6435cedcsm5016329ejg.132.2022.03.07.10.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:59:30 -0800 (PST)
Message-ID: <d5c5e3f7-7f50-6c57-f82a-41d5494ea514@canonical.com>
Date: Mon, 7 Mar 2022 19:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] dt-bindings: cpufreq: mediatek: add mt8186 cpufreq
 dt-bindings
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-3-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307122151.11666-3-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_105935_753181_90ED4B79 
X-CRM114-Status: GOOD (  16.51  )
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

On 07/03/2022 13:21, Tim Chang wrote:
> 1. add cci property.
> 2. add example of MT8186.

One logical change at a time. Are these related? Why entirely new
example just for "cci" node? Maybe this should be part of existing example?

> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> index 584946eb3790..d3ce17fd8fcf 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> @@ -48,6 +48,10 @@ properties:
>        When absent, the voltage scaling flow is handled by hardware, hence no
>        software "voltage tracking" is needed.
>  
> +  cci:
> +    description:
> +      Phandle of the cci to be linked with the phandle of CPU if present.

This does not look like a standard type, so you need type.



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
