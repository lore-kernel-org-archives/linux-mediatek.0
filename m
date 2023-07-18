Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB78EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeNzcLZcbKq2pijVIKB1EKgYyt490I0ItiXqddVq1sY=; b=pBltcKsJXzbUvk1N7/rVJ2vvUX
	6zXasifmn8HhIzLOf4AVf64O5JXV8KkGDoDqzfZx10lWkHST5seRGcniH214czQl7oudKXT6nIBXw
	KWmdLM/Wc/oxkVPqkz7oxIMEpRkFOg4hvXyyByT8xzrUT4NLGzI2mObD3V81WCX9Cfxhhiv8e9X4j
	wZsRTqqG4FMGGV8x1i5RQmxbwGB/Of1R9OREWXTcp4G2etsqsMVq2dEU8cZQTKPXhnCnNbQfLOdYt
	3l98v7qkIShZpMWEhskkQKjEgzoa3Rw4oVdBj9Ri+Coav5/UNflAJOyeQJOSwt0x9Pu6SjlAdWoZM
	SFR3NZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0BC-005TGg-1a;
	Wed, 19 Jul 2023 05:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Ao-005T4r-0i;
	Wed, 19 Jul 2023 05:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jeNzcLZcbKq2pijVIKB1EKgYyt490I0ItiXqddVq1sY=; b=fHqfFB8mSIctBiCl3zWngJx6jz
	6rO6H/CNThcCPTUMmybm4TQGSArMMxLjdPDG1+Ttv4pSfK2R8hcovwgFdJyiFrR0P/YsMZCIh6d8h
	EbgetQCMzpOoQA3/rHdpSpQh7g60/XbW457HwdW0SWyGe6Tv0UlJLMEmxpYVYe+O9xko0PZ9YGnUH
	e8CGi67uKKpmSPwhIApvdZHOsshNTQ4xNo5jvk5IyGCykzmZS0EXA/heK/AmHV4GLXDzNsKIIrSHf
	b3u49OYVkUh3OKvyMCTbiK0ESTjS5T/T7XoqdUz5t09afAy6vXuCKUAE5OtZ3lwbWva5RIxGrSl5D
	kg5ePx/w==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkR1-00BZ0V-0w;
	Tue, 18 Jul 2023 13:08:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e5d9e20ecso8131581a12.1;
        Tue, 18 Jul 2023 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689685627; x=1692277627;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeNzcLZcbKq2pijVIKB1EKgYyt490I0ItiXqddVq1sY=;
        b=rP3r+2F3AtU9GAGdeWWs0YgHxvEURd130cvktz54GM4lnMwxB516TsdaJesy7qaCjI
         4+/0VA7N1E+xSOrMg/fBoenZaTAxuz/SGcNLFSOIDOm5QPNQEkDUDYxubU1L4nKVeJCT
         9SlVxT1pcW1UiuADjAqmAQzHTEPvaOG65NnextEZL4bbMPRbdNKjl7BdP5lZxvNAZbKp
         aKLkq+HHEcl4JTCu5ZsDHiBmEGrGh+BqvSViUWI5WXQ5x6ucFXmHJ2Ro7TNgZawah+n4
         OcU6DeeXdZaGKG71n+iyijDAz2E7cP/gSjoGVApK3JrKMl+N5whq11HOy6RuYyp/jUys
         8m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689685627; x=1692277627;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeNzcLZcbKq2pijVIKB1EKgYyt490I0ItiXqddVq1sY=;
        b=bnhcXKsOQsUVh+C8Ry6oN8kDuMFWbwpuAQ7WLmE+TpeApBDKQW2lX1qv8VuZkQy7GE
         ymNEuvTfiO19vHFnA8hS3HBCsJ6b7q750Ok3x5U+nRy8rK3dAkB7EbnqWzdbwW/xSETm
         TzgDfkJE+yLuT/S04JyyrNmpu4asLQJIyLcdGj++qUvAw4BQvySzCHlTpANNwKaylS/U
         dD6OjZueH+akO7NIlpCCYQenBNkOuDCOnVK3FKlIlYGl8XRP/6vTOg+53KgbRMaVnel1
         jWRq0aoid0XJ4N061V2bdyiTd3O793s/Jr8GZeElCzZ3hAUQNk7WklcNuMo2JIPirdZq
         OzjA==
