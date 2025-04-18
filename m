Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D808C369AB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Apr 2025 14:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DQvLhC14bp4rJsv5CqZB8EQOmGYEbWdl+YLKOIIZM0=; b=oaQBXw/wHIQRzi3A2UlrlRnA+D
	4zSt/2mIjwa4Rp9NwJjSsr+febMrIRe06+r2nXZBiTkjKKvLtC/D+Xf/gSKv/4h2uvzul2eDyNuX6
	md9swOWbu3rVFAcSIPTG8ZYGWGfIjVsQ+ax0besafy4DLo6O3Cz2EsxU4UqRSo4J+bvvayu/sIr3U
	cSVvkcfk0P+RHFFjAU0R+m/1M4p+YASZc5cdDAeR/LxMQ2boLYOqg1PNILEEVKbAf1pBgUu+d4bHT
	rns2rZpBJCge9vV4qKfdnebgrzHYkqNyogLkxwC3c9T2CdxZGVzX3lygoRcpCn+hoqgcKlqWIZYj+
	hNJ9KRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n5c-0000000GW9K-0pOs;
	Fri, 18 Apr 2025 14:53:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n3g-0000000GVpW-3uNc;
	Fri, 18 Apr 2025 14:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A0C15C4B8E;
	Fri, 18 Apr 2025 14:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A43EC4CEE2;
	Fri, 18 Apr 2025 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744987871;
	bh=bNG069bANGf30ORJdaTSbWaHvDsABZiESkRt7KTKH9M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lUY5A2r/U0nCOjjtPhudNKNqeAXxrr/J53n7CF7KYuRy50/cqSDje+VCmg7F4MVo1
	 oIDbHdqmT8faaGRgbVlwxWmVZuzGujLJyU84Ypb/HoA3+NHWcbjuVdhO26oXWC/WrK
	 ++kt3Y09BRhH2F9LLdlLdHnTwu6KmMO22IUmKmFPAexz/TUEEag39zeTZuY/MR11Oh
	 ah6SR18wRB2GysTaj2jqWjfBeOGL+45C9VRkKo8yCBv7UxDVI8Dxy3heFOLa550V/0
	 osGGsMf4bElmwzXxZldkl0pXhXaiGqd6VOFFuaghA3QxTzY0Dn8mR+sUusyV7Rz+VD
	 TPiK8JB96MGOg==
Date: Fri, 18 Apr 2025 15:51:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, David Lechner 
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger
 <ak@it-klinger.de>, Petre Rodan <petre.rodan@subdimension.ro>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/8] iio: chemical: pms7003: use aligned_s64 for
 timestamp
Message-ID: <20250418155102.563607f5@jic23-huawei>
In-Reply-To: <2ac349c8dd9b7fcc86e2caae1f74943c23289921.camel@gmail.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
	<20250417183535.00004d87@huawei.com>
	<2ac349c8dd9b7fcc86e2caae1f74943c23289921.camel@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075113_080469_A8EFB033 
X-CRM114-Status: GOOD (  24.44  )
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

On Fri, 18 Apr 2025 09:51:37 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, 2025-04-17 at 18:35 +0100, Jonathan Cameron wrote:
> > On Thu, 17 Apr 2025 11:52:36 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> >  =20
> > > Follow the pattern of other drivers and use aligned_s64 for the
> > > timestamp. This will ensure that the timestamp is correctly aligned on
> > > all architectures.
> > >=20
> > > Also move the unaligned.h header while touching this since it was the
> > > only one not in alphabetical order.
> > >=20
> > > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > > ---
> > > =C2=A0drivers/iio/chemical/pms7003.c | 5 +++--
> > > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pm=
s7003.c
> > > index
> > > d0bd94912e0a3492641acd955adbc2184f4a11b3..e05ce1f12065c65d14b66ab86e2=
91fab47805de
> > > c 100644
> > > --- a/drivers/iio/chemical/pms7003.c
> > > +++ b/drivers/iio/chemical/pms7003.c
> > > @@ -5,7 +5,6 @@
> > > =C2=A0 * Copyright (c) Tomasz Duszynski <tduszyns@gmail.com>
> > > =C2=A0 */
> > > =C2=A0
> > > -#include <linux/unaligned.h>
> > > =C2=A0#include <linux/completion.h>
> > > =C2=A0#include <linux/device.h>
> > > =C2=A0#include <linux/errno.h>
> > > @@ -19,6 +18,8 @@
> > > =C2=A0#include <linux/module.h>
> > > =C2=A0#include <linux/mutex.h>
> > > =C2=A0#include <linux/serdev.h>
> > > +#include <linux/types.h>
> > > +#include <linux/unaligned.h>
> > > =C2=A0
> > > =C2=A0#define PMS7003_DRIVER_NAME "pms7003"
> > > =C2=A0
> > > @@ -76,7 +77,7 @@ struct pms7003_state {
> > > =C2=A0	/* Used to construct scan to push to the IIO buffer */
> > > =C2=A0	struct {
> > > =C2=A0		u16 data[3]; /* PM1, PM2P5, PM10 */
> > > -		s64 ts;
> > > +		aligned_s64 ts; =20
> >=20
> > Bug I think..=C2=A0 So another one that really needs a fixes tag.
> > For all these we might be lucky with padding on the allocations
> > but we shouldn't really rely on that. =20
>=20
> Agreed... We're likely not that lucky for x86-32
Applied with
Fixes: 13e945631c2f ("iio:chemical:pms7003: Fix timestamp alignment and pre=
vent data leak.")
and +CC stable.
>=20
> - Nuno S=C3=A1
> >  =20
> > > =C2=A0	} scan;
> > > =C2=A0};
> > > =C2=A0
> > >  =20
> >  =20
>=20
>=20


