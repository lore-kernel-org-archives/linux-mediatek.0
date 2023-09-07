Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1180EC8737
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFvKw/C+eRBttYpNIvuoKoEDclnwhygZQkRrbjzi620=; b=paTFxzk9O6ZMfcnSZ8oQsAllb6
	TPXEpufLAKYbHWSZsaMPRCC1q2JdxbUnM8+j6tnFSIt8rLDTxFtBV2quap7zfo3spBT4an/KToc8B
	dbCZ99/VAj6Wbs9OG92p2agkf5E/SzFYeAKGxN9xb5jFWwtCTXC/vUAhtE7WLzHYx0fblyZehm4se
	oZMeRd83fbtvff+Fr4OG0wcLAKgYPBtFJNSSLib4EOXi+8UfJEI98Gb0i8/F/iMBmYVv3qa5mAcGE
	+hhNlbaox8KI1kviyvLA3T9IPLxb9obFrZmtDoc4RCn29JvwRqDWnnoArdSUOaAEyjIX5ZeEg4eNv
	CB/92UWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeGY6-00CEUe-1h;
	Thu, 07 Sep 2023 15:04:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeGY2-00CETQ-38;
	Thu, 07 Sep 2023 15:04:00 +0000
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B32F12CE1;
	Thu,  7 Sep 2023 17:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1694098947;
	bh=Mn1DzFplHiBq8ejqQ2yJAbBIICsOc165Jqw6Kub7OiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLxPhoanBVn3d3nkZ8jaIznfcfbRYFdDgBvjh+EF6gSwkXFgWPmbJ4NwRuR/RlAjo
	 366yttkSBiEYj38E625bs/itwgMHWApUIc44tDKm4bQdayC6tzc5N8BwveqjAk7zIA
	 GUstIOX8pRx4OLUs2fqLytdk1A2JAKH+Y2yG3rVs=
Date: Thu, 7 Sep 2023 18:04:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8365-pumpkin: Add overlays
 for thp7312 cameras
Message-ID: <20230907150408.GC17610@pendragon.ideasonboard.com>
References: <20230905233118.183140-4-paul.elder@ideasonboard.com>
 <502fc7b1-a32d-6901-3a45-d2aa0e0c3849@linaro.org>
 <20230906083237.GL7971@pendragon.ideasonboard.com>
 <a3ed9856-a87b-5cf6-26b5-ff2b19234a8a@linaro.org>
 <20230906090058.GB17308@pendragon.ideasonboard.com>
 <59e07c6a-6f1b-0cc7-dddc-96d2a4050843@linaro.org>
 <20230906093531.GO7971@pendragon.ideasonboard.com>
 <169399810391.277971.691693692840899613@ping.linuxembedded.co.uk>
 <20230906111429.GC17308@pendragon.ideasonboard.com>
 <ZPnkUVmDZYb0ysu0@pyrite.rasen.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPnkUVmDZYb0ysu0@pyrite.rasen.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_080359_171532_D8F22D62 
X-CRM114-Status: GOOD (  33.50  )
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

On Thu, Sep 07, 2023 at 11:55:13PM +0900, Paul Elder wrote:
> On Wed, Sep 06, 2023 at 02:14:29PM +0300, Laurent Pinchart wrote:
> > On Wed, Sep 06, 2023 at 12:01:43PM +0100, Kieran Bingham wrote:
> > > Quoting Laurent Pinchart (2023-09-06 10:35:31)
> > > > On Wed, Sep 06, 2023 at 11:21:31AM +0200, Krzysztof Kozlowski wrote:
> > > > > On 06/09/2023 11:00, Laurent Pinchart wrote:
> > > > > >>> has a regulator@0. There are similar instances for clocks.
> > > > > >>>
> > > > > >>> I understand why it may not be a good idea, and how the root node is
> > > > > >>> indeed not a bus. In some cases, those regulators and clocks are grouped
> > > > > >>> in a regulators or clocks node that has a "simple-bus" compatible. I'm
> > > > > >>> not sure if that's a good idea, but at least it should validate.
> > > > > >>>
> > > > > >>> What's the best practice for discrete board-level clocks and regulators
> > > > > >>> in overlays ? How do we ensure that their node name will not conflict
> > > > > >>> with the board to which the overlay is attached ?
> > > > > >>
> > > > > >> Top-level nodes (so under /) do not have unit addresses. If they have -
> > > > > >> it's an error, because it is not a bus. Also, unit address requires reg.
> > > > > >> No reg? No unit address. DTC reports this as warnings as well.
> > > > > > 
> > > > > > I agree with all that, but what's the recommended practice to add
> > > > > > top-level clocks and regulators in overlays, in a way that avoids
> > > > > > namespace clashes with the base board ?
> > > > > 
> > > > > Whether you use regulator@0 or regulator-0, you have the same chances of
> > > > > clash.
> > > > 
> > > > No disagreement there. My question is whether there's a recommended
> > > > practice to avoid clashes, or if it's an unsolved problem that gets
> > > > ignored for now because there's only 36h in a day and there are more
> > > > urgent things to do.
> > > 
> > > Should an overlay add these items to a simple-bus specific to that
> > > overlay/device that is being supported?
> > > 
> > > That would 'namespace' the added fixed-clocks/fixed-regulators etc...
> > > 
> > > But maybe it's overengineering or mis-using the simple-bus.
> > 
> > You would still need to name the node that groups the regulators and
> > clocks in a way that wouldn't clash between multiple overlays and the
> > base board. It would be nice to have nodes that are "private" to an
> > overlay.
> 
> What's the best solution to this then :/

It seems we don't have a good solution. For now, I'd recommend just
picking a name for the regulator that has a high chance to be unique,
like reg-thp7312-1v2 for instance.

> > > And the items are still not on a 'bus' with an address - they just exist
> > > on a presumably externally provided board....

-- 
Regards,

Laurent Pinchart