X-Gm-Message-State: ABy/qLYvGAAsvWeEBr6vSDrUSdHSWQLUNTulsPqTA8CMSzTeUshwS9Rl
	zzgLa7QNcvABbEvxFBQWEjI=
X-Google-Smtp-Source: APBJJlEiPfshVtSNYkP8OH436Zpce1Qp7nrenoouEBdZbfLSznRPVQG3AGuGgTjKso3ViGypwJ6d7g==
X-Received: by 2002:aa7:d38e:0:b0:51d:9dd1:29d0 with SMTP id x14-20020aa7d38e000000b0051d9dd129d0mr14765841edq.23.1689685626590;
        Tue, 18 Jul 2023 06:07:06 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v18-20020aa7dbd2000000b0051e0c0d0a8bsm1218465edt.7.2023.07.18.06.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 06:07:06 -0700 (PDT)
Date: Tue, 18 Jul 2023 15:07:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sean Wang <sean.wang@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <ZLaOeCI4cp79wfiH@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
 <20230718111143.000067dc@Huawei.com>
 <ZLZ5obLK89E1S_2R@orome>
 <f002fe945307d0904bcee8bd1f21d9e589d32ffb.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cxQ8UzeWhjJFmiXC"
Content-Disposition: inline
In-Reply-To: <f002fe945307d0904bcee8bd1f21d9e589d32ffb.camel@crapouillou.net>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140811_760490_CF3BE643 
X-CRM114-Status: GOOD (  17.60  )
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


--cxQ8UzeWhjJFmiXC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 02:01:27PM +0200, Paul Cercueil wrote:
> Hi Thierry,
>=20
> Le mardi 18 juillet 2023 =C3=A0 13:38 +0200, Thierry Reding a =C3=A9crit=
=C2=A0:
> > On Tue, Jul 18, 2023 at 11:11:43AM +0100, Jonathan Cameron wrote:
> > > On Mon, 17 Jul 2023 20:28:21 +0300
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > >=20
> > > > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > > > switch the driver to use it instead of open coded variant.
> > > >=20
> > > > Signed-off-by: Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com>
> > >=20
> > > No pm_sleep_ptr()?
> >=20
> > pm_sleep_ptr() is pointless on this driver. This driver is selected
> > by
> > ARCH_TEGRA and ARCH_TEGRA also always selects PM.
>=20
> If I'm not mistaken, ARCH_TEGRA selects CONFIG_PM, not CONFIG_PM_SLEEP.

Indeed. I suppose pm_sleep_ptr() would make sense, then.

Thierry

--cxQ8UzeWhjJFmiXC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2jncACgkQ3SOs138+
s6Ew4hAAl5R17Bggr3INa4txNS6fRJHBAZkJ+mWhS+i2rp5oJ52oHctOukPe3n3x
pLZ+YCbflBOYqF9kNA5d6t9ij7t6oc5OXj8gfSxn9EB9I8dGfYHA67fX2ul7YyWG
cWN8YivHIXUJrSl36ZyUbzLx5PIUwQzMPiKnlMs91l3CyiLDDUC57vhhlAkxBjsa
pS7jTqHWQgv3wvDXq9hPKm5vHioJsaMninnzlicJyPPKEklTJuPt8ztxEuOoKrXJ
R92uAqURS/sp65HGBajYC/zytjduCjCLCaEphlRRvUpgDzI20LYJ0ozzPCkxMoee
2J51MbQlOAOur28EjjISkUtU6lPvved5XzWPEvNcya8uwxgfpCOFbXMycYawqkSf
8+pWkZJAAF9uDchinQwEl82g19NndHZ049YWwlqiluDURZqVAGDitkRBlYRiIhpe
bApEYaQed5NIDRZ45MohoZR1bcCUcN8SCTYeiM7buOH+JV7fvWIZJHWhcATTCvUj
kKWgl5fnMPq2a5F5346roojgESbtWuauYKzvGqIMlqr2wTe29hrTY+pzSsqaceSN
TEwu80frLmy+a/1OzgrQtAhZ14RmpP1XlFDHkipJHNFIRSF6pc2SsRMrRggcKJVA
LgXuPi7IxBkI763YIoGS8f1k0AkVOduCSe3hTKXM17tRGoKMzY0=
=JFZa
-----END PGP SIGNATURE-----

--cxQ8UzeWhjJFmiXC--

