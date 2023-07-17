Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71042EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xb2qmqc0S+l9zveTKecTCaBrQtpukHKGGQbHSZAWBlw=; b=uGaj+kOOksj1XeITCTsNbEsJS0
	HOydKKkzLNlvyVOEI49pJjDqOA/X00Qbv1fKCxARDXtWq0ey11Cc0P5d+ZEsxFL+5VY1a4d6gvzqg
	Zpd1dqZvR8u+0sDXoLnvKa5Z4eGPx6T4rRZoB/3fScJ7MqhHmPrEDInqW1CqwMTQZYGtUlEzPzRZD
	phunP/+TBZnLtZovtApMSyYfohJOqqvlyrryIGAA36yJPMB/EmmYfGFs0F2pyAnSldnT9QFE1Shv3
	0x1JgscFxX5A7GhX6dGlxr3ZQVstA7AdZV7fpLf/e33kS+Eq++EsRg43DBGkhfloaU+zfqSnsg9Rn
	bBzc1XOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzxz-005ORb-14;
	Wed, 19 Jul 2023 05:43:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzxx-005OQj-36;
	Wed, 19 Jul 2023 05:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xb2qmqc0S+l9zveTKecTCaBrQtpukHKGGQbHSZAWBlw=; b=cV/B1QgW88HbmnW1wBxCnr/4Sg
	10bDxfhaDd8/kt9RmKdZ6r3vAEgJnb0KxeYiXmVgJxCIAhywFIs7C4zMIwZanAulfQubZ7lM1siYX
	QC9WoHm0gygolU0tNAufhVFJ5Su29xRYmMln/Tuub/ysTLStx27zcD6Ju7ApK5MZ/8tCoy/cVYoHR
	6mCGlTOL/rayWaK3ypvaI5KwRYn1g4xbdiXzBBSIswafZR+JhvicTMIW17/yz6zvM2izBPQJHLRCr
	qReStUYOozTk7jDJWFd+aM8XLR4r2heHAdFy5srg7UwqqI1an3j6w4oungdrAo8Or+9zRLVB6Yqc4
	cG30ROvg==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTv5-009EwL-08;
	Mon, 17 Jul 2023 19:30:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-986d8332f50so641966566b.0;
        Mon, 17 Jul 2023 12:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689622083; x=1692214083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb2qmqc0S+l9zveTKecTCaBrQtpukHKGGQbHSZAWBlw=;
        b=BTRCe0wSjL4OnWcx4c9xtGoFBpUi/oxwv5MWrOI0B/XSq6Q6XSQI2iLkpgBO/zJJem
         g4HsijBeJwuB0G5miOL8aNMgnYql9PGrDXF/p+K960iFN36I2uRG/2fw+n73VrYXcmcP
         4HXYuKyxR+TuifXaPkGc1+W+j+PMZ/RSjgHjft5FFcvpOAYVYS126axP0DP/dzrRLPPa
         dxGaL1EN3Ls/gGOs6ARcG016+HkVHSQa4Ex77y5xnWiOL6xwXnaeDCpqh8iRKNhnvB3d
         rEyKL8YbqJdg17R3eE7IIoOb42Ds8aIV8yBilKk6+v04QpwU0DYKCsCvX4zlwxRYbI4l
         Xtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622083; x=1692214083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xb2qmqc0S+l9zveTKecTCaBrQtpukHKGGQbHSZAWBlw=;
        b=FRYpmDZb8q46Y9I2g6A5UapYfFKnKjsujHLXDQJ4nV2jKX+SPLZ8+ntQJ79zbFgMl/
         wHUna/0CJxto6n74Oas87lFc6+njiDtbkR6jRZModMxI9LUoElz2ykcclgd8u8p1m5QC
         fGhsRiraziFcJvgNpGEaR9rnBZ9N0+cbfR2A16buBKp3WYZ+mLNq/6CwEqDZzeCKWGl+
         lzxoy1bhFDBzhYLcZF0cGtlC+UdXTrQQSTE9BlBVc+zLakYmnggKVJN0fojKLLJwSnRo
         SLymUgw2AhdooSQrmHfjo15nljqqt04oHhfR9yh41CAYLfFuPR4P3zdSHzw71kfHSpfW
         ioxw==
X-Gm-Message-State: ABy/qLZNBAam1RMRnHZu+E3JuirU18B54Yp+IHtfTd5jCoM3LnD29jZQ
	x/v3SHv594tU8YUBcrM/bsMPD2hEtFMLWGGudbE=
X-Google-Smtp-Source: APBJJlGHUsCxOzwC1BXP8sKGI4zFCzyewqJILgIOQ9UMgqwwJ4S5kzJ7xxe2L/QiASSZB9oGB1E/wmdh1nID6rQCrxM=
X-Received: by 2002:a17:906:52da:b0:992:16bb:2b6e with SMTP id
 w26-20020a17090652da00b0099216bb2b6emr9690173ejn.29.1689622083203; Mon, 17
 Jul 2023 12:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-4-andriy.shevchenko@linux.intel.com> <73161288a07eb34a458061151d9d9a5c10d79c1b.camel@crapouillou.net>
In-Reply-To: <73161288a07eb34a458061151d9d9a5c10d79c1b.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jul 2023 22:27:26 +0300
Message-ID: <CAHp75Vc6yYz94dZmf2QJ3jV1Yqqw-7_47sm5hSSU2M9B2O_BQg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pinctrl: cherryview: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Paul Cercueil <paul@crapouillou.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Balsam CHIHI <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_203008_143123_770BD4DF 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 17, 2023 at 10:22=E2=80=AFPM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
 :

...

> > +static DEFINE_NOIRQ_DEV_PM_OPS(chv_pinctrl_pm_ops,
> > chv_pinctrl_suspend_noirq, chv_pinctrl_resume_noirq);
>
> That's over 100 characters, please break this line.

If it's a problem, I prefer to shorten the names of the callbacks.
Would it work for you?

--=20
With Best Regards,
Andy Shevchenko

