Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BACAC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 15:41:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3365E20855
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 15:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S3O89Vut";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kp1AtVky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3365E20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qmFSZSFFRAgr6K6El6YyNnZVdAEEzm9p3ccR9Pi84+8=; b=S3O89Vut9fk1SMYmJTkl8mHUF
	GI69sZMdKBy+VOFudguwZI2upqnW5eoKSPZwh543PzMVjYGm1ry0NmLBO2xPQMkjQj7CmakHsrmJI
	BXzEGXsHcDPOZqVtyzvN5YjZfYy5tDDEDAVybIFZE296e4TOdjgHB4c1ZYfi7crHKSWjuVrn1GP2W
	YEbC0ZI4jElx2hAF1vvseW+Vc4ykTBYtHxlAWtnlKaC2ZZt+0pC4YLgBpaJKkA42Z6OeNKtRISiUv
	uyLuN9mY/uX67Es+91NQXHGVe1F/ch5YkEMvmJkq+a2wsPaJgKU0ib6Lgi5J729ALnPSS1n+Z96Yp
	TxdkOLHTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6FLv-0000W0-RN; Thu, 13 Aug 2020 15:41:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6FLq-0000Tt-Qg; Thu, 13 Aug 2020 15:41:12 +0000
X-UUID: 2d5a24d4e6684e4a9b19f7e0124925b1-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OI2w0zxGU/a5MT+qrXCuXuPIjQEDPCiyv0ctdmKpaHw=; 
 b=kp1AtVkyCMTzGUlxGE4L9ySB9d6uSPYV+7jhuhZyHYlav46UoxZD4rY16TrodrEBIvtELm2lu6y5ODc2y/SS5fYkrk+AwfpeJTGQUjtQnJIiMDXZ2LmHWyfaRvczKUTsfJ1rvV2tCRJkcFL3VwLWgHnv1PXxJYWoarWNbr3HVq0=;
X-UUID: 2d5a24d4e6684e4a9b19f7e0124925b1-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 610700092; Thu, 13 Aug 2020 07:41:02 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 08:40:59 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 13 Aug 2020 23:40:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 23:40:56 +0800
Message-ID: <1597333200.23246.68.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Aug 2020 23:40:00 +0800
In-Reply-To: <20200812120537.GA5545@sirena.org.uk>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200810185933.GI6438@sirena.org.uk>
 <1597217353.23246.45.camel@mhfsdcap03>
 <20200812120537.GA5545@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D514158544447E00469B94A50FFBB32CA73ED07B5A7FB226AF2A86D1D56A22B42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_114111_116197_68C99538 
X-CRM114-Status: GOOD (  36.89  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 13:05 +0100, Mark Brown wrote:
> On Wed, Aug 12, 2020 at 03:29:13PM +0800, Jiaxin Yu wrote:
> > On Mon, 2020-08-10 at 19:59 +0100, Mark Brown wrote:
> > > On Mon, Aug 10, 2020 at 11:05:53AM +0800, Jiaxin Yu wrote:
> 
> > > > +void mt6359_set_playback_gpio(struct snd_soc_component *cmpnt)
> > > > +{
> > > > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> 
> > > What are these, should they not be managed through gpiolib and/or
> > > pinctrl?
> 
> > These are the functions that control the mux of input or output
> > signal. I refer to the other codec drivers, most of them are manipulate
> > the regs in their codec drivers also. Maybe it's easier to control?
> 
> These functions are exported for other drivers to use rather than
> something done internally by the driver - if this were internal to the
> driver it'd not be a big deal but when it's for use by another driver
> it'd be better to go through standard interfaces.
> 

Can we move this part of the operation to the codec dai driver ops, such
as .startup and .shutdown? Because originally these functions are
exported to machine driver's dai_link .startup and .shutdown ops.

> > > > +int mt6359_mtkaif_calibration_enable(struct snd_soc_pcm_runtime *rtd)
> > > > +{
> 
> > > > +EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_enable);
> 
> > > Why is this exported?
> 
> > This function is exported to machine driver to do calibration when
> > registering. The interface between MT6359 and MTK SoC is a special
> > interface that named MTKAIF. Therefore, if MT6359 is to be used
> > normally, it needs to rely on the platform for calibration when
> > registering.
> 
> So this needs the SoC to do something as part of callibration?
> 

Yes, the side of MTKAIF in SoC part named adda, we need config it before
calibration. We will also upstream machine/platform driver that use this
codec driver later.

> > > > +	switch (event) {
> > > > +	case SND_SOC_DAPM_PRE_PMU:
> > > > +		priv->dev_counter[device]++;
> > > > +		if (priv->dev_counter[device] > 1)
> > > > +			break;	/* already enabled, do nothing */
> > > > +		else if (priv->dev_counter[device] <= 0)
> 
> > > Why are we doing additional refcounting on top of what DAPM is doing?
> > > This seems like there should be at least one widget representing the
> > > shared bits of the audio path.
> 
> > We have "HPL Mux" and "HPR Mux", there will be two paths enabled when
> > playback throuh HP. But actually they share the same control sequences.
> > So in order to prevent setting it one more time we do additional
> > refcouting.
> 
> That sounds like you should just have one output path defined in DAPM
> and merge the left and right signals together rather than maintaining
> them separately.
> 

Yes, it's would better if they are combined into one mixer control that
named "HP Mux".

> > > > +	/* hp gain ctl default choose ZCD */
> > > > +	priv->hp_gain_ctl = HP_GAIN_CTL_ZCD;
> > > > +	hp_gain_ctl_select(priv, priv->hp_gain_ctl);
> 
> > > Why not use the hardware default?
> 
> > We have two ways to control the volume, there is to select ZCD. Because
> > the other one it not often used, ZCD is used by default. 
> 
> Why not just let the user pick at runtime?
> 

For another adjustment method, we didn't upstream it, so only ZCD
reserved. And the hardware default setting is ZCD, so we can removed
these lines.

> > > > +	ret = regulator_enable(priv->avdd_reg);
> > > > +	if (ret) {
> > > > +		dev_err(priv->dev, "%s(), failed to enable regulator!\n",
> > > > +			__func__);
> > > > +		return ret;
> > > > +	}
> 
> > > Perhaps make this a DAPM widget?
> 
> > "vaud18" needs to be always on so we enable it when codec probe.
> 
> If it is just supposed to be left on all the time it's better to do this
> in the main device model probe rather than the component probe.  The
> component probe should usually only be used for things that need the
> rest of the card to be there.

Ok, I will correct it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
