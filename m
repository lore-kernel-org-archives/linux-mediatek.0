Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C90C77B7E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 20:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71Hj1US0pSM/IwfSeQssNoD3szbJK4N2OqLUHAmgjD4=; b=QgSLOa4/C2Ejk4+D0rDEeLAkWK
	hncZi0CZbhXm9eQVKG1Hh5DLVACaP+04zqeCUIuWWquU62pB4SBQkm4CMVUdebTjlp6eDPInOZ2sN
	gCQFDEt6Br+I7BnJ5Wm7YLfLsTnxb1ae0BbVKyXegujWl/08TclUiBglbe9L+NpRszyMCpNylIeNM
	whs88zZHHSUPxANxKIwwb0uzcCfxMK6NAKOWCiXjvXWf6u+dwwEyTknoC3DXuYHwoyD00N8MgS+YZ
	JYpMYOIUCl/Zx9CvrBOqGUe0QKaH+MH066NPpfyB85q/rLjXGxslk0LRaXFqeTfXA6bDKV1TYeOLu
	hiyXrnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUH7-00Bgfp-11;
	Fri, 28 Apr 2023 20:01:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUH2-00Bge0-1L;
	Fri, 28 Apr 2023 20:00:58 +0000
Received: from notapiano (unknown [194.36.25.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ACF8F66032CF;
	Fri, 28 Apr 2023 21:00:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682712054;
	bh=6i1JUq29VFHhcwxsShC8PZn9X8kOz1TV4HuL2Wb9A2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0iioVLUW03JDY5ecGWdF3jrGqspgJ31dBgi6MIyuHKvh809IXfDbjNkLqzXlt3Pg
	 b4C6QSUOlxbf7vbKPiddSQft0WbwieHVXxlOwskGjfWnoFGAJs/cw1E3FTqiD8DRto
	 c5tA469u0nmiDbw8vESjqzPYHRJa6i1onhQh2x6J9pZkMfZe7se0j7Hmj5NyjtUvFT
	 2LQF6TSTvW9n/hagf71iviV+PR9UIn1g7SUM4BeZftDCbQifMSZL9tWMcniVTlV9AQ
	 XCc8s3k0kyHEFU0Sj4hwpTdcLBjgv+6aRAjdMnA67NWqg154TXkeLLerjmTXJjqimM
	 h8Huc8mnGBJRA==
Date: Fri, 28 Apr 2023 16:00:45 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com, rafael@kernel.org,
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org, ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	khilman@baylibre.com, james.lo@mediatek.com,
	rex-bc.chen@mediatek.com, Alexandre Bailon <abailon@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
Message-ID: <5a437b3c-e134-40df-830a-7ea0f21849fc@notapiano>
References: <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
 <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
 <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com>
 <CAGXv+5EZPWohGN5CaEiqVrM4MyAar3cPEUhHtGY_9wTJSJNVFQ@mail.gmail.com>
 <CAGuA+oqF4jFMyEo09VDmCf-_7g0ua3XDKDAJ+t3Gat14pDM9NA@mail.gmail.com>
 <fab67eef-4dc9-420d-b127-aedc6f54cad0@notapiano>
 <CAGXv+5E0rzByZBn91d60MQ7P0=GbAQUH=PK9EYDu3Upr33td6A@mail.gmail.com>
 <CAGuA+oo0w8n9zEKdd1UfYx+F08wK4CcUGqRbBi4C-xNYp+vtDA@mail.gmail.com>
 <28e50e45-53cf-4a34-a81c-10f1faab2d4e@notapiano>
 <CAGuA+oprz06WS0reC1Edqr1fMn-TjSrCgoO_M54JYQ4x8UnTOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGuA+oprz06WS0reC1Edqr1fMn-TjSrCgoO_M54JYQ4x8UnTOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_130056_709246_7C8D5E7E 
X-CRM114-Status: GOOD (  55.93  )
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

On Thu, Apr 27, 2023 at 04:08:13PM +0200, Balsam CHIHI wrote:
> On Thu, Apr 27, 2023 at 1:20 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Tue, Apr 25, 2023 at 01:28:39PM +0200, Balsam CHIHI wrote:
> > > On Tue, Apr 25, 2023 at 12:00 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > > >
> > > > On Tue, Apr 25, 2023 at 6:21 AM Nícolas F. R. A. Prado
> > > > <nfraprado@collabora.com> wrote:
> > > > >
> > > > > On Tue, Mar 28, 2023 at 02:20:24AM +0200, Balsam CHIHI wrote:
> > > > > > On Sat, Mar 25, 2023 at 5:33 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > > > > > >
> > > > > > > On Wed, Mar 22, 2023 at 8:48 PM Balsam CHIHI <bchihi@baylibre.com> wrote:
> > [..]
> > > > > >
> > > > > > Hi Chen-Yu Tsai,
> > > > > >
> > > > > > Thank you very much for helping me testing this suggestion.
> > > > > >
> > > > > > Indeed, calibration data is stored differently in the mt8192 compared to mt8195.
> > > > > > So, the mt8192's support will be delayed for now, to allow further debugging.
> > > > > >
> > > > > > In the mean time, we will only continue to upstream the remaining
> > > > > > mt8195's source code, so it will get full LVTS support.
> > > > > > A new series will be submitted soon.
> > > > >
> > > > > Hi Balsam,
> > > > >
> > > > > like Chen-Yu mentioned, the calibration data is stored with 4 byte alignment for
> > > > > MT8192, but the data that is split between non-contiguous bytes is for the
> > > > > thermal controllers (called Resistor-Capacitor Calibration downstream) not the
> > > > > sensors. The controller calibration isn't currently handled in this driver (and
> > > > > downstream it also isn't used, since a current value is read from the controller
> > > > > instead), so we can just ignore those.
> > > > >
> > > > > The patch below adjusts the addresseses for the sensors and gives me reasonable
> > > > > reads, so the machine no longer reboots. Can you integrate it into your series?
> > > >
> > > > Not sure what I got wrong, but on my machine the VPU0 and VPU1 zone interrupts
> > > > are still tripping excessively. The readings seem normal though. Specifically,
> > > > it's bits 16 and 17 that are tripping.
> > > >
> > >
> > > Hi Chen-Yu,
> > >
> > > Thank you for testing!
> > >
> > > As the readings are normal that proves that calibration data offsets
> > > are correct.
> > > would you like that I send the v2 of series to add mt8192 support?
> > > Then we could deal with the interrupts later in a separate fix,
> > > because the interrupt code in common for both SoC (mt8192 and mt8195)?
> > >
> > > Does Nícolas also have tripping interrupts?
> > > On my side, I've got no interrupts tripping on mt8195.
> > >
> > > Any other suggestions (a question for everyone)?
> >
> > Hi,
> >
> > sorry for the delay.
> >
> > Indeed the interrupts are constantly tripping on mt8192 here as well.
> >
> > I do not see the same bits as Chen-Yu mentioned however, I see
> >
> > LVTS_MONINTSTS = 0x08070000
> >
> > which corresponds to
> >
> >         Hot threshold on sense point 3
> >         high to normal offset on sense point 2
> >         high offset on sense point 2
> >         low offset on sense point 2
> >
> > and it's the same on all controllers and domains here, which is weird. I noticed
> > we have offset interrupts enabled even though we don't configure the values for
> > those, but even after disabling them and clearing the status register, the
> > interrupts keep triggering and the status is the same, so for some reason
> > LVTS_MONINT doesn't seem to be honored.
> >
> > I also tried using the filtered mode instead of immediate for the sensors, and
> > that together with disabling the extra interrupts, got me a zeroed
> > LVTS_MONINTSTS. However no interrupts seem to be triggered at all (nor
> > LVTS_MONINTSTS updated) when the temperature goes over the configured one in
> > LVTS_HTHRE.
> >
> > I tried the driver on mt8195 (Tomato chromebook) as well, and it has the same
> > LVTS_MONINTSTS = 0x08070000
> > even though the interrupts aren't being triggered, but in fact I don't see them
> > triggering over the threshold either, so I suspect the irq number might be
> > incorrectly described in the DT there.
> >
> > Do either of you have it working correctly on mt8195?
> >
> > Anyway, I'll keep digging and reply here when I find a solution.
> 
> Hi Nícolas,
> 
> Thank your for your time testing and investigating the interrupt issues!
> 
> I only have an mt8195 based board (i1200-demo), and I could not
> trigger any interrupt on it.
> I whish that MediaTek could reply to this thread to give us more
> information (I avoid disclosing MediaTek's internal information).
> And now, it's clear that mt8192 interrupts does work at least (but not
> properly, may be we could fix it at driver level).
> 
> It's been a couple of days since I sent a v2 of the series that adds
> LVTS support for mt8192 SoC (+ Suspend and Resume, + Doc update):
> "https://lore.kernel.org/all/20230425133052.199767-1-bchihi@baylibre.com/".
> I wish that it will be applied very soon, then we could patch the core driver.
> 
> My colleagues "Alexandre Mergnat (amergnat@baylibre.com)" and
> "Alexandre Bailon (abailon@baylibre.com)" are now part of this
> project.
> Please let them know of future information.
> 
> Thanks again for suggesting solutions!

Hi,

finally managed to fix the issues. I had mis-read the interrupt status bits,
which made things a whole lot more confusing...

I CC'ed you on the series, but for the archive this is it:
https://lore.kernel.org/all/20230428195347.3832687-1-nfraprado@collabora.com/

Please review/test it if you have the time.

I have one extra comment regarding the mt8192 support, but I'll write it on the
v2 of this series.

Thanks,
Nícolas

