Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 03:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpBQ6Sfsq0n+GUC+RSYA7LBD8KYD7Gu5EsaMLsfHzMg=; b=Ybb5nS1+JL1u7Q
	3joVEEMjPv/JEa/abH8H5YG+xWYBjb4P0v47b4NNXJXl5aQLvzANy3f3NtxeoSu8nEpb2Wo0kiSOD
	FrSmxyJ7hToOMkEmFxsoN8OxQtppr1RdE1Ixndc8JDR/dx2ISDWwr6gSsx2wHoBcISBhWfHJnVFQg
	qWYRSrPFwjQIh+ROAKHpcW4eVaP47dR4OD0PhK4XrSlpXEon+EiAzCdrUfRvXBgyRGfp690ggvUiu
	kAe9Op/T/mLGIX3aYBwj22x5BDZAmqTGo5eCZ54bqBYyl5v7HTYCJ3u+xs00fnR+YiHIlycBIoIym
	wTRWLcGMWWBKRL+BVJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npM1w-00EKMv-VN; Fri, 13 May 2022 03:31:53 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npM1i-00EKDt-LU
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 03:31:40 +0000
Received: by mail-ed1-x531.google.com with SMTP id p18so8437476edr.7
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 20:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5yCw6+SLWwc4hLigZs4FMJCongrsGQWmk50eU/pub3E=;
 b=aioEmXhPB8b+rsy5UpVm5j8mhPIA2BMxULITDwvPqJ14UdKSU49ZpLdNVruYg67ti/
 sVZAUYXqQUjgB1O5jwF7yUharg744ZVAebijeS1fJLBlr5E4MgoMqkRhopAkDrD4yLEX
 5t6CSiyUxUv6EeN0RjQ7nJLeOvS9hJa/gkCNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5yCw6+SLWwc4hLigZs4FMJCongrsGQWmk50eU/pub3E=;
 b=zLYmcOvD79ClJh9YXRpO0GdnlyGlOM4cwl0UbpIlyCFITIECI02QDDhVEVuGtIAGSn
 tOGciAF1bLw9kH2252ESHIiyL1YR1F0G8ZnP4pZwHAKYhonb3j+f4SpvGjcO49Q4rR2E
 yQh0uRvKiUFtBE3zSjMYARMXdlgtNLetjoqcJ9SM+L1/Gx8BHAGSPI/G7iVfbX2jFf3b
 TVT3i6IORcAWomw3/+d4XWcdXk93NqVzV6o8+JY4uYwiJs0wMgGt/v6u8GsToilcKSB0
 gf4MdAx9I1F6G5Vc2zWdZNPVFgOBQpQda96+qydyou1OdCirS+8rVl780xUPSyXGaFC0
 Yx7Q==
X-Gm-Message-State: AOAM5331J7um/8tAIrWxFN7wYGmRnHvr2+LFR8Z4M836yIufvy+NSA6Y
 wEfYBUsuonvBUHlOycU9B3QT5pEsCQBZRpSG+zphPg==
X-Google-Smtp-Source: ABdhPJwpZayrClC+spTzuFpZXtMET8ynvlYqTUFmPJed8aEt6GjVxYTTm2RZ+SRrZTAY9eMOjyCMTDxDFFphMihU77Y=
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id
 i20-20020a05640242d400b00412c26b0789mr38593610edc.232.1652412696597; Thu, 12
 May 2022 20:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
 <CAGXv+5HgyN+kp86M2GgFtbruXSAMSLxsh9vf8zVE5TxRMyTyaA@mail.gmail.com>
 <a8e5fd9de1feece9051e1624c5cf3b672131a122.camel@mediatek.com>
 <CAGXv+5G6Qv1JcsZNrw5=USJSzPkczW42FgXRYqAK=xS-moO6nw@mail.gmail.com>
 <14cdb1e17015e299231e72356e661203d4beda17.camel@mediatek.com>
In-Reply-To: <14cdb1e17015e299231e72356e661203d4beda17.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 May 2022 11:31:25 +0800
Message-ID: <CAGXv+5EfoOx8LHwHeL+wva_M0KX4S3qLNsBgk_003hvXxYPRVQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: krzk+dt@kernel.org, cw00.choi@samsung.com, robh+dt@kernel.org, 
 kyungmin.park@samsung.com, khilman@kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_203138_762440_433AF2D3 
