Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB76DC38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 14:25:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA9F62083B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 14:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PkWMUpte";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KyTJVpYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA9F62083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNNqaQhqdD+pVnkLWeYmTjBnKoJ1diP9ZF0ZGP8eoH0=; b=PkWMUptezYifKg
	uJd8POmEBrPhiQx+a/9EXiVm4jy0bPYifrN2RqxNtj57bsP7N0zrMsLnd6B/nk9YMB2h/GsjaSlSD
	q7JqiJTQv3MNBUw+0a6766cmr9U7e0SvtS0xncaqARHjqDq8LFHjAHZx1H16cCDmNBYXpQezN0lHy
	uklofSsGOqS3RZpmG56ZdJJP3SMI+bZ9IOCGIqziS6YH/QPjONPkzPmamxoFtB4QJTRSpefQobjC7
	0NqOa/x9/2uEdsHyc901D4YYfhHHKbUWN3LBTjID/T9oXFBt/DBrj9WyigxWDO0SijtNnLSigwwnc
	cv30uJqAQzJt8HvhMjBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWhSh-0000du-6L; Thu, 07 May 2020 14:25:19 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWhSd-0000dD-VG
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 14:25:17 +0000
Received: by mail-ed1-x543.google.com with SMTP id r7so5511570edo.11
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ll5ZHgxCTQbof/AtoyqjsYrTVcOxespcFhggcUBqe5A=;
 b=KyTJVpYdiQiZ2naOvISh2nYJbcEYd3SezUeXrYuqg5BTwnm4t7zhD+bpkDRKoDMoOL
 eHTQoUgmutyG4x+6LT3PWq4d9FV149l+vE3UikCwmbzEIgnSe5QM0IStXI0e9nL4wVTX
 xHYn8duybiNu2TOu/3yuPcStCHcv2ea1p3J0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ll5ZHgxCTQbof/AtoyqjsYrTVcOxespcFhggcUBqe5A=;
 b=es4rrI9vLzIClpJjhwbMkLP1muYqf1NSdyNjv7v/Y4bfd8B1KoDrMgMUQrOYJbyyYZ
 maTRT2+Vy65iYSBXrLKIgJnozkUtGUW1a2021Ry3J/yDvs9uWKuFMKO5nSvOUf7SwQPh
 +qZ/QB8d1J5Qu4CmKIARM2MBqMEVx7kxfQe1/NijYAcBa2S8gAVvdjrn5wwezYuOb6qz
 IaXLai33RkQGIuDwoOs1b0G/q9i+nJdK6fMmUOeEapUrb8xP+OEt9p+0jhjAHXNnRxxP
 /TQRLvGbDcC7zo596Lh/CiuE7lCX4lXZi/YW7lxLVb9Hp9I2GpU/yXh33IZcirQwBQ94
 RVtQ==
X-Gm-Message-State: AGi0PubTnvPYH7uikLZc9UZVIbt4XlJeJ0+JF62YIgOQ20fuoh8+8c7W
 0g/ypUhpISpE5lmzrBP4JVszKVfzch6XcA==
X-Google-Smtp-Source: APiQypIVdCS4lP9gBlMUKHsWkmFhAyevMs+K6UTULUWqRZpIlAZ3vYVJxahHYK8icP52gtpUc2A6uA==
X-Received: by 2002:aa7:c643:: with SMTP id z3mr11895123edr.154.1588861514223; 
 Thu, 07 May 2020 07:25:14 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id p63sm569783edb.85.2020.05.07.07.25.13
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 07:25:13 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id e26so6768953wmk.5
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 07:25:13 -0700 (PDT)
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr10723255wmj.55.1588861512281; 
 Thu, 07 May 2020 07:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
 <20200430080924.1140-2-dongchun.zhu@mediatek.com>
 <20200505070451.GS9190@paasikivi.fi.intel.com>
 <1588688238.8804.150.camel@mhfsdcap03>
 <20200506112136.GV9190@paasikivi.fi.intel.com>
 <1588856325.8804.179.camel@mhfsdcap03>
 <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
 <20200507141147.GF9190@paasikivi.fi.intel.com>
