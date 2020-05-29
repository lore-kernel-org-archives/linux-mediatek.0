Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC45C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 13:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98DBD21508
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 13:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IckqH9G7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FLkftvLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98DBD21508
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqZ6Q2e8jxvGk0GaWVRSN9P5ErOMlZ5LNsApBS76E/M=; b=IckqH9G7ZTszA7
	qA7Uwa5+amZgMQO9ub3D4u7f0hzvEesHDtZ/G/8dSwIZzOTFWGMNNKUpvU6lCeG0Xykz+yUEeLhPA
	GkHcSKG5USJQqszzlfwywv747XLJBNYBfW/BXSjgqLYgiVr/7B0SJkePoyi27PHy4YVJpXH5PNNHU
	uSeX0elpr1uxLZjs4lBihQA3Gt11yppemDdP/Rc0nfTKY7vwlITcs0qUFR+ligSxt67Nv2BnHk6Np
	m2qGTJNdu1eic/7fG9+LdyK31rc/u+mmOlarnR3IxQ+PJjh06TzIIZ8deAjV9FYfKK8hCVNkyrkL+
	LmL9DH60QbvJMxLn+9qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jefIn-0003bP-Py; Fri, 29 May 2020 13:44:01 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jefIX-0003Pp-6I
 for linux-mediatek@lists.infradead.org; Fri, 29 May 2020 13:43:46 +0000
Received: by mail-ej1-x630.google.com with SMTP id z5so2143719ejb.3
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWgHSNB7/VCfINBd4053Z4Bp4XM8aSMiiq5K+JAFOJU=;
 b=FLkftvLPGVoeJxbq2VHT25nIDxHqlrnsichgg+ZcVZeImFzvr5WM6ikvLnws0GBV75
 e0Zn7vsbU4Yvy69PdBhEWe/kHB8gmtLkkXdVlfQq0BaaUZC0RFw1i+DCdnrmHmd3975E
 ikaIJR7tmKW8ZMPMqS6oIY/eWF4Uwu7lNTxoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWgHSNB7/VCfINBd4053Z4Bp4XM8aSMiiq5K+JAFOJU=;
 b=fvAYkPrNHL4tUHwwMo207CPwIUAKMiy2ORCslgAPHd6rtli2oJmqmP0Ad/BZyqOaY8
 Upmqhz5k6nOTSmfaowICF/15xB20nuJvs7jsagYcuzc8wssHaVacALGRwfPLDYgIxuQO
 Xmy4NoTAyO//NxPQ5mu91ay8zqOMrq55LxMTERNKuRNxTbwx8+slwAp+fPgq5BI8SPYS
 ogkNUiqqnzFO6JH8iCxt0SeXGbkJ4ToDFGPRE+ghjucmC0+Y4XBKekHgMlVAVZKNtzhK
 3DlP9URJDISJfPQgS1++qkHnm3cN9DYtBv+wygURIFXPkWFKdmsP9WJmI1eHzWQFGNBT
 AhbQ==
X-Gm-Message-State: AOAM5334cU9mLSOUTp4bl4bWAD6totCOCWEAU0RSLSy/TVFETw4+A9ex
 iBAOdCDOvlcsUhpRcMx3HQb7s4RY5pJV6A==
X-Google-Smtp-Source: ABdhPJzWovfzy1w9+1dG0CGL/LYtfDCXCxFaxBSZ8cy+gqHUxl21bx+Of+Udm5YHSgq/14JzO543zw==
X-Received: by 2002:a17:906:1a06:: with SMTP id i6mr8198851ejf.9.1590759823222; 
 Fri, 29 May 2020 06:43:43 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id w7sm6731851edq.94.2020.05.29.06.43.41
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 06:43:42 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id j16so3655709wrb.7
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 06:43:41 -0700 (PDT)
X-Received: by 2002:a05:6000:d:: with SMTP id h13mr8532637wrx.17.1590759821053; 
 Fri, 29 May 2020 06:43:41 -0700 (PDT)
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
In-Reply-To: <1590653082.8804.517.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 29 May 2020 15:43:30 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
Message-ID: <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
Subject: Re: [V9,
 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_064345_229940_80BEB31E 
X-CRM114-Status: GOOD (  25.82  )
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

On Thu, May 28, 2020 at 10:06 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Sakari,
>
> On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> >
> > On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > > Hi Sakari, Rob,
> > >
> > > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > > Hi Rob, Dongchun,
> > > >
> > > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > > +    properties:
> > > > > > > > +      endpoint:
> > > > > > > > +        type: object
> > > > > > > > +        additionalProperties: false
> > > > > > > > +
> > > > > > > > +        properties:
> > > > > >
> > > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > >
> > > > > Yes, if you are using it.
> > > >
> > > > Dongchun, can you confirm the chip has a single data and a single clock
> > > > lane and that it does not support lane reordering?
> > > >
> > >
> > > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > > uni-directional clock lane and one bi-directional data lane solution for
> > > communication links between components inside a mobile device.
> > > The data lane has full support for HS(uni-directional) and
> > > LP(bi-directional) data transfer mode.'
> > >
> > > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > > would not be added in next release.
> > >
> > > > So if there's nothing to convey to the driver, also the data-lanes should
> > > > be removed IMO.
> > > >
> > >
> > > However, 'data-lanes' property may still be required.
> > > It is known that either data-lanes or clock-lanes is an array of
> > > physical data lane indexes. Position of an entry determines the logical
> > > lane number, while the value of an entry indicates physical lane, e.g.,
> > > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > > the clock lane is on hardware lane 0.
> > >
> > > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > > there is only a clock lane for OV02A10.
> > >
> > > Reminder:
> > > If 'data-lanes' property is not present, the driver would assume
> > > four-lane operation. This means for one-lane or two-lane operation, this
> > > property must be present and set to the right physical lane indexes.
> > > If the hardware does not support lane reordering, monotonically
> > > incremented values shall be used from 0 or 1 onwards, depending on
> > > whether or not there is also a clock lane.
> >
> > How can the driver use four lanes, considering the device only supports a
> > single lane??
> >
>
> I understood your meaning.
> If we omit the property 'data-lanes', the sensor should work still.
> But then what's the meaning of the existence of 'data-lanes'?
> If this property 'data-lanes' is always optional, then why dt-bindings
> provide the interface?
>
> In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
> that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
> shall enable four-lane configuration, which may increase consumption of
> both power and resource in the process of IIC communication.

Wouldn't the receiver still have the data-lanes property under its
endpoint node, telling it how many lanes and in which order should be
used?

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
