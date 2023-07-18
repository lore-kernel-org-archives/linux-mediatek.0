Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0E0EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXaT6APHJQXhpbwZ9c1qIYiSYwOvNOpb+GN5TESf5y0=; b=F4/NUiclH0WE5g4wXSmJg0P3Tk
	c0RiE8ECS/0oBNL591fYb3k9vvvE0hyfuZeR+t5on2o4xtIMiC5VlJnQIqwfwqimFuZwlCmFQmVTu
	OGPg98xlenM8EEBgcU/mEctlz2HaoeOAzkFT8PZtrbLXEJFTPC9qaLhU9FaH+252DzwcNLeaYtM1M
	1uDrn7wHRwq/cpC9B/xKmJs1J3EuyzE4rRvWRO5KFWiXEsnrY1SI6B5uumKlXdhEqwIXgFB/jhJ0d
	momO9j3ATWOMILobYl2Taj05hhskxwLTBkGGtcBwLSxbharJnOeVTzHKtNG1CbHZBs/D7xtgNzbnE
	faV/YuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0s8-005qYM-1L;
	Wed, 19 Jul 2023 06:41:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0s7-005qXj-0v;
	Wed, 19 Jul 2023 06:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WXaT6APHJQXhpbwZ9c1qIYiSYwOvNOpb+GN5TESf5y0=; b=RqvUet4SjEx50fh9H7iQxhnvaF
	Vv0+COFqNm8Dpvn2JMETCPvoGiamhUMVw0JWCNBdtGuLoqMONZ2uJLCBQL9xFD2iKnO+NNGtjjNK8
	xGS69JCoTKgnrl22hNmWcp6gSdMFEfAIy2VfZAfZ4Y2TuNvjM+QcfUQsXeukIJjiI5IF5szmeC6/u
	8FxK1WH20W1zpBLbvrPqh5cD4fMIXoT9eGXxWHIDFYsN5oA31dgPB71UmYErL3H8m57W0uNAanrAt
	qWoFgUHmL4TIDWOH9/CRbgex51dpPC1sl8wQlk7VyYPh3h3hvq+qTnhHM9gRWiwhFUezIysazUX0p
	qCfp8MQQ==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfRP-00BGdD-0E;
	Tue, 18 Jul 2023 07:48:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51f7fb9a944so7559740a12.3;
        Tue, 18 Jul 2023 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689666374; x=1692258374;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXaT6APHJQXhpbwZ9c1qIYiSYwOvNOpb+GN5TESf5y0=;
        b=kuUL6qubC4aVn22O15bxQLyYanj97a2vktrajCEMYVHyKka+ggyEPUfBwU6TJ1etlo
         /le1HoC3ySgmofs9wboZlrd3lr6CNNlhWLqpzpU+b8hRrbVPfNiz2jF1BQ+XUVofm43n
         rik5HU+yZMK2RPDKqQS9Pk8qhmThEAoDee1tesR1TMtLiQT6WT4bFijDhxFmv3WGXdU0
         4FUT6ghKiWCkdUKVS1nMFcLsT39Cj31+5rgAmjZ6UrHGEHtGWcqyGRWnosMwRupt8M7z
         cJD+JB0PT2uI1ncMuS9jHL619hKLBVvo8nx2MAFv3zCnbXpuSVABGv0x/hE6r04doVUB
         E3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666374; x=1692258374;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXaT6APHJQXhpbwZ9c1qIYiSYwOvNOpb+GN5TESf5y0=;
        b=b0KMWRn2wMugkcMP3M4h5crXxmgSq0CNfY5bGTi59f/FQTzFFqKfnAzS1c0wCPoGRK
         T122zOa9l7CD4s6codCxOCFgGxGmXgnB7DrAbT/DATC0aIrBTGkqtFj3IW3q3Orpj9qs
         1AFCJ+nUkIs3ZrqfAbIxo33r9eE9/6WERNalQp7iSYBWnjF5JQlTFkUqvnuGI4ceXc5v
         BwqydRI6rKisOo7u7rvj1y7MiAROnyasG1JuKtRGM3tzGIRBH5bhj1dEJ/XhUTCNm8+b
         bxZC1xF/itEayYuWP+CvXrbT45mCVnP8z5mOZPQJosEmEE7ZsYGMfCjpc7jfY4EzcHmi
         97sA==
X-Gm-Message-State: ABy/qLai98eMDlf5PZWYbhdkqWYLYUPwE+Ay8v3Tg6sWUAnzQcLWiy2Z
	UMMafYzmlqSK41E+2sahYRE=
X-Google-Smtp-Source: APBJJlGEfvRTZ1qi772HzYEzzIQoZO2W4jSwQ00uCNhfTuToM8Pe+1d/DyRPiG4wclpp5+j+MPeKhQ==
X-Received: by 2002:a17:907:7704:b0:992:c8d7:b66f with SMTP id kw4-20020a170907770400b00992c8d7b66fmr11300335ejc.75.1689666374008;
        Tue, 18 Jul 2023 00:46:14 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906860300b0099290e2c163sm638762ejx.204.2023.07.18.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:46:13 -0700 (PDT)
Date: Tue, 18 Jul 2023 09:46:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <ZLZDQ64QHsNi7kra@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXrLK6/iTZZPHAap"
Content-Disposition: inline
In-Reply-To: <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_084815_484934_09CE372C 
X-CRM114-Status: GOOD (  13.40  )
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


--xXrLK6/iTZZPHAap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 08:28:21PM +0300, Andy Shevchenko wrote:
> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--xXrLK6/iTZZPHAap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2Q0MACgkQ3SOs138+
s6F/xA/+I0bEAIZvtYSJbWGW3odYR79tYmCu4u3Def9PnhZ4sLDjCh4N3pUGz/hc
cmQzv/IXBSl8Z2xpnAmBCZHdz6EzsdEpaGxaykNyskzO1ABDIMw8YkkvN4vA3f+2
g7NOaof0vdyf0n+Q6AtdJW/2KHVgwJSGqkfRVHHajwLJOZtCm1naB5wThiSCKz1a
ytHyYiYwD4Os1zh2dD2EXJ0Ezz/+XkjwdTNoTaZZvaxvIyo3IgX9K0cXX2wzpMr+
asMkplyryGX8LfjKcExpiPotUPGFUFwN93gA6Glg8PDdqRU9I1ARbTmlqlSld+eT
V4xy5I4DNKeU8Zi1kN+umHEkhaZg2bC5ZFG8GHgmcTbHogmc5s3AB4nHmIr6geS4
/zYsU7W/0wdR5fUF7Umnbe/DX0Tss27ntqbz1aEj/p+W7E0QDXvT4LtUKz5SiJjs
8gcdP8h5ZM4Eji0+UlWlZX0JVtg3d+48FefiuaEf43gBJXrvKCZTlLNif4JEUzAZ
cflDyd3QSeKNEXTVPKAju5++znR69t+PhlyrGqNkeEUhQ5RgM3O3CCbJuhuaycn7
hZaNEynqbxNwQoeIXxfQ5a/i38iRosZyLhdVQt52YE8ON5Y3sl18Q4nXjvCTTQd8
uPduIo56wHEd2064KmnQP6oWDa+ceh8kJI2/qmNH0xk15QYSVF4=
=NQCN
-----END PGP SIGNATURE-----

--xXrLK6/iTZZPHAap--

