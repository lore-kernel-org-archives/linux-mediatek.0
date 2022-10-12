Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeOjosyr5u2M7MVtBWoYoVb9Bk3p95cjeefCPrwJkC8=; b=qLyGFHUdWsvdr3q2g0StPNpZk2
	PFYhaqhdHqkN969BGa5Nt+jkVmhLPGf50gnOeeletDnEEkjyQ8auhRLvbYb2vdfFl+ZGBvgGHUlqH
	V9Tm35RrhgWgUx07utiXvPpJzzvWpd/EKPoQVP5q0pTSwoeOU1KPvJDY9n1AwHzxeeYY2jgZnIky3
	CHPxfXnmGLuqyMBTHyIqhhITCSNJ6h9SZmU2ewcrui1ho7mteLAxUeVjpT210sL5VeGEn0UJF9h3z
	ZDUNn2TXSwjDXuvZp/UB0EZArEqfrjCWEni7rr6Gr6f8p3QkmHJUlNhxegnTV50buD5IJZEt61f14
	fPoqmuUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYlT-007cKe-8g; Wed, 12 Oct 2022 10:15:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYlJ-007cHz-B3
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 10:14:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id bu30so25508682wrb.8
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeOjosyr5u2M7MVtBWoYoVb9Bk3p95cjeefCPrwJkC8=;
        b=IfIyh9wLS22x3KmioEiReoiaJDSljH0FVVLTgHFIlCO85dVHuNF1tKi97jq9vkDVCD
         vf96D1ykpoCnKHHvEpbZkO2HY99bjvkAOt9sOnwSFXnLTmjO2xcwkqwRrhXEeYqyb10Y
         2LIY6lhVIKnX1RucCyRrC362M2AYpqUOWTt3quh9Pd+1IEuaqR5yn4HTUEcvaiaY6RAB
         JF2ZP9o+OCu02lYjZ3oQ/bcTa+s2lQh8QmhWJITeCxw2/lIGdkZHcrGLVCj/QBmalzuS
         jf0/xhx2gz9mg7ZwnKwuE30KlQqsk8OYdmE1EJdn9ISCwAunLoyV1dSWtCssdHyxYncd
         N6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeOjosyr5u2M7MVtBWoYoVb9Bk3p95cjeefCPrwJkC8=;
        b=du5SW5M+zXdSak/W0W1bvkreG5nkSZGnGPnBieb7iWFZFgbkJbTWV9ptF0kFrxCHPr
         H3HODIHHHR5gOU44idOKeDNbi7Te0RNAMGLAXGVmpLtlVo8QP1n7qKuDeaT2yO14AREs
         kZDkBVTBVGjP8fQKIuLlTLEUJQhheYOkIYp6LUfnJXFRkYQHRz35Yo2kq3Inq8vQbIqE
         y3GDwNpnyqV2IQgqplENpaehkN661JmvbHXau5g0DcLmyNK4pBUR3w4Q9acQOwn6ZC8I
         tLGu/KSwKlLmi+/Vwlu+sviIf2ABs+uegKByYcvcb/JFodmqRhUQ6rTePhuVWtNxw7tc
         69Gg==
X-Gm-Message-State: ACrzQf3f8nvwbZ7IKqzlOVE+CKuoI76jRMphIg6dvDZCgX1bPE23psNG
	ajtwI7AaC80Se2IRlFWXvAAbPw==
X-Google-Smtp-Source: AMsMyM6y2xXYz4x9NLL4v6vXYngR+hifxuZO8FeTz8FWmqoJQGmH7LJIfhFlhS0UXcVQm2AjLQ+Oqw==
X-Received: by 2002:a5d:5988:0:b0:22e:5a65:1e21 with SMTP id n8-20020a5d5988000000b0022e5a651e21mr17945171wri.338.1665569689584;
        Wed, 12 Oct 2022 03:14:49 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003a83ca67f73sm1503870wmq.3.2022.10.12.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:14:48 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:14:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/7] gpiolib: of: add a quirk for legacy names in
 Mediatek mt2701-cs42448
Message-ID: <Y0aTl9iL/22pLfx6@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_031453_386562_C8EEA6AE 
X-CRM114-Status: GOOD (  10.99  )
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

On Tue, Oct 11, 2022 at 03:19:29PM -0700, Dmitry Torokhov wrote:
> The driver is using non-standard "i2s1-in-sel-gpio1" and
> "i2s1-in-sel-gpio2" names to describe its gpios. In preparation to
> converting to the standard naming (i2s1-in-sel-gpios) and switching the
> driver to gpiod API add a quirk to gpiolib to keep compatibility with
> existing DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I'm just passing through since I was curious about this 'set but FWIW:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

