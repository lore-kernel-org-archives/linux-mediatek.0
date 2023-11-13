Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AAEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTO0ERk3BWfb6UISnsbuegKh0j43MXQ3l4j0lmIgta4=; b=rG2t/QrNbRAVg2nob3xEPjvArD
	CDvOQKSQDQNKM9VMI6KmTvl1IPo/1aCuyjLEDaoJnvrQyooC9shsvXWOyVQtGEOYIWi7kP7e6wQhl
	NfOjFIYkF8OyvWnN5a1CiZGjA23WuBd4uDPmt268OmV1cf/pPvqjz3VxhmoFX3wHYhJtzvBJZ3CO7
	5fviLiCtxbjgmJuPuNVrSeP0K896HiWQARrT1FxGQYlOLlV7K2WejrBoVuCSwFaLYZKRWCsbx65ZV
	zqoQ+IKL24xq9VeclHiGaTAPldCKg9TUcVu/ubQnszxcI1hi+gy/HG0/cZ870hOxBurqfKN7azTs4
	nqaTJDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2TzI-00DdIy-22;
	Mon, 13 Nov 2023 10:16:12 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2TzE-00DdII-24;
	Mon, 13 Nov 2023 10:16:09 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ce344fa7e4so2686177a34.0;
        Mon, 13 Nov 2023 02:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870565; x=1700475365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTO0ERk3BWfb6UISnsbuegKh0j43MXQ3l4j0lmIgta4=;
        b=hvHh9OD2vo8jwXvrZ6yeQuAqj+vJFKgcQYIIm4EqVpD8x085AA948k+RtJt2h2GnlU
         LKrQJtwKWIfgW1f6KixtWFpd0yDUEE9lL2QsXi3dRmTDaauUFAeSagiQwjRc96FKi5DX
         J3jsHibjBcvStCp4I44VmaKVMfFdq2AqIa8XGMyT2B89zo/11cLPwlDnu7ciOQs1IYmr
         5XTLBFAW6ux7Giiaaxdxjo/At8MA/9xqupUoAZkbgJzkVTESDmrsAJqwQ4nlomRHky1q
         sHAJmjfVUMD9ZYERrEuWG28hatjW+s3ZZKQh38LMI/wXUcPxVUFmzaU+XIXtXxIdvkZ4
         R7Ig==
X-Gm-Message-State: AOJu0YyYL6PCKecJBMSb73t2lyKhXwWpUkfBzr+4NkV6kv+0XJ9tW871
	1oDAwOVFLwVosroMz5s7GYYMXKiJczGFaQ==
X-Google-Smtp-Source: AGHT+IHv3ZBiv+tJx2dCHl6Sc+maIFzuGara/XRhdY+MgIj2ye3Cyl0YoXKg2zdlABplZnJnz0xO6Q==
X-Received: by 2002:a05:6830:1608:b0:6bc:f6d0:87d2 with SMTP id g8-20020a056830160800b006bcf6d087d2mr5859233otr.38.1699870565597;
        Mon, 13 Nov 2023 02:16:05 -0800 (PST)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id d12-20020a9d4f0c000000b006ce33dc3004sm781008otl.49.2023.11.13.02.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 02:16:04 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-589d4033e84so2202052eaf.1;
        Mon, 13 Nov 2023 02:16:04 -0800 (PST)
X-Received: by 2002:a0d:d74d:0:b0:5a7:d86c:988 with SMTP id
 z74-20020a0dd74d000000b005a7d86c0988mr6382133ywd.28.1699870543575; Mon, 13
 Nov 2023 02:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de> <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 11:15:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8nCWzTuBeSTPkR=heWqdAYrhAJ9ZgydzWNRqkTuT+xg@mail.gmail.com>
Message-ID: <CAMuHMdU8nCWzTuBeSTPkR=heWqdAYrhAJ9ZgydzWNRqkTuT+xg@mail.gmail.com>
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Al Cooper <alcooperx@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Tony Lindgren <tony@atomide.com>, Petr Mladek <pmladek@suse.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel@pengutronix.de, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_021608_682325_623AA3C4 
X-CRM114-Status: GOOD (  20.58  )
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

On Fri, Nov 10, 2023 at 4:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

>  drivers/tty/serial/8250/8250_dw.c           | 6 ++----
>  drivers/tty/serial/8250/8250_em.c           | 5 ++---

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

