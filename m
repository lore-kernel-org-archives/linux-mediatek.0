Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3A1C25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=; b=ohQSmsI95g85CUmNwme9HMNz/+
	h3S8rWIYbben++qMB0jWLgskRg437HJhkIwraXKZxofF8hA/nfz2KVlu3Dc4XVflFEItbdL/Pa29w
	ArUkmJlxCb/+h3IHlWbGrG9//Mf/KGrYeEsAfY1rZM7uNVvPh7O5J6a/wuGA5e8g381iofYhWPzF5
	WnB5E5Hs/+wblQPeEQwyE83uQ3EZVykzDWqIfO7vmg3bh9TKEk/PLAF61qiLYuXu+nmLCNGKPdAfu
	j6jnuWEnA5uymUXrOu/AXpChuM0VLCi1tYH62crkgSmJ9KT5rys9p/kAYhedPXfC782TbRb4KUtkE
	7p+XPQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFPk-00000003aZ7-3gpJ;
	Wed, 29 May 2024 09:16:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFPh-00000003aYH-1dTe;
	Wed, 29 May 2024 09:16:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a626776cc50so194936366b.3;
        Wed, 29 May 2024 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716974162; x=1717578962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
        b=fjoYg2DTbxoKGfS+cOKYf2DABHpqm/cjbksnargVX4MkRMvZ+6neLnlIHCm5zOAxiu
         6cnMQFAUTjAagoJxoJiI9+2FpXkgQ1OkM/DJSj09D4VQiwXeVEZV3jpbGsHfNk0srRJ2
         CJh+7yJTCV02YwrakqDhiRDKiClxNwBYn/GWjllHCuOBipJgshjifyrOCSZwoMl9gfCr
         1svq2u2BQU3LdboqgMDtXSotLK3QT2Lo6CbpiV7mO97bOR8hvtYVj4Gz4wZVqOD3AcgH
         HRf35TpBczZU5CAeOjAB1dfC5PHWhbKYFLEiDtcP1YQE0ZW6eTV2eJ2X4bstozmz/q2k
         UqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974162; x=1717578962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
        b=Q32sClKcgqyGeN4xn3J7qufZABBtjV6Ci+dBBwRqB0QqKkenMYmvqQzaZnNKOcdD1H
         HVi6MPmJcSVhIUW0svw/gEEBnYBY8RxjKQYziX8W9MXNSNLsosj/qy6UTVD91H1dVHxC
         XlZYMHvBBi7ffw34KOLATyxmye/WoLHF+ELvRF1DTRjxf0S0agzw6lnSozrMlpGjuCI0
         Ns7gAx3a2b+Po7i+OWY91t/7BqGoXmRuw6pFifgmebVcsThFI1iKvNmHbIcWFoV99+Er
         x4bPUbEJFctCsCgWX2w3mL5K2v6vsdfMG7paOqUcbrSDkE08oFp+6IeIYUI2lpK+ryU/
         SjgA==
X-Forwarded-Encrypted: i=1; AJvYcCUhrCQRYOQqfBHUp5bBCcdMkxJYEMJ/ZBzdPl5Q+zSVTcVyG97vXCgAYdxLno04/p0zV5RnOr+ojuA9MsH/zeF3Fpc0gLKaE/HdmdFXjGo9kZt9374aCrSa0lKem+9Y1SmehBpN9L1fXfsmYnqJLoe7HhNtbfKsWZ8=
X-Gm-Message-State: AOJu0YzXrKlhhSNa24H3mYC8j6j1ivDBOwNKkh7V8nXLqP3GOfPLd9Hn
	7otm6vPVVKiZ4ufjgTsmX0eJnin4YlQxl1Qb9r6LAzinlKLP0hF35c79D3mNmtJnaVhaDOyYhfG
	3lGIz87tG9FHY5h+NA9WMfIia5kE=
X-Google-Smtp-Source: AGHT+IFzCGL3iHzr4n/qBEh0rBcTkXqfRF+a6gRaRMQGh5+of4CGG73bxuOyvd2Zs59FzGTTgkYC/QKjn7uf1k5x4v0=
X-Received: by 2002:a17:907:7e85:b0:a62:de58:b362 with SMTP id
 a640c23a62f3a-a62de58d30fmr640122266b.55.1716974162356; Wed, 29 May 2024
 02:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-5-andy.shevchenko@gmail.com> <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
In-Reply-To: <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 12:15:26 +0300
Message-ID: <CAHp75VeurNjWSLsM_cEphZZhqSM9TNc_ozGYcJ-vvefHg8NY2A@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] pinctrl: mediatek: Provide a helper macro PINCTRL_PIN_FUNCTION()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_021605_452763_B19777C7 
X-CRM114-Status: GOOD (  10.37  )
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

On Wed, May 29, 2024 at 11:24=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 28/05/24 21:44, Andy Shevchenko ha scritto:
> > Provide a helper macro to assign the struct function_desc entries.
> > This helps further refactoring.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Not a strong opinion but, for commodity, I'd like to see "moore" mentione=
d in the
> title, as only the Moore pinctrl IPs are being touched here (where MTK ha=
s two
> different IPs: Moore and Paris).

If I need a new version, sure, I'll add that.

> In any case:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

--=20
With Best Regards,
Andy Shevchenko

