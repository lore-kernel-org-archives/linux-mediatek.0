Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A402EC001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2cj6nzOloFnUedIE+sqlGYJXKAM8KXP3LA38uvlSgg=; b=ie4ExOdQWkR+7amtvgNU/8ar93
	S6NnGVSY3cGtrU9pVfeExVy49MOlIdExzfwRXyQWm35G53JHEwxsrnNXaHB9hE4EXN+qQY4vagpf3
	v/ZRyjWVjyon2J3hryXL4/IOk3rI8pgDTjpi7ye1OblhDyTwsqFX7uih6P++9iuoyxCCUOmZQiM1N
	WYNEB5R9nqqOGnefSQWAo63khEjtJ+oN2VDTfaaXlaZqxf3MvIg7qLGHWS1UPyPX1eeddwX56e6Pu
	PXqnRRPGElNps4VKEUU+KldmVAZ64BNRSZr4zgJQV+6lyiXMCbkLM4TjByCKnvsLGsvVfsf+st1tx
	6bEIVomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11k-005vl3-1Y;
	Wed, 19 Jul 2023 06:51:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11h-005vi5-0A;
	Wed, 19 Jul 2023 06:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N2cj6nzOloFnUedIE+sqlGYJXKAM8KXP3LA38uvlSgg=; b=Tu5AASpDxh9/WAG++KOrpvmV/f
	D+rTRpacA8B9pDoUTgxegTTT21Ov4ok2sodWr5W/4Jg0pDK7QGknG9o9hOqA3i9C4SJQ2t5glL+Mm
	OOzg7At15r5Hv2MZpeLgfjBXh1oHn3dNW+uKteL735K42FDZIZAcw4Lqerg4uot5aq1HnnahlhIeE
	3sBg3V4vbvITBvMnk6olv1zSMn2rnqBrMDv0SZRPMnrHr2E10UtuoN05Ux7mxFaymXFnyQ7GAxO+j
	833ChXb3wFFl6QdrmUzixp+3N4gPqRdIySTWFBbOM6lV2TsZsmx8mErcTKmiVO02Cmhzzuf9awjw1
	qd/UDspg==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTks-009EdQ-1m;
	Mon, 17 Jul 2023 19:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689621543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2cj6nzOloFnUedIE+sqlGYJXKAM8KXP3LA38uvlSgg=;
	b=aMum8ykNR3O1EyRf6APapE/nrm/XIgEfrpD8ayt6JjIYHc+ZXXuoLqyzwoTFi2PMsEbFo0
	8F9S9ZtTbKtbVAibRi4zQuAieo9ldUyxhzc5NMkbAJtj94tVSGeV2CfoYzoeBe1keU1UIX
	0eqds2sfP9zZWoHFmwgWgbxzA1/ATLA=
Message-ID: <a9c7064df30215878925206751a4017830938ede.camel@crapouillou.net>
Subject: Re: [PATCH v2 01/10] pm: Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Balsam CHIHI <bchihi@baylibre.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
  Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org,  linux-pm@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Mon, 17 Jul 2023 21:19:00 +0200
In-Reply-To: <20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_201936_722610_FA0AAE4F 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Andy,

Le lundi 17 juillet 2023 =C3=A0 20:28 +0300, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> _DEFINE_DEV_PM_OPS() helps to define PM operations for the system
> sleep
> and/or runtime PM cases. Some of the existing users want to have
> _noirq()
> variants to be set. For that purpose introduce a new helper which
> sets
> up _noirq() callbacks to be set and struct dev_pm_ops be provided.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> =C2=A0include/linux/pm.h | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index badad7d11f4f..0f19af8d5493 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -448,6 +448,15 @@ const struct dev_pm_ops __maybe_unused name =3D {
> \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SET_RUNTIME_PM_OPS(suspen=
d_fn, resume_fn, idle_fn) \
> =C2=A0}
> =C2=A0
> +/*
> + * Use this if you want to have the suspend and resume callbacks be
> called
> + * with disabled IRQs.

with disabled IRQs -> with IRQs disabled?

I'm not really sure that we need this macro, but I don't really object
either. As long as it has callers I guess it's fine, I just don't want
<linux/pm.h> to become too bloated and confusing.

Anyway:
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> + */
> +#define DEFINE_NOIRQ_DEV_PM_OPS(name, suspend_fn, resume_fn) \
> +const struct dev_pm_ops name =3D { \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NOIRQ_SYSTEM_SLEEP_PM_OPS(susp=
end_fn, resume_fn) \
> +}
> +
> =C2=A0#define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
> =C2=A0#define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP),
> (_ptr))
> =C2=A0


