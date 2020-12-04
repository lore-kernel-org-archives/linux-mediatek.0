Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AD5C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 06:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 932ED2253D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 06:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 932ED2253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9W943isKVA4m4x9w/9SvsKfIKjHfv323SCCWGv4uRq8=; b=0e+QNM4VTlt9YHtjyN0F6roTJ
	FXaHN1hrBxGx7U9MM8MWjIBQX5eLTDDetdvHmICxAg7ouYxOQ/RYejfPkm4EFJbHecUlIJf71lSjK
	ab6qjT9+Iti+ErPYjZtF7ScJkrCJ5Q3cnFQzOn0ZOr451HKnYL8hqqsmnzhwsimiy/hAYk08iIdNh
	sSw4fNpPkqeL4+ca8odnWgEPPmtcXwd0BRIPjPb03EGkInyZE1vYvQb0h7nsQeU7icg/blVaLLhOO
	9iKqc8/dgVH7lsJyK07FlPHYblWzs0PeGdi/EOWD7jLrIVcUaPzKRfdWTTLM6OzhuGa6ktlTTMz8b
	LAuQy45Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl4VQ-0002V5-FX; Fri, 04 Dec 2020 06:23:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl4VL-0002Td-Vq
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 06:23:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id i2so4177270wrs.4
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Dec 2020 22:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98JkySW9/YPknIOP/vurrpriMRdU3Eb0izq2wDpGtMs=;
 b=ptlG2MEbVrPb2egLQW7XfjoIdnyFnJSEl5UOV3qQqSXT/R/9N5qJh785SkNjtSVafY
 eI5+ODstgUwiwtYUySnaBR+Yc1TSrmYFb2p77jCtkDub+G4YAANIA4qjFRAhpF4pinjq
 LBn9eCES70H/Rleg6etUGUaH+6TfwXpTH1aiEgsI17gT5vxOTf7YgafJSYqTzU47+L9h
 1mYojfdBNMc5Nxn2K1fD7nSv7OS0k/ioAJRfHKXjUYOfdSa1Ltc+FU7t5+ncTAfoxUXT
 +vKLY4WHsptaZu5r0T7cOSJZIIzN96EYHHwaR8qyEVg7PZzCkfd9x/Q8cTa+wXS4yPaq
 x2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98JkySW9/YPknIOP/vurrpriMRdU3Eb0izq2wDpGtMs=;
 b=SSdY6Twes7b64uPEkGDoA0NQtyqLfCpe5l1dy6152DUf5/1tREvPck/jfk8n9bzgUl
 rqhBNmsLVz32mPcAlA3TFgu6Pzm3CjIf1hcD4u7MxJ/UVcv80VqJBvq8bVil5KubjuOZ
 Dm7dfh96CVGSlN+m+pSGnkjFrFs/TOQY06vkxwx1ksombPaBIhJLJod9VcVZtlMoHrLL
 0CuLB5hy5zx/bidKNMxzaeYpiLbW62ewsrHlnQlatvocfzV7jKPNG7DE60CSyoc7viRA
 2aIxcEi7fVY/XyOgA8rmkfPWYdUtciM71dWo1eIOq7if9t1GGmptkxwsHv/HNFfXuIUn
 adKA==
X-Gm-Message-State: AOAM533UtTMYQPgnRUdrsBGvlwMzVosbAvdv3ZPPnS/0y8yrzCefaPUK
 eoYHX1y+jUong78Zun5SD884cjnMa1yQjF1HVTtSrQ==
X-Google-Smtp-Source: ABdhPJzEy0kjlzbhbJ4HskVgZqUeu1kU8i5mODdxRXXs4BAgs5Hjr/NV8JA3TzwWGgwm85BkW3SiHNkFcJ5K0AD0aOI=
X-Received: by 2002:adf:e54f:: with SMTP id z15mr3093292wrm.159.1607063018670; 
 Thu, 03 Dec 2020 22:23:38 -0800 (PST)
MIME-Version: 1.0
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
 <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
 <1607049966.4733.189.camel@mhfsdcap03>
