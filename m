Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06133C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 18:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B602068D
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 18:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xd5/G6AX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="krEtW7JM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B602068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8RChO9nWywkHvAoR0qX56ddEKkzYr/wkjxnXzH8A14=; b=Xd5/G6AXOlkzKB
	pwKvfz1iHZsmoklfLrB0AN+fhVVtf0rzaXVbi4HHMnGURJq/bxuiiX8KREifhVRHJlKY8dbnIvLL+
	d9DuOiSUIikmRgpq1LinHBJ9iNRZvCt91YVZtS/OKZHmVbyER3hXGl/lJQgKyX1MscPusHdHFaEOn
	TQOzcf6+MWAnHEeCBze3bQnZJnC153wdhS09++Puwo7akZZDYlzcoHFa46GajyrweX8WeB9tp+EcI
	nLsG8DU8eSZ5FFO1OkZQMvg3g/ZO2EWHWK+yNgPTN+P6jLhITCjptde8Lpsvz+ca65zfwmIyelbjv
	8Z10FKKkc+ky+Zw63cbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfp15-0004ij-82; Mon, 01 Jun 2020 18:18:31 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfp12-0004hb-6s
 for linux-mediatek@lists.infradead.org; Mon, 01 Jun 2020 18:18:29 +0000
Received: by mail-ed1-x542.google.com with SMTP id g9so7978800edw.10
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2020 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ktf8hdQ0/bBZ1rrqyUokS+zLJv4wCtg8txRgNdj1RPs=;
 b=krEtW7JMlTpPiCKTfkH45ggYkkj3H9lMw3FHZ+1Nxnk3MzT/QKbhGGtK42nirA8MFn
 8G8AE9vCtYO/pcHXfz0lHK5hnvODHlSFgnXWwVwztN5SNCHF6uSpFZSNBGwod3CN8UPc
 7Rxz2QyGs/IN647KyZ76Gh0/KSl4VBY2OXwuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ktf8hdQ0/bBZ1rrqyUokS+zLJv4wCtg8txRgNdj1RPs=;
 b=TM0aCzW+Xe1V5QKBUwvxcENGVjrQnxFR6dNycmCRVZ8jQsvIAhqam/CsoXlSVebYcz
 Zrd/R//+LkU32IHVloP6R09DvgdknpL9AOO0u9k8FMyojIDwg/gJSsEicRt09h9ILyQc
 Zbh7o0Yf1xWXROr6y2ipJoDGSA7hcHlHeOwutt9MAXgfU+qKkTNLmkwVr1G43Mrq/wFX
 MEHqaj1qFFO2TFGsFgiUU7bkyX6K/JB9O2x2HDUd5B6HKFobQozQbsehhE8ADt96AZLV
 t4QjibB7rqNPQDjtw2BeE2QfBITi+p+0wTu0ezWAA6rAshm9YUw1TO4Ym8kR4tRyg9DC
 WTZg==
X-Gm-Message-State: AOAM530HRzgBuSthZZ9LQNc8m3QyxFKLt9QrNBYneFvPCKBCoxZ2gcNe
 YbQ1AGS5sQFNKkPp3e7hjCIXGkPGqg4=
X-Google-Smtp-Source: ABdhPJwley0N4iTz5g0oqOsLaAeVzMVqFl9AXeQKlXG6yJvh/XznR8UjZyRqCe8ZNl6gX38X7ZlsNg==
X-Received: by 2002:a05:6402:642:: with SMTP id
 u2mr9717485edx.230.1591035505178; 
 Mon, 01 Jun 2020 11:18:25 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id j16sm71087edp.35.2020.06.01.11.18.23
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 11:18:24 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id q25so500587wmj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2020 11:18:23 -0700 (PDT)
X-Received: by 2002:a1c:b155:: with SMTP id a82mr509536wmf.46.1591035503038;
 Mon, 01 Jun 2020 11:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03>
 <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com>
 <1590636882.8804.474.camel@mhfsdcap03>
 <20200528072332.GW7618@paasikivi.fi.intel.com>
 <1590653082.8804.517.camel@mhfsdcap03>
 <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
 <1590978816.8804.523.camel@mhfsdcap03>
