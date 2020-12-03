Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32790C64E7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 03:30:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9371622203
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 03:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9371622203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IpeiIIHikUxiPYYxINqpVA9/nslGbPaeMTk6HK4Yo7k=; b=d3hqGC//QcmvmwKQQ22G4QzyI
	pOtnR/TFpMK2id6tQb8yGFBvHABUqatonTW52+fLNZzJDjbc3t7EwDpqtHmkZxnhfDQbaJ0rG9R6D
	/Xt6j5REyeyX8LsplxzCN1xz/e0CTRI0kz/KvyiDnnkgPwI1kt3VhGc/zzUgt/Nl7bBxkIJ1mrATm
	YkjoEAvUT6B8tk472FXrRwl2qBnk6PyxZkglLgnJEDtKUEA9HXWVG0vkJU7gCpMDaFddFRJfZBot6
	IZn9vLWhhH4ZckBD+U0MlYYhkk+a3k0mu8wBYH3GpAvK5qw1NSKXvyM+TEOZcOZVdPo8p3IKeCM8x
	T02DgawIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkfKD-0008Rb-HF; Thu, 03 Dec 2020 03:30:33 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkfKA-0008Qa-OT
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 03:30:31 +0000
Received: by mail-pg1-x544.google.com with SMTP id o5so533081pgm.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Dec 2020 19:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ccj6b9pxrqpLMEQV5KpSS6RxrNoGGzMjVrA/qC32hfE=;
 b=TdmdMAXcbIkcPSaPzbV896gbNaogvjXSo8idr4V3kUarOjDeBV+aB2G9WX3zsoab26
 OBz5pWCSkCNzOkbDu9TkFxlEG+HNevlIqJ3UQb5YvIXNXpNLTJkJbRLHGnMUz9R8JDYV
 /KjQtCGGKqgObEyEs6lZGxXwHKmxaJnFFUTOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ccj6b9pxrqpLMEQV5KpSS6RxrNoGGzMjVrA/qC32hfE=;
 b=ekq14TsQHSPJ491WgQeWya37FArVw41PolNFhdvV1vRJNkSRyGFB02x9V8JoWWYKhI
 mrSVMN3Pfw4XXoJRMkTvltXW/dYbv7UxCSon2UtEGT+dFHmPm7/NijRWFzcPr7+FUPh+
 9oVB2aMlqLR80Q+hSccrW6fsLsoeboMNZf/UcxtsR6cUq0Dk+2OuDSp0pYSJ4jDSjxtM
 /q7Ajkkz87T5CMrKzdDTBUrBjEUMqBt8s1WZK7Deqod+AEcm/T3tFJBHe52WNPIGHdHK
 sxAkRb5RIHyyIz8q1a6poJX0SfIurlSZaJUJn0FqXfdMXj3qpuXtFJQkGN6l4+XKXmHB
 czpg==
X-Gm-Message-State: AOAM530lnGCYkMdZ9mYZDjCITl90q5aLtUsPXu6YXEgu77zT07HRDa+F
 5clbXk6zu2UFO33ZNGxW9Rw/N4BiXuf0f+ONhyKocA==
X-Google-Smtp-Source: ABdhPJzoBgT28c7z3yMIzACokhuRY837a+IEnLu4EkS/3QjHToN3HgaQLczFSCGvS7Y1qrTMIBNzmhNgyVK3OJWt/40=
X-Received: by 2002:aa7:9803:0:b029:198:26c8:51e8 with SMTP id
 e3-20020aa798030000b029019826c851e8mr1409486pfl.42.1606966225868; Wed, 02 Dec
 2020 19:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
 <20200930022159.5559-4-crystal.guo@mediatek.com>
 <20201130111340.GA3042402@chromium.org>
 <1606907202.14806.65.camel@mhfsdcap03>
In-Reply-To: <1606907202.14806.65.camel@mhfsdcap03>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 3 Dec 2020 11:30:15 +0800
Message-ID: <CAATdQgDXYHMst2TO_ohvaiYF3_SZunrzpKs3MW6tOgez5W2j=Q@mail.gmail.com>
Subject: Re: [v6, 3/3] reset-controller: ti: force the write operation when
 assert or deassert
To: Crystal Guo <crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_223030_880032_1E25AE07 
X-CRM114-Status: GOOD (  26.32  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?WW9uZyBMaWFuZyAo5qKB5YuHKQ==?= <Yong.Liang@mediatek.com>,
 "s-anna@ti.com" <s-anna@ti.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 2, 2020 at 7:07 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
>
> On Mon, 2020-11-30 at 19:13 +0800, Ikjoon Jang wrote:
> > On Wed, Sep 30, 2020 at 10:21:59AM +0800, Crystal Guo wrote:
> > > Force the write operation in case the read already happens
> > > to return the correct value.
> > >
> > > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > > ---
> > >  drivers/reset/reset-ti-syscon.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> > > index 5d1f8306cd4f..c34394f1e9e2 100644
> > > --- a/drivers/reset/reset-ti-syscon.c
> > > +++ b/drivers/reset/reset-ti-syscon.c
> > > @@ -97,7 +97,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> > >     mask = BIT(control->assert_bit);
> > >     value = (control->flags & ASSERT_SET) ? mask : 0x0;
> > >
> > > -   return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> > > +   return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> > >  }
> >
> > I don't think there are no reset controllers with cached regmap,
> > thus I don't think this is needed.
> > Are there any specific reasons behind this, what I've missed here?
> >
> > We need to be sure that all other devices using this driver
> > should have no side effects on write.
> >
> > I can think of a weird controller doing unwanted things internally
> > on every write disregarding the current state. (or is this overly
> > paranoid?)
> >
> The specific reason is that, the clear bit may keep the same value with
> the set bit, but the clear operation can be only be completed by writing
> 1 to the clear bit, not just with the current fake state "1".
>

sorry. I didn't think of that case,
then I think this patch must be applied. 8-)

I've thought that the bit automatically flipped to the current reset state
after the internal operation is done.



> > >
> > >  /**
> > > @@ -128,7 +128,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> > >     mask = BIT(control->deassert_bit);
> > >     value = (control->flags & DEASSERT_SET) ? mask : 0x0;
> > >
> > > -   return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> > > +   return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> > >  }
> > >
> > >  /**
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