In-Reply-To: <1607049966.4733.189.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@google.com>
Date: Fri, 4 Dec 2020 15:23:28 +0900
Message-ID: <CAAFQd5C0_v7hyvu7BHtkH_ecYUXPGTGq75Xrr63b3Fe81r=tuA@mail.gmail.com>
Subject: Re: media: i2c: add OV02A10 image sensor driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_012344_038187_2FA715B8 
X-CRM114-Status: GOOD (  26.61  )
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
Cc: Sj Huang <sj.huang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 4, 2020 at 11:47 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Andy,
>
> On Thu, 2020-12-03 at 20:10 +0200, Andy Shevchenko wrote:
> > On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:
> >
> > > Static analysis on linux-next with Coverity has detected an issue with
> > > the following commit:
> >
> > If you want to fix it properly, see my comments below...
> >
> > > 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> > > 530 {
> > > 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > 532        struct i2c_client *client =
> > > v4l2_get_subdevdata(&ov02a10->subdev);
> > >
> > >    1. var_decl: Declaring variable ret without initializer.
> > >
> > > 533        int ret;
> > > 534
> > > 535        mutex_lock(&ov02a10->mutex);
> > > 536
> > >
> > >    2. Condition ov02a10->streaming == on, taking true branch.
> > >
> > > 537        if (ov02a10->streaming == on)
> > >
> > >    3. Jumping to label unlock_and_return.
> > >
> > > 538                goto unlock_and_return;
> > > 539
> > > 540        if (on) {
> > > 541                ret = pm_runtime_get_sync(&client->dev);
> > > 542                if (ret < 0) {
> >
> > > 543                        pm_runtime_put_noidle(&client->dev);
> > > 544                        goto unlock_and_return;
> >
> > Instead of two above:
>
> From the document, pm_runtime_put_noidle is to decrease the runtime PM
> usage counter of a device unless it is 0 already; while pm_runtime_put
> would additionally run pm_request_idle to turn off the power if usage
> counter is zero.
>
> So here maybe we can really use pm_runtime_put instead of
> pm_runtime_put_noidle, although it seems that 'pm_runtime_get_sync' and
> 'pm_runtime_put_noidle' often appear in pairs.
>

In an error state (e.g. if pm_runtime_get_sync() fails),
pm_runtime_put() would decrement the usage counter and call rpm_idle()
which would instantly return an error code. The end result would be
the same, except that pm_runtime_put() would return a non-zero error
code, but we ignore it anyway. However strange it looks, this seems to
be an API guarantee, so Andy's suggestion is correct.

Best regards,
Tomasz

> >                        goto err_rpm_put;
> >
> > > 545                }
> > > 546
> > > 547                ret = __ov02a10_start_stream(ov02a10);
> > > 548                if (ret) {
> > > 549                        __ov02a10_stop_stream(ov02a10);
> > > 550                        ov02a10->streaming = !on;
> > > 551                        goto err_rpm_put;
> > > 552                }
> > > 553        } else {
> > > 554                __ov02a10_stop_stream(ov02a10);
> > > 555                pm_runtime_put(&client->dev);
> > > 556        }
> > > 557
> > > 558        ov02a10->streaming = on;
> >
> > (1)
> >
> > > 559        mutex_unlock(&ov02a10->mutex);
> > > 560
> > > 561        return 0;
> > > 562
> > > 563 err_rpm_put:
> > > 564        pm_runtime_put(&client->dev);
> >
> > > 565 unlock_and_return:
> >
> > Should be moved to (1).
> >
> > > 566        mutex_unlock(&ov02a10->mutex);
> > > 567
> > >
> > > Uninitialized scalar variable (UNINIT)
> > >     4. uninit_use: Using uninitialized value ret.
> > >
> > > 568        return ret;
> > > 569 }
> > >
> > > Variable ret has not been initialized, so the error return value is a
> > > garbage value. It should be initialized with some appropriate negative
> > > error code, or ret could be removed and the return should return a
> > > literal value of a error code.
> > >
> > > I was unsure what value is appropriate to fix this, so instead I'm
> > > reporting this issue.
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
