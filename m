Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F4DEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jUY1jEJmV3qWV/43bu9eEtdH4W6Xqd3vD9XFmNOjKI=; b=ZXVR/GXVj3JSjdGq2I0FlC49z/
	ARGL9FPSwetNUrF8AcOmCskGp1/abAmxx948crGWdFcRfYqFFfH3b/cqJlZQ94m2fKD1MQCLhtkfO
	oKRzmLqSTr1O68yascBxGhKqe2zSLjNI9yhy5k4TF7DSNrQ/zHddPs0zIxTo3/lFvql+H7VZGbdti
	UQw4b+/EscOOgVB2Vy2j6Yg+1QxsDkmzFSyTnH+/2S30gIhlwAzM3DZOW4++omeq+BI/5MAPi2qcs
	k/KBh4k/DsuEP4WyPpLarYn4IvFpnUMO3azjOvgiIG3bXusk4+1iWUE+oOVwGB05xKtOkOUVVBNKI
	74Hc3dXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLznk-005Kav-2v;
	Wed, 19 Jul 2023 05:32:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzni-005KZU-2I;
	Wed, 19 Jul 2023 05:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/jUY1jEJmV3qWV/43bu9eEtdH4W6Xqd3vD9XFmNOjKI=; b=lqt16oYAeIQa97v7SASbsZjvwY
	n9qV9Jbk2jFyI1q6tymu0696F3/r0AiytTv8rvfTqeBJJHRfqQqclsSDuk3SkbXMGo51ZLrfUapDD
	/1lfji+0Rf6fSS6lloF00MqC/yPrYEFSrSxboP1goKqDAGk5m1TgcmysPd8kQ3ZjtjBPtZsDd9RZ1
	ZXHwESoQXzP1QvNR/Yjm8orMx3ELmVJ8uu0E9qWyysrtNIwwEKD1FnnHTPWoayJ3Jm5kkOz/EL5Ek
	qtR4zVXyUmc4idBv31TYblbAENrh8HIT96QFenQ3HJyX14cbwn2iG3LiTtddtCQv1yjw+SJCaoWs1
	tTkveRfA==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTtc-009Et4-2c;
	Mon, 17 Jul 2023 19:28:38 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so73337561fa.2;
        Mon, 17 Jul 2023 12:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689621995; x=1692213995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jUY1jEJmV3qWV/43bu9eEtdH4W6Xqd3vD9XFmNOjKI=;
        b=NdT8Ok/z3CyjC/m8f+adwlKtyAxdYC3w0X8v2PC6edXelaYryvjGkvvk25uVL8Ac9M
         9P60v5TzEIgoAunufAb5eKO0g4whc+Mtqr9z1yRm7W8KfnATY0YtQ985XGLLRX143cDO
         MbyjGtOACZhukJce1PPT9FM7Fmz4M1/mIQcO5Fg+H51uMJtveBeR7cmHuG8YnU1+94uP
         kTMJKEX++PzPpf1PSnOd2sY9qNU1W+up54S2meOebzWFVAUfnkjGtIIrD8tPRJaQEMc8
         C5+4eL+4dMnFh5OxbkYIkIKTHt3L3u0rvxt5lBZkz1G0yIo5YVaAFqx+Yb4N7CoazIxV
         MKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689621995; x=1692213995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jUY1jEJmV3qWV/43bu9eEtdH4W6Xqd3vD9XFmNOjKI=;
        b=klqXv7iwzFQazEfMPYKbaBy8GZzwn1vY6pvnJWznos48NtGOojXEyysJoUoCIiRtjQ
         8YO2ko6RYMdOq5Pq+rw1yHgM6bvhyj0Jjpm5r44Z3Nbw3XRkz2O1CRPn8enChXF1VAYL
         xQ5hB7pdA5/ox+1HT1WlhaGM6bhRqloXoEETrF5GxKyjYYcbkximNiZNJrCM7ufWp64C
         20WZuUXDxC83um5vV0OOaamImap0AGQa+pedWLqv5sW+ymfiVh6KbW/xGQoUhZQKG9xq
         xl8MuVE9x/wD0FxcSjLB3H2y/dqTqQO1EpRC0zN51EyzLG33BJgvjk73wgVRCX8b7lhV
         0rZA==
X-Gm-Message-State: ABy/qLYR4QmkQQzlFdT7zVAD+8RemAxB5XQlfRGr+J0uvvwJmAweO1Pl
	Yk+D5scgqmvmxhN9tnZKxpAMBG91KsMQ/Lh2/pk=
X-Google-Smtp-Source: APBJJlH2RTaXZ3hTVITWgLRumGcexov0CNacaQ45uBlxGr0vGAsIESz+PDg2BypvK6Yznkn1rI3VBaMZjcwjiZdYXdQ=
X-Received: by 2002:a2e:8416:0:b0:2b6:a827:164f with SMTP id
 z22-20020a2e8416000000b002b6a827164fmr8225340ljg.10.1689621994680; Mon, 17
 Jul 2023 12:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-2-andriy.shevchenko@linux.intel.com> <a9c7064df30215878925206751a4017830938ede.camel@crapouillou.net>
In-Reply-To: <a9c7064df30215878925206751a4017830938ede.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jul 2023 22:25:58 +0300
Message-ID: <CAHp75Vc2m48hcU_+3Kyt8-M-4CQUjXbpbz6VMSWpH1kbn_Fjkw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] pm: Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper
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
X-CRM114-CacheID: sfid-20230717_202837_098545_54F3F3D4 
X-CRM114-Status: GOOD (  10.33  )
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

On Mon, Jul 17, 2023 at 10:19=E2=80=AFPM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
 :

...

> I'm not really sure that we need this macro, but I don't really object
> either. As long as it has callers I guess it's fine, I just don't want
> <linux/pm.h> to become too bloated and confusing.

Isn't theidea behind all helpers to simplify life of the users by the
cost of bloaring up (a bit) the common file (header and/or C file)? As
cover letter shows, despite having several LoCs added to the pm.h we
saved already a few dozens of LoCs. And this it not the end, there are
more users can come. Moreover, there are some deprecated macros and
those that starts with SET_*(). Removing them can make balance go too
negative for the pm.h (in terms of +- LoCs). So I can't really
consider above as argument.

> Anyway:
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Thank you!

--=20
With Best Regards,
Andy Shevchenko

