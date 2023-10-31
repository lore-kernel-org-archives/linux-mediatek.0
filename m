Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379C3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9qfLEK06TzSqBUhhY7WhDo85mwqQZMQIqOjJBw25iQ=; b=UgoPnBI5OsHXOX+mLrsS9rurOy
	oQdL500KrrF8ZhhFIQKVCBc8JZqBlHRyEgl5efdQLf366l4im3LKkLzkjvlHTJ6f91NLtB6eJ7Bg8
	1nleG9rZqqpkIeWF5ZcA7UDnGaz6ddMcPJ4MLVZz1jJFjjjTbRXN57VxrGtSaGFV1qvhmLJQ1ACxl
	FadF0mULfq9aGa1q0ASHEDrNHctArYJJRyXZp7m0mX833ak3lrWbofMcnm3C0dlz8FrTpedcBoEhj
	pJwVWXCqw8lGyuIRbrmAVC4kz3xBDvBaLJSKkzDHBEQ7m7bPbbKlDSkmNerBJkSMIopDYGTQ74wkF
	21rhwW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpfy-005Qws-0Y;
	Tue, 31 Oct 2023 14:25:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpfv-005QvH-2i
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Oct 2023 14:25:01 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D1682E4;
	Tue, 31 Oct 2023 15:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698762276;
	bh=kAQwZszGVqNC6vjTX1Xv7edKgIaht2Jp7zfOZLOGIjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zl4qkg5H7sStGk4TZMyJ/0s3iI3RLNHuFhVJBtpYWHY0CjpWSl86a9JxIvqDFZrG9
	 KPwNQi9O0Vv26HEHXdWWaHam+XKVHV+EmuZuefKHHqpOJ7Zr63QDAarRy0mcfsdM1W
	 P4U/+o6TdPfE++DwHGjVYtPWL4Hwr/pzzIkpqXEE=
Date: Tue, 31 Oct 2023 16:24:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/3] media: i2c: Add driver for THine THP7312
Message-ID: <20231031142459.GB14322@pendragon.ideasonboard.com>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-4-laurent.pinchart@ideasonboard.com>
 <ZTutbU1XG_jKZbIp@valkosipuli.retiisi.eu>
 <20231027124529.GA19539@pendragon.ideasonboard.com>
 <ZTvOIQSmpytUisUD@valkosipuli.retiisi.eu>
 <20231028151858.GB20465@pendragon.ideasonboard.com>
 <ZT9kwC3abUKR9fgQ@valkosipuli.retiisi.eu>
 <20231030104241.GJ12144@pendragon.ideasonboard.com>
 <ZUDatMX10WK0bdid@valkosipuli.retiisi.eu>
 <ZUEEBXfjTPqnnL9b@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZUEEBXfjTPqnnL9b@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_072500_047046_E94D77B8 
X-CRM114-Status: GOOD (  47.84  )
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

On Tue, Oct 31, 2023 at 03:41:25PM +0200, Andy Shevchenko wrote:
> On Tue, Oct 31, 2023 at 10:45:32AM +0000, Sakari Ailus wrote:
> > On Mon, Oct 30, 2023 at 12:42:41PM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 30, 2023 at 08:09:36AM +0000, Sakari Ailus wrote:
> > > > On Sat, Oct 28, 2023 at 06:18:58PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Oct 27, 2023 at 02:50:09PM +0000, Sakari Ailus wrote:
> > > > > > On Fri, Oct 27, 2023 at 03:45:29PM +0300, Laurent Pinchart wrote:
> 
> ...
> 
> > > > > > > > > +#include <linux/of_device.h>
> 
> I believe this shouldn't (mustn't?) be used in a new code.
> Rob have been doing a big job of replacing some OF-specific
> APIs by generic ones.
> 
> ...
> 
> > > > > > > > uapi/linux/thp7321.h ?
> 
> Why does the driver even have that?! Does it allow direct IOCTLs? Some
> other hardware information that should be supplied via "abstract"
> (presumably existing IOCTL)?

Custome V4L2 controls.

> ...
> 
> > > > > > > > > +	sensor->dev->parent = dev;
> > > > > > > > > +	sensor->dev->of_node = of_node_get(sensor->of_node);
> 
> This should be device_set_node().
> 
> > > > > > > > This device could well find its way to a non-OF system. Could you use the
> > > > > > > > fwnode property API instead?
> > > > > > > 
> > > > > > > I'm pretty sure there will be problems if someone was using this driver
> > > > > > > on an ACPI-based system, so trying to pretend it's supported without
> > > > > > > being able to test it may not be the best use of development time. I'll
> > > > > > > try, but if I hit any issue, I'll keep using the OF-specific functions
> > > > > > > in the next version.
> 
> Besides ACPI it may be other ways of instantiating the driver.
> And we, in general, asking for creating OF-independent drivers as long
> as there is no strong evidence that the platform itself and the particular
> hardware never ever will have anything than OF. And it almost always
> not true for discrete (outside the SoC) components.

I'm fine making drivers OF-independent even without any clear evidence
that the device will be used on a non-OF platform when doing so does not
incur an unreasonable extra development cost.

> > > > > > I'd suggest to use OF functions if there's no corresponding fwnode function
> > > > > > available. The intention is they cover the same scope, so it is likely
> > > > > > something that's missing will be added sooner or later.
> > > > > 
> > > > > I understand, but if the conversion is not complete, it's not very
> > > > > valuable. I have no objection against using the fwnode API in the
> > > > > driver, but I'll let someone else handle it when and if needed.
> > > > 
> > > > If you leave it using OF-only API now in a driver that is not bound to OF
> > > > in any way, someone moving it to fwnode later may not be able to test it on
> > > > OF, increasing the likelihood something breaks. So use fwnode API where you
> > > > can now, and we'll address that one call later on.
> > > 
> > > Sorry, this is extra work for very little gain (if any) now, so I don't
> > > plan to do so if I can't implement a full conversion.
> > 
> > I don't see why would you leave this for someone else to clean up later.
> > It's called "technical debt". Similarly, we have no ACPI-only sensor
> > drivers that would use ACPI specific functions that would not be available
> > on non-ACPI systems --- they've all used the fwnode API, missing just
> > regulators, clocks and GPIOs.
> 
> I agree with Sakari. Let's reduce the scope of ACPI/OF/etc-specific functions
> in the drivers. There are really little that have no generic counterparts.
> And most of the usages are special cases.

Sakar has submitted a patch to add one missing fwnode function. If it
gets accepted, I'll try it out and see if I can convert this driver. I
will still not do a partial conversion if I hit any other blocker.

> > If you like, I think we could have an fwnode version of the same function,
> > to be used with DT binding compliant format for the device in ACPI DSDT.
> > Plain ACPI would have no need for the function.

-- 
Regards,

Laurent Pinchart

