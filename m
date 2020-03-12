Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C7AC10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 10:14:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1A220674
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 10:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUris9bl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DmyVra3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1A220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZyT1rEW3odISvMUvhUaWsyJ3I9yv9olX7KuaBwwn+o=; b=bUris9blQQmLKS
	GLnFoI4QRt9zUkWHvO8phF910AZFcfY6LqsF4hkYm45zVDkv1BgHvwQPIFD37D29bxthlEaFf5fhd
	RvDnp4p7yhhqe3E248WUvkf20gBmw6aDqFUYxE2N1WoM3qdxwZcwVZpuvoSgqldREKudKUGIfTliU
	bt/Ac9y/q+/F/5XPPV07zjnfXGL/KarppzQFMII/GU9Df5xoH9KZLFKzaytHuMlGP5yf3ACIihevL
	FOHqv3cdzolfj4ZcDAkoHs/RnjLGZxqz/TH1oXnbdVCZNJJ042WF4VnbX9uRTffJ5WbazLeb3mI7G
	5UYTrwc7a5Kxxh7bQgVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCKr7-0001aU-W3; Thu, 12 Mar 2020 10:14:22 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCKqx-0001R1-Tb
 for linux-mediatek@lists.infradead.org; Thu, 12 Mar 2020 10:14:13 +0000
Received: by mail-oi1-x22a.google.com with SMTP id a22so4882231oid.13
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2020 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jmkbYdX8+j8+5rRfl7f3e7GwQSqimyD7SYnYxFyR5E0=;
 b=DmyVra3yF33pND3KBYCG1WrIzqhrPuc37FpVnMX4LRRIrYiXGMpvgPZFZ7bNhx38Jy
 bhBBWOZx+Hi9tJnU7TiJIYR5QAN9paP3kNEAOpLdvqCbpSmYXC0ndWO8Wn/G8hMEoBWI
 7UbF6503aN9fGMsUHVjHpDJ76xjYIUVcSLLlauXJTrBry+6gqbCXkADBm/lhFTPE2dP1
 m6psJHurWRf9QyJqhxENGmofwGS/ziPISB+aR3e8Ybrc6JRvHO8HRLcHdNUT0jYcd5Iz
 uNQuf9VPV1M4kv2mOkskGWHMi8hhUlsOp9R+iuDNgOSSId1M6ByOnNrpRR+9MNvpccEg
 cW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jmkbYdX8+j8+5rRfl7f3e7GwQSqimyD7SYnYxFyR5E0=;
 b=KDwmNJxedrQV9b22tJ+o2rbBW9ug+ML9W9DUVt0ZtUjrZ5cXbwW++Jrngj7UuZyfUQ
 ZgPFIEHBWewfoopGyA9rclZZ2fx0+qImA9RjqDo+Hmq6PNDCoGhRj62SRw5XBMjfITM4
 NVKSOJSjd8FYAIw/Qp+tJ7ohed6XXMlkSqQr9AlO+bKhcMGjysYxIubZ4u6XDX9+2QLw
 31SE7cD8J4He7y/I8Vs1cds80uS69BPFqIZsCWRwy7dPHNamcRguBmxjTxond1dVzaOS
 7uH+R1zuHtG2zjSIWV8ab8J8dkKLDmP+5NIO6byA0P68YgaZ6gJCAYLlcTxscGS6E+U0
 4sxA==
X-Gm-Message-State: ANhLgQ1lEcQvpR/n961QC1KPuLH6SuBR0mZqZB7EHLoEorP54MMrz5Aq
 J+etQyvFxeYW0Q4Q4MCHygLuCZvWjic6e59oE0X++w==
X-Google-Smtp-Source: ADFU+vuvLA7OJNogZQsqCnB5B9kakN6GgYe45+rLlUxm/uBRIXUsVnDaJlTEPNY27ZGSH15nNbJL51uwKZO17iVx8DY=
X-Received: by 2002:aca:ab4b:: with SMTP id u72mr2054085oie.26.1584008050585; 
 Thu, 12 Mar 2020 03:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-2-robert.foss@linaro.org>
 <CAOMZO5C9Oj+SmTroE+bSsGcOPpz6se+WOqw1qJU9x6TrzbzZKw@mail.gmail.com>
 <CAG3jFyuLMxUEr7yZAHT99JK8NoUZc-aquuMEtSBH_Vipa-_giQ@mail.gmail.com>
In-Reply-To: <CAG3jFyuLMxUEr7yZAHT99JK8NoUZc-aquuMEtSBH_Vipa-_giQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 12 Mar 2020 11:13:59 +0100
Message-ID: <CAG3jFytyTO9h311WzTGDwDzGF-rwY1ANC=mhXXGxn6v83Anqmw@mail.gmail.com>
Subject: Re: [v1 1/3] media: dt-bindings: ov8856: Document YAML bindings
To: Fabio Estevam <festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_031412_019436_80F220E7 
X-CRM114-Status: GOOD (  18.05  )
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 ben.kao@intel.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jonathan.Cameron@huawei.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 10 Mar 2020 at 16:51, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Fabio,
>
> Thanks for having a look at this series so quickly.
>
> On Tue, 10 Mar 2020 at 14:57, Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Robert,
> >
> > On Tue, Mar 10, 2020 at 10:46 AM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > > +    ov8856: camera-sensor@10 {
> > > +        compatible = "ovti,ov8856";
> > > +        reg = <0x10>;
> > > +        reset-gpios = <&pio 111 GPIO_ACTIVE_HIGH>;
> >
> > Could you double check this is correct? Other OmniVision sensors have
> > reset-gpios as active low.
>
> I have tested this, unfortunately I don't have access to a ov8856
> datasheet that includes
> this level of detail. But I have tested this.
>
> >
> > I suspect that the driver has also an inverted logic, so that's why it works.
>
> That could explain it still working. Let me have a look into the
> driver and see what it does.
>

I had a look at some of OmniVision drivers, and there does seem to be
a logical inversion in some of them,
but not all of them.

ov7251:
- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
  to the hardware pin XSHUTDOWN which is physically active low.

ov5640:
- reset-gpios: reference to the GPIO connected to the reset pin, if any.
           This is an active low signal to the OV5640.

I think the confusion stems from the XSHUTDOWN pin being mapped to a
GPIO called reset, and the two being logically inverted. Currently
this series does several mappings.

XSHUTDOWN -> reset-gpio -> n_shutdn_gpio
       ^                           ^                      ^
Physical Pin               DT                Driver

I think changing to what ov5640 does makes the most sense.
XSHUTDOWN -> reset-gpio -> reset_gpio

> >
> > I don't have access to the datasheet though, so I am just guessing.
>
> Me neither unfortunately, if anyone does have a link for it, I would
> very much appreciate it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
