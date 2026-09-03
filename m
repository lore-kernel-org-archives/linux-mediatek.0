Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D522C61DD6
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 02:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=; b=fawZgpRJvrZ94hkn2Iptikofr3
	AzU8UkdDxdWUDp0QG6En8jC9pERFYzcwPpOnehESBu2ZPSoxQnWYZg3Ulj+JegFSFK/FSHTQPhiUX
	HL8/u79wZ82YW1Az81XUsPEr8AB5JZDCPBkhrFyrRH740ofdO6PUOIJu6+6MwNizE/XgIjNq4huQ6
	Ga+iN8OQNG1Viv+h1V1853+9CUm9eojmq1iVlmGDrzoirG3gA9iJ1rqCWIapXcvtBeNtksVaphgt6
	IxxTap9KJOCsmtK76kdo6fxTu7rOVwu2ZCqGuRpRnHJZL6rRj7KSDayKjKxLbW77KTVkaRrwKnmx6
	Yecyw/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xf5-0000000GFQS-2sfL;
	Thu, 03 Sep 2026 02:58:47 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xf2-0000000GFPk-2LmH
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 02:58:45 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2010310a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404323; cv=none;
        d=google.com; s=arc-20260327;
        b=qhIz9vF8JrGTW6AWeD9JedH+EYqILrqXUvKg18ilO2UJVk/ZRSDCY2uBysPoK2NqKC
         rCiAH2/qXvs1rNQUKhETRIoDDzX8OWVyEYLSdPwPujn1ykLpXQG4rHFVUx+Y20t2cEB1
         FdTxjS4hXEGFr1LCWEx0ZI/dPfQIB+7+kdN5oRWVRiXOABf4h/3Qxs5B/quMSs6LnnfG
         /jVplM9/HfpY8VhFYUIbwgwVfisok4p7zi5W0pdwxGRaqwEwcWFtvni8p4T0668Hkipa
         SQdhkt81J/FyDa03YQakJPQ4bsrpLoWlsIUtU26+H9lyQ+vlZoIu50CFP129hnQAjvVh
         ciFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        fh=iAqORoHVOOR+IzG0qWXbKruGTTYVYkVKlIizkSkAzcY=;
        b=XSAr4NrAx5EmbaHAx7lD1b2x/N911emO28SC4IBpSQhxjFGX9Y9CqclHGDChlMCrzG
         TI+ut9PHdgMFAaeL6Hj0ZopNvkuC3WlLhRhV5tar76BI1urUtATWIl6Q2deW5buWSXFY
         2eGwQsixxwWG+O9JiiGonUjwuv20NmpbpMjc20zWQrCi5855d4qPoBxOdOc0PLEzPGM2
         yJtxU2xUCYBw3xVqKcHwXtMR4DbmsXBgRFOWeWiPz25tIb53204MIhGQkFPv+NUq/Q32
         H393DoOUEIhvB1w1KtKB4gc2qMaUp6gpoBdUc8/7zdg/afXByLk7UvgkNBP1zvMrQWV/
         4WNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404323; x=1789009123; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=RgODpQGWcy+wx+0B4mY0BJPUNgMTgDXLg+CP6xz4OM/aJqOTvJpPom8sdIEJOopzLK
         pOnkNuJRemGwOeggjwEXGg9/ZBLsu5S5dY5w7kWVa4xH1UgtxoIkxYR73/XVlaDw3EXJ
         pedC526aSL+cb3lv+jgI3DDAcgnbf5cvBD5E8t20Nwno+QqfYuYkuVr07XNkV13RvFSD
         Sx+K2wEdhSlw6BRa40HIccWV77FB0MONwS1vuKMfztDbM3Rr0AcQ0fvoIjIp2cDLchYj
         E9YconLzTe7LWWdlcyokjmjFlSVGbjiN36TOKFvA2XwNHbweKhVJiNa/8LsmrBNThLr9
         iF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404323; x=1789009123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=XFpycwdTFhu0EyHWc71KcnVRjx3nCdcZJXk69EnkY2OlcaR/86cw0iIzkXzp94yEr3
         XmAnuAuCsarNNkHaPiJcCrsCzPDRHed9SsgzQTRDI4z5xqvn7Q7hLGYKA8fpF0VgtARO
         5EZL5deKs9Un77RJxAr3ZGpVVUo54zn35hcqYOop4/MJNrLTPPVxUyA5B3N3gqh4JlXN
         1lm4NKi3Vi0XO3NtSIGkAJcpHNLkAzICIyzXwWBxpvYWaehRIxs+QUdGPU20l6X4ukL2
         jzf9V9jIEaN7zJVwyfidzQhblL6YdUAI2lKfvGGiok7OD0GmXBth4k7NmImR66Oel6Ui
         hJcA==
