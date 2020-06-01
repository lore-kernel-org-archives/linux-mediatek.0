Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57B4C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 18:48:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 874EB206C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 18:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iYzOcnG5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HHXQoRKk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 874EB206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0YuIY4tu3r71T3wjUNHxEDh60xej6PjSwh2YSH4MAw=; b=iYzOcnG5E8o1ub
	U+MDSEsmZJOZ5MhjoX4KUsDdEJKMenW9mJ92wQ9nVVs2IybA4pKANiOnEEidjyG6rtKCoxmbT8gEw
	DGUbKIGQTCTLYPpzXLpiGvbqPOrSEKHuxkmFwvd8xFHobdBKTh41tR0rYr7idE6jAtgGnwB1z+pBd
	2q8cGxBFo25zg4fged7m7GhzETv6fEF8XLgQ5MPl/l/cJcseLOAYYKbon4bcDtKn6WcJXN9mAd0jH
	s3gNUc54L8Xb2KmJ333gTIwdXS6YSjGYz1s5bAuF9H38XRZFiCcIRKB0mhTKlHm52oUP4UpXEn7sJ
	t2cf8+qZF5ObLCQLMGYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfpTp-00005l-Br; Mon, 01 Jun 2020 18:48:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfpTm-0008WB-Bs
 for linux-mediatek@lists.infradead.org; Mon, 01 Jun 2020 18:48:11 +0000
Received: by mail-ej1-x62c.google.com with SMTP id e2so10174177eje.13
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2020 11:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ll0Hxtpd9kUjoZ6368PBnHFjk1t/KP9A5doX0NsjS8Y=;
 b=HHXQoRKkRwnj5wx8VXlsES6HymXOV8W2MTPYDHm4YaFpj9bCVwM2Nxf2BlFpKZp3XB
 2Qh/o6KxlEKLbqinUeFXafMKslx9YzDJAaZs+8Unv53j5DBKoqiPBjGvg/IYBC7Q3JA/
 Ieg4HsYz/NKf3SaU/zciPOSrIIBePr/Z58XAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ll0Hxtpd9kUjoZ6368PBnHFjk1t/KP9A5doX0NsjS8Y=;
 b=pArUKVMV/Z3dK+9GIx92TGVXigkwHfDWpEHTyGXbmqYYo0OfiKSadKz2wu20U0Dcut
 iTT51G1+psMkLW92RTfgg/IdsbWknyKoUBIXO3Nq0qTYBw/s/AITSywTCGSNEnwKgBxE
 H+Vncvldc5OvzbaKXpvu/qXElBgZdZrR5+XtsKzxJWJzdedXXyussJqtYjBAWVUv9KQp
 klbHHJmA4Yk24UIqn1Hh+fO/6QT33ZTfu20OAmGhFVTgPErOIRWpbxQTyPytDh4Tz1sd
 lePO/sM5vEVP/A3AVYOR9g6Obn7yAPyj80R68sfjUUqKJCIOkmlM5JHWzuscYCxpSV7+
 nZpA==
X-Gm-Message-State: AOAM531W+YRCncsP0XvvQ8KEQAb9lmbsAkfHTUoznS7xhIOm83RRRylg
 Q3D8Lk0oXHti+o1kI8Db3Lz6jwuxKr0cBA==
X-Google-Smtp-Source: ABdhPJw8koWJQMpJTnCpGagracdQpRHkEgYT1eOGc4zRvU6ZS2SKFDq2Xnc66MWQebW8WchFjD7iEA==
X-Received: by 2002:a17:906:971a:: with SMTP id
 k26mr8270950ejx.230.1591037288529; 
 Mon, 01 Jun 2020 11:48:08 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id n5sm138481edq.13.2020.06.01.11.48.06
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 11:48:07 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id k26so559121wmi.4
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2020 11:48:06 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr590231wmk.55.1591037285905;
 Mon, 01 Jun 2020 11:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com>
 <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03>
 <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
 <1590570089.8804.453.camel@mhfsdcap03>
In-Reply-To: <1590570089.8804.453.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 1 Jun 2020 20:47:54 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
Message-ID: <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_114810_405241_F7E28C59 
X-CRM114-Status: GOOD (  18.90  )
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
 Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
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

On Wed, May 27, 2020 at 11:03 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Mon, 2020-05-25 at 13:45 +0200, Tomasz Figa wrote:
> > On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > Thanks for the review. My replies are as below.
> > >
> > > On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun, Sakari,
> > > >
> > > > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
> > [snip]
> > > > > +   pm_runtime_enable(dev);
> > > > > +   if (!pm_runtime_enabled(dev)) {
> > > > > +           ret = dw9768_runtime_resume(dev);
> > > > > +           if (ret < 0) {
> > > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > > +                   goto entity_cleanup;
> > > > > +           }
> > > > > +   }
> > > > > +
> > > > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > > +   if (ret < 0)
> > > > > +           goto entity_cleanup;
> > > > > +
> > > > > +   return 0;
> > > > > +
> > > > > +entity_cleanup:
> > > >
> > > > Need to power off if the code above powered on.
> > > >
> > >
> > > Thanks for the reminder.
> > > If there is something wrong with runtime PM, actuator is to be powered
> > > on via dw9768_runtime_resume() API.
> > > When actuator sub-device is powered on completely and async registered
> > > successfully, we shall power off it afterwards.
> > >
> >
> > The code above calls dw9768_runtime_resume() if
> > !pm_runtime_enabled(dev), but the clean-up code below the
> > entity_cleanup label doesn't have the corresponding
> > dw9768_runtime_suspend() call.
> >
>
> Did you mean the 'entity_cleanup' after v4l2_async_register_subdev()?

Yes.

> Actually I made some changes for OV02A V9, according to this comment.
> Could you help review that change? Thanks.

Sure, I will take a look.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
