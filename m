Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B39C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 15:17:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFDC61411
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 15:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAFDC61411
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WccRxqWSWor9xAIXFmwxvT8TYwNzu8RHYsneTZu/wg4=; b=nNTGv5WZJUQnvpevuJ4CBkZbX
	yuOVBM/w5tcneGn6fnzv70qdMkzdfkZOf5kx1qmZIltMdKV29yuMlQXfmtP9n6OIMp/BU4R0Uutlv
	jPwGpa2SO3lXoiIzqWXxlsHWn0+mFAm/8t2cJ9L66O9rmnVcxnWWtnViI7T5DqNYPFSkEu3AgrCBT
	uY2QvAsE2qaizmQsonmdGtXh/xvVhD22Ot6f78J47lpdC2oobi6TNjWmI0j7CMsD3kmLDZ3EWxejN
	WKK82p4Y5yomaCpxTgKJKZSB5xEl4Ua37UyIn0pGIpysCycxvr8oaalrYdTqnONDtDgOIc7ZvuCF2
	tk/uIRiYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc8Pf-005vwL-Rn; Thu, 29 Apr 2021 15:17:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8Pb-005vvm-F5; Thu, 29 Apr 2021 15:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jJ48jMIp0hSfiCLziKFhP9eV9v1tPJ0WIyCQG8H3xMI=; b=veu8asuw6K56NcBelT6Hw1nAQG
 sJi0G+4AdJyvQRNvHgQCdFJU06FBZ8buNx5k0EhH2YjOo9eMiw3od7tkV9oe5we01PwfT9JG4HFoo
 HnFPE+H9/Z4njr2x0f4CtGlYK+2f/LSTDf/YH9nf1EP2CrT+7QgF1mHS3eCGglEvD/UEgIrF44+j2
 edBiyhdqPBAPqFQOx3KOav3xl11A3SYZ+Zd60ELqt9fIxl5IrXYquIWpzU1mPmHcQnSaYwC5dE1Lf
 0kPBKGwsS2s8u7lIh/0j5ryKw64ZuK1FTS5WdW/iXdDlT9WCOECjNHDwMvzi3ectRHNQJRNiMkm7L
 3O7yE5Rg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8PW-000iew-PX; Thu, 29 Apr 2021 15:17:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DADC8613F8;
 Thu, 29 Apr 2021 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619709421;
 bh=0TF/rgI+kIrUM4ucLgyoRQVNDZwjwMCttPCbdF1J2ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TNblwH+As0w11JRNen3DEa/sKtquJO7N/ed+Wi2cPt5DPo/pzApjHeB4CYlT9czKN
 RFJnIUjSlU/iXNkujkJ9GfUIBpZYvUPaxBLDLGXBQdVlv5qb6mSpE1DcETxlBJLjdH
 3g63qgtE3JXAaoo4Aq3ZJQdiRo/RBYWmOp0+Glxzsc1YjsicyiOaSi7GIhQYDFx0Ss
 xxX7tIodOuoDf+uK3PdOkr9EHdavuGSGLxTjoqehEjaUHaupkr1YkvsH7C4pSmGQvt
 kJLY88R3n7qjm+eBETbZXRLROLJk7BZhgXtoeO/pKC8+dHkhcGgjRgK0xEL1TOs1c0
 knRtXQpP0PexA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lc8Ph-0006kM-4M; Thu, 29 Apr 2021 17:17:13 +0200
Date: Thu, 29 Apr 2021 17:17:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>, Ricardo Ribalda <ribalda@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, linuxarm@huawei.com,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Shunqian Zheng <zhengsq@rock-chips.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devel@driverdev.osuosl.org,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-tegra@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Benoit Parrot <bparrot@ti.com>, Helen Koike <helen.koike@collabora.com>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, mauro.chehab@huawei.com,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 linux-arm-kernel@lists.infradead.org, Jacob Chen <jacob-chen@iotwrt.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Hyungwoo Yang <hyungwoo.yang@intel.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Dan Scally <djrscally@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 00/79] Address some issues with PM runtime at media
 subsystem
Message-ID: <YIrN+VEY9Sf+eztR@hovoldconsulting.com>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <YImEMN/POW5C8lG7@hovoldconsulting.com>
 <20210429121215.64a7cbdb@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429121215.64a7cbdb@coco.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_081702_926296_5B9566AA 
