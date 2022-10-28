Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9714C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2rrxegvFg2FU9tdiMVnm2F7JFLebLK8/DzrkdwOia8=; b=MwGlUPbSJ21KdcAQwTRg0dIFwo
	OhJmlS0JF7WhiA47TT7gZLZP9UOplZyyHPUkyzrI7s5CPYC6W2W9FJ6esvemaZc+mGiy7sawdJvrI
	lym+EpBvgfmdUo2xX451L5r4rv9abqfU3teqLR7wf5j+ygiKeBrR4tM3TV09wChKlcM+3Ma9EsyLi
	Q3oIVF1ADEgrmOMuOIhVX5e7fqjbg7m67VDfc+ZtlztyA659OkRaMmvgA+iF4lNbhBDAxU2eYUL9G
	dub1xhqyS5zuuNi8Mgs+EgkNRWpYR+TsE3rWU0zzhcVsKb080w6ZULNLQldktv97tlFcaLbkjIf7X
	ncrCYRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTcm-001XWL-JS; Fri, 28 Oct 2022 17:58:32 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTcc-001XSD-K4
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 17:58:23 +0000
Received: by mail-qv1-xf35.google.com with SMTP id u7so4527365qvn.13
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2rrxegvFg2FU9tdiMVnm2F7JFLebLK8/DzrkdwOia8=;
        b=fraNEttcjrbsQWUwMp/J+ZIx1bUNFBiwkQcyDOQ95PrT/Ks0L8ibhqyrNNhv+O299F
         A6ygkQQlI+xYVk440AFZ+hE3xghWHIBwToMAOFiBqv/00BlolCA8DouG4Mu54Y9tTKh+
         xlROBBFVesNR5GN94eEclsuL2A8mFYnWaSuk/1e0Q+jgACzlyq2SoWxUu0YDy6Rr9UpC
         lMPibTya5CqLdgxez8XUv2QadYFSuD9hDqNRnZeAWrPgM5hEjvGBBTsU1xE6tQEepu4L
         4QXW0AsPMWadTl/iAoAiaK53L8EMsKWejyZGupqUJKGuH1ANvotGiMJZ3O1kVuLOan+K
         7UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2rrxegvFg2FU9tdiMVnm2F7JFLebLK8/DzrkdwOia8=;
        b=Q9cDdwhxNFWDBVIjcCwfpnrBjbWge+RU+4BaX6KCszfylIjMoxqjzK2qeS2HHsYtnh
         yofc54fVQHavQsQLYC1ROVYEABnGdBnSdjYkelrFKu+vhj17BsfW6TWh/eg++1UHX8a4
         o0fUWuot/VLsEURYaXeOJ2W2+r6Jj/Gxj2bx7OouRaGGvth7alqCJe7wrLFNgUnqwo5a
         3FijCZ0Io+V8ChgHcjIqzMgmUJd3tBKkmuL7j8Gj++/acRv6bKhKxK9rsnTveKRtICtD
         zFu7ufV13XsnArWqHvKUFVCSJlwylBYic8kWEIgrlRnUT5TSzGo8Gv5DS3ao45qhsbP9
         rF3w==
X-Gm-Message-State: ACrzQf1FNEZyKJAiwXobHgyWqjm96rPZMPuTstmv5UAwRpMXIP9RLzEM
	+P7dWO3sWVR8x4bbbjfeG0uAKg==
X-Google-Smtp-Source: AMsMyM6quImhJlk5cn6eegtdWzH8grrjs4wtY1GdGHe9oHTnd9M/5Z7LjS0jMuspsFZFxBZYG0eHRg==
X-Received: by 2002:a05:6214:3005:b0:4ad:8042:128a with SMTP id ke5-20020a056214300500b004ad8042128amr545569qvb.66.1666979898742;
        Fri, 28 Oct 2022 10:58:18 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w26-20020a05620a0e9a00b006bb82221013sm3426268qkm.0.2022.10.28.10.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 10:58:18 -0700 (PDT)
Message-ID: <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
Date: Fri, 28 Oct 2022 13:58:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 "chunxu . li" <chunxu.li@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_105822_663703_F3142D2E 
X-CRM114-Status: GOOD (  14.21  )
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

On 28/10/2022 13:22, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> index 4fc5b045d3cf..212d2982590a 100644
> --- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> @@ -21,6 +21,10 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description: The phandle of MT8186 ASoC platform.
>  
> +  dmic-gpios:
> +    maxItems: 1
> +    description: GPIO for switching between DMICs

Switching how? Enabling? What is the meaning of each GPIO pin value?

> +
>    headset-codec:
>      type: object
>      additionalProperties: false
> @@ -72,6 +76,8 @@ examples:
>          pinctrl-0 = <&aud_clk_mosi_off>;
>          pinctrl-1 = <&aud_clk_mosi_on>;
>  
> +        dmic-gpios = <&pio 23 0>;

Use defines for flags.

Best regards,
Krzysztof


