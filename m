Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094C8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewFvocVNfh/1BMVRJJhj6y+q9DXa1cklPYO4jJJ+ZPI=; b=SlqZZ+cSuGCmZ/PauLxzAHUccx
	3qAglGvHXDBHBfcGhKGRU82OlyYbC2Fk+Lf6aYQ9Pe6mJJS6tv949ZXBdxVr/gCPZkmYQdfySQBzQ
	D4z5OqMNZJCTDthrAxxCPxFhutKUKiQSP31rBeM1CUlE01YA0bOlZkgyW4ZkLx9zg3f2Y6Sc8Yrpf
	e+kZhR41pt1ZymAwIgU2BRmCkA4JtFH/0TtSEuemGOyJm/z0rOG6cRlrpMdBwkInNgFv10AEaWg1e
	qOoIl5jUAZuGR9gScBFEJjWFtu4P5V9kFxBqmSeYvoBdhBo11+WfTXdRAiNmuGtBcQzoZB0gMJ3dp
	x8Cnv6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyRo-00G9Sd-M3; Tue, 30 Aug 2022 10:26:20 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyNw-00G7nB-6I; Tue, 30 Aug 2022 10:22:22 +0000
Received: by mail-lf1-x12d.google.com with SMTP id bq23so14874360lfb.7;
        Tue, 30 Aug 2022 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ewFvocVNfh/1BMVRJJhj6y+q9DXa1cklPYO4jJJ+ZPI=;
        b=G9w+EHsaYTf3RTd0wF+VIfFaIZEtTiw4ylQgi2J4gfawcB7MJij1hAOQqp127Cp3sV
         9Tzei6RF70Zq7P0eHDXPdurkyOZKpYeFgoxBN0D5cMrM0uLxYqhKS0l/yQ44wCBmxaY1
         AUBPV/+Z8fqfQYJ8GHWpjeAs5IfSkBqKmy7vOWlOkf8c5T+fXxDFhYycK2i6UO53EhTY
         cG5QhtsblzJeRgBxxQjOmn9uK0CJfYkOLVZ3wmGlUZ6MuDmSfKC5y/ZbnjyB+sUEmXyL
         jv0sIEergg/34/jqdrJr6jA1UbDviYTis75trAfEUisn8YAmdt9KwvPDvprXRBd0r+Wp
         1VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ewFvocVNfh/1BMVRJJhj6y+q9DXa1cklPYO4jJJ+ZPI=;
        b=4rJAL/ffJNLc/hLiSW5NDT7Ldsd5JYMbJha/PNJ7fFINwRIXDamPml9ZSW/vpeDUkT
         Qlt97pe+zg/jqP7tVL5uTW5XQoQqT76Yu4Cfht9rhVa0yOto3FvOjwzJl8Qoh5/Zgzqr
         WES9CwVfdVc6IXKaU/6DASXlWQi0T8Oo6QFUsBclclIHlyDa6IPYv9Hyyj3l7HGjqzXg
         wwSDzr+gjVYU+zwLvxS65bRi7sHs2kFX99ZXTVOSeBR0OaTWj16pplYuGxcrkNt6l7Bj
         ofGekNj57Bz358Jb5hAM5eQUfhz9nTZmQql9gbLNdGBx3P8vrMerlBrn9KG/I4zUTbP+
         Gzrg==
X-Gm-Message-State: ACgBeo3+vKeTbVXvL0OSGmabKczUxq1svsA95kZBeDKSBNqynGwn+tiD
	OchAQ3+8Inz8s/OJC4Ji9eU=
X-Google-Smtp-Source: AA6agR6roG+6pfy1GbA43X3JSuD5tBGJOEwN6P3O5bTo8eY5FYH8nUbstwZW9bi3uCb39lJN5D/lvA==
X-Received: by 2002:a19:911d:0:b0:494:6701:1d17 with SMTP id t29-20020a19911d000000b0049467011d17mr3991390lfd.31.1661854936337;
        Tue, 30 Aug 2022 03:22:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id t17-20020ac25491000000b004946d1f3cc4sm613954lfk.164.2022.08.30.03.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 03:22:15 -0700 (PDT)
Message-ID: <a97be2ae-b7d2-2ecf-fa17-de2d8755fb83@gmail.com>
Date: Tue, 30 Aug 2022 13:22:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9 05/10] lib: add linear range index macro
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, szunichen@gmail.com, andy.shevchenko@gmail.com
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-6-peterwu.pub@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220830034042.9354-6-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_032220_315863_C2AF6D37 
X-CRM114-Status: GOOD (  14.99  )
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

On 8/30/22 06:40, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add linear_range_idx macro for declaring the linear_range struct simply.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
> 
> v9
> - Revise LINEAR_RANGE() and LINEAR_RANGE_IDX()
> ---
>   include/linux/linear_range.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
> index fd3d0b3..2e4f4c3 100644
> --- a/include/linux/linear_range.h
> +++ b/include/linux/linear_range.h
> @@ -26,6 +26,17 @@ struct linear_range {
>   	unsigned int step;
>   };
>   
> +#define LINEAR_RANGE(_min, _min_sel, _max_sel, _step)		\
> +	{							\
> +		.min = _min,					\
> +		.min_sel = _min_sel,				\
> +		.max_sel = _max_sel,				\
> +		.step = _step,					\
> +	}
> +
> +#define LINEAR_RANGE_IDX(_idx, _min, _min_sel, _max_sel, _step)	\
> +	[_idx] = LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
> +
>   unsigned int linear_range_values_in_range(const struct linear_range *r);
>   unsigned int linear_range_values_in_range_array(const struct linear_range *r,
>   						int ranges);


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

