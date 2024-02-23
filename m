Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDA2C54E41
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCpS/jUTYLOZ0fDcQmJIwIBOst6krKf4KWBNveRLQuU=; b=dFMnWR/Qs/86E1rhDGyb+x9rFk
	/kkrGVA3shpT94ala3ui7D2ZvLxIs2w1rLSDOrYzz14NJJDHsWygzDiFEYZr6X/tatAEAsG0EIV43
	iOcsCkwRnwDiRjon/3NOVXQsLkBbKzOvn72mD3jUBxHB5iV0S3LTFj5FQHcwuLgazAjzSTBNs9Yyy
	YQ98o5lpUNQdJLDcTgaYsBI1jvBpWAqJCfHsPhCCdZkEqbIklinZ1fHwBkgqTNJ+IT76crpN9R1lk
	o3o8hmQan1Of5JuQEueozKcHWFEheC6ZzRFqQpOCXukkdv9iemWpYfrmCvQxhox+71SOwqB2yqALB
	CFLLI+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdUdo-00000009JU0-3ene;
	Fri, 23 Feb 2024 12:27:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdUdj-00000009JOS-2lUs;
	Fri, 23 Feb 2024 12:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A51CBCE2B9D;
	Fri, 23 Feb 2024 12:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB87C433C7;
	Fri, 23 Feb 2024 12:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708691212;
	bh=m//cWAePIv4cTZDYri/URPe8qx3PAjrr8Fa4bEJ/jYw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iZSQ/HTX2hNdNLIy3vkQ2Mhcy7B3AcZ4GJzTIslwj7FQ9QGqb8MtlDta23N9Vwe3y
	 lrts2nTwptGS/hOtaF7+eA6l3i8xvLLu6d2mb9F1zdiv+n1cHntDc/nedbnOWYAeuB
	 01Ncv/gZk50JdISyyt5DYanwA69wt70ASDNE7D21By/0wkVq8FBhYVnPDaioShYGTT
	 ln5E16eNjwSVj0tLN6ftkdewOjFQZiPXKGfRPY3lmXnP/RZL27ltagxjwOgUiJUg0D
	 SOg1MY5nYbXlOq/NQKd0Zr7V5psWedQv0i0fHhCIfcRvzKR9DryEmp+ZWCkAftnTkP
	 jlPDUqkd21I/w==
Date: Fri, 23 Feb 2024 13:26:41 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: andy.shevchenko@gmail.com, George Stark <gnstark@salutedevices.com>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Aleksandr Mezin
 <mezin.alexander@gmail.com>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
Message-ID: <20240223132641.3e2ba16c@dellmb>
In-Reply-To: <Zde_s8iecR2ArKjC@surfacebook.localdomain>
References: <20240222145838.12916-1-kabel@kernel.org>
	<Zde_s8iecR2ArKjC@surfacebook.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_042655_923674_AFB28A6B 
X-CRM114-Status: GOOD (  13.05  )
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

On Thu, 22 Feb 2024 23:42:11 +0200
andy.shevchenko@gmail.com wrote:

> Thu, Feb 22, 2024 at 03:58:37PM +0100, Marek Beh=C3=BAn kirjoitti:
> > A few drivers are doing resource-managed mutex initialization by
> > implementing ad-hoc one-liner mutex dropping functions and using them
> > with devm_add_action_or_reset(). Help drivers avoid these repeated
> > one-liners by adding managed version of mutex initialization.
> >=20
> > Use the new function devm_mutex_init() in the following drivers:
> >   drivers/gpio/gpio-pisosr.c
> >   drivers/gpio/gpio-sim.c
> >   drivers/gpu/drm/xe/xe_hwmon.c
> >   drivers/hwmon/nzxt-smart2.c
> >   drivers/leds/leds-is31fl319x.c
> >   drivers/power/supply/mt6370-charger.c
> >   drivers/power/supply/rt9467-charger.c =20
>=20
> Pardon me, but why?
>=20
> https://lore.kernel.org/linux-leds/20231214173614.2820929-1-gnstark@salut=
edevices.com/
>=20
> Can you cooperate, folks, instead of doing something independently?

Thanks Andy for pointing to George's patch series.

I can drop the mutex_init() part and add just the debugfs part.

Marek