In-Reply-To: <1590978816.8804.523.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 1 Jun 2020 20:18:10 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
Message-ID: <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
Subject: Re: [V9,
 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_111828_260238_0C0AC965 
X-CRM114-Status: GOOD (  29.09  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 1, 2020 at 4:35 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2020-05-29 at 15:43 +0200, Tomasz Figa wrote:
> > On Thu, May 28, 2020 at 10:06 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Sakari,
> > >
> > > On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari, Rob,
> > > > >
> > > > > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > > > > Hi Rob, Dongchun,
> > > > > >
> > > > > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > > > > +    properties:
> > > > > > > > > > +      endpoint:
> > > > > > > > > > +        type: object
> > > > > > > > > > +        additionalProperties: false
> > > > > > > > > > +
> > > > > > > > > > +        properties:
> > > > > > > >
> > > > > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > > > >
> > > > > > > Yes, if you are using it.
> > > > > >
> > > > > > Dongchun, can you confirm the chip has a single data and a single clock
> > > > > > lane and that it does not support lane reordering?
> > > > > >
> > > > >
> > > > > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > > > > uni-directional clock lane and one bi-directional data lane solution for
> > > > > communication links between components inside a mobile device.
> > > > > The data lane has full support for HS(uni-directional) and
> > > > > LP(bi-directional) data transfer mode.'
> > > > >
> > > > > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > > > > would not be added in next release.
> > > > >
> > > > > > So if there's nothing to convey to the driver, also the data-lanes should
> > > > > > be removed IMO.
> > > > > >
> > > > >
> > > > > However, 'data-lanes' property may still be required.
> > > > > It is known that either data-lanes or clock-lanes is an array of
> > > > > physical data lane indexes. Position of an entry determines the logical
> > > > > lane number, while the value of an entry indicates physical lane, e.g.,
> > > > > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > > > > the clock lane is on hardware lane 0.
> > > > >
> > > > > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > > > > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > > > > there is only a clock lane for OV02A10.
> > > > >
> > > > > Reminder:
> > > > > If 'data-lanes' property is not present, the driver would assume
> > > > > four-lane operation. This means for one-lane or two-lane operation, this
> > > > > property must be present and set to the right physical lane indexes.
> > > > > If the hardware does not support lane reordering, monotonically
> > > > > incremented values shall be used from 0 or 1 onwards, depending on
> > > > > whether or not there is also a clock lane.
> > > >
> > > > How can the driver use four lanes, considering the device only supports a
> > > > single lane??
> > > >
> > >
> > > I understood your meaning.
> > > If we omit the property 'data-lanes', the sensor should work still.
> > > But then what's the meaning of the existence of 'data-lanes'?
> > > If this property 'data-lanes' is always optional, then why dt-bindings
> > > provide the interface?
> > >
> > > In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
> > > that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
> > > shall enable four-lane configuration, which may increase consumption of
> > > both power and resource in the process of IIC communication.
> >
> > Wouldn't the receiver still have the data-lanes property under its
> > endpoint node, telling it how many lanes and in which order should be
> > used?
> >
>
> The MIPI receiver(RX) shall use
> v4l2_async_notifier_add_fwnode_remote_subdev() API to parse the property
> "data-lanes" under sensor output port.

That's not true. The MIPI receiver driver parses its own port node
corresponding to the sensor. Also quoting the documentation [1]:

"An endpoint subnode of a device contains all properties needed for
_configuration of this device_ for data exchange with other device. In most
cases properties at the peer 'endpoint' nodes will be identical, however they
might need to be different when there is any signal modifications on the bus
between two devices, e.g. there are logic signal inverters on the lines."

In this case, there is such a signal modification if the sensor has a
1-lane bus and the receiver more lines, so the data-lanes properties
would be different on both sides.

[1] https://elixir.bootlin.com/linux/v5.7/source/Documentation/devicetree/bindings/media/video-interfaces.txt

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
