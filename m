Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2119606A882
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B2z3APmM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlsSzBI4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sMXrHsolRG3J/I2nE1oI1F3DJZKjH3O2j2E6lRmGAtI=; b=B2z3APmMqxAkO3
	vh40MlS1SlnPeKIKSSiqGl6BWjEhS0q2hdbIxPW9GQSjdgaf+phXyc73XJomRGQ86rRJSjU4tg5fN
	LsjCGGuHVjWxbjwzxkCtmgluQt0jlC9lXe241yd3bejbeg5ozsdr06y3Mhl3LJTBsuhCdgDKzKdwq
	nsYMv/PBlTIcWOqsLwqurl8e9NKE00+jZSqkUVnTPtn83zG+7vD75O1XB21ePOe5yT+/xdYBaRAuf
	erYXUvEzRvxeEGmxLgDCSVTeqCqJgG60EqrKIO5suWgxw2DSiVa/QN5Id8/NF7C6bQxYUrDgLWlkb
	jQKMW2Gt2Vh0mQrvlYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIq6-0000000GdM0-1L2K;
	Sat, 14 Nov 2026 18:51:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIq4-0000000GdLV-43ZB;
	Sat, 14 Nov 2026 18:51:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B4EB600CB;
	Sat, 14 Nov 2026 18:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCB71F000C4;
	Sat, 14 Nov 2026 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794682259;
	bh=sMXrHsolRG3J/I2nE1oI1F3DJZKjH3O2j2E6lRmGAtI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NlsSzBI45RTY2QD9JZZw15/cPFKHjhMg1sEMEBxkV8amdg1yO+DFVQ8AQqHYY0z5L
	 jLO7hZiQS0cqtBZ68PLHxfjCWzE7EJAJHPFzXQx63FHzG0S4XE6FZ4grX2dWC4Ih5f
	 rvcGcgSTx6Fs7qzSYnN+fiGVYf997qz9wsTJFwqspOPNZI5xchKyzHRea03RDyxBUx
	 ZV8pGBQREZ5dfECdGUF/1oOF7pOed9HxTfJ5JMRvWaN73lIXS/Jdw1fm/FldNWmZrZ
	 JtH6Ok24KutZDvWBMjCZuXBj25LaiYExQ04VwC7l62ECsPgSZocMAVi/fgXZweQn7Z
	 +fNbHAAymlQGg==
Date: Sat, 14 Nov 2026 18:50:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "=?UTF-8?B?TsOtY29sYXM=?= F. R.
 A. Prado" <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] iio: adc: mt6359-auxadc: mask conversion ready bit
 in mt6358_read_imp
Message-ID: <20261114185050.1aa08612@jic23-hlaptop>
In-Reply-To: <hAkgxe6jt5EJW-8bHBs53r3CWCxKxjjzGm6u-l-RzYaGedsBunJrv8nOB48zDSLaMD_jJqtC1Xt1wlz0zDdGF28li-clCdIjUzE9xSbh7Hk=@protonmail.com>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
	<20261103-6768-6358-fixes-v1-2-2a868a33152b@protonmail.com>
	<20261103234540.46cc8c1b@jic23-hlaptop>
	<hAkgxe6jt5EJW-8bHBs53r3CWCxKxjjzGm6u-l-RzYaGedsBunJrv8nOB48zDSLaMD_jJqtC1Xt1wlz0zDdGF28li-clCdIjUzE9xSbh7Hk=@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 00:19:33 +0000
Roman Vivchar <rva333@protonmail.com> wrote:

> On Wednesday, November 4th, 2026 at 1:45 AM, Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 03 Nov 2026 18:32:08 +0200
> > Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:
> >   
> > > From: Roman Vivchar <rva333@protonmail.com>
> > >
> > > In mt6358_read_imp() the raw ADC value is returned directly without
> > > masking out ready bit, resulting in incorrect battery voltage reporting.  
> > 
> > Can you add where the ready bit is.  That might help someone
> > looking at wrong values and wondering if this is what is causing them.  
> 
> It's at the end of mt6359_auxadc_read_adc() function, which is included in
> the commit message. Do you mean include the code part too?
> "*out = val & GENMASK(chan->scan_type.realbits - 1, 0);"

Nope. I mean which bit is the one that will be set and shouldn't be.
Is it Bit 15 for instance? 

Just having a note in the commit message may help someone (or these days
an LLM most likely) find this.


> 
> > This one is pretty glaring as bugs go (given I think this means the
> > top bit is set?) so any reason it wasn't obvious to anyone testing
> > this device?  
> 
> I can't really tell if the driver was properly tested. As far as I understand,
> Chromebook devices use some embedded controller, which likely manages this
> kind of stuff without PMIC ADC. There's no in-tree mobile SoCs with mt6357,
> 6358 or 6359, nor fuel gauge or thermal drivers (yet), so maybe that's why.
> 
> > Jonathan
> > 
> >   
> > >
> > > Apply the mask to strip the ready bit, matching the behavior in
> > > mt6359_auxadc_read_adc() function.
> > >
> > > Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> > > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > > ---
> > >  drivers/iio/adc/mt6359-auxadc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
> > > index 951d236f972b..09432d0974cf 100644
> > > --- a/drivers/iio/adc/mt6359-auxadc.c
> > > +++ b/drivers/iio/adc/mt6359-auxadc.c
> > > @@ -502,7 +502,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
> > >  	mt6358_stop_imp_conv(adc_dev);
> > >
> > >  	if (vbat)
> > > -		*vbat = val_v;
> > > +		*vbat = val_v & GENMASK(chan->scan_type.realbits - 1, 0);
> > >  	if (ibat)
> > >  		*ibat = 0;
> > >
> > >  
> > 
> >  


