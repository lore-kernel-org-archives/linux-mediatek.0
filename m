Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582E8C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfvOZ/r/9xhV2IOVZmWGdwaESTpDCIgP8OCrBiOEH34=; b=2w6Iu4q9b/iSyg1ZNvFHz0HU6w
	rNqvCp0lSNIXnsfDikSlYrEeOCwV98aXg0AhDwX+TdctJUj0FLgzfEfNP9sq6+POwJvPdXqDHqDBy
	kXWfbwngpzJyHotasG3tY+iWnd/XAXIgS0f7QkAlQNQC3qsswYgh5fwvPBwZ5k00qUO1KqazZgjME
	3bC9Ewjd+JvjwGpDrNUe5BbiG3fetFtW/ZxT0uadgngt7ZEJkGia8ek4+SsjvCqOJoyXp+UfW+pk2
	qGgwHqlQjjv/qdmSPHvZqRZnzZjJBRNz9vbsoglCsD9yXPzdHH7kVKq3jht6L+TDWrimVapd/OCYJ
	6QbbmClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IWk-007xAt-0j;
	Wed, 29 Nov 2023 11:14:46 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IWh-007x80-1r;
	Wed, 29 Nov 2023 11:14:44 +0000
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so5999336276.0;
        Wed, 29 Nov 2023 03:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256481; x=1701861281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfvOZ/r/9xhV2IOVZmWGdwaESTpDCIgP8OCrBiOEH34=;
        b=GH6datshPEelTZi/85QdarbPbRVWLbbMoQob33fIEzkm2p/yt1mOeywiwD2VmWQCS0
         ngC7g44TsADJbkjNz9ECDvQvX1i8siM7GN7wJOd/xC4fGTd81mrgcOI+7xYp0KodzQwi
         eE+7jUV5x4cff2/yH0TSD+TgC7vVvLWFmjeIZYZOBrwJP+asy8TcReQTmQx3H6FTpU+l
         Ees0XKVsprndEPKrW9Sz5vzhqejg2dgcEVsQ8YBjmLk+CIAH0rZpPvFgMgzV+C0hORJX
         AWz3HU2K58n+kSqbrqog+k8lB8t37qCxDOBC9k5JJtdvcz6iVA3nrLzs6faZS35P563k
         srnA==
X-Gm-Message-State: AOJu0YyEjwQV4iozTFEazDlDHgcq+HSJ4W85MZOuqPv/5pCawW0CG+Bs
	ChCLwV6K7prXSnmEVu5Lm6049wq6it2uwA==
X-Google-Smtp-Source: AGHT+IHScqOV8jde3ass3hclE50n+WMnGRUYQtg2hAhilbqjA+OK+4r/alsp/mbDqLuKFIjDPk0Ucw==
X-Received: by 2002:a25:fb12:0:b0:db0:2fcd:6b91 with SMTP id j18-20020a25fb12000000b00db02fcd6b91mr16822651ybe.15.1701256481301;
        Wed, 29 Nov 2023 03:14:41 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id o67-20020a257346000000b00d7497467d36sm4173606ybc.45.2023.11.29.03.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:14:40 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5cc5988f85eso67729337b3.2;
        Wed, 29 Nov 2023 03:14:40 -0800 (PST)
X-Received: by 2002:a05:690c:4041:b0:5ce:39b:84c6 with SMTP id
 ga1-20020a05690c404100b005ce039b84c6mr14916699ywb.17.1701256480754; Wed, 29
 Nov 2023 03:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-23-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-23-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:14:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhhU9ew0KXw1nYygBxTc5ucYq_rBC06=U1b6iRoxdqGw@mail.gmail.com>
Message-ID: <CAMuHMdVhhU9ew0KXw1nYygBxTc5ucYq_rBC06=U1b6iRoxdqGw@mail.gmail.com>
Subject: Re: [PATCH v3 22/22] pinctrl: core: Remove unused members from struct group_desc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_031443_617070_130CDCA3 
X-CRM114-Status: GOOD (  14.69  )
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

On Tue, Nov 28, 2023 at 9:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> All drivers are converted to use embedded struct pingroup.
> Remove unused members from struct group_desc.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

