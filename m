Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FB0EB8FB6
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPwzFOCBWCK55DyOoNnL8i9UkFIXZYAg+1Ld8mGQ0Nk=; b=AApcCo3r+XW1FU/8EcNHHniu30
	d44DEygVblkf45bOQ1LuH/cei6DXZXqj40cOV4NdrWESjEdt52gIEKSKY3HeDNe4SFzg5CjJr3AcA
	3C9JwjFWUtT40LIjWxXN83RL43IeDcECnr6PxJgNzJ/czdD5vH3PSYQObtgEfkktUX7COf/eECjw9
	CWiYDFRBi42QA8J449LmO3IwrN8MjyLrrRUO9BlEidctZJBWMA/7bxY6ep9hsCRYnVRyfCRbQqcrv
	VWTpo+34jhZMUOrRVoqS/xRUDespfgVBbma0lX15j+xQieNuoczKNblRI7hfp2q6YVWA1T4O328x+
	867/cz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqUI-008ZJl-2W;
	Wed, 06 Sep 2023 11:14:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqUE-008ZF3-21;
	Wed, 06 Sep 2023 11:14:20 +0000
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFC44283;
	Wed,  6 Sep 2023 13:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1693998769;
	bh=AQq3rEfJzkraL3WBQ5gV4/xZ6makPLqqmlJnfXoE3io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C2N+FLau4PxGx+LQpHMmqzlTxOuTtEhXfFZiohfI+g33WDbMPqaGhdPhTVhEP2jyp
	 wN5w0kRIT+mUBr/4d2mODnoWE/QoCjfuh+MVl72PMk7Q+gNduK0uydH2T5K4uIOxIu
	 ENZsc1WHRFAd13ZUaSWyF7zxJRIRo/mdo5rNWYG8=
Date: Wed, 6 Sep 2023 14:14:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
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
Message-ID: <20230906111429.GC17308@pendragon.ideasonboard.com>
References: <20230905233118.183140-1-paul.elder@ideasonboard.com>
 <20230905233118.183140-4-paul.elder@ideasonboard.com>
 <502fc7b1-a32d-6901-3a45-d2aa0e0c3849@linaro.org>
 <20230906083237.GL7971@pendragon.ideasonboard.com>
 <a3ed9856-a87b-5cf6-26b5-ff2b19234a8a@linaro.org>
 <20230906090058.GB17308@pendragon.ideasonboard.com>
 <59e07c6a-6f1b-0cc7-dddc-96d2a4050843@linaro.org>
 <20230906093531.GO7971@pendragon.ideasonboard.com>
 <169399810391.277971.691693692840899613@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169399810391.277971.691693692840899613@ping.linuxembedded.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_041418_886277_02008EAA 
X-CRM114-Status: GOOD (  27.69  )
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

On Wed, Sep 06, 2023 at 12:01:43PM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2023-09-06 10:35:31)
> > On Wed, Sep 06, 2023 at 11:21:31AM +0200, Krzysztof Kozlowski wrote:
> > > On 06/09/2023 11:00, Laurent Pinchart wrote:
> > > >>> has a regulator@0. There are similar instances for clocks.
> > > >>>
> > > >>> I understand why it may not be a good idea, and how the root node is
> > > >>> indeed not a bus. In some cases, those regulators and clocks are grouped
> > > >>> in a regulators or clocks node that has a "simple-bus" compatible. I'm
> > > >>> not sure if that's a good idea, but at least it should validate.
> > > >>>
> > > >>> What's the best practice for discrete board-level clocks and regulators
> > > >>> in overlays ? How do we ensure that their node name will not conflict
> > > >>> with the board to which the overlay is attached ?
> > > >>
> > > >> Top-level nodes (so under /) do not have unit addresses. If they have -
> > > >> it's an error, because it is not a bus. Also, unit address requires reg.
> > > >> No reg? No unit address. DTC reports this as warnings as well.
> > > > 
> > > > I agree with all that, but what's the recommended practice to add
> > > > top-level clocks and regulators in overlays, in a way that avoids
> > > > namespace clashes with the base board ?
> > > 
> > > Whether you use regulator@0 or regulator-0, you have the same chances of
> > > clash.
> > 
> > No disagreement there. My question is whether there's a recommended
> > practice to avoid clashes, or if it's an unsolved problem that gets
> > ignored for now because there's only 36h in a day and there are more
> > urgent things to do.
> 
> Should an overlay add these items to a simple-bus specific to that
> overlay/device that is being supported?
> 
> That would 'namespace' the added fixed-clocks/fixed-regulators etc...
> 
> But maybe it's overengineering or mis-using the simple-bus.

You would still need to name the node that groups the regulators and
clocks in a way that wouldn't clash between multiple overlays and the
base board. It would be nice to have nodes that are "private" to an
overlay.

> And the items are still not on a 'bus' with an address - they just exist
> on a presumably externally provided board....

-- 
Regards,

Laurent Pinchart

