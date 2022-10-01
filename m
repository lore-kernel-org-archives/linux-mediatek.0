Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D01C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Oct 2022 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbamZ2ow/g11hpM+MF84OwCGJ/5vic7bSg5IL8Tgc1s=; b=Vl1lVZO53vZiCmhSMZuzg1OZdj
	pP7u9m5/CgNYiYzVJPaV2nqsiVNxA8AVbXrJYmkdxv7rRWEbPqdGJzTfpbF6g7TP+/SwpuanuBPz5
	tDQWqyCSTn1egDE9KWHj3g6cSfK1w9mMVph+auFR7EyJb4xNoU1xtEXjnyDgLiIYOtvH3kpqz1Hpm
	bRwKq5j8w5wX/Xjhj7F2ZIndrUnFl4nWzVP4QPpxaesZxnWfCPl7Gw0dnGYI58UDlveemIuLSUiz0
	MxFj0lsWqeU4BOLLhkKQ5S4pcps7/lxR/Q4El0sgzFp4P8zgZHeZnE43SCFPmRoSiL73rHgqnd93z
	ZXmx//PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeg1I-00FMJA-Pe; Sat, 01 Oct 2022 17:11:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeg18-00FMGH-AT; Sat, 01 Oct 2022 17:11:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 788AF60B93;
	Sat,  1 Oct 2022 17:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392F2C433D6;
	Sat,  1 Oct 2022 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664644266;
	bh=8/44+tCSDFyhjA92zaYauwO92/g0g3Xh1rsDr7QVWcU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qmheUtIfr5JybckX7f7bA9Sd3Py8wBG14xJCadq/+nk6NPIk5qQI/rioK0VZT9Ou3
	 qLzTCn/nLQAlNGDG6JpXFxnVCavpzpB2/OvcNreWI6yqLH9LIKn8rjUs/6cTHgI++k
	 9D58XicM9lDLXIcDIywsUITbNqDeKwLeGntsiHqKNaAp+doEnWZaEhD637mab7dlux
	 OwMPtsOK9QULS9GD6Tlcy+qKFSkh+Ojg4eoi6EDB3ymwYDjsXT/2Bpaed0JnB5LB4F
	 mov9I9irgRKH0x6IfWtrvmD/hFKht/ZbdV7jcHjeQITd2EMzJTxQRQEQ+059ise5pA
	 P5Ks5UgL1YkRg==
Date: Sat, 1 Oct 2022 18:11:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, ChiaEn Wu <peterwu.pub@gmail.com>,
 pavel@ucw.cz, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 lars@metafoo.de, andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com,
 alice_chen@richtek.com, cy_huang@richtek.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, szunichen@gmail.com, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v12 3/5] iio: adc: mt6370: Add MediaTek MT6370 support
Message-ID: <20221001181117.7b3f3297@jic23-huawei>
In-Reply-To: <YzXbJM31s0P0nLD5@google.com>
References: <cover.1663926551.git.chiaen_wu@richtek.com>
	<9bf36f09bc5f002f2b09b7cc26edccf109516465.1663926551.git.chiaen_wu@richtek.com>
	<20220924155525.5663bed8@jic23-huawei>
	<YzFY5FI0PrZqdAiZ@google.com>
	<CAL_JsqKKJGtacbzGqCupFniSGha610L1cay2V+AK8vehTA=F=g@mail.gmail.com>
	<YzQSnuwPjzJIgsYq@google.com>
	<20220929163418.GA2270491-robh@kernel.org>
	<YzXbJM31s0P0nLD5@google.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_101110_492083_C3B7828B 
X-CRM114-Status: GOOD (  36.63  )
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

On Thu, 29 Sep 2022 18:51:32 +0100
Lee Jones <lee@kernel.org> wrote:

> On Thu, 29 Sep 2022, Rob Herring wrote:
> 
> > On Wed, Sep 28, 2022 at 10:23:42AM +0100, Lee Jones wrote:  
> > > On Mon, 26 Sep 2022, Rob Herring wrote:
> > >   
> > > > On Mon, Sep 26, 2022 at 2:46 AM Lee Jones <lee@kernel.org> wrote:  
> > > > >
> > > > > On Sat, 24 Sep 2022, Jonathan Cameron wrote:
> > > > >  
> > > > > > On Fri, 23 Sep 2022 10:51:24 +0800
> > > > > > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > > > > >  
> > > > > > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > > > >
> > > > > > > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > > > > > > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > > > > > > driver, display bias voltage supply, one general purpose LDO, and the
> > > > > > > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > > > > > > standards.
> > > > > > >
> > > > > > > Add support for the MT6370 ADC driver for system monitoring, including
> > > > > > > charger current, voltage, and temperature.
> > > > > > >
> > > > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > > > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > > > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>  
> > > > > >
> > > > > > This will have to either wait for next cycle, or go through mfd because
> > > > > > of the dt-bindings include which is in the mfd tree.
> > > > > >
> > > > > > Please make those dependencies clear in new versions.  
> > > > >
> > > > > If the bindings come together in -next, then subsequently in Mainline,
> > > > > it shouldn't really matter.  
> > > > 
> > > > Except that the bindings haven't come together and at this point may
> > > > not for 6.1. linux-next has been warning for weeks because the child
> > > > device schemas haven't been applied. I've said it before, all the
> > > > schemas for MFD devices need to be applied together. Or at least the
> > > > MFD schema needs to get applied last.
> > > > 
> > > > Furthermore, subsequent versions of this don't get tested and we end
> > > > up with more warnings[1].
> > > > 
> > > > It's only your IIO tree that the DT  
> > > > > tooling with complain about, right?  
> > > > 
> > > > And the MFD tree...
> > > > 
> > > > Please apply the LED bindings (patches 1 and 2) so we can get the
> > > > existing warnings fixed and address any new warnings.  
> > > 
> > > Who usually applies LED bindings?  Looks as though they're good to go.  
> > 
> > Pavel. The issue would be I don't know if the driver side is ready and 
> > those usually go together. Other than my complaining here, how's he 
> > supposed to know that the bindings at least need to be applied?
> > 
> > Again, the process here is not working. I've said before, all the 
> > bindings for an MFD need to go via 1 tree. You obviously don't agree, so 
> > propose something. The current process of no coordination doesn't work.  
> 
> The solution would be for someone to create succinct immutable branches, like
> I do for real code.  If someone would be happy to do that, I'd be more than
> happy to pull from them.
> 
> I go to the effort of creating them to prevent actual build breakages,
> however doing so to keep a documentation helper script happy is a step
> too far for me personally, sorry.
> 

In this case the bindings include is included from the driver - not just the
binding.  Obviously there are dances to get around that by using the values
and replacing in following cycle, but that's not the case here!

Jonathan


