Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A9CA1007
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=; b=dNv5ATjCgFCue4Zmx44OSvZTbN
	VpIkJaPZrwdJncAB69oCjAjWNcbIncGOXQAubN3N8nDIJs4loRg9yNq25J6crXkKXutQc60hmH6BU
	9ag5Gzi9qUc0GfYqWNQAMi2O9GeMzlJVU9xGob+sOKdWQzKGfYqnLmOiFA6pNJWdjrviKc5h741dM
	PIk7rZmQuC53We5BOW/SobVmaXm1sEgOxlZ2u1s8CT2hFKEnP+VsrIrYIc2yBJfArC7T2fDm6URna
	S657bRjZSxQ0l/aMwWjxF8Q04NCqncKNIdU2U7+juY8nsiCqd2wodLsAphgPhGUkfE+rcU3S6g3qR
	6U+TP4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbeC-00000002sor-3511;
	Wed, 03 Sep 2025 00:46:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZKh-00000002LJi-3tWD
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 22:18:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f76277413so3342733e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756851510; x=1757456310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=Wsg4gz4NUYVHBbYZ6yfyJ7BMtHn4ZHsttXR4KzSkHzoEDMoFa9NS/Wy/DUQMH8nz1/
         3TdXH1hrA7ST70gvAM6MfUGWZSeWulSxIC6VyE/hJpmLbqQJrl1KLcukym49YVR4esLD
         yAyYD03pBlbI+ja7cp/lA6nrYx0UWArE/Xf8IcFnMZaDs7bz/dd0Wf5HAbXhsveAxEBP
         p8crOp9zlLBhzIDZn/BO9N/5rY+lN4v7jgV5MX1/uy38mLwakqvaBrBS0jZT6qGSmV7C
         dxxWLmxqEfmacZqugLwpLwvlPRv39OX8YDkhR4sVl+ytXKd4Z44SDKXvgeUk2ovYK/9y
         nLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851510; x=1757456310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=uqEwzkZf6SBfw1CAEAaW6DqnG9QWwQN73jB5NpFTAebNNt+E306IPsAmxwbGW7dMux
         yGwTtfzg8hntJvPOlyGV9/a1qlyEm/lNGKpyk38xoHxK/gKik+gXa7NJnwMQHzHGnEdU
         s6SCtyQILfk0EAp5x0Tp08GplEz1tx4ZgATtbTGZb3k0yAodfzD68j/8uFJE4dnTuzL9
         SQqGG9c48JJ+LFkintzPJ7JJT3JFCyqLjzWyPV5cf9FEiWipZDq8yzrJs98xtgtbj8gB
         gyCHJVa7y/iXqqZI7s7lxEw1Mazb5WXiINP4Bx+Oe6Q/D4U6lUYOh0Ddkt/4TsyHbsd/
         Cu2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/R2XxiSnEJu5er1anDyJIFLSFbvJUMpJ94wOhqL0i2431uLRyrvKoyFl0yaMFpBi0gukkSIwBX7uVWxOxMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK+qvB1jCtwewOpLm1uzEIS5EIKBUq5wd2YarD9F6Cjrc1mI9k
	L10sRrHjaWUtCUaVlivCXIMmLErZ0Ed29x7AdtfojFFX5b5od1jv4zyI6ChaQGMmpjR8kya7GBc
	luU/Pn00OC0IuSvyp3LtJ3ZUoJxuQGkF74dYf/hbcqg==
X-Gm-Gg: ASbGncsnObxoCzFCJtV2qlxZOxgPiPC9Cii0eQlISpZ8Tc5Zd0k3LUc2MI2gnLR7Qtr
	9mlfzohTN1n+CBEg4FwFmWPk4fiEaQOgyQjCSHvanOKgn+ATrQbWvyNwjDZjmY4Y0CUCOtm2hUO
	n6Fo+nmC8675NgxCSztxKsJwnKG+hg+b+Kct321pCdpiTs3vyLV6qxpFyO8R1E1aE4SciJvKcuC
	pEB9HwBWA7f8zCI9A==
X-Google-Smtp-Source: AGHT+IFb5FJ4SVuaW/MZYjqlxiCtjVdy/Gs9hCmULK5gWsYMbnHTDsvg0XfXKbqBDAFJs9xAYF0giEeS6uNYA+ao+FQ=
X-Received: by 2002:a05:6512:3d11:b0:55f:65fc:8db5 with SMTP id
 2adb3069b0e04-55f708b9c56mr3711945e87.23.1756851510074; Tue, 02 Sep 2025
 15:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 00:18:18 +0200
X-Gm-Features: Ac12FXw-1tPuaZxU9kVS8RfwbL5AeZ_YF1A5IdRwoR4crjvnC6JAL_oHeKPOKoA
Message-ID: <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_151831_970722_CAB8E99A 
X-CRM114-Status: GOOD (  16.29  )
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

On Tue, Sep 2, 2025 at 1:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.

This is what I want for pin control, and fixes an ages old issue
that pin control has no intrinsic awareness of if a pin is muxed
to a function providing GPIO.
So patches applied!

Any remaining code nitpicks can be fixed in-tree, I need this
to be able to apply the much desired Broadcom STB driver,
so this needs to go into -next now for cooking.

I also want to strictify some drivers using this, bringing GPIO
function awareness into them, which is a good thing!

Yours,
Linus Walleij

