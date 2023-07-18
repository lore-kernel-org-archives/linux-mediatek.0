Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6230DEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFkovm95/NomURdsGPIAPD0hFqphahW/5HgAnQNo7ZA=; b=gioz7NNjkjsjXSU3xmnhiemp3t
	bX8d8dGn8Tm0alvy0ScLDTOoU7LPHUFjkvl8pQ3XKuXfcef3Ibxgoe9EJDOqDWKupsCDbVNffRNkR
	hx9/BBSBe+NsO3Ga7hwgU3fxtZB206kO9Ebckxp+SBBZdapwnbak+VWShnv1oRzlQHaSeo74ReIWn
	sXRJZy1ug6+Hu8jBzK/AqmkCWDH8T6MzriPrgczZvaOTF+OSwg0qs7EaJLZxpU6gL0oCToCazTIOm
	jtXHcqIOIMN1Z4MP2aSrjFWg58mmoRCfrbj4tNHaqt3qZks7e7qZuiRYarCKvuLDLtrm2vNK7XaMW
	8cthqyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM13q-005wy2-1K;
	Wed, 19 Jul 2023 06:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM13n-005wwp-2N;
	Wed, 19 Jul 2023 06:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sFkovm95/NomURdsGPIAPD0hFqphahW/5HgAnQNo7ZA=; b=nrleLe2WVDgtVDxK7lnxT+cCIR
	HzvCtrq62wpSAs3AOLrVdEWxIm6u887LYHCI9dqxGuOnrl/0W1Grib0MHhW43ZAW+ZZFA2tMSFRPs
	hoOog7h1fgpqgP9Q6gbgmdmAZOfrRirMMlFOOOtFwERPfLBXo5/ez1Vu5BBZqw690fjAllZm06kTG
	6Tv1/B9ztZC9HsPsBNvkv6xVjXZh84XhzWbEGGk//VxRrw1YNkp2Hh7xTPcZAdmKo4DTAArSpd5Lq
	StrFUvsKSDaWXusxrAnUKuAsGii86QSUuhZXX4/ZI3KMQ9aUcEBoOXbgEv0yqJnNWIuRVMXj2A43C
	ddXUuMOQ==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjOe-00BVXb-0l;
	Tue, 18 Jul 2023 12:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689681689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFkovm95/NomURdsGPIAPD0hFqphahW/5HgAnQNo7ZA=;
	b=tq0JK9YFWofWplFZTCbhVKU/E4dCyURCFTQ+mh315DhR29FezVDG+WSSgKtpw2nIhggtQE
	c9lZeQCC+ShIJCgXLdnYzKas1cnC52mqtxqMY6I6t9RUUHTxyj4eM1JB2rg5hGXoNoPm8w
	PLzaccWdEndc+qisR8UbQytF3Typ3fo=
Message-ID: <f002fe945307d0904bcee8bd1f21d9e589d32ffb.camel@crapouillou.net>
Subject: Re: [PATCH v2 10/10] pinctrl: tegra: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Cameron
	 <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Balsam CHIHI <bchihi@baylibre.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Len
 Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, Sean Wang
 <sean.wang@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Ludovic
 Desroches <ludovic.desroches@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 18 Jul 2023 14:01:27 +0200
In-Reply-To: <ZLZ5obLK89E1S_2R@orome>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-11-andriy.shevchenko@linux.intel.com>
	 <20230718111143.000067dc@Huawei.com> <ZLZ5obLK89E1S_2R@orome>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_130141_572549_F2351D49 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Thierry,

Le mardi 18 juillet 2023 =C3=A0 13:38 +0200, Thierry Reding a =C3=A9crit=C2=
=A0:
> On Tue, Jul 18, 2023 at 11:11:43AM +0100, Jonathan Cameron wrote:
> > On Mon, 17 Jul 2023 20:28:21 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >=20
> > > Since pm.h provides a helper for system no-IRQ PM callbacks,
> > > switch the driver to use it instead of open coded variant.
> > >=20
> > > Signed-off-by: Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com>
> >=20
> > No pm_sleep_ptr()?
>=20
> pm_sleep_ptr() is pointless on this driver. This driver is selected
> by
> ARCH_TEGRA and ARCH_TEGRA also always selects PM.

If I'm not mistaken, ARCH_TEGRA selects CONFIG_PM, not CONFIG_PM_SLEEP.

Cheers,
-Paul

