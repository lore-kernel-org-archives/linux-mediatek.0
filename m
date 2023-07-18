Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADCEC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytViiwfcWe6lsyfyDSaN9OoXNWJryJiZznNT0Efms7I=; b=pdcJ2rPogJKJGAbROMROHmYSpW
	/chcudF6hfeL+ZwWCuv/IlAfwf7Cbd1WGTN8/G+lVnUDJjRA4sA7ZBeks/EKeNAT9UXFKUK1O289s
	VarbR5Df3ciIo50rLI2KevukDjcSYwJHe7f5n7DLt5DcmU0OXtaq4fQarq63H624YOSIW8hrE0JP5
	AGi5EeOKuatkvOLzbAuCyNzFLW4NEJFdR851+7qGzFtF6zDka63ket3zGAkPCztqyq901w4ewuHtw
	MhCsoReaKIgvfCXkoMDW77nxPH4DKlvsLhchT5ayM4v+zWBHEMGFk6GEECK7iDeDbmeL1u84GQoal
	K4la7vOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzIu-00579s-2Y;
	Wed, 19 Jul 2023 05:00:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzIt-00578t-2N;
	Wed, 19 Jul 2023 05:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ytViiwfcWe6lsyfyDSaN9OoXNWJryJiZznNT0Efms7I=; b=ZaByB2XkZFiOahu+KpEugOphof
	+6vZsRZXsznSAB7HpG9KAn0BiHx6PbYURq5cMAVMeldY8Hm5nfckhnptiCPjYq/iu3FF4qMoV8Vs8
	5KcGe8TMt3Bsyu35p4ORwJhgtoTf5wCDJkShRK2nXoeYU2tXWjT38TTeQACqNjN5KZ9UbFJZ9gD/Z
	GdgdVy/uKUNNa/MSSY1T0DkH1Zpw55lQSe2EXuQ30ttq199EE/aar+11nXb2T0Zo2qsCQzswasal3
	nxs/1+hUO6alAWcaWmxJ+UxN5fNCn8slAHxEjO9WPwDijawOibH9zj6I1ZVTRCH1PTbpOQMy34uVZ
	ZtjRvPSw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLj4J-00BTJa-0L;
	Tue, 18 Jul 2023 11:40:43 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9923833737eso676157766b.3;
        Tue, 18 Jul 2023 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689680292; x=1692272292;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytViiwfcWe6lsyfyDSaN9OoXNWJryJiZznNT0Efms7I=;
        b=UH6/jNT6G/IyXGm0cDcz8bMGqhWZEcRoDl7YEmT4RLClO5FMO7umKh3Ngtz3zFW8gN
         I0WNIoLjxncgOP5/cofemL/NG1RKHN4lCDDGPCL6kM3Rj14wSajZzVTnSLX9sE9VO4Y9
         UQGo5AQBJoFaLQAK8kdRMoVQ+MNoeucfKLjjAXzovOPSdeF8l4P7RtYgS83aaXGJ5suT
         kLR8SPe9ZSXCoNebACKkqT5ewGJYPxlRQpigC+nB//bkpsVFtd/ULixpqjsXjv6gKog0
         xaQUKxLw2ODCfSaJnO6d1l4/zCYOMYUXkCl4+UDgjBxPH1DowrrJ0y81D6jo3dMoXRc6
         fPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689680292; x=1692272292;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytViiwfcWe6lsyfyDSaN9OoXNWJryJiZznNT0Efms7I=;
        b=lXJFtDYJDMDivMDhf+E3vphIUVqaiph9TL058zKDMwrBrq3/zPwI8Xq2W/VYU39IPd
         TVdbX57uwTsLq4Ng4x8IReU2RL/ZO4bInzi8IOyMbbt/bzHVhmeMPIWF1QsTrI2WzX4A
         hbQtC6nHLSIUC8d+QUP/5sQnlkj7mGECy/8swDjR671a08jbz3GuemaHLBguqXR/Tn1v
         /Oi/q4F6Vvc5m3R2xYwY91ijvRPmyFY/QDQLBChlpUzz9oJBG2ajFB7+kvQHKexjG/1b
         ZawtI5BKkNpL9h2OCTT9sKJcixzLBFV7+vcobEuyzH3jEeQwZBYXvjRcrZTlct81Oa/c
         vamw==
