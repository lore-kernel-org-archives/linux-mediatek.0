Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D2EC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XsHCAAUo/oLtA4l5n4XUmocauuvUzyU7VbH9wcjXcQ=; b=wCY7gzx39zk66+lkTTmYvlLGLb
	D3ZFJoXNdra7b3drmZPRHe8CvAzELDUuDR9N12FhakvMuQqYCEU9C11oZB2ivv6Hh9eDE9cfk7YQB
	JWyeuTEXQvxWUcrlavEN6VB35KZyoob4SOIHp0U/9E6lFpxezIxnf33Kr08FOGH2UrP8USWxMVw/c
	IcM6s8L1uVBgAMvNxkVpcxRLZRawcfnh3+NF4zWbaAZMW7BMeUGCKj0C0koal9/lFq6FT8d2C7Hfk
	WUNSigFVAsgMl52DPl8TznbAeHfj97+5rB7kx4XnUoykJjvDXrkEGN8QTp/LIpJR1T6JHiVfG4+U7
	igTQgKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNYoP-00FpL9-Bx; Mon, 15 Aug 2022 12:03:17 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNYo9-00Fp2Z-31; Mon, 15 Aug 2022 12:03:03 +0000
Received: by mail-lf1-x12e.google.com with SMTP id c28so6283935lfh.3;
        Mon, 15 Aug 2022 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc;
        bh=/XsHCAAUo/oLtA4l5n4XUmocauuvUzyU7VbH9wcjXcQ=;
        b=ErUX/iJM60mg/GIhgD9m2o8Zsimzt51AWru/dx19gtiQS8+UJAccBHKTCddaet4TL/
         rEMwij3r1MnT4WMxRr+n8tI+hgQvFYSU4A+na+zrazwGfgyPwI2qpZ6NcVpZgYBQU1vw
         YnYlPGp8CSlmgHsuOypQ+2k2G75mzmpUIAyAQblYZWsbHoZ3D7uBunM2iAEjxonZUruq
         XmQvyKmgrdxBuqrUSY5a5XnpN/CCCP/7/hdlyeD+ChsNjOc1+g5KERM6GSB1gIbDR8ZM
         elh7UJtmD8U4ToCIwcM8PvG0qMTtWsCzvISExiM7RTPenDiFEYWS5gDjaJp7M3FiYxci
         wuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/XsHCAAUo/oLtA4l5n4XUmocauuvUzyU7VbH9wcjXcQ=;
        b=elh8ctC9qqE0+Mgj0HYYgcua7REisFkCit50TqCh53IEBfzq1YbjtkdF+W5J8/lKRX
         Ld+yr+OFgSVaVzJq2izth9FXu3za6tm+o1BzDYEo97Rzo0L2BHyf6KAX4RjmiNy8o3WP
         e8v+ygYJaCJ7sz+s5jEIwpPc83v+4qVklCIR/sTV4U3z7//m3hOqxkH2JKQRTSrHdn1G
         /WnaE84xa2Yz1kj9yKHJnUgp8mTT9z1EAoh0xltyo8smWz2VGUL6n4/WElwxvtaTv1Fi
         evUBk4FyFkBTLRNvopANpQDJtEP2ZJiakFSziMRg1iFK3HJ6zTTihEKWPilWa4OcX16N
         vbXA==
X-Gm-Message-State: ACgBeo3zvhY0wnHnOln6gbY1jfRcouiye8HWINwRJgZJELBhRvX4w8hM
	6vKBClJqWfiDtusy7OZk6k0=
X-Google-Smtp-Source: AA6agR5bn+jCdjoc5L3WS7gsgG/DC+Ia6If8+ihGn5S9bGfb+XvBKScyMfO5upO4+SQ2quD69RF6Lg==
X-Received: by 2002:a05:6512:1581:b0:492:8c61:5bef with SMTP id bp1-20020a056512158100b004928c615befmr1251567lfb.518.1660564975422;
        Mon, 15 Aug 2022 05:02:55 -0700 (PDT)
Received: from [172.16.192.210] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f26-20020a2e381a000000b0025e2e70b41fsm1384223lja.71.2022.08.15.05.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 05:02:54 -0700 (PDT)
Message-ID: <5a1a5a80-526c-2f76-0086-15cc76e88a06@gmail.com>
Date: Mon, 15 Aug 2022 15:02:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
 broonie@kernel.org, lgirdwood@gmail.com, andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
 <20220815090125.27705-7-peterwu.pub@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [RESEND PATCH v8 06/12] lib: add linear range index macro
In-Reply-To: <20220815090125.27705-7-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_050301_230716_074D6DE8 
X-CRM114-Status: GOOD (  18.50  )
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

Hi ChiaEn,

On 8/15/22 12:01, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add linear_range_idx macro for declaring the linear_range struct simply.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>   include/linux/linear_range.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
> index fd3d0b358f22..fb53ea13c593 100644
> --- a/include/linux/linear_range.h
> +++ b/include/linux/linear_range.h
> @@ -26,6 +26,14 @@ struct linear_range {
>   	unsigned int step;
>   };
>   
> +#define LINEAR_RANGE_IDX(_min, _min_sel, _max_sel, _step)	\
> +	{							\
> +		.min = _min,					\
> +		.min_sel = _min_sel,				\
> +		.max_sel = _max_sel,				\
> +		.step = _step,					\
> +	}
> +

I think this somewhat differs from what you had originally scetched. Eg, 
if I didn't misread the patch earlier - you had:

#define MT6370_CHG_LINEAR_RANGE(_rfd, _min, _min_sel, _max_sel, _step) \
[_rfd] = {                                                             \
	...

instead of the
 > +#define LINEAR_RANGE_IDX(_min, _min_sel, _max_sel, _step)	\
 > +	{							\

I think the latter (without the []-index) is more generic, and very 
welcome. However, the IDX-suffix does no longer make much sense, right? 
I suggested name LINEAR_RANGE_IDX for macro taking the array index as it 
would also be useful when dealing with arrays.

Do you think you could still drop the IDX from macro name or keep the 
array index as the original did?

Maybe ideally introduce both macros (unless Mark has objections), one 
with the [_rfd] and suffix IDX, and the other w/o the suffix and w/o the 
[_rfd]?

Thanks for the improvements and the patience! ;)

Yours
   -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

