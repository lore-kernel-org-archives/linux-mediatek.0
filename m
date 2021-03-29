Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD8AC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:28:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2276061976
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2276061976
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FQNxQCjUyxHS2MbvgihKsqqeKTRPbRKT6zeQIB7XvU8=; b=f+fDS+XYcgcDoCorhzuFHJixD
	Xb5UQ3GCAYEnek5yb9PLZH3mXmrg+bKAJwFUcCJouOaeF5OBeQnrHOwlBvmnZdjkr/YGdNFf+oXmV
	ljVqBSZffcQiXJwYRhhTISVeakJYwKlUlD2S2Z5hEXeuUbYEFiwJAy7adoP2XftnzZCiSVTPsmQfH
	BBvmAY5zm2S79vHei9iTzjvx4GHm1k6tq6fSl6g6huxLk2MkViz9zCljFwdxy41TKsSuX7eyN0zFE
	Kbg4mQfnDCZF5s7XSubov6ZwlJTxUZxO3EVtpRttdP8PJ2CzI6LbZvsldyOf2eQ3xzxyTayW5sV7A
	T3nqlFEyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxYK-001FDf-4X; Mon, 29 Mar 2021 19:27:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqSE-000d2z-Ov; Mon, 29 Mar 2021 11:53:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id p19so6477571wmq.1;
 Mon, 29 Mar 2021 04:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wQLkbOswuI+BpoLUVhG6EjT/ZfQAs/+vgKlOUr1dkh8=;
 b=kB8a7321/zav80c5lhd8wZGVmThE+nFkEER4zryYbkFuKOXBXQMvHs4iLXBJ6VXzXT
 ij3ks0AmPIQGyWUzO91Xlq2I5ber8JoTGXEapHt3DqUNEaAZT/w9E9SKUT4sVuoP+Gif
 nXhD51DjjmeMBwVPWmSStADEi596U66Xlu1FDbr9vY/PVowc53F/TkWM6r1/WQcDLDq6
 uExvPnbjC/m+TXuBx47elnEOfTA8R8tMjnI2llRyO6GK+/M/ibpechVcd+EcQVXmQD6H
 3O1L6YweNFGsRn1VUTMi/hfEwDYMaBDFFJ+iMFOPU4693G2c7YplKtHyMk2ddfG8akaq
 BeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQLkbOswuI+BpoLUVhG6EjT/ZfQAs/+vgKlOUr1dkh8=;
 b=uaoN0qFsiY4c1bWZ2rQIck/IgeALXcuV87jD054h2/3CLYe99ckFsy9ZqrMz12W88O
 HNd8VRn40yd3ni3gDngpLYjz3Kh30tbQemTJCCdBu6kBf/12O3BHtHY58tnHRbulZdJJ
 vetmpqOUsnqKebdPWpLlZXZTUtw+WU4tOJyfEfm+gjQ8zaEQWeB6Vnr4CPZlz2f1Uz30
 IZ0eXqI/p/F736kp0Jl7tO2OsoGjE5c6rPN9N2AsuM1cuLiveB9m7AQzkOlfvdJsVJEQ
 F62e31lvuD3wB6UyMpO8u3SNCqibcJtG70/DYG1PR685ZgnlB+JCsFnkejI/AoW1jPDq
 isaw==
X-Gm-Message-State: AOAM530pcXlrPF+LVcwMIMc6hoF1oPUlR5PC2iK7sckNmScFlnVRQ99L
 pvXVLl54xi4a5Yzm5BNW6nw=
X-Google-Smtp-Source: ABdhPJw0EXyW8g/N+HbtdIOdlmlhALM9J0chb1Wv/F56E/RlCvHktkk4fZbvbFKh72p7d6sbBzHefA==
X-Received: by 2002:a1c:e383:: with SMTP id
 a125mr24553877wmh.125.1617018790275; 
 Mon, 29 Mar 2021 04:53:10 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id g15sm22721058wmq.31.2021.03.29.04.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:53:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] dt-bindings: serial: Add compatible for Mediatek
 MT8195
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Stanley Chu
 <stanley.chu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-4-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <96b1e804-fc1c-d343-2308-f96c95d82e81@gmail.com>
Date: Mon, 29 Mar 2021 13:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319023427.16711-4-seiya.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_125311_097678_F89BB1C9 
X-CRM114-Status: GOOD (  16.03  )
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



On 19/03/2021 03:34, Seiya Wang wrote:
> This commit adds dt-binding documentation of uart for Mediatek MT8195 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Applied to v5.12-next/dts64

Thanks!


> ---
>  Documentation/devicetree/bindings/serial/mtk-uart.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> index 647b5aee86f3..64c4fb59acd1 100644
> --- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> @@ -20,6 +20,7 @@ Required properties:
>    * "mediatek,mt8173-uart" for MT8173 compatible UARTS
>    * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
>    * "mediatek,mt8192-uart", "mediatek,mt6577-uart" for MT8192 compatible UARTS
> +  * "mediatek,mt8195-uart", "mediatek,mt6577-uart" for MT8195 compatible UARTS
>    * "mediatek,mt8516-uart" for MT8516 compatible UARTS
>    * "mediatek,mt6577-uart" for MT6577 and all of the above
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