X-CRM114-Status: GOOD (  48.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 12, 2022 at 9:05 PM Johnson Wang <johnson.wang@mediatek.com> wrote:
>
> On Wed, 2022-05-11 at 18:48 +0800, Chen-Yu Tsai wrote:
> > On Mon, May 9, 2022 at 8:14 PM Johnson Wang <
> > johnson.wang@mediatek.com> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > On Tue, 2022-04-26 at 11:18 +0800, Chen-Yu Tsai wrote:
> > > > On Mon, Apr 25, 2022 at 8:56 PM Johnson Wang <
> > > > johnson.wang@mediatek.com> wrote:
> > > > >
> > > > > Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> > > > >
> > > > > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > > > > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > > > ---
> > > > >  .../bindings/interconnect/mediatek,cci.yaml   | 139
> > > > > ++++++++++++++++++
> > > > >  1 file changed, 139 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/interconnect/mediatek,cci.yam
> > > > > l
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/interconnect/mediatek,cci.y
> > > > > aml
> > > > > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.y
> > > > > aml
> > > > > new file mode 100644
> > > > > index 000000000000..e5221e17d11b
> > > > > --- /dev/null
> > > > > +++
> > > > > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.y
> > > > > aml
> > > > > @@ -0,0 +1,139 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > >
> https://urldefense.com/v3/__http://devicetree.org/schemas/interconnect/mediatek,cci.yaml*__;Iw!!CTRNKA9wMg0ARbw!zuufEcqpKbditY3eqLTHpL8P8humMCyh4D4QWsximmw124tJUPE3ZBUyBqBtDlQ9pSDO$
> > > > >
> > > > > +$schema:
> > > > >
> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zuufEcqpKbditY3eqLTHpL8P8humMCyh4D4QWsximmw124tJUPE3ZBUyBqBtDoE9YHyu$
> > > > >
> > > > > +
> > > > > +title: MediaTek Cache Coherent Interconnect (CCI) frequency
> > > > > and
> > > > > voltage scaling
> > > > > +
> > > > > +maintainers:
> > > > > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > > > > +
> > > > > +description: |
> > > > > +  MediaTek Cache Coherent Interconnect (CCI) is a hardware
> > > > > engine
> > > > > used by
> > > > > +  MT8183 and MT8186 SoCs to scale the frequency and adjust the
> > > > > voltage in
> > > > > +  hardware. It can also optimize the voltage to reduce the
> > > > > power
> > > > > consumption.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - mediatek,mt8183-cci
> > > > > +      - mediatek,mt8186-cci
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description:
> > > > > +          The multiplexer for clock input of CPU cluster.
> > > >
> > > > of the bus, not CPU cluster.
> > >
> > > Thanks for your suggestion.
> > > I will correct it in the next version.
> > >
> > > >
> > > > > +      - description:
> > > > > +          A parent of "cpu" clock which is used as an
> > > > > intermediate
> > > > > clock source
> > > > > +          when the original CPU is under transition and not
> > > > > stable
> > > > > yet.
> > > >
> > > > This really should be handled in the clk controller, and not by
> > > > every
> > > > device
> > > > that happens to take a clock from a mux with upstream PLLs that
> > > > can
> > > > change
> > > > in clock rate. The end device hardware only takes one clock
> > > > input.
> > > > That's it.
> > > >
> > >
> > > To make this intermediate clock works properly, this driver is also
> > > responsible for handling the Vproc voltage and ensures the voltage
> > > is
> > > high enough to support intermediate clock rate.
> > >
> > > If we move intermediate clock rate control to clock driver, then
> > > intermediate voltage control may be handled by the clock driver
> > > itself
> > > as well.
> > >
> > > We believe that is not reasonable because clock driver shouldn't
> > > handle
> > > voltage control. On the other hand, DVFS driver is more suitable
> > > for
> > > doing this job.
> >
> > Either way the DVFS driver handles the voltage change.
> >
> > Right now the driver is doing:
> >
> > 1. Raise voltage if scaling up
> > 2. Mux CCI clock over to stable clock
> > 3. Set rate for CCI PLL
> > 4. Mux CCI clock back to CCI PLL
> > 5. Drop voltage if scaling down
> >
> > I'm saying that the clock driver should handle 2+4 transparently when
> > any
> > driver requests a rate change on the CCI clock. So instead the driver
> > would
> > do:
> >
> > 1. Raise voltage if scaling up
> > 2. Set rate for CCI _clock_
> >    Here the clock driver would do:
> >    a. Mux CCI clock over to stable clock
> >    b. Change clock rate for original parent, i.e. the CCI PLL
> >    c. Mux CCI clock back to original parent, i.e. the CCI PLL
> >    and back to the devfreq driver ...
> > 3. Drop voltage if scaling down
> >
> > Does that make sense?
> >
> >
> > Regards
> > ChenYu
>
> Hi Chen-Yu,
>
> Before we mux the CCI clock to an intermediate clock(MAINPLL), we must
> ensure that regulator voltage is high enough (we call it intermediate
> voltage) to support the intermediate clock rate.
>
> Based on this concept, if we move mux control to clock driver, there
> will be a dilemma about which driver to adjust the voltage.
>
> 1)When DVFS calls clk_set_rate(), clock driver scales up the regulator
> voltage to higher than intermediate voltage and then mux the CCI clock.
>
> This option is not reasonable because clock driver shouldn't handle the
> regulators.
>
>
> 2)DVFS scales up the regulator voltage, then calls clk_set_rate().
> Clock driver mux the CCI clock to the intermediate clock.
>
> This option isn't straightforward and makes one confused easily. For a
> person who reads this driver, he may not understand why we adjust the
> voltage before clk_set_rate().
>
> That's why we put intermediate voltage/freq together in the DVFS.

Thanks for the explanation. The intermediate clock's rate being higher
than the lowest OPP is the key I missed.

I can't think of a better way to describe this in DT. The intermediate
clock's rate is stable, but it is set either through hardware reset defaults
or firmware, so we can't just assume a given clock rate and hard code that.
Having a direct reference to the clock seems simpler.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
