Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B39C04A95
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plF1N4PGYUKQlWhTtkjzU7DgMPusvYvs149pl5B1LAs=; b=phORzvc/PrZbtVcKowNvDDkb/B
	2cKL0Xto0/YjfefOBRGwgVcZ9esQuE012TE3vB7gVxztwqRtSQDUuBxqm6pzmXDup+mrU8iCDw+q2
	8lKZuqME36z4WJKWv7Xk6RtdeYdRuFiAPHc+FtF7dunkZ8gfC6HTPKqOYto/7xTtmLD9b53kPSZkA
	YdmESYPLs66kaj+4pVaYNr5XgXiUjqs5jmo1/1VWaZvGJ83s3V6Rh16cbV1UjHt5reO9m0JB+4taS
	eDcXgfW5qx3uWyr6YU8SO5rV9qLNpU/SMywP43DDZX5WVszy0wqILjMfrNqcDS8fsUfQ9a21lOaRr
	Mj5m+lWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqlA-005nua-SD; Fri, 23 Sep 2022 22:03:00 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqkz-005nrw-6x; Fri, 23 Sep 2022 22:02:50 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 6B5201A0739;
	Fri, 23 Sep 2022 22:02:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id B26E420028;
	Fri, 23 Sep 2022 22:02:19 +0000 (UTC)
Message-ID: <ac809b03c78355b52c4ce936cc5a4ed3dd303441.camel@perches.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
From: Joe Perches <joe@perches.com>
To: Han Jingoo <jingoohan1@gmail.com>, Andy Shevchenko
	 <andy.shevchenko@gmail.com>, torvalds@linux-foundation.org, Andrew Morton
	 <akpm@linux-foundation.org>, Julia.Lawall@inria.fr, 
	krzysztof.kozlowski@linaro.org
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, lee@kernel.org, Daniel Thompson
 <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, Jonathan
 Cameron <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Helge
 Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>, 
 mazziesaccount@gmail.com, andriy.shevchenko@linux.intel.com, ChiaEn Wu
 <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, ChiYuan Huang
 <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, Linux
 LED Subsystem <linux-leds@vger.kernel.org>, devicetree
 <devicetree@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>, "open list:FRAMEBUFFER LAYER"
 <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Date: Fri, 23 Sep 2022 15:02:28 -0700
In-Reply-To: <CAPOBaE7mcNqgQvsPpqewmq=Na9MC9RH5AW8CHn5ZJFAUsq6_eg@mail.gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
	 <20220830034042.9354-10-peterwu.pub@gmail.com>
	 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
	 <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
	 <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
	 <CAPOBaE7mcNqgQvsPpqewmq=Na9MC9RH5AW8CHn5ZJFAUsq6_eg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Stat-Signature: icdqc5u914mweh6876zxemizkb1yinja
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: B26E420028
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX180tjz2i84oRN7SAvJ/UKULO1Sz9+vBSi8=
X-HE-Tag: 1663970539-507553
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_150249_327563_5072E272 
X-CRM114-Status: GOOD (  14.29  )
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

On Fri, 2022-09-23 at 14:34 -0700, Han Jingoo wrote:
> On Wed, Sep 21, 2022 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >=20
> > On Wed, Sep 21, 2022 at 4:48 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:
> > > On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wro=
te:
> > > > On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >=20
> > > > > +#define MT6370_ITORCH_MIN_uA           25000
> > > > > +#define MT6370_ITORCH_STEP_uA          12500
> > > > > +#define MT6370_ITORCH_MAX_uA           400000
> > > > > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > > > > +#define MT6370_ISTRB_MIN_uA            50000
> > > > > +#define MT6370_ISTRB_STEP_uA           12500
> > > > > +#define MT6370_ISTRB_MAX_uA            1500000
> > > > > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
> > > >=20
> > > > Use upper letters as below:
> >=20
> > For microseconds (and other -seconds) the common practice (I assume
> > historically) is to use upper letters, indeed. But for current it's
> > more natural to use small letters for unit multiplier as it's easier
> > to read and understand.

I think it's fine. see:

commit 22735ce857a2d9f4e6eec37c36be3fcf9d21d154
Author: Joe Perches <joe@perches.com>
Date:   Wed Jul 3 15:05:33 2013 -0700

    checkpatch: ignore SI unit CamelCase variants like "_uV"
   =20
    Many existing variable names use SI like variants that should be otherw=
ise
    obvious and acceptable.


