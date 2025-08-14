Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0297CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 04:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=; b=smjBGVPgcVQgeAr2gj6jbzFZC8
	4wa9R96+aubddaf2XAec/Yyvr0Bf8ZNfT3YPonYCEVgrq6myuxHnHYJdiYBPijJu1D6lezbb2/s1p
	io5MlrcRY0mVrVyC3/80bgeqvcBxFYgLiN5KCBmbWt1ZDlCK9MSq7zmK6urmncPNMQ6vCirQ27AyD
	qQ6T8U7kKNqlBEjOsycueHQyZViuCVIVvDvJ2pTShhMAJ2PSvtHxsI+A+GobrlW77pbi3nV6igwET
	T5BeS8taODCd1+/JyS5NyW5GoTvFh+2u8PybRArxGi5TAakskowWqYcPaiTqCe414T8rd4CfKFsBb
	2tDApMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP9j-0000000FiPg-1rZj;
	Thu, 14 Aug 2025 04:01:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP4O-0000000Fhe7-1W78
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 03:56:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55ce5243f6dso522645e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Aug 2025 20:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143762; x=1755748562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=;
        b=QuMBIZR3OnXDDvqpXw7hUTMW7tuWeyPAxM17FL+EnKonjms6cZVS5yLiYxEXq4yc4f
         dH7cAaCS3QkTb/5la38QI0gW21cOQKjJHHc0U/IDMLAEGpdzaOHjOwVqzFXUNG25uW/4
         SxEngRnQJCUuiSYqt1S3Qp8O7QM2uLsDnjfes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143762; x=1755748562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=;
        b=arRfcEzvOP1C3naNarO/29ffFu6sO62rXnfiJgB16p/yEDdh152vi+vyWhPLzZ/rmL
         5HnXyeRGrl787qKXTekJxixgy7BlAuliwxeSsEWRAvrZaPa7vTqV8z5Z7fhiAH4ihUTT
         2uuvBPhAiYGSvwCh/jjMXZxDvdvFrkIThI4+PYZpCbENm3IjfZtiWGD32kE3FGzFcUV8
         CjOUEJ8C1OyGfC4HHOhxrmRs67B9rFDVQVO6GjmPCTBvsbfepCbK7pKb5NRtyIfjwQdP
         Eog1d9wPt/Phb4xjnbkk9l0NSd97GubnDF29lqWuAGuqdAecKQRB40rBpEM/VPaA9seV
         6yYw==
X-Forwarded-Encrypted: i=1; AJvYcCXdxaGojJq8g2DQj/gBkxu02qfLm5r+2htK4TaBaXZVdru0CO2j5fGMQ9XNCzbWaZ6EqMynGx2XZTAdnD336g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhkx+juGeBz3dI3qqjbn7DKgP8shtRLIAxr/w6I7E1nu2FdpYQ
	MXJsynWt94/p7Rj1/paX8WAeM/7LUIYf8/giDLMoNPnY08YPlwCOCUdjkk1OOWZNPhjxpvB2Gj0
	L6mrUKGJCg6BgsicYcIw1BAx7emSPAnAc+JZhu0fzsaEfnUAGM0k=
X-Gm-Gg: ASbGncsOsQWpcThmr7v9jD1AW5PAIcRnKqZ8nPMN5WMYEp8lu/0vI15jdxbELCYRSK2
	eBUgQ7Cf4HAnKSLdQyzaRg2bSKfhSqh+FBqrnzpkjmBssaUkevZibxNbp/tq9vgJBVvsTUPL6NF
	Hr0MC1gCnE1MMN8OmygzbimGwQ8Jtg5f1CxNZ8sLsueNFwLrZgSJfWP+wrjIgZwCQM/0dTtzWt8
	3xObrAidWZ88piQ8Rn0ZZgRmswMfzOr1PeLe/Ffo/JfsA==
X-Google-Smtp-Source: AGHT+IHQMv69+04AP9otNVcxhwI8uWKlLmUkdvXFQ1PCUQkCenB9LDrLy/Vl+cHfeBSUvo7zV0jpH3UAnLNxpErRIuE=
X-Received: by 2002:a05:6512:4406:b0:553:2868:6355 with SMTP id
 2adb3069b0e04-55ce4ffa5f7mr485589e87.18.1755143762579; Wed, 13 Aug 2025
 20:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-5-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-5-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:55:50 +0800
X-Gm-Features: Ac12FXwQl-cvQ51JsCsvzfEY1EzqeHLXUhAtiyz4lnmgFYbrRneNtPbyaTw1wc8
Message-ID: <CAGXv+5GE4eUjMhewRm9oa+GbJWt8tMC0RXvT0R5FEfVOAsJ3fQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pinctrl: mediatek: moore: replace struct
 function_desc with struct pinfunction
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_205604_400165_40057D0A 
X-CRM114-Status: GOOD (  11.68  )
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

On Tue, Aug 12, 2025 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. This driver doesn't use the data pointer.
> We're also working towards reducing the usage of struct function_desc in
> pinctrl drivers - they should only be created by pinmux core and
> accessed by drivers using pinmux_generic_get_function(). Replace the
> struct function_desc objects in this driver with smaller struct
> pinfunction instances.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

