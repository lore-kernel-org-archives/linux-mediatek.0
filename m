Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C88EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYQ8MaDMGhvh5jrKhzRgcfiYyE0M1SG6+4azBMBqudI=; b=4pGfircMH2mgrtP81vikrp2Hht
	4C5Ac9zs7krOiRpKaeUih9LKUs81VXjXOFye3MnvH7YRo/Sc5BuwZtxkrKw8cVYfAQR05QXSMHmKz
	eyJsqLR/udocn1657BaPej3YyanXXYYMQZKbKQ/fBLe0qEv7RNlpFB62R9fEXN0kmpMeZwmsTDQhd
	XN2AbMP+dJTaeitn12tHVip4lw5UTR4N4cLkeuX3zmuA23Zmc4AnQ5vcE6a6Xp61KPdgNMajnEU3W
	MWBF+Hfem8ZB0jwIHanIZIy2b5a/tnlMbhEWi4jRxLWZ7maL75svOPBt3X9B50moevLdolLJRtoKU
	jJtJzGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0zJ-005uOl-0x;
	Wed, 19 Jul 2023 06:48:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0zH-005uMp-1g;
	Wed, 19 Jul 2023 06:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gYQ8MaDMGhvh5jrKhzRgcfiYyE0M1SG6+4azBMBqudI=; b=P/2MksvXeGOc0J291l7sK/6fcJ
	fLyiB9KlUjdEKZxmqAhYS6pufCSG3KlndMLlCgzUMF2LY7fY3fJNu/SDxY84knB42LygTyy46iIDf
	SX8yU8w2AW4A7s+ed/IitRBqsEwc5cKcYSzO9CYJWcE6RJ0uIcWHFhQnFaNenlii0TXCGFFLF6csX
	VV/bW8WVmTMFzdc03kSuMp0xu76YaRkfef9HEvjy+umzoMvcIV7mTvKD0PU5+viWv27th8XL2SzHp
	Q3oHzM4FJX8udEVCgkc+wMGIMQ3xut2ru45O9Wa19PI0piuS5494N7KdxO8KYdz/653cSb2glAqSS
	q6ZA5saw==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLU1B-009FF9-0e;
	Mon, 17 Jul 2023 19:36:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-993a37b79e2so664262666b.1;
        Mon, 17 Jul 2023 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689622464; x=1692214464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYQ8MaDMGhvh5jrKhzRgcfiYyE0M1SG6+4azBMBqudI=;
        b=CmYsV+OUNE6OWix7qWg2NF9ksb+D4FwJEZz5BB5Bt/eEtlbnBpWxzX1hjxX7GWMqbP
         QBss3SAYbf08ZGFzeGlGu8svA+436HShSfeRePvPl/5SsV4Fi73RrXgNqWoj/5aAHE+n
         CSqV+P/yUXwSn/vt9QkACzC/YZqH/RF4Va2KFecfDefZJ1WQtq4cOWU0H5x1WXjQAXaf
         X9btZnmo+RiAnZHQWN0shbzijTaFo7v1aF8zdleQKC3A7KRH+fDuqbGpdfDBIhfSpKuY
         DdyLGY2oKZR3HC1qyeUtfB1POtC2MdmqdDR6cz0tcGI7drepjmRZnwDYY8bZV67pILK5
         vbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622464; x=1692214464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYQ8MaDMGhvh5jrKhzRgcfiYyE0M1SG6+4azBMBqudI=;
        b=MtlqxuWYtAzq2nGSNLaa2JIEAICe+6wKgOSEUaKfdMgRZS4X8rcThdzgHvE3j+M3qS
         bhsJtI1Skr+MO7yIxR2QQcVgRKbtqig76weKItcVwzpDUfkHcbD+mWJ8HjIC59/4G4Os
         8W2g5eJMDrEO2b98Yq20cuiZi4x2mUmZvuPiL1ni7rahj6znuqDoC4ABlbzZcUYbHPUW
         dQFoyeCh57TD7+v6EQsy8XrqJbl6Rpi586RRicPBSOOVbWjv3WYF07ICNw7MnsjmJ+Ez
         TUkqGdX6T4SW6jesyGBxJQFe8Nq3yzEkAwoYmXgLbKHisKiXIA4gQEtOlqk3+/LMxgH6
         y/IA==
X-Gm-Message-State: ABy/qLbV3VMaA4DuYzcFVPpELCHRMdf/+8/VAKHJXvGBbGpSHK0zDKN7
	wZuxZaJcqKIsouNJCQf9kPM8dqaK9yUJRDHfj70=
X-Google-Smtp-Source: APBJJlGurTqxANGgZNeReihcfNiVDUQt3bLiY5il/O2f15miMPKQEnW6eArvtv8YdY0XGgskr4ratb3Fb7Qvh+aEAis=
X-Received: by 2002:a17:906:841:b0:991:cfce:7a09 with SMTP id
 f1-20020a170906084100b00991cfce7a09mr9440149ejd.67.1689622464190; Mon, 17 Jul
 2023 12:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-5-andriy.shevchenko@linux.intel.com> <c47c26ba7ea5bcbdcbe1d001b6cc527cee6c7d03.camel@crapouillou.net>
In-Reply-To: <c47c26ba7ea5bcbdcbe1d001b6cc527cee6c7d03.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jul 2023 22:33:47 +0300
Message-ID: <CAHp75Vcjq9=Q2_fsGJ9oCw=WYR3p3ot_cNLiDJV93psNcXXHLw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] pinctrl: intel: Switch to use
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
X-CRM114-CacheID: sfid-20230717_203627_812078_61C3CE0A 
X-CRM114-Status: GOOD (  13.87  )
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

On Mon, Jul 17, 2023 at 10:02=E2=80=AFPM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
 :

...

> Unrelated change.

OK.

...

> So the correct way to update this driver would be to have a
> conditionally-exported dev_pm_ops structure:
>
> EXPORT_GPL_DEV_PM_OPS(intel_pinctrl_pm_ops) =3D {
>     NOIRQ_SYSTEM_SLEEP_PM_OPS(intel_pinctrl_suspend_noirq,
> intel_pinctrl_resume_noirq),
> };

This looks ugly. I didn't know that EXPORT*PM_OPS designed that way,
but it seems pm.h in such case needs EXPORT for NOIRQ case as well.

> Then your two callbacks can be "static" and without #ifdef guards.
>
> The resulting "intel_pinctrl_pm_ops" can be marked as "extern" in the
> pinctrl-intel.h without any guards, as long as it is only referenced
> with the pm_ptr() macro.

I'm not sure I got this. Currently drivers do not have any guards.
Moreover, the correct one for noirq is pm_sleep_ptr(), isn't it?

--=20
With Best Regards,
Andy Shevchenko

