Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4867DC432C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 21:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1DD21774
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 21:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHTY5HB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1DD21774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oz8JwYOlZTu2osjqUvJjLCOYvX2oQDAd8eFgnyUc1g0=; b=iHTY5HB42K6E4e
	xGT80p9Y95P1vYGsaEO37X4WZD3OrZqr4YDcLLDVy+qWWULjrc8DHFLCHIKxSb4WJEVhhUmmQx51P
	ItZ3gxiA9KSq6Wcf+rtiOobAvaXJjmcPiPLPWfK+czDC5FQZo145JBG5z6+bs61Nh+EN68h1LghY1
	BjHM3T6C92Hn1hdCui1k6kUFk63bPtUthTx1Ga0i8ksU4z/lraMEmwqdSwCXw/glf7OQ1/7HN8zy0
	v+nxhC3PRAlPZ4PWbGdPZe/RthB8rAaTpbz5mdWEXNh4EMAkGeoDXRfRwZlyWteT8YYQ5DVi+sy0V
	sWYk0Wv0lwvaTwuBWMMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia4w9-0004qU-8z; Wed, 27 Nov 2019 21:33:25 +0000
Received: from smtprelay0174.hostedemail.com ([216.40.44.174]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia4vx-0004ed-64; Wed, 27 Nov 2019 21:33:14 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 49DF1180020E4;
 Wed, 27 Nov 2019 21:33:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cows61_381bf37cb8f3e
X-Filterd-Recvd-Size: 2684
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Wed, 27 Nov 2019 21:33:05 +0000 (UTC)
Message-ID: <b2cbe247a33dd9f6c747fce180f964b88d5dc70a.camel@perches.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: Use the correct style for SPDX
 License Identifier
From: Joe Perches <joe@perches.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2019 13:32:39 -0800
In-Reply-To: <CAMuHMdUSSHvQ74c156tuhWShp05TQuSmXa-kY3HNbYj0VL_d4g@mail.gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
 <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
 <9bacc7d9-6bd9-0b7c-18cd-d614796397dd@suse.de>
 <ae40eb808f420f5de4a140b8757dfbc426a8cf90.camel@perches.com>
 <CAMuHMdUSSHvQ74c156tuhWShp05TQuSmXa-kY3HNbYj0VL_d4g@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_133313_287774_224443AA 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Nishad Kamdar <nishadkamdar@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-11-27 at 22:12 +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 27, 2019 at 9:59 PM Joe Perches <joe@perches.com> wrote:
> > On Wed, 2019-11-27 at 21:55 +0100, Andreas F=E4rber wrote:
> > > However, if we're touching these lines anyway, shouldn't we be updati=
ng
> > > the SPDX Identifier to GPL-2.0-only while at it?
> > =

> > Probably better to do that with a treewide script one day.
> =

> Yeah... But it's already more than one year after
> =

> > https://lkml.org/lkml/2018/8/16/487
> =

> and Documentation/process/license-rules.rst (which is the authoritive
> rule?) still hasn't been updated...

The patch still applies today...



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
