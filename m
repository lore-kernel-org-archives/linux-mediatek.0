Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55464C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osR47h8hZijUiWkRpNe4tgz4I5D1NmDPfRHkjph4yN0=; b=xj1gaDVulxAEQPq/qMPDapKoWo
	FTBxU3Q7OAUgX+WxR93d3o1KQSDCxC8jNb+zF/wN2UsHzdM/ONsKo443uLw9/lpPhK1qYv1K3N1a1
	7/b57O73Gk6bToqdGuV+hnVgI/qjjLEuyXQRxCOBO4SJh7ezhku2laN1mYSdiMB2wxs6n4ZDlFSRz
	iJZ60gOyJ86HsAKuj2IUSv36VVDkLfkwAIQP8+dHdsnd4SuElYcusmL0doDRRmECaX7mvQP49etNG
	38TEj6lbjmE9EkbrGo5D2ghXmKg6k5Ug76FG45ce/qLzQFph5KHwlJoCAnsINhUus2zag3jD54Kkq
	INIsT+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofG2D-004RMS-CH; Mon, 03 Oct 2022 07:38:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofG22-004RGe-Fd; Mon, 03 Oct 2022 07:38:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78EFDB80E6C;
	Mon,  3 Oct 2022 07:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8850C433C1;
	Mon,  3 Oct 2022 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664782707;
	bh=FMDhul54hBYZQNvlhI+0jeQ0A7mo8ydCvb98f+w5/tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qC/Zb5U+/jHtIErjFIKbjqnjDcQLpGQ/tPS0CHeha5N2hizQpMJqK2bVyz9DEt/8y
	 3lzB67Ezb/Oxogf7vMwoXpNYaca8yLrMSwfWPOHUA0zjvJ02TdOJRzaRyyrIrysmCE
	 qF3IWzh516DSH/1ocyrZFWzaq00P3BcoW1ljSobzh24bvxNGqAZf2a5tQhvmyHI7Vs
	 fCOqxa8cN1n5FepDwgI8QgL2aKuBxVg2VfbIF9Z41fdGEPhYLyqApXDDo1xbkhJGTC
	 p0Xaq/RM8wOZHOJA1UqynUyDXg/OOuAG5KzB2M1soRfmCw2pDe7U9T2GdnBN6Nls1u
	 ZI5k4VIlRa1Ag==
Date: Mon, 3 Oct 2022 08:38:19 +0100
From: Lee Jones <lee@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>, ChiaEn Wu <peterwu.pub@gmail.com>,
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
Message-ID: <YzqRa4bF3onhHPva@google.com>
References: <cover.1663926551.git.chiaen_wu@richtek.com>
 <9bf36f09bc5f002f2b09b7cc26edccf109516465.1663926551.git.chiaen_wu@richtek.com>
 <20220924155525.5663bed8@jic23-huawei>
 <YzFY5FI0PrZqdAiZ@google.com>
 <CAL_JsqKKJGtacbzGqCupFniSGha610L1cay2V+AK8vehTA=F=g@mail.gmail.com>
 <YzQSnuwPjzJIgsYq@google.com>
 <20220929163418.GA2270491-robh@kernel.org>
 <YzXbJM31s0P0nLD5@google.com>
 <20221001181117.7b3f3297@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221001181117.7b3f3297@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_003830_841342_F55E13FE 
X-CRM114-Status: GOOD (  39.34  )
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

On Sat, 01 Oct 2022, Jonathan Cameron wrote:

> On Thu, 29 Sep 2022 18:51:32 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > On Thu, 29 Sep 2022, Rob Herring wrote:
> > 
> > > On Wed, Sep 28, 2022 at 10:23:42AM +0100, Lee Jones wrote:  
> > > > On Mon, 26 Sep 2022, Rob Herring wrote:
> > > >   
> > > > > On Mon, Sep 26, 2022 at 2:46 AM Lee Jones <lee@kernel.org> wrote:  
> > > > > >
> > > > > > On Sat, 24 Sep 2022, Jonathan Cameron wrote:
> > > > > >  
> > > > > > > On Fri, 23 Sep 2022 10:51:24 +0800
> > > > > > > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > > > > > >  
> > > > > > > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > > > > >
> > > > > > > > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > > > > > > > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > > > > > > > driver, display bias voltage supply, one general purpose LDO, and the
> > > > > > > > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > > > > > > > standards.
> > > > > > > >
> > > > > > > > Add support for the MT6370 ADC driver for system monitoring, including
> > > > > > > > charger current, voltage, and temperature.
> > > > > > > >
> > > > > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > > > > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > > > > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>  
> > > > > > >
> > > > > > > This will have to either wait for next cycle, or go through mfd because
> > > > > > > of the dt-bindings include which is in the mfd tree.
> > > > > > >
> > > > > > > Please make those dependencies clear in new versions.  
> > > > > >
> > > > > > If the bindings come together in -next, then subsequently in Mainline,
> > > > > > it shouldn't really matter.  
> > > > > 
> > > > > Except that the bindings haven't come together and at this point may
> > > > > not for 6.1. linux-next has been warning for weeks because the child
> > > > > device schemas haven't been applied. I've said it before, all the
> > > > > schemas for MFD devices need to be applied together. Or at least the
> > > > > MFD schema needs to get applied last.
> > > > > 
> > > > > Furthermore, subsequent versions of this don't get tested and we end
> > > > > up with more warnings[1].
> > > > > 
> > > > > It's only your IIO tree that the DT  
> > > > > > tooling with complain about, right?  
> > > > > 
> > > > > And the MFD tree...
> > > > > 
> > > > > Please apply the LED bindings (patches 1 and 2) so we can get the
> > > > > existing warnings fixed and address any new warnings.  
> > > > 
> > > > Who usually applies LED bindings?  Looks as though they're good to go.  
> > > 
> > > Pavel. The issue would be I don't know if the driver side is ready and 
> > > those usually go together. Other than my complaining here, how's he 
> > > supposed to know that the bindings at least need to be applied?
> > > 
> > > Again, the process here is not working. I've said before, all the 
> > > bindings for an MFD need to go via 1 tree. You obviously don't agree, so 
> > > propose something. The current process of no coordination doesn't work.  
> > 
> > The solution would be for someone to create succinct immutable branches, like
> > I do for real code.  If someone would be happy to do that, I'd be more than
> > happy to pull from them.
> > 
> > I go to the effort of creating them to prevent actual build breakages,
> > however doing so to keep a documentation helper script happy is a step
> > too far for me personally, sorry.
> > 
> 
> In this case the bindings include is included from the driver - not just the
> binding.  Obviously there are dances to get around that by using the values
> and replacing in following cycle, but that's not the case here!

The paragraphs above to not pertain to the use of shared include
files.  Obviously that would be a good case for the use of IBs.

-- 
Lee Jones [李琼斯]

