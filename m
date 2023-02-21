Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EBBC636D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 00:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbRbfOg+dBTkdgD8ZibaoS2Qloqzj6jzK3SK0/a4F8c=; b=bVZPt+JIX4vRoJNevroHX98Qcs
	VrMyUSwb4sBDuoXLoH5ZRyXCzpNNUcRLRnH+Xcr/bz+e2gIdVdL2C20LoPFtTJ9CVpOTr0IAS49+2
	3beXXi2M+0GZF5MhL+ks9ts3Z1z32Sgxrs8w2EOPYQsnRWmV4iVL2DCjwAXR1OTw/MF5VxJb9ztB7
	VXs1E3dC8e+q8M3+VTD8K46Z1bhQ6Dzo4ORaEtGu+qcoF4lQ8wQ/1BQZUH2W4f8gB9Buq2sbBcZ76
	ohZ9/hRutVJn5lcOLTL1wRBauYMacI5rqQONqUrTCTLVCGO+a2Ro7/GrqmOYSn3t7oTfwXXM+LAqI
	hap+0rpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUGJB-0063j6-5m; Tue, 21 Feb 2023 00:15:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUGJ8-0063h7-3m; Tue, 21 Feb 2023 00:14:59 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pUGIh-0005aB-1e;
	Tue, 21 Feb 2023 01:14:31 +0100
Date: Tue, 21 Feb 2023 00:14:25 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mingming Su <Mingming.Su@mediatek.com>,
	linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwrng: add driver for MediaTek TRNG SMC
Message-ID: <Y/QM4YtDWocpY9hb@makrotopia.org>
References: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
 <84de90f5-da77-d3f2-c14a-d2e5c53bbf1c@collabora.com>
 <0d5d5d00-8569-a642-cca7-798c8d24a986@gmail.com>
 <20230220235811.GA618419-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230220235811.GA618419-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_161458_171204_BDB4A6B4 
X-CRM114-Status: GOOD (  38.36  )
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

On Mon, Feb 20, 2023 at 05:58:11PM -0600, Rob Herring wrote:
> On Thu, Feb 16, 2023 at 12:32:10PM +0100, Matthias Brugger wrote:
> > 
> > 
> > On 16/02/2023 11:03, AngeloGioacchino Del Regno wrote:
> > > Il 15/02/23 14:27, Daniel Golle ha scritto:
> > > > Add driver providing kernel-side support for the Random Number
> > > > Generator hardware found on Mediatek SoCs which have a driver in ARM
> > > > TrustedFirmware-A allowing Linux to read random numbers using a
> > > > non-standard vendor-defined Secure Monitor Call.
> > > > 
> > > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > 
> > > Hello Daniel,
> > > 
> > > incidentally, I've also done some research on this one some months ago, when
> > > I was deep in adding support for the Helio X10 SoC (MT6795) on Xperia M5.
> > > 
> > > The rng-v2 is simply the same rng but hypervised by the TF-A... and the only
> > > difference is, well, as you're also pointing out, that we're using secure
> > > monitor calls instead of direct MMIO handling.
> > > 
> > > There's also not much more than what you've implemented here and the only kind
> > > of addition that we will ever see on this one will be about changing the SIP
> > > command (as some older SoCs use a different one)... so...
> > > 
> > > ...I don't think that adding an entirely new driver is worth the noise, hence
> > > I propose to simply add handling for the Secure RNG to mtk-rng.c instead: it's
> > > shorter and we would only need to address one if branch on that probe function
> > > to set a different callback.
> > > 
> > > The clock should then be optional for *some* of those "v2 handling" devices,
> > > as if I recall correctly, some do need the clock to be handled from Linux
> > > anyway... otherwise this v2 driver will be "soon" looking bloody similar to
> > > the "v1", adding a bit of code duplication around.
> > > 
> > > What do you think?
> > > 
> > 
> > That was exactly what I was thinking as well when I had a look at the
> > driver. I propose to add it to mtk-rng.c. I don't see any value having a
> > second driver for this.
> 
> Or fix the firmware to use the already defined SMC TRNG interface...

I agree that this would obviously be the best solution of all, and it's
also not completely impossible as TF-A for this platform can quite easily
be built from source. However, for devices already out there it may still
not be an option.

> 
> In any case, like the SMC TRNG, you don't need a DT binding. The 
> firmware interface is discoverable. Try the SMC call and if it succeeds, 
> you have a TRNG.

I'll try that and let you know how it goes ;)


Cheers


Daniel

> 
> Rob
> 
> > 
> > Regards,
> > Matthias
> > 
> > > Regards,
> > > Angelo
> > > 
> > > > ---
> > > >   MAINTAINERS                         |  1 +
> > > >   drivers/char/hw_random/Kconfig      | 16 +++++++
> > > >   drivers/char/hw_random/Makefile     |  1 +
> > > >   drivers/char/hw_random/mtk-rng-v2.c | 74 +++++++++++++++++++++++++++++
> > > >   4 files changed, 92 insertions(+)
> > > >   create mode 100644 drivers/char/hw_random/mtk-rng-v2.c
> > > > 
> > > 

