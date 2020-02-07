Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FC2C35247
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 02:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABCE520715
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 02:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhO4whW5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n54HafII"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABCE520715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rn9kDOSDPS2HPNDHDCFjjSFnbAYwCK26uwAsPujTM84=; b=YhO4whW5VtpG/8
	UxdtjCOL7c5VMr3eZoetsAfmzI6lc2veoUTbLmHZRmw6SOr/wa9l5UJinJ3n5ZEIxzIj9yQcMNzAa
	4/QpUVf7Uythtt5K8vsuXNC2oL+dms7IPW4QZcVaNZOoJ+DuHffcSWHySyIHgLnL+CWLB8lolrRts
	C5I9fVx/uUaxLfK4Bxie/y0eGd2061G28iQFOYCFvLV6Y4Se62Pv9OzXtWiFBKg1vv6c4L4QGbBXk
	MN0lNmytyNEzn8Vu8L6Obl3NixFgzyvjrKU/VK+D5WbPB8X4u2DntVH23ve1K++s6nO7lerU+31AX
	3NvE9s2rDauACywhy4QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izt0F-0007wJ-OM; Fri, 07 Feb 2020 02:04:19 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izt0D-0007vL-8X
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 02:04:18 +0000
Received: by mail-qv1-xf42.google.com with SMTP id u10so289328qvi.2
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 18:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f/k2mGN9MY7NNfoOb4gMqNsjIZIFXh28kOhlDVSQmA0=;
 b=n54HafII/Lex3YLQXDbmveG7TRPxgfQUwWoNXykBlSczgnFnbEiABU6Nlwne2EnVqZ
 BLZNg9eH05yf+6HnfQFJWO3Ox35KsJoJtLmFEwLlc7LmqfuMonfkWKrE2MVp0ijf+rlC
 pgFHFzmYKEZYMyZMpnzqCt5JXY3Du2ndL/p2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f/k2mGN9MY7NNfoOb4gMqNsjIZIFXh28kOhlDVSQmA0=;
 b=WGy9Bcyj6VoI8hbec08K3g0ZzGj0w4uRDi9VnBn7rtmS1n+Q2xViMiuQsEAnXOhGQ3
 IorMTYLZ+7uJsdSebUwNAmPxx9IimJihm/TyZ94DTVAQdzaWI6PMTpCd+PVVicbnlmbD
 VRpY1r5LDbiHIr6kScJR0kk+LbSZ0y8sPNHAqnNdEECE3aPMpMDqc54X1lWV4GXKw2EO
 j9FBhaP08HsdVED5ATQND9QUnyavFMmZTDoRLv3M8xMZPy31Ersav7mxTDllgqdd5Sv4
 gef/JQF2WNfNPHQeVn1UG0v4hY2GanPEhWnA1LoJn9fOSpTKK3ugmXnclJ+HVyTlpcOb
 L35g==
X-Gm-Message-State: APjAAAUJpWCzdB48w5YA3nC++5GEqgee3w4RAlWkNwv+04KyL2MBulvE
 JATJxJqvJr/ukaDmp069xSvlrCD3W4ih7knk6J2H/g==
X-Google-Smtp-Source: APXvYqy6BPTxmJROJmd8xpRbLnJsPInZlt9zqkAt5bAH9XGkXglHOonteC+kQPoH8wbuH3FDnIt6xkHqcmjd+EAPUBo=
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr4977078qvb.187.1581041055375; 
 Thu, 06 Feb 2020 18:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-6-drinkcat@chromium.org>
 <b58a8cf9-3275-cf89-6dff-596aceeb8000@arm.com>
 <CANMq1KBcNr=1_poBHrA_SDo_h-5i3e5TMqASEVaDj5LevsRcOQ@mail.gmail.com>
 <CAPDyKFr4Vz1ihuFQNnhDLEnOs=BZ1n2wzw3CATgPcDXs9g54uA@mail.gmail.com>
In-Reply-To: <CAPDyKFr4Vz1ihuFQNnhDLEnOs=BZ1n2wzw3CATgPcDXs9g54uA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 7 Feb 2020 10:04:04 +0800
Message-ID: <CANMq1KBCd0wNgVAxAzxBwafHoafPExz07wKFhEWQFViAc0LL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panfrost: Add support for multiple power
 domain support
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_180417_327982_154258C7 
X-CRM114-Status: GOOD (  25.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ulf,

On Mon, Jan 27, 2020 at 3:55 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 10 Jan 2020 at 02:53, Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > +Ulf to keep me honest on the power domains
> >
> > On Thu, Jan 9, 2020 at 10:08 PM Steven Price <steven.price@arm.com> wrote:
> > >
> > > On 08/01/2020 05:23, Nicolas Boichat wrote:
> > > > When there is a single power domain per device, the core will
> > > > ensure the power domains are all switched on.
> > > >
> > > > However, when there are multiple ones, as in MT8183 Bifrost GPU,
> > > > we need to handle them in driver code.
> > > >
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > ---
> > > >
> > > > The downstream driver we use on chromeos-4.19 currently uses 2
> > > > additional devices in device tree to accomodate for this [1], but
> > > > I believe this solution is cleaner.
> > >
> > > I'm not sure what is best, but it seems odd to encode this into the Panfrost driver itself - it doesn't have any knowledge of what to do with these power domains. The naming of the domains looks suspiciously like someone thought that e.g. only half of the cores could be powered, but it doesn't look like that was implemented in the chromeos driver linked and anyway that is *meant* to be automatic in the hardware! (I.e. if you only power up one cores in one core stack then the PDC should only enable the power domain for that set of cores).
> >
> > This is actually implemented in the Chrome OS driver [1]. IMHO power
> > domains are a bit confusing [2]:
> >  i. If there's only 1 power domain in the device, then the core takes
> > care of power on the domain (based on pm_runtime)
> >  ii. If there's more than 1 power domain, then the device needs to
> > link the domains manually.
> >
> > So the Chrome OS [1] driver takes approach (i), by creating 3 devices,
> > each with 1 power domain that is switched on/off automatically using
> > pm_runtime.
> >
> > This patch takes approach (ii) with device links to handle the extra domains.
> >
> > I believe the latter is more upstream-friendly, but, as always,
> > suggestions welcome.
>
> Apologies for the late reply. A few comments below.

No worries, than for the helpful reply!

> If the device is partitioned across multiple PM domains (it may need
> several power rails), then that should be described with the "multi PM
> domain" approach in the DTS. As in (ii).
>
> Using "device links" is however optional, as it may depend on the use
> case. If all multiple PM domains needs to be powered on/off together,
> then it's certainly recommended to use device links.

That's the case here, there's no support for turning on/off the
domains individually.

> However, if the PM domains can be powered on/off independently (one
> can be on while another is off), then it's probably easier to operate
> directly with runtime PM, on the returned struct *device from
> dev_pm_domain_attach_by_id().
>
> Also note, there is dev_pm_domain_attach_by_name(), which allows us to
> specify a name for the PM domain in the DTS, rather than using an
> index. This may be more future proof to use.

Agree, probably better to have actual names than just "counting" the
number of domains like I do, especially as we have a compatible struct
anyway. I'll update the patch.

> [...]
>
> Hope this helps.
>
> Kind regards
> Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