In-Reply-To: <20200507141147.GF9190@paasikivi.fi.intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 7 May 2020 16:25:01 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
Message-ID: <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
Subject: Re: [V7,
 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_072516_035010_6FDBBCE0 
X-CRM114-Status: GOOD (  33.69  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 matrix.zhu@aliyun.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 7, 2020 at 4:12 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz, Dongchun,
>
> On Thu, May 07, 2020 at 03:50:40PM +0200, Tomasz Figa wrote:
> > Hi Sakari and Dongchun,
> >
> > On Thu, May 7, 2020 at 3:00 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Sakari,
> > >
> > > Thanks for the review.
> > >
> > > On Wed, 2020-05-06 at 14:21 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari,
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > > > > > Hi Dongchun,
> > > > > >
> > > > > > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > > > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > > > > >
> > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > ---
> > > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > > > > > >  MAINTAINERS                                        |   7 +
> > > > > > >  2 files changed, 155 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > new file mode 100644
> > > > > > > index 0000000..2be4bd2
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > @@ -0,0 +1,148 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > +
> > > > > > > +description: |-
> > > > > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > > > > +  sensor output is available via CSI-2 serial data output.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: ovti,ov02a10
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    items:
> > > > > > > +      - description: top mux camtg clock
> > > > > > > +      - description: devider clock
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: eclk
> > > > > > > +      - const: freq_mux
> > > > > > > +
> > > > > > > +  clock-frequency:
> > > > > > > +    description:
> > > > > > > +      Frequency of the eclk clock in Hertz.
> > > > > > > +
> > > > > > > +  dovdd-supply:
> > > > > > > +    description:
> > > > > > > +      Definition of the regulator used as interface power supply.
> > > > > > > +
> > > > > > > +  avdd-supply:
> > > > > > > +    description:
> > > > > > > +      Definition of the regulator used as analog power supply.
> > > > > > > +
> > > > > > > +  dvdd-supply:
> > > > > > > +    description:
> > > > > > > +      Definition of the regulator used as digital power supply.
> > > > > > > +
> > > > > > > +  powerdown-gpios:
> > > > > > > +    description:
> > > > > > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > > > > > +
> > > > > > > +  reset-gpios:
> > > > > > > +    description:
> > > > > > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > > > > > +
> > > > > > > +  rotation:
> > > > > > > +    description:
> > > > > > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > > > > > +    allOf:
> > > > > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > > > > +      - enum:
> > > > > > > +          - 0    # Sensor Mounted Upright
> > > > > > > +          - 180  # Sensor Mounted Upside Down
> > > > > > > +
> > > > > > > +  ovti,mipi-tx-speed:
> > > > > > > +    description:
> > > > > > > +      Indication of MIPI transmission speed select.
> > > > > >
> > > > > > What exactly does this signify? And how do you come up with the number?
> > > > > >
> > > > >
> > > > > Apologies for not addressing this number clear.
> > > > >
> > > > > From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> > > > > the default val: 0x03.
> > > > > The description of this RW register is as below:
> > > > > Bit[2:0]: MIPI transmission speed select.
> > > > >
> > > > > Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> > > > > This would be fixed in next release.
> > > > >
> > > > > In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> > > > > that value if there is no setting for this private property in DT.
> > > > > The caller in driver would be updated like this in next release.
> > > > > if (ov02a10->mipi_clock_tx_speed)
> > > > >     ret = i2c_smbus_write_byte_data(...,...);
> > > >
> > > > How did you pick the value in the example? And why do you believe it is
> > > > specific to a platform, and not e.g. a sensor mode?
> > > >
> > >
> > > We look into P1:0XA1, one register that defines MIPI transmission speed
> > > select.
> > > From the datasheet, we can get the possible values that could be set to
> > > P1:0xA1.
> > >
> > > Actually this register is an independent of sensor mode, it is just
> > > included in sensor mode's register setting table.
> > >
> > > In addition, this private DT Property is created to fix the MIPI test
> > > failure. The register values are adjusted and verified from vendor to
> > > make sensor signal meet MIPI specification.
> > >
> >
> > In theory the value could depend on the mode, because different link
> > rate could impose different requirements for the physical interface.
> > In practice, we haven't seen any hardware that would require different
> > values for different modes.
>
> The mode (possibly in conjunction with other information available to the
> driver via V4L2 fwnode interface) precisely defines the parameters of the
> CSI-2 bus --- apart from the possible exception of the bus timing related
> parameters but this is not supported by the name of the parameter.
>
> Therefore I don't see how this parameter, which supposedly is used to
> determine the CSI-2 transmissions speed, could be board specific and thus
> belong to DT.

According to the very imprecise information I have access to, it is
not about the CSI-2 bus itself, but rather some internal parameter of
the sensor's CSI interface. Unfortunately there isn't much information
on what this value exactly controls...

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
