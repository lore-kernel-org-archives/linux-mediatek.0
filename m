Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13571C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B02RqxjBTQRs85a8gF2gLe9dL1JOQq3J4L0ycDQz7f4=; b=cIT0/vI6EU4WiQN+fSgjSdrbfs
	ze5cLPkEnh7Tf6BRmMYnwHFInYkS6KeGcyZLRknwPmWl1qjm0y76R5SSunQAyMIfNSpVH/g3uUk7g
	AMdZKirtUwFvx+xkQGOU1aYyBG7NPae/SLIfoQFJo6GdE9pqmLmo8LYkxlcUn69h+eW7/Nh+cf346
	D1ZntzXGhWj/E80ox39m8fQyxnX8XO30roD/nui+3FaDOsJhjCqkwuNQWP70k3KA5uwuzPkPFUTYR
	Yuz16Jqu9rcXfy2y9otKDn0AOuQcabwHx9fm21bugfprjSlpyIT0yXV1K0hvl3w/AK7WHz+6ZhrXs
	PYBf22dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJvuH-00EfQd-5y; Fri, 05 Aug 2022 11:54:21 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJvuC-00EfNc-UT
	for linux-mediatek@lists.infradead.org; Fri, 05 Aug 2022 11:54:19 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-31f445bd486so21442567b3.13
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Aug 2022 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B02RqxjBTQRs85a8gF2gLe9dL1JOQq3J4L0ycDQz7f4=;
        b=ECUBjQ6a3KqW1cyowmSgFitTkNeso0Ptc6F6gnpY6N5bqbTzGXPuJcI/pfHBU2BYGG
         7iUgbmsVaEJrs3RJuNxaMadfi+1iFQnDbL4PJ8FjroL22bN7bMNtzmxHslqP1RMmR257
         I7k9Tt+x6e2/Cx1n/EnZ1yR2O/CXu5PcOqI9rnlUt1AiqJqp+GgAr1PzA44lJK61HbKa
         W6D1uq7j4FWlUhlUF4DBHmg2hs/PskkOvgwqeCa25YKkXkvnVDh31JLE9jtk8YV8gFMV
         DXdJDBdg47uYSw9SPj6TwjWL97g6mwUHBr9xO2D2g8ULIUoBudCP4o7GDa2uitv0myvE
         Ejig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B02RqxjBTQRs85a8gF2gLe9dL1JOQq3J4L0ycDQz7f4=;
        b=DDUmAfHxHQzNIjaQ/SxJMn3NcQAlAkOugfVhq+XTXT/vIEWzY5/D9xSBnmfGU6tv9E
         +2EIpdy8UftvudN6tLaRINGqDAGd3TdXsnrkpHUPoDfwGiRfcWxnMxu3UKeUqXkFCEL9
         pJyPN2Vp9ICmZXjwErwtOqlx10hKdFPw347cOizKg2Z4bmr3FNAKel2QRaXPCW21/pHG
         rw/N60XgUKeftvBo1IlIjUO5nwxWRTcInqumYvV4S9SiKplOdI0x1df27rPeckN8ZkrR
         fTvishVEJ4ukhBmmr3oTgq1aKYbXyvXTUq+G9N6c4815fU0oKPERc+qgA1hr8iVZqVm4
         MbzQ==
X-Gm-Message-State: ACgBeo03Ecqv29nBDBn0dORjYfZNaZjzoN4AXUPBhT1Ab6f/tPkjUPKe
	TcuBlXdcTrsPWWcSwo4yaU1A3l5SVr5VK5LBIri+ow==
X-Google-Smtp-Source: AA6agR72QleJK186GhMdgMP/yTvyEphneAZ2QYvhg8nnZGfN+KY6QWW+tPlsHTl350LimpY/Cp8NATm/hRG1zpOFkm8=
X-Received: by 2002:a0d:e88e:0:b0:328:297a:fd9e with SMTP id
 r136-20020a0de88e000000b00328297afd9emr5960768ywe.88.1659700455699; Fri, 05
 Aug 2022 04:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220804130912.676043-1-bchihi@baylibre.com> <20220804130912.676043-2-bchihi@baylibre.com>
 <20220804230407.kwfsxy74qmmebfsj@notapiano>
In-Reply-To: <20220804230407.kwfsxy74qmmebfsj@notapiano>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 5 Aug 2022 13:53:39 +0200
Message-ID: <CAGuA+ornX-mt-kjYE9693PEYqCpQQGf=CdG1k4kwzaS4BBHxmg@mail.gmail.com>
Subject: Re: [PATCH v8.1, 1/7] thermal: mediatek: Relocate driver to mediatek folder
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_045417_219715_91FBFF51 
X-CRM114-Status: GOOD (  21.96  )
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

On Fri, Aug 5, 2022 at 1:04 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Hi Balsam,
>
> On Thu, Aug 04, 2022 at 03:09:06PM +0200, bchihi@baylibre.com wrote:
> > From: Michael Kao <michael.kao@mediatek.com>
> >
> > Add MediaTek proprietary folder to upstream more thermal zone and coole=
r
> > drivers, relocate the original thermal controller driver to it, and ren=
ame it
> > as "mtxxxx_thermal.c" to show its purpose more clearly.
> >
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >  drivers/thermal/Kconfig                       | 14 ++++-------
> >  drivers/thermal/Makefile                      |  2 +-
> >  drivers/thermal/mediatek/Kconfig              | 23 +++++++++++++++++++
> >  drivers/thermal/mediatek/Makefile             |  1 +
> >  .../mtxxxx_thermal.c}                         |  2 +-
> >  5 files changed, 30 insertions(+), 12 deletions(-)
> >  create mode 100644 drivers/thermal/mediatek/Kconfig
> >  create mode 100644 drivers/thermal/mediatek/Makefile
> >  rename drivers/thermal/{mtk_thermal.c =3D> mediatek/mtxxxx_thermal.c} =
(99%)
> [..]
> > --- /dev/null
> > +++ b/drivers/thermal/mediatek/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_MTK_SOC_THERMAL)                +=3D mtxxxx_thermal.o
> > diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mediatek/m=
txxxx_thermal.c
>
> When Daniel suggested using a more SoC explicit name like 'mtxxx_thermal'=
 [1]
> the xxxx was supposed to be substituted for the actual SoC (family) that =
makes
> use of this driver :-).
>
> From the compatibles looks like we have mt8173, mt2701, mt2712, mt7622, m=
t8183.
> So it doesn't look like it's a single SoC family... What about calling it
> auxadc_thermal?
>
> Thanks,
> N=C3=ADcolas

Hello N=C3=ADcolas,

"auxadc_thermal.c" makes more sense, since we have "lvts_thermal.c".
Thank you for the suggestion. I will take it.

Best regards,
Balsam

>
> [1] https://lore.kernel.org/linux-mediatek/24250d03-b25f-e521-5abd-f36109=
885c36@linaro.org/
>
> > similarity index 99%
> > rename from drivers/thermal/mtk_thermal.c
> > rename to drivers/thermal/mediatek/mtxxxx_thermal.c
> > index ede94eadddda..60924f8f98e9 100644
> > --- a/drivers/thermal/mtk_thermal.c
> > +++ b/drivers/thermal/mediatek/mtxxxx_thermal.c
> > @@ -23,7 +23,7 @@
> >  #include <linux/reset.h>
> >  #include <linux/types.h>
> >
> > -#include "thermal_hwmon.h"
> > +#include "../thermal_hwmon.h"
> >
> >  /* AUXADC Registers */
> >  #define AUXADC_CON1_SET_V    0x008
> > --
> > 2.34.1
> >
> >

