Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183DDC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:37:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA65A206BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3OQVmd8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA65A206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0CyLIPrQtM9EAHrlDhpfEdPlEqp+3zYS68lIhX+sCYI=; b=T3OQVmd8q8Gqr3VCsb+jCraV/
	K3vv7d+67AlUZLAnIzlQx6w1bjiCRayclnQMDiEG4oqRfLrcvmUPD9Jziy4RobhunvodaRUfPn5J1
	NYmygGW5MYOcVtgf6QiEq+G1bdWbAdp6JJcVHUArbKjAsSHgjfmYHrnshCm99VddyRCH3Xyjhoklf
	QG76eCiRuTWxwRZnjAnU1i9BgKHqfp6UX9vS46i3Kbsw++jlGuy+kenlauyOTmRH3hMiVhBZd6n0l
	/2EmciL4RLE2J0S1YH2KYfaaGelF7beQ2M1HGBfmZhba12v5+YitCm8t0qpnpoAwcH4FjbIAailiK
	SzKVRjhOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqHNq-0004vQ-NW; Tue, 30 Jun 2020 14:37:14 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqHNm-0004uK-UF; Tue, 30 Jun 2020 14:37:11 +0000
IronPort-SDR: 848XLfrCVcWewPcrS4sGNAAvY2nUk1TCnY4VdcpsF3g8AesEN7oDScO2wq3Bbb7bZnT0I//3yC
 bx2noAECj6/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="164251999"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="164251999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 07:37:08 -0700
IronPort-SDR: TXnmtpuuv8IkPHzCQZ8xil9NFjyMMlIhDaUlHleEi9/3MlNTBqZVvADOI64AV/rGk+FbVBXUaf
 bDSog2SN/SQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="266488793"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2020 07:37:04 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jqHNh-00GrcC-2T; Tue, 30 Jun 2020 17:37:05 +0300
Date: Tue, 30 Jun 2020 17:37:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200630143705.GW3703480@smile.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
 <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 04:21:31PM +0200, Tomasz Figa wrote:
> On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:

...

> > > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > >
> > >
> > > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > > the sensor off the first time. Alternatively make reset signal high in
> > > runtime suspend callback.
> >
> > We might want to keep the signals low when the regulators are powered
> > down, to reduce the leakage.
> 
> Ah, I actually recall that the reset pin was physically active low, so
> we would indeed better keep it at HIGH. Sorry for the noise.

Here HIGH means "asserted", so in the code above it's LOW, means "deasserted",
i.o.w. non-reset state. I dunno what is better, it depends to the firmware /
driver expectations of the device configuration (from the power point of view,
HIGH makes sense here, and not LOW, i.o.w. asserted reset line).

And nice of the logical state that it doesn't depend to the active low / high
(the latter just transparent to the user).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
