Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7494FC25B76
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqw+cygr4tu0jrq2gafJ0puvsDoezQDbVv92CjgKrSE=; b=Tg0nucUvQm4dexOax2x0XXgTkp
	hZjjefTx6G5xjFbq6M/L3Y/Hhk5AJAovlxRgvC6rERyse0b0zHUiE4C65+9rm8VIXkKDJNu+Nl+xP
	2NH8oqfLfPEX9D10ZULd/vkoUHDrWNpSWZ76eHHokYI5MUcwoHw/lt8GR74aOOdWPoxugMnpFDWOB
	lKrsURBjnP/d71xLswlav2ZGOUJaSH72+mHkkfzoxEwhFRYINmD3GdGtCWe8SeFr0mi2iZHge8TkT
	UI7SMlDhqUO4xBnclMJc1j7TNVV+gRpI7FsjTkZy2fxQDMhvoa3L0bL+/Yl+7yTMgCK+Dt2jCW4DO
	J4ReQwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sG075-00000000UKH-42DW;
	Sat, 08 Jun 2024 17:44:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sG071-00000000UJD-2KxR;
	Sat, 08 Jun 2024 17:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 21D54CE059C;
	Sat,  8 Jun 2024 17:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE8DC2BD11;
	Sat,  8 Jun 2024 17:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717868656;
	bh=hvWsrTbBgumYKTUSkkB2KU76v6GG4PeU+81uyBO0di8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=efsnHbWpkZWap9PHnfl1TgcF9tP3Tc56Dle4LYSs7K0T5WMogbBkG+TskIVlfimpg
	 kVB5gmjGa2w21h8CgDPcJIGPXB9MxFYcclcP933F3glOoz5J908muGSLD3R3zl4b5P
	 Z6qB1TyYUyPOmUUYb42af+lXW2kIMYIg4WFfGQLws0SNygKfaG31PrKigDjC7gLXNY
	 bGqr70HMJbrCyMx+LHpi4pA3XKUiNULX7JJudt0JYYDsgwi3G9nttxv6L/46bzBVkV
	 obODCDfVV2Ou8UIau95ilhWeuNj0aKrRdUIaIh80+9SkbMKFrd8lJAApcz2oTB8f2Z
	 MGPl4tAIFhkDA==
Date: Sat, 8 Jun 2024 18:44:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, lars@metafoo.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lee@kernel.org, andy@kernel.org,
 nuno.sa@analog.com, bigunclemax@gmail.com, dlechner@baylibre.com,
 marius.cristea@microchip.com, marcelo.schmitt@analog.com,
 fr0st61te@gmail.com, mitrutzceclan@gmail.com, mike.looijmans@topic.nl,
 marcus.folkesson@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 4/5] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
Message-ID: <20240608184404.5c34668f@jic23-huawei>
In-Reply-To: <575186dc-8a4a-4d93-98f0-d2271b0aa1fb@collabora.com>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
	<20240604123008.327424-5-angelogioacchino.delregno@collabora.com>
	<CAHp75Ve8qPLu+gS8o5Q5A20j_+AP_UVkOzdKqcnhUawA_sW+VA@mail.gmail.com>
	<575186dc-8a4a-4d93-98f0-d2271b0aa1fb@collabora.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_104419_832546_AEBB031D 
X-CRM114-Status: GOOD (  13.72  )
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

On Tue, 4 Jun 2024 15:24:31 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 04/06/24 15:22, Andy Shevchenko ha scritto:
> > On Tue, Jun 4, 2024 at 3:30=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote: =20
> >>
> >> Add a driver to support reading the Auxiliary ADC IP found in the
> >> MediaTek MT6357, MT6358 and MT6359 Power Management ICs, featuring
> >> a different register layout, configurationm reset and ADC reading =20
> >=20
> > configuration
> >  =20
>=20
> Oh, oops! If there's no further comment to address, can this be fixed whi=
le
> applying, please?
>=20
Yes if Rob is happy with your response to his question on the
dt-binding.

LGTM as well btw.

Jonathan

> Otherwise I can send a v3 :-)
>=20
> >> sequence from the other already supported MediaTek SoC or PMIC
> >> (aux)ADC HW.
> >>
> >> This driver provides multiple ADC channels for system monitoring,
> >> such as battery voltage, PMIC temperature, PMIC-internal voltage
> >> regulators temperature, and others. =20
> >=20
> > Seems all my concerns were addressed, so
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> >  =20
>=20
> Thanks!
> Angelo


