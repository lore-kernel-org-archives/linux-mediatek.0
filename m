Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0C2CEBF83
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Nov 2025 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=; b=H7g/Ydf0M9RHbf1O2v4iQNGQX0
	gPEs5nxbNZq3S0mXWClJsfmvoT6A4HPCbdZ8Pht9fzo731ALQTrF6s4BC4BNnBei0C+Yd6wNByY4a
	5asjwcKO6TNoWqDK5kDp15XnPh2/7NFZJ+NrwjoUmMCJfcTR1/MuozuJPErRhQMUAQHGn6q4Ip1JN
	8kZ5AP5iKkRiXCx/ASjkhOslYxzYt3Hkn2ufP6ZuetWx8V+il3O8TaZ5w17unKHa9eGuiAHLsdpWR
	wMy6+dAuSaMAqIyy5f2x+R3+9AuUFKWvli0KaSiRxkH0FqUB19QXMDg6k9VCRFBZ9/gkyowR+SvDT
	kEcchuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMMT-0000000E2HN-3rMu;
	Sat, 15 Nov 2025 19:55:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMMR-0000000E2Fp-0CIL
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Nov 2025 19:55:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b32a5494dso1802093f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 11:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763236500; x=1763841300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=;
        b=d9h6sNy6won37XIqcGhE+NaezmYwO5Xkcc0sxepjaCMwZZJIkhj1d9KYZ858stGEDV
         5g7C/kFfG0Z6QRne9ZlRQKf1Ze2VxWiPvGaghCt54yvht6hBypy7sv75zOHRSRcjzQXP
         h8gqmDnRm8FucLHk+OorurZuVixhJlwjbCLj7o99N3fmlNN5BjAtiNemAkV+cugEAyyw
         NE8JjLZxMXFRBPPK9VB7AIhuNCx5Zkrw9k1z0+2NP65NrvWA1q1yCCna26JDy/iDRNs9
         vXiN56JIFLntEPGebo57dFoY38dV+LSoP7PeW7vTLLcLgzjV57F1ieoXvJ1nsZafC9+I
         iAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763236500; x=1763841300;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=;
        b=pLg1+h+mg9ucuLR0plhiABVnz0IkHjGoyYtq0y2MVlSnmHlDrtrCyPgGISLyWJMz3V
         zRTOJgAlv0msxpEf2vkqHD2to/gMgt+PHupbLrHG3pV2rTTw8WV0B0zfGsr87HVgQJ5x
         Ri0BbY0QYuwx3vXhNurQx9eYDOvicgpn6A7CSEWCC2rUPuOHei+SNbQTZRZWxdAmbaWl
         1IVuGDg6E6y1YIbZnBJOhag7eRj79N/jpMI8uhj5mkProSXcgNZ0R0IHQRIkeIP9JrUP
         kWOpiYv47VEJbX/SY5fMoAnmo9AswDooEgs+GOFhhT4AhOEcvCQJpB4n2dgBa6HxEygo
         3Hzw==
X-Forwarded-Encrypted: i=1; AJvYcCXlYa078mEsfu5Iol7fsxzt12GJUJ3HKWjnzOFp0t/nnX8aMdyYj2L6wTpG+IJmWIsMy+oD6jTU0obcTIh8Mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhyTcLk8IZXkLx0sJvlTUr1+k8cBZDHdYU3D11bTsGxCRJE/tN
	ClwJoBjCpXl448qOGgT56t7KxV6RCRfmTcOTxQFZY+g8ZDUEVS0ryX54
X-Gm-Gg: ASbGncuhbtjjVxDrTe5XUa1C741AWafF2kY5LFespg3/C3TVke9bfbkUl5xHlsiFVHJ
	I/ZH1CA0tKtRmp7w6OFbp3sRzSYv8Eos4+cQCQXsBAV+fwsigregQWyIhPNwjwhJMF8a9upeGKC
	B6R/bM9nGauiqWxT85HuKBlCXpywerGUcJt2Zeto2PXYE4y79+NikqDsVw2uevAEndAnXYv+kz7
	Y1ug53aBSLSJ/tDzcN9CD7tZI6TVf/mBygYNn51vFFm+1A1cHmUgdoRfdLTFTGeiuEkcDq9t34n
	sK4HQy7w6xJl0/3hX5eqRGaKTNXopZ3R+RczdUpjwf+0snjDFJY/YHd3AaDhUBC7644oCG6u0Za
	T+kjGmZEko8+UhbNnQBH8/vUckheyZIZDgTK7nqA4uq4K8jIHolxqGBO/H8WDLDezhk3jMPrWi0
	ujqOraO6BN4ZzP8dU1C6TIPL2jcz5fUw71tyl8aY+aSzVa2Q25br+v
X-Google-Smtp-Source: AGHT+IHSPwnyZ4YZke/ZsJzOSxMHljj18mEXOamqRXYe9YIBBAmYoQ9mxQRgJ1dWDU6O1s+9DDZ4pA==
X-Received: by 2002:a05:6000:2f83:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42b5937618emr6490889f8f.52.1763236499409;
        Sat, 15 Nov 2025 11:54:59 -0800 (PST)
Received: from Ansuel-XPS. (host-87-10-15-59.retail.telecomitalia.it. [87.10.15.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae2dsm17786147f8f.5.2025.11.15.11.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 11:54:59 -0800 (PST)
Message-ID: <6918da93.df0a0220.10a972.69d2@mx.google.com>
X-Google-Original-Message-ID: <aRjajP6jIi8QQfJu@Ansuel-XPS.>
Date: Sat, 15 Nov 2025 20:54:52 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	Sean Wang <sean.wang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
References: <20251115100000.177791-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115100000.177791-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_115503_121722_89ADEE17 
X-CRM114-Status: GOOD (  17.32  )
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

On Sat, Nov 15, 2025 at 06:00:00PM +0800, Chukun Pan wrote:
> The blamed commit made the following changes:
> 
> -#define PINCTRL_FUNC_DESC(id)...
> -		.desc = PINCTRL_PINFUNCTION(#id, ...
> +#define PINCTRL_FUNC_DESC(id, table)...
> +		.desc = PINCTRL_PINFUNCTION(#id, ...
> 
> -	PINCTRL_FUNC_DESC(pon)...
> +	PINCTRL_FUNC_DESC("pon", pon)...
> 
> It's clear that the id of funcs doesn't match the definition.
> Remove redundant #string from the definition to fix this issue:
> pinctrl-airoha ...: invalid function mdio in map table
> 
> Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/confs handling")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Acked-by: Christian Marangi <ansuelsmth@gmail.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index bfcedc7f920b..18c952e44229 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -35,7 +35,7 @@
>  
>  #define PINCTRL_FUNC_DESC(id, table)					\
>  	{								\
> -		.desc = PINCTRL_PINFUNCTION(#id, table##_groups,	\
> +		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
>  					    ARRAY_SIZE(table##_groups)),\
>  		.groups = table##_func_group,				\
>  		.group_size = ARRAY_SIZE(table##_func_group),		\
> -- 
> 2.25.1
> 

-- 
	Ansuel

