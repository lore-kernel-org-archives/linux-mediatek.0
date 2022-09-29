Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247E5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=priF4YOKPlWsoG5ki5A0knzt567cVTtA0/xxM4O68mo=; b=D/kZEtcCihUn2W1GswOhpgwWjQ
	1j9YbM7UX7McmiBGQr6hXWap/CrC1hfqltyVghY729NUYe9cmb0XBBOqTnzn8rVTHhM+6Ng2eYzmT
	4PSKz8HHKd6ywaeSHOnlbkz2tW5IK6HOV3pvexZ0QXZOj2OJeVcTbHBKkqBYkdrXUSTFedNONGPzh
	rJAwPQBMLlF/ixMxbxzTZUWwYkI32Pi/DMhB0tfwFCkXoQI8aL0XA2QVqi4BwdfdxLwEgYSbbT8UR
	j9vuTx2LuYP5+phF1Jwf2/+uOKodCw6hNnHBIUjrnSbTk4KjSqNVUmDLUtMoqaFKFH2dMEsYqGJhC
	q6b0i+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxhT-004jbO-NL; Thu, 29 Sep 2022 17:51:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxhH-004jY1-O5; Thu, 29 Sep 2022 17:51:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5216DB82617;
	Thu, 29 Sep 2022 17:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05048C43141;
	Thu, 29 Sep 2022 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664473900;
	bh=/rgIw13/q7gyzY3HDMRyadzYlUbWim4MSs3xVb/+10A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAPtwETm/aNpnZV6tOadVoZyzaLVgAp4tlpn3dyhJLP3q+4PFIkxYNT/0O8FRhkPn
	 l5q6g8iLtBP72jHr5JGT0tggqRRjsi6k4VVB0CrYu3whpcm+6sMtyQ7GVtr31R3sg9
	 zfC81dKmHz1WjsoFjX3nJ6bljXM2dcFpM+jY5UGQUR3++1AoWHsUPnZhZnPpQKKH+a
	 fzcHvsK+jjGVs5nZCGcsLrnUczCfF9jdhaorVLMaOhR29fIJ42H+P7mJVAFrz6Nl2Y
	 J0xljmp6Yc4eDfV4uWgCMKmy/FkyV2sjclCWf9sQ9hxWqdVb/VRoAZ3Nfi766oBrwa
	 xdRv+OghfH5Og==
Date: Thu, 29 Sep 2022 18:51:32 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, ChiaEn Wu <peterwu.pub@gmail.com>,
	pavel@ucw.cz, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, lars@metafoo.de,
	andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, szunichen@gmail.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v12 3/5] iio: adc: mt6370: Add MediaTek MT6370 support
Message-ID: <YzXbJM31s0P0nLD5@google.com>
References: <cover.1663926551.git.chiaen_wu@richtek.com>
 <9bf36f09bc5f002f2b09b7cc26edccf109516465.1663926551.git.chiaen_wu@richtek.com>
 <20220924155525.5663bed8@jic23-huawei>
 <YzFY5FI0PrZqdAiZ@google.com>
 <CAL_JsqKKJGtacbzGqCupFniSGha610L1cay2V+AK8vehTA=F=g@mail.gmail.com>
 <YzQSnuwPjzJIgsYq@google.com>
 <20220929163418.GA2270491-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929163418.GA2270491-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_105144_116518_AF07964F 
X-CRM114-Status: GOOD (  31.93  )
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

On Thu, 29 Sep 2022, Rob Herring wrote:

> On Wed, Sep 28, 2022 at 10:23:42AM +0100, Lee Jones wrote:
> > On Mon, 26 Sep 2022, Rob Herring wrote:
> > 
> > > On Mon, Sep 26, 2022 at 2:46 AM Lee Jones <lee@kernel.org> wrote:
> > > >
> > > > On Sat, 24 Sep 2022, Jonathan Cameron wrote:
> > > >
> > > > > On Fri, 23 Sep 2022 10:51:24 +0800
> > > > > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > > > >
> > > > > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > > >
> > > > > > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > > > > > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > > > > > driver, display bias voltage supply, one general purpose LDO, and the
> > > > > > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > > > > > standards.
> > > > > >
> > > > > > Add support for the MT6370 ADC driver for system monitoring, including
> > > > > > charger current, voltage, and temperature.
> > > > > >
> > > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > >
> > > > > This will have to either wait for next cycle, or go through mfd because
> > > > > of the dt-bindings include which is in the mfd tree.
> > > > >
> > > > > Please make those dependencies clear in new versions.
> > > >
> > > > If the bindings come together in -next, then subsequently in Mainline,
> > > > it shouldn't really matter.
> > > 
> > > Except that the bindings haven't come together and at this point may
> > > not for 6.1. linux-next has been warning for weeks because the child
> > > device schemas haven't been applied. I've said it before, all the
> > > schemas for MFD devices need to be applied together. Or at least the
> > > MFD schema needs to get applied last.
> > > 
> > > Furthermore, subsequent versions of this don't get tested and we end
> > > up with more warnings[1].
> > > 
> > > It's only your IIO tree that the DT
> > > > tooling with complain about, right?
> > > 
> > > And the MFD tree...
> > > 
> > > Please apply the LED bindings (patches 1 and 2) so we can get the
> > > existing warnings fixed and address any new warnings.
> > 
> > Who usually applies LED bindings?  Looks as though they're good to go.
> 
> Pavel. The issue would be I don't know if the driver side is ready and 
> those usually go together. Other than my complaining here, how's he 
> supposed to know that the bindings at least need to be applied?
> 
> Again, the process here is not working. I've said before, all the 
> bindings for an MFD need to go via 1 tree. You obviously don't agree, so 
> propose something. The current process of no coordination doesn't work.

The solution would be for someone to create succinct immutable branches, like
I do for real code.  If someone would be happy to do that, I'd be more than
happy to pull from them.

I go to the effort of creating them to prevent actual build breakages,
however doing so to keep a documentation helper script happy is a step
too far for me personally, sorry.

-- 
Lee Jones [李琼斯]