X-CRM114-Status: GOOD (  51.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 12:18:16PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 28 Apr 2021 17:50:08 +0200
> Johan Hovold <johan@kernel.org> escreveu:
> 
> > On Wed, Apr 28, 2021 at 04:51:21PM +0200, Mauro Carvalho Chehab wrote:
> 
> > > 1. despite its name, this is actually a PM runtime resume call,
> > >    but some developers didn't seem to realize that, as I got this
> > >    pattern on some drivers:
> > > 
> > >         pm_runtime_get_sync(&client->dev);
> > >         pm_runtime_disable(&client->dev);
> > >         pm_runtime_set_suspended(&client->dev);
> > >         pm_runtime_put_noidle(&client->dev);
> > > 
> > >    It makes no sense to resume PM just to suspend it again ;-)  
> > 
> > This is perfectly alright. Take a look at ov7740_remove() for example:
> > 
> > 	pm_runtime_get_sync(&client->dev);
> > 	pm_runtime_disable(&client->dev);
> > 	pm_runtime_set_suspended(&client->dev);
> > 	pm_runtime_put_noidle(&client->dev);
> > 	
> > 	ov7740_set_power(ov7740, 0);
> > 
> > There's an explicit power-off after balancing the PM count and this will
> > work regardless of the power state when entering this function.
> 
> Ok, but this should equally work:
> 
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
>  	
>  	ov7740_set_power(ov7740, 0);
> 
> as there's no additional cleanup made on this particular driver
> between pm_runtime_get_sync() and pm_runtime_put_noidle().

No, that would break the driver as I pointed out to you yesterday:

	https://lore.kernel.org/r/YImG1klSPkFSaS3a@hovoldconsulting.com

If the device is already suspended when remove is called then you'll
end up with an unbalanced call to ov7740_set_power() that will try to
disable an already disabled clock.

> > So this has nothing to do with pm_runtime_get_sync() per se.
> 
> Yes, but some patches on this series are cleaning up the driver release
> logic.

You mentioned this example as an argument against using
pm_runtime_get_sync(), which I don't think makes sense.

> > > 2. Usual *_get() methods only increment their use count on success,
> > >    but pm_runtime_get_sync() increments it unconditionally. Due to
> > >    that, several drivers were mistakenly not calling
> > >    pm_runtime_put_noidle() when it fails;  
> > 
> > Sure, but pm_runtime_get_async() also works this way. You just won't be
> > notified if the async resume fails.
> 
> Granted, it makes sense along the pm_runtime kAPI.
> 
> It is inconsistent with the behavior of kobject_get*() and other
> *_get*() methods that are based or inspired on it, as, on those, the
> operations are atomic: either everything succeeds and it doesn't return
> an error, or the usage counter is not incremented and the object
> state doesn't change after the call.

Right, and I'm aware that some people have overlooked this. But its not
the end of the world since hardly any driver can handle resume failures
properly anyway. 

This is mostly just an exercise to shut up static checkers.

> > > 3. The name of the new variant is a lot clearer:
> > > 	pm_runtime_resume_and_get()
> > >     As its same clearly says that this is a PM runtime resume function,
> > >     that also increments the usage counter on success;  
> > 
> > It also introduced an inconsistency in the API and does not pair as well
> > with the pm_runtime_put variants.
> 
> Agreed. A name that would be more consistent with PM runtime would
> probably be:
> 
> 	pm_runtime_resume_if_get()

Naw, since the get part always succeeds.

It should start with pm_runtime_get, but pm_runtime_get_sync() is
unfortunately taken.

> as there are already:
> 
> 	pm_runtime_get_if_in_use()
> 	pm_runtime_get_if_active()
> 
> But any such discussions are out of the scope of this patchset ;-)

Right.

> > > 4. Consistency: we did similar changes subsystem wide with
> > >    for instance strlcpy() and strcpy() that got replaced by
> > >    strscpy(). Having all drivers using the same known-to-be-safe
> > >    methods is a good thing;  
> > 
> > It's not known to be safe; there are ways to get also this interface
> > wrong as for example this series has shown.
> 
> Very true. Yet, it is a lot simpler to use functions that won't change
> the state of the objects when returning an error, as this is by far
> the most common pattern within the Kernel.

A resume failure does change the state (and needs to be recovered from),
but I get what you're saying.

> Human brains are trained to identify certain patterns. When there's
> something using a similar pattern, but with a different behavior, 
> our brains are more subject to fail identifying problems.

Sure. But I'm not sure that having two interfaces with different
semantics to do the job is doing us any favours here. But again, that
discussion has already been had.

And I realise that this is partly also your motive here (even if the old
interface isn't going to go away).

> > > compile-tested only.
> > > Patches 1 to 7 fix some issues that already exists at the current
> > > PM runtime code;
> > > 
> > > patches 8 to 20 fix some usage_count problems that still exists
> > > at the media subsystem;
> > > 
> > > patches 21 to 78 repaces pm_runtime_get_sync() by 
> > > pm_runtime_resume_and_get();
> > > 
> > > Patch 79 (and a hunk on patch 78) documents the two exceptions
> > > where pm_runtime_get_sync() will still be used for now.

80 patches in one series (posted to lkml) is a bit excessive. Perhaps
you can break it up in a fixes part and one or more cleanups parts?

Johan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
