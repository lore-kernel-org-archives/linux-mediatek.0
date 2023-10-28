Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A6C0032E
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Oct 2023 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K59C/uh5elT4DEa0YWOGwP2uWKVpGGx8/beIXA9yu0k=; b=QkYuHlRBGCydamDROY+oJU7QM4
	TGQOCWoDF1q5rJ7GzhFl9IPfwm62/B/w5RLOuprP1ocuggJdQOYMCZXdJLFerD1QMoI7gonYAoIyU
	58cdS+MjwXjabJZ9df7qSL186pWd6P1/mPw1NfwlZIHh89DjMxLeL2rPyDWf77CvrAzlJlS03LqVk
	SXimyvqBFAhDnzfzg7eGot7+TOj91ZFH9v/CUAU6TuPiiQY9WV3HvNAPeZjPCuCOONpk/9T8rk9Uq
	x+GtJTyeOHgf1fwwxa5XAMiilDxzOAM+KvlOW2Xdjqo/lqXja6/dPfczP4wY5LYxW6XpbbXNR2cRh
	ZNSz2j0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwl7r-000b8H-27;
	Sat, 28 Oct 2023 15:21:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwl7p-000b7s-0d
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Oct 2023 15:21:22 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8093720;
	Sat, 28 Oct 2023 17:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698506465;
	bh=rIFG5RylCOrTsOn92CCprYkaBaOXGGGb94LhEdMHo6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcSid5K3h0a21RAtVO/krZPPkG0GttN+9U7eZF9NoXTFeILnjgO2C/eRJ7qyAC3Kw
	 pIUdiPqSgTjpCNU8+Kkj3r6HvuXHAcDugM2HRYgNJXARRi2e3iFyGDFenihoqc/tqi
	 9Z6pzAJPY8PaThxiRvwdRmhwy8b3QyKB6XJjg7wk=
Date: Sat, 28 Oct 2023 18:21:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231028152125.GC20465@pendragon.ideasonboard.com>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-2-laurent.pinchart@ideasonboard.com>
 <ZTulSCwfyEF9exu9@valkosipuli.retiisi.eu>
 <20231027121929.GC12144@pendragon.ideasonboard.com>
 <ZTuueXYFeEqqpD6Z@valkosipuli.retiisi.eu>
 <20231027124634.GB19539@pendragon.ideasonboard.com>
 <ZTvOtnbRrykdr7oW@valkosipuli.retiisi.eu>
 <20231027153649.GE12144@pendragon.ideasonboard.com>
 <ZTvk6RRXBQib_Qow@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTvk6RRXBQib_Qow@valkosipuli.retiisi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_082121_380451_93276E14 
X-CRM114-Status: GOOD (  20.99  )
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

On Fri, Oct 27, 2023 at 04:27:21PM +0000, Sakari Ailus wrote:
> On Fri, Oct 27, 2023 at 06:36:49PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 27, 2023 at 02:52:38PM +0000, Sakari Ailus wrote:
> > > On Fri, Oct 27, 2023 at 03:46:34PM +0300, Laurent Pinchart wrote:
> > > > > > > > +  port:
> > > > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > > +    additionalProperties: false
> > > > > > > > +
> > > > > > > > +    properties:
> > > > > > > > +      endpoint:
> > > > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > > > +        unevaluatedProperties: false
> > > > > > > > +
> > > > > > > > +        properties:
> > > > > > > > +          data-lanes:
> > > > > > > > +            description:
> > > > > > > > +              This property is for lane reordering between the THP7312 and the
> > > > > > > > +              SoC. The sensor supports either two-lane, or four-lane operation.
> > > > > > > > +              If this property is omitted four-lane operation is assumed. For
> > > > > > > > +              two-lane operation the property must be set to <1 2>.
> > > > > > > 
> > > > > > > How are link frequencies determined by the device?
> > > > > > 
> > > > > > The link frequency is not under direct control of the host. There are
> > > > > > registers to select between mode presets, each of them producing a
> > > > > > particular link frequency.
> > > > > 
> > > > > If they are known, one could only allow setting the modes with known-good
> > > > > link requencies. This could be added later on, too, affecting systems with
> > > > > link-frequencies set. I guess you could also add it now, as optional.
> > > > 
> > > > I vote for later :-)
> > > > 
> > > > > Where's the link frequency information available? In documentation or in
> > > > > on the firmware API?
> > > > 
> > > > In the documentation (which is not public I'm afraid).
> > > 
> > > Could you add this information in the driver?
> > > 
> > > Co-incidentally, the driver is lacking the LINK_FREQ control. It should be
> > > added.
> > 
> > Oops. Seems I got caught red-handed. I'll fix that (and add the
> > PIXEL_RATE control too).
> 
> :-)
> 
> The PIXEL_RATE is intended to be the pixel rate on the pixel array. The
> driver doesn't have HBLANK or VBLANK so is it even useful to have
> PIXEL_RATE?

I don't mind leaving it out, it's easier.

-- 
Regards,

Laurent Pinchart

