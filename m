Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC67C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC86207F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wm08PJg0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC86207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c3TvF/2ui8m3JWMH6lmlXKrYjrVHrSWseVpynGJ+7is=; b=wm08PJg0dVoK6NRcpf8iU9f4S
	SV58EYiZ9Q67lSxauZa5okPp4WuTOL64g19c9vNhQDwiCwUpM5gSuIrgQlXwP0S4izqFq3+/3Nfc4
	Ja18KZxsr98P9xo00k483so9n9C5cjaGB+ZwmWpqcsUittSGe6+aPcXEwerFdJ0czHFDp3pnM0lqr
	3m4Qf8s4pmtUQQOnNbTWZwekUw7OQ2938Z+idlKxf/HwYarqNw4H8uo7KF/oLSxBZkPj63PWV4ixS
	Kqs3n14esqnoT2vgfa4dQwWJX/GX9DWdrd3W98nnx61Fio+FDfbtnNTukHsrvtCVgUWxI/Oa+qwKF
	b1ozTHoIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0h2e-0006i6-53; Wed, 29 Jul 2020 08:02:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0h2a-0006gL-BP
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 08:02:21 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k0h2X-00086y-8P; Wed, 29 Jul 2020 10:02:17 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k0h2W-0001cy-D3; Wed, 29 Jul 2020 10:02:16 +0200
Message-ID: <d259a74ca9e425f9b39ebbf47b0decb6be0beed5.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] reset-controller: ti: adjust the reset assert and
 deassert interface
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>, Crystal Guo
 <crystal.guo@mediatek.com>, robh+dt@kernel.org
Date: Wed, 29 Jul 2020 10:02:16 +0200
In-Reply-To: <ba0d1e29-3ba3-5379-d03e-1ccec21c2ffa@gmail.com>
References: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
 <1596008357-11213-2-git-send-email-crystal.guo@mediatek.com>
 <ba0d1e29-3ba3-5379-d03e-1ccec21c2ffa@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_040220_433361_43826C78 
X-CRM114-Status: GOOD (  23.63  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Crystal, Matthias,

On Wed, 2020-07-29 at 09:48 +0200, Matthias Brugger wrote:
> 
> On 29/07/2020 09:39, Crystal Guo wrote:
> > Add ti_syscon_reset() to integrate assert and deassert together,
> > and change return value of the reset assert and deassert interface
> > from regmap_update_bits to regmap_write_bits.
> > 
> > when clear bit is already 1, regmap_update_bits can not write 1 to it again.
> > Some IC has the feature that, when set bit is 1, the clear bit change
> > to 1 together. It will truly clear bit to 0 by write 1 to the clear bit
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >   drivers/reset/reset-ti-syscon.c | 13 +++++++++++--
> >   1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> > index a2635c2..5a8ec8f 100644
> > --- a/drivers/reset/reset-ti-syscon.c
> > +++ b/drivers/reset/reset-ti-syscon.c
> > @@ -89,7 +89,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> >   	mask = BIT(control->assert_bit);
> >   	value = (control->flags & ASSERT_SET) ? mask : 0x0;
> >   
> > -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> > +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> 
> Nack, this will break the driver for the other devices.

I don't think this will break the driver for existing hardware.
regmap_write_bits() is the same as regmap_update_bits(), it just forces
the write in case the read already happens to return the correct value.
Of course it would be good to check that this actually works.

> The kernel has to work not just for your SoC but for all devices of all 
> architectures. You can't just hack something up, that will work on your specific 
> SoC.
> 
> Regards,
> Matthias
> 
> >   }
> >   
> >   /**
> > @@ -120,7 +120,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> >   	mask = BIT(control->deassert_bit);
> >   	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
> >   
> > -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> > +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> >   }
> >   
> >   /**
> > @@ -158,10 +158,19 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
> >   		!(control->flags & STATUS_SET);
> >   }
> >   
> > +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> > +			   unsigned long id)
> > +{
> > +	ti_syscon_reset_assert(rcdev, id);
> > +
> > +	return ti_syscon_reset_deassert(rcdev, id);
> > +}
> > +

I'm unsure about this one, though. This is an incompatible change. At
the very least this would have to be optional depending on compatible.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
