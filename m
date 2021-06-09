Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E593C48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C84B9611BD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C84B9611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODyj9HyRZSvZ3mnE0nQtedOWF0cfKKjJtb7JjkIRfNM=; b=bwBMxnNu2j5zl6
	5JKJefnOyGO8drw7v2Zwqp0xC3+nin4Fbx1p3bHOKMyvy6hQ/foBPhb8ROrfFsQgui5ZAUWHY4Lka
	Pn0V2EH3kV/uh6dBLBr2CsX+eigVUATApYBOevKfDuLMT1Y5OGNnMMQGOsuT/eWtM08JDtO2U079z
	cZG3a9ftUsjG0JlGmPcVfWCklV6D2cBZ+pIByffI6YeVoiKCIZ7MZN3Wsux8nXoyrWdWuVkA4e64H
	2MD9dxUpe6oce7c778jrb4kLro35+N3lc0yZunc6nw0WfFU9tGuUaBoODGRtq7Lhk62dC/UqKSzI3
	d0CIeU5Wqc//wN3oOpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvMW-00CyJb-UM; Wed, 09 Jun 2021 10:23:05 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvMS-00CyII-SA
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 10:23:02 +0000
Received: by mail-il1-f177.google.com with SMTP id h16so12147497ila.6
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t6UzJhB8g25TMzOtGb3r8/gh9ASR2geRTCyrguQiy0w=;
 b=GJET2NWNYXS+LFAAxUpFrmk9Zs7bAnwHE3iuLB/rW1YsDSh9m8c4wKe+w0WDgnF6h1
 L0P0t98uOT2QI8Eu6XEGTuekKwVpnefqz68t3F6ymbfd+Woiao0MnygGP9Gf33kpDqcr
 dC9RsRwfgledY4JWR/EWy/EEAoptSenxW2M8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t6UzJhB8g25TMzOtGb3r8/gh9ASR2geRTCyrguQiy0w=;
 b=CTkqRGOaMULH1evU+apdwAuBShLqzNZ2pVDsQqLyT5WORd4vx2MZ553vJpblwrG5yC
 zUsXuARqnw1uAQs0Nt1ANEsPpZHwdWzCUpZFkc//e+XF4znvCCQHPwwCZQf61oosK9o1
 Pbw03pfM0fvkN5+geQxQXvQzqb0UAeG8ThosvCWUZhza/G8IAp8J+SQdHyeUKJhYfLOp
 bx0AnnidmrkqU0/qXGuDV1dOWhCKjgswV5CvPA2Pe3Ph/5YRId5Mbfp6yJDJMP8PnNhL
 upaVKwdj6O+AJvwj4JzBO/Lee6G2G2pZ7pq9VgY+2Q/aZkEh8i5QUZnvKtro80MMMxu0
 vWPg==
X-Gm-Message-State: AOAM531sP6yAXr2zR/lJyzoGHhQduBR0OIahA7N5KBDa1d8CIYUSCE2i
 E5OzoWZL3T+MVN+BR2dryaG9t4Lrsd4A4A==
X-Google-Smtp-Source: ABdhPJwzHot/hkZj9z9SM2ZNjkROAFvkLUHkgo9YzvwmdxeM2iS9GnnLUK45+cM91pDNHfCh1PvAzw==
X-Received: by 2002:a05:6602:2344:: with SMTP id
 r4mr22753425iot.69.1623234119116; 
 Wed, 09 Jun 2021 03:21:59 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id t21sm1232184ioj.10.2021.06.09.03.21.58
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:21:58 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id i17so24808618ilj.11
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 03:21:58 -0700 (PDT)
X-Received: by 2002:a92:d312:: with SMTP id x18mr22776588ila.90.1623234117697; 
 Wed, 09 Jun 2021 03:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
 <20210517173314.140912-9-gene.chen.richtek@gmail.com>
 <CAC=S1niBX4cL7EaROvG9NKSrnFFqCj+EPAZx0KASNTcF9F6E0Q@mail.gmail.com>
In-Reply-To: <CAC=S1niBX4cL7EaROvG9NKSrnFFqCj+EPAZx0KASNTcF9F6E0Q@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 9 Jun 2021 18:21:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1njdq2jbjxzAp6tG50T5o7kt_RCSEZRaBEKdcraPHRe3dw@mail.gmail.com>
Message-ID: <CAC=S1njdq2jbjxzAp6tG50T5o7kt_RCSEZRaBEKdcraPHRe3dw@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] mfd: mt6360: Fix flow which is used to check ic
 exist
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: lee.jones@linaro.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com, 
 shufan_lee@richtek.com, cy_huang@richtek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_032300_937451_731EA375 
X-CRM114-Status: GOOD (  24.12  )
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

On Wed, Jun 9, 2021 at 6:02 PM Fei Shao <fshao@chromium.org> wrote:
>
> On Tue, May 18, 2021 at 1:36 AM Gene Chen <gene.chen.richtek@gmail.com> wrote:
> >
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Fix flow which is used to check ic exist.
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/mfd/mt6360-core.c | 32 +++++++++++++++++++++-----------
> >  1 file changed, 21 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
> > index 50a170065a98..cdd99770f94a 100644
> > --- a/drivers/mfd/mt6360-core.c
> > +++ b/drivers/mfd/mt6360-core.c
> > @@ -293,6 +293,25 @@ static const struct mfd_cell mt6360_devs[] = {
> >                     NULL, 0, 0, "mediatek,mt6360-tcpc"),
> >  };
> >
> > +static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
> > +{
> > +       u32 info;
> > +       int ret;
> > +
> > +       ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &info);
> > +       if (ret < 0)
>
> A dev_err() to indicate the read info error? (it used to be there)

Oops sorry I didn't realize that the patches are applied. Will send
another one for the minor fixes.


>
> > +               return ret;
> > +
> > +       if ((info & CHIP_VEN_MASK) != CHIP_VEN_MT6360) {
> > +               dev_err(ddata->dev, "Device not supported\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       ddata->chip_rev = info & CHIP_REV_MASK;
> > +
> > +       return 0;
> > +}
> > +
> >  static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
> >         MT6360_PMU_SLAVEID,
> >         MT6360_PMIC_SLAVEID,
> > @@ -303,7 +322,6 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
> >  static int mt6360_probe(struct i2c_client *client)
> >  {
> >         struct mt6360_ddata *ddata;
> > -       unsigned int reg_data;
> >         int i, ret;
> >
> >         ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> > @@ -319,17 +337,9 @@ static int mt6360_probe(struct i2c_client *client)
> >                 return PTR_ERR(ddata->regmap);
> >         }
> >
> > -       ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &reg_data);
> > -       if (ret) {
> > -               dev_err(&client->dev, "Device not found\n");
> > +       ret = mt6360_check_vendor_info(ddata);
> > +       if (ret)
> >                 return ret;
> > -       }
> > -
> > -       ddata->chip_rev = reg_data & CHIP_REV_MASK;
> > -       if (ddata->chip_rev != CHIP_VEN_MT6360) {
> > -               dev_err(&client->dev, "Device not supported\n");
> > -               return -ENODEV;
> > -       }
> >
> >         ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
> >                                        0, 0, &mt6360_irq_chip,
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
