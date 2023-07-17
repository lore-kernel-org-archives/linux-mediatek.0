Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CCEC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYJ6kOFjamhBvRAj7/wxocueNoAM4M+pGSMxfmWyQFo=; b=Q7LLSZbR0CRDb+S+w49wFGyv6J
	lV2I/gu5qQsN/SkDhXziy9kCkHMdJ7LcBreRaumeOq+dpRj9xkXCvfiMGYjn4XipZ9SUzgQs0bU24
	AkDV3oZ6w6h85rNbQrDESQDQIYVfptnggueqhgGCasfySKfGa961lf5k73rFTnjKDAqzD3Sd5GZIa
	flOgzCdrz4ikjgdHqY7xLZW3hUTxK1kc2lmQOI3DbpUv/l5lsNrpzhRyfV2eo7AFE2KFMRo+ix9Wp
	AXCpFyo+XqIASdQ2c8MbsQAAABE8thsErBYFPZD3eH78Xmqs/HDC2K6sbo/IN2t+hQmfdVHqXbjAq
	Ew0QpkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0DS-005Ufw-1W;
	Wed, 19 Jul 2023 05:59:14 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0DP-005Ucu-0W;
	Wed, 19 Jul 2023 05:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NYJ6kOFjamhBvRAj7/wxocueNoAM4M+pGSMxfmWyQFo=; b=nqBsaxuub1/JYmTdYIsG0F6WTq
	b1Va90RzcRA96QdbNiBKUfsNo2Qqjljl1sK7jOjwFLi+pNBAVVpmgY8LCDqlvRHRSTplOo0auEt29
	yz72bafW1ww66Cn+A30+IDeUQcw9xtp/bSAYbP9/+6+ff5iU+8ZKCZg+im6WuBCFuMb/pVZRArTCT
	9o2T4p0n2jFFYZM0u/Ymnkhscw9jJrQdE5OJyKh/RfdHzpO9QBPyV/y+3y4Wl8uyd9NAXgFBiFr3V
	SR4iP9j78EHJPaBgj7Nm4p+fIDGBqZpb9fBI3duu9MnCRWfX/nmo/CQbKZzI+nKq0PpIcGsCr/+6Z
	C8vkaiGA==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLU2b-009FL8-1G;
	Mon, 17 Jul 2023 19:38:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9939fbb7191so1009632166b.0;
        Mon, 17 Jul 2023 12:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689622552; x=1692214552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYJ6kOFjamhBvRAj7/wxocueNoAM4M+pGSMxfmWyQFo=;
        b=PIP2Rn6tpp78cegzxLwoIVwZ4FoBHshqHfqr5nt5sFzhQBvh53GF/tVZ6bCY4fOp/5
         KetATrSe/jBBRw8duCXzr0oy0PkUOSeVKHyxaTYZY3cg3IEcD4wp68j156/IDK7juTqa
         PUQQSHBBwReNEkc4GfkEqyqyUQbnEzxSq4K3Oj8piOrGRe4QbZF6bCw6SYmY93TDBJnm
         9LMTy0R/Cvm3TEhwgFe6oVgVZ6EDWHLMBpZoM120061PxwrCycG3JFe3B2ac4nC5MUac
         UGwJJulRDn+UFcdkYS1OBa9V09CD++NvoB3oSd7vUTk6IZqcVKkREUhTvZHhWd17hT4x
         0GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689622552; x=1692214552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYJ6kOFjamhBvRAj7/wxocueNoAM4M+pGSMxfmWyQFo=;
        b=Aaj4XCMWXizrqjxz4ukDRYxCCwjKo6+8ykdavcLG+T+ItgGv0/PCL2348C5ZHh/mck
         HPsIYbT15hY/0cTyjbc4P3oKQ0sGWWKYRmNUhz7XGJmdqLqsTHDGLA35+D4DO+F91wLa
         EBxiYvC2ukV5XLADEIqbKH4Tt6nftRM+0BPbYQSYisI5r8aV7TG87caIiezNlt+G872U
         /SukCGEzH1h4U+wu9oiUbRig7QOg+h602imZV7v0jmtgPsGyeufSItERF5pgFWUGKtUK
         vRxw7AR/HpV0LSlzlTjeuHJ4zH7QCqeSkQKia3cMYLARso7/sZnBW9oVBMUGQOdp1slP
         cW4A==
X-Gm-Message-State: ABy/qLbr3qeBOHweSafAzhE8LZp1yrULQcNx9+7BijkIX1t/S2FgSa0G
	nT/vogtdgzFf+Ab1FMOj7xFaS84M3UFucmJnFq8=
X-Google-Smtp-Source: APBJJlGW4673ZXUdmH9EyALyJYqmzpqtgm1SGTb0UF42kwcQ8Wh+SSnyIk9sxfrz+X4Pht1lQFCoW9Rx+xQJMZNrq+c=
X-Received: by 2002:a17:906:1da:b0:994:54d1:ff57 with SMTP id
 26-20020a17090601da00b0099454d1ff57mr10191773ejj.4.1689622552398; Mon, 17 Jul
 2023 12:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-7-andriy.shevchenko@linux.intel.com> <e356066d5e4001d5ae26a1f55996086ce0b59cf2.camel@crapouillou.net>
In-Reply-To: <e356066d5e4001d5ae26a1f55996086ce0b59cf2.camel@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jul 2023 22:35:16 +0300
Message-ID: <CAHp75VfkTUjv51MsLrZf3Zsg9Pn+6E-TkqW_c7fcwggD71RHrA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] pinctrl: at91: Switch to use DEFINE_NOIRQ_DEV_PM_OPS()
 helper
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
X-CRM114-CacheID: sfid-20230717_203801_126061_9F3C78D1 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon, Jul 17, 2023 at 10:26=E2=80=AFPM Paul Cercueil <paul@crapouillou.ne=
t> wrote:
> Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
 :
> > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > switch the driver to use it instead of open coded variant.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Thank you!

> Although you could add a bit more info in the message of this patch, to
> explain why it's OK to remove the __maybe_unused tags (the code is
> always visible) and why switch from pm_ptr() to pm_sleep_ptr() (it's
> only used for system-PM callbacks).

Sure.

--=20
With Best Regards,
Andy Shevchenko