X-Forwarded-Encrypted: i=1; AKwUvBxIyMBAzRjQtOxaoOfNgiZoTQz6123VVVwJZa/f+6hLmTU2kVN1EtlccLoVqDsWGIzD4AepX7356BAFo9HjZA==@lists.infradead.org
X-Gm-Message-State: AFuF++l8WIKJvnd1RzG8vwJHadzU2BaqP4AzV/8KggnXj+5KfKocNNS0
	N3/MM30gAbW4Rxhp0hQKFprGjD5BaBfe/+QAL5SefxtOOxT/JJkMmpboiEOankJpMAN0EYj4zg5
	FKVhlqULpEq6YMSDzyH4iuwpOBuzju+k=
X-Gm-Gg: AYBFou1udjvZZgRrB7GX5x8+7+GfaGMAWWwhD89m282hPt40CnXDY8h3Ir0KuT7TPYP
	gZkcSyoYunwRWMLPhqco9GzA/Gzbg5b+cFvfen766uSHVxAXMZUUcLJxR9QL4j7N/u3vFebeUle
	QB4Y39TOio9r9Sqhi9rDxf1l9+dJhefEmNTT78OwLNo+GWbHhlbdL0UKxDVqPDaZgIexQ1yY9A+
	1qBDnLfjwHfobLXZkXl2pOMevsHT9Qn1qPcWTnU4GJXqz474v1rMBnzzfFpuEVt5urZKiuibQZq
	Mhn8eScbGpsO4cqdqpVWMHdTbRmwPGpFPcTwPw2KCKzmPT1FuFcIO4EosVTrcZpkgqK6y8uzUsu
	UaiGrVQULV7WiNPTIs/ytx0p+uA5QMXevC0VzAyetfrOyAKF0b+kM2WEg3wGryDYNQHMT
X-Received: by 2002:a05:6a00:10d5:b0:852:38ff:b4b6 with SMTP id
 d2e1a72fcca58-85ed3f6cd26mr11933247b3a.17.1788404323051; Wed, 02 Sep 2026
 19:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
 <20260828050526.590761-3-phucduc.bui@gmail.com> <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
In-Reply-To: <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 09:58:31 +0700
X-Gm-Features: AcwNN1U5zeKxmI35EGDwvUZzgzhqsl97lW_cejqy0aA9Qkk84c4bJui1c3m3NJ8
Message-ID: <CAABR9nH5dcpaxDSyo3jjimorTJ35nf_OjFF067Mr63aiCO3Q+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux
 disable path
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_195844_602882_28CD3580 
X-CRM114-Status: GOOD (  12.28  )
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

Hi Cezary,

Thanks for the review and the suggestion.

>
> I was thinking off a typical teardown procedure - everything is permissive:
>
> // the disable path:
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>
> or, if one wants to do this properly: split apll1/2_mux_setting()
> functions into:
>         void apll1/2_mux_disable()
>         int apll1/2_mux_enable()
>
> You do not have to go for the split, the first option is just fine.


I will follow the first approach and use a typical teardown procedure,
where all steps are allowed to proceed and any errors are only reported.

Best regards,
Phuc