X-Gm-Message-State: ABy/qLYHePHKBMJGQPCPtPtRTq3bi9tWTcNtuiZxG8fteMeeEKuimE0B
	nCtrQqcaHrXxW1AGYJ2kbKU=
X-Google-Smtp-Source: APBJJlHJRSPDt4M6wS2e1KWsyePiNebOZ7j3ub/iC5nCKSHaAmmccwdmBc9nzeQ3r0OPWw7mcHpIAw==
X-Received: by 2002:a17:907:7413:b0:96a:2acf:61e1 with SMTP id gj19-20020a170907741300b0096a2acf61e1mr13582422ejc.64.1689680291722;
        Tue, 18 Jul 2023 04:38:11 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709063a8e00b00988b86d6c7csm903639ejd.132.2023.07.18.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 04:38:11 -0700 (PDT)
Date: Tue, 18 Jul 2023 13:38:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
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
Message-ID: <ZLZ5obLK89E1S_2R@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
 <20230718111143.000067dc@Huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P74v0JVNv+vvpyMH"
Content-Disposition: inline
In-Reply-To: <20230718111143.000067dc@Huawei.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_124039_480822_91481613 
X-CRM114-Status: GOOD (  13.14  )
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


--P74v0JVNv+vvpyMH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 11:11:43AM +0100, Jonathan Cameron wrote:
> On Mon, 17 Jul 2023 20:28:21 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>=20
> > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > switch the driver to use it instead of open coded variant.
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> No pm_sleep_ptr()?

pm_sleep_ptr() is pointless on this driver. This driver is selected by
ARCH_TEGRA and ARCH_TEGRA also always selects PM.

Thierry

--P74v0JVNv+vvpyMH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2eaEACgkQ3SOs138+
s6HN5g//Ywj/wrs+BJr6VMHiLwbiRkA7v79ehOPzJ4OJUIYi3+1MAwmiWoFhEAcl
/T/eouCmHEic/yTcPLdI+J281dGNEtUfBocjS2bjIDVmEJLxdEQaj9etacJ45Mcb
IQYvnbmISFU6pJmF1TGioxkM6hSkHYpp1UNTAj4zZQZHqTGnk/NqOuEDIbht89x0
wQB0lbP9v0MshiQFj8QQKzDL/Q1nfrMzjAuvi9esT8DDqxNXWObkxqhNsJWxvbzV
a170XTFD7jE1+aTHyWt6KL2OtbLl4hKm4oyuyJsgGuW/NJRCIdFLyOfjPZ5bDWSS
tpTQcbvkjeGNSLjbZHB7cq8b8pgfuC+3f1fRL9V+3WLiHv34tTi+KBE1mdtk7oMz
jtWordkVw1MKp4coQrejaKK3kk24m4Xafa5ESYOJsL8F0CemS0Xqk8lQ+QrSEXGC
DvUbBTLWCZYopNX1TTD0IN3zy7MAopgsvIoEXjVfUPupR6onNJ5MyriXzDOJEqAq
P1WgES+vP23KX8uf/SCLCTBXSXMhfjwv1bDV+R2V5dIvVvYAW+SXbWncKxufAk24
myEePxe0D6lfE3I0pXSJwFOy/1GBu2eMojpkHPAOXS6xalB1tfNA0i5ql0qXwIci
yxdnnk39QqWv2w7pVnlUC43liVyc8pITB0bYSPspMhPsPFug1ug=
=Df4E
-----END PGP SIGNATURE-----

--P74v0JVNv+vvpyMH--

