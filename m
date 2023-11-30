Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114E6C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUdP6LeO/4HAezqcq7YXUkxax+n83AqIPO6DNMdfcCg=; b=WNupgrr5q8n5qiimbr0dLXM9wo
	vnz44l+/yefF/T6MATzMhWrlKQ1G5MRRd0hy8T+hO6DjwD90z18b+40yeXpE6UufVSxtMXAODKpM9
	84+8YJjzXTBFeKK3YkwU+8rZ9UWNt+mRvrQT2SqNk07s1lyhMuPPxjFWXFZMLdbe2wDiz6Dejtllv
	Rtyqnf5IPmH87NlXcWgHvE2NihJ/ZGaQO02Bd/raKRoJ/UDNryQ1ucJuJ0NTXyLj4xQypNTB9kOFY
	HC+drHHZ+kVyJMTcZfOrkzwCFR4p9M822f+YZQ/IgPDEFj/jbwxeqsIzpU2VvjwUPqB/0F2p6Rbit
	fH+s4NiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eO4-00ASZp-2E;
	Thu, 30 Nov 2023 10:35:16 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8eO0-00ASYA-1t;
	Thu, 30 Nov 2023 10:35:14 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5d2c6c1ab66so7921057b3.1;
        Thu, 30 Nov 2023 02:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701340511; x=1701945311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUdP6LeO/4HAezqcq7YXUkxax+n83AqIPO6DNMdfcCg=;
        b=NqKRK0LOgJ+zCY2ZZMcdqqv6nBQlakoPpa1ziN5b6G2PtkHYS6DgCPgXGoGtsXhVjb
         uIHvJ+4fJAUQ0mv6uCfDSu1JizlqxoBUfK6SM/CcW0CdrzZfQMunyjo1seP4FTaEGVIq
         2KfC4vgzDyjrut0fFHNOIQY+LlMrrsEf/bNBfWzhODFYzjD2XiOGsfNoZ/xiaZmDYreS
         h1INTwTRitc1F3Y6TRhLdTbWDern2acJo1o3oU1sGKl9h2WcV+0So/PBQRd05evee+zd
         g0WQWlB2560VYxdIGP41rZfDZq04P4qeLiXAQfSO/1DgXLRKBnR0GsvlGOTqtp6fVxmA
         Y5xQ==
X-Gm-Message-State: AOJu0YyCnPAef+7h4Z6+UfwfrBSYVbEuPRK3CZ5GYaccs8fEEJCfM5aU
	QMvp4V5VUdj0YncifXHhzyL5HZ3ZnHKWng==
X-Google-Smtp-Source: AGHT+IGZLYaFODApVd1sS55ME+7I/fxbLE4qdNYH7UzlActvJ3XiVfbVUhCUC31vnU4CwpknbF2X0Q==
X-Received: by 2002:a81:ad21:0:b0:5d3:a54a:3aa7 with SMTP id l33-20020a81ad21000000b005d3a54a3aa7mr83370ywh.14.1701340511425;
        Thu, 30 Nov 2023 02:35:11 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id d79-20020a814f52000000b005cb5cc39945sm277537ywb.23.2023.11.30.02.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 02:35:11 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5d35a952943so3670937b3.3;
        Thu, 30 Nov 2023 02:35:11 -0800 (PST)
X-Received: by 2002:a0d:cc4f:0:b0:5c9:ff96:d78b with SMTP id
 o76-20020a0dcc4f000000b005c9ff96d78bmr21925523ywd.37.1701340511007; Thu, 30
 Nov 2023 02:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com> <20231129161459.1002323-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231129161459.1002323-7-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 11:34:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCEVrg1Dsu9u-cECyXJP4PKXkXibU0QK1G=+juwG9rxQ@mail.gmail.com>
Message-ID: <CAMuHMdUCEVrg1Dsu9u-cECyXJP4PKXkXibU0QK1G=+juwG9rxQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/23] pinctrl: core: Make pins const unsigned int
 pointer in struct group_desc
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
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_023512_648929_AE6702B5 
X-CRM114-Status: GOOD (  15.57  )
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

On Wed, Nov 29, 2023 at 5:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> It's unclear why it's not a const unsigned int pointer from day 1.
> Make the pins member const unsigned int pointer in struct group_desc.
> Update necessary APIs.
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

