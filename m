Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05BDC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU8THopaey18BSVo2rpjlClP/FvuUEZGKe5WW3UvJ9g=; b=M/IfGzto8uhRwach7ljUTiTXIM
	B4Nc36sWlpP6tuZro3qheJ0ayDbABauEx4NLPobjmBzZzY3sU+3pcL6Z2wLOySHcOOU+1u+IWTQmJ
	s6B5/0ZwkoorgqsQajAW2+0J2fvq+9tX9Ud4YnIVLlgO5kfRKjoCmbZRkCUQkknxIW8I5uyYQv8Un
	Re0s8hfw0GwVozBBr1zaBRHHETy7zES7sTC5xj9cTNgxgupwIexJ+g4SmSNYRs17P9DtvEB0oEsv4
	epxycld5OncDwEeZTdAqJnEKw7s6M+VuQO4xupKjgU9hArez5CZ4Rr6WVbqwe24uZRlHurxEiPsTO
	//o9rdyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu3v-005FWV-F1; Wed, 08 Mar 2023 13:42:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu3e-005FSe-3V; Wed, 08 Mar 2023 13:42:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78460B81CC2;
	Wed,  8 Mar 2023 13:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B87FC4339B;
	Wed,  8 Mar 2023 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678282935;
	bh=YW+SZDRVXklCngw+7708VvFnfwV2mw5HHBrr6iHIZtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3yvoyvi4uAYB5K4AyE6S1fEmLVPM0XKZHidQLpGT2LYPEqQ2JZmpYAE8eDUshAlQ
	 bcud82pWGNVDAhcLzqsA4m+LpktawJycbe6sYG2TV6gbx75gfyhEiGn1QBaouIzt0k
	 SScNezEWmdsMjQrruWSEts4A7TV5qa0lV6sQN2tkDwcdZx+t48ZsQaUtrz2qPoJfVm
	 GPLg/oyqbSnQ2YTZok9YY2gMsp07ncHPrLpc2A+AAKv9HIezA6m9ZaX+jm+JJDPys3
	 AGGkOZ8dYrv4l0Cnkxvfk7Wr3hrcWWrUi4BAvjuZUzDedQyiLTiT9tJPKQcBmGxVcm
	 surebN+LfQ1dQ==
Date: Wed, 8 Mar 2023 13:42:08 +0000
From: Lee Jones <lee@kernel.org>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: ChiaEn Wu <chiaen_wu@richtek.com>, corbet@lwn.net, pavel@ucw.cz,
	matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com,
	jacek.anaszewski@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-doc@vger.kernel.org, peterwu.pub@gmail.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v17 RESEND 3/3] docs: leds: Add MT6370 RGB LED pattern
 document
Message-ID: <20230308134208.GK9667@google.com>
References: <cover.1677150607.git.chiaen_wu@richtek.com>
 <c6487954daff5e514023056ad7de1d0ddee674a8.1677150607.git.chiaen_wu@richtek.com>
 <20230305101824.GE2574592@google.com>
 <20230307040804.GA15766@linuxcarl2.richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307040804.GA15766@linuxcarl2.richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_054218_310331_62543FD6 
X-CRM114-Status: GOOD (  22.66  )
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

On Tue, 07 Mar 2023, ChiYuan Huang wrote:

> Hi, Lee:
>
>     Some question about the comment.
> On Sun, Mar 05, 2023 at 10:18:24AM +0000, Lee Jones wrote:
> > On Thu, 23 Feb 2023, ChiaEn Wu wrote:
> >
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Document the MT6370 RGB LED pattern trigger.
> > >
> > > This simply describe how the pattern works, each timing period, and the
> > > pattern diagram for MT6370 RGB LED.
> > >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > ---
> > >  Documentation/leds/leds-mt6370-rgb.rst | 64 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > >  create mode 100644 Documentation/leds/leds-mt6370-rgb.rst
> > >
> > > diff --git a/Documentation/leds/leds-mt6370-rgb.rst b/Documentation/leds/leds-mt6370-rgb.rst
> > > new file mode 100644
> > > index 00000000..d1b2e4f
> > > --- /dev/null
> > > +++ b/Documentation/leds/leds-mt6370-rgb.rst
> > > @@ -0,0 +1,64 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=========================================
> > > +Kernel driver for Mediatek MT6370 RGB LED
> >
> > Are you describing the device or the kernel driver?
> >
> But referring to others, it seems each one also write this as 'Kernel driver'.
> Sorry, I cannot catch the point. Did you mean to modify this description as
> 'The device for MT6370 RGB LED'?

Just because it's been done before, doesn't make it right.

IMHO, this document should describe the device, not the driver.

--
Lee Jones [李琼斯]

