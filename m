Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F98C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 14:06:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFB1206A5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 14:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hih9Sc2B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVciF0Mx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFB1206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y4dT++kuCoGwCB4FdWqQ9VMl/H2HVj1d90z7Z09kLRo=; b=hih9Sc2BiDzZlhmLlI/fHRXuT
	qRKseUaoTXw54Z2TIza1hFOWaNxTGMJQ+Rl31GDfgiEWYb94pSaw2Mc0zaQWvAaUtHjQmmbMsG2GL
	EXLUdE0Me21fzjK57Kik4wfKZN5jd4xHqyR0L+h1kCYRhDkp3Js3CRhrXUtbzWYzCWxwnr5lx2ths
	87P75fRmc6WwerrbwyXnqpKAxQTASIDX4/FK4qNxa5jiGKOTbKDx//tn9kaUhyCnJJiEz1bNaji15
	g8zMSegeMcZ8GOoqLWESbkIjgh9KNP2hCSdGJ+YDocXZa9SZrBNpTUaFMc03GT0yrcNJB0aEtnQ0W
	PyUZi7grw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kECM5-0006Ey-Ol; Fri, 04 Sep 2020 14:06:17 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kECM1-0006Ce-AS; Fri, 04 Sep 2020 14:06:16 +0000
Received: by mail-pl1-x643.google.com with SMTP id c15so1214355plq.4;
 Fri, 04 Sep 2020 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PukjSGhlHQX0Z/o0j+rhOHIqKb7zdi9HfeAMWztSDNI=;
 b=HVciF0MxoWzoDMlsOpwCzyc6HoSQJ4IdsGvnRjj3Y0YdbT4YFxFyanNN2hHKR+BoGb
 dPDHOGvGKSVJkWCUTLuZTSOPjcEblqJ2RbVmYHneyKvhPxSTWNCcU73nre14k/Dc1TG4
 tOurTCojQhwc37X/a+4I55MM7OOFZAbVIF7zVZszUZmns3pzXKqVRVtb6YNYnqXwP1YS
 giYy6Zl2ECsKdt3TkKmaW/YLpsSnf+AnfbkZ7pDE8N7KyBIavtftQNAIlpWNLpjtGexY
 ibbA8Jgmvp9MA23ctDFOBJhxpFn9MvhcegrE+bvKxCJZsO2inrIluuV6uxkWnfTeB6sO
 B10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PukjSGhlHQX0Z/o0j+rhOHIqKb7zdi9HfeAMWztSDNI=;
 b=Ng6hyqIw6iskBzqromETehxdVFgU0T4epX+7qxvpI+Qg/rKkccBh0bqAXFFPvYShKc
 w7AUQysL4ceuAfDBeZO2NvonlokUXD1n+2zMn3l8l5qcNNPJ3KAKg5duVbPQ4jMiF0lT
 eyh0Br+HmY1pEgffrcjzwebcxI13xwZI2pjKHwyP/8+XyrXQK6G9y/tohDqeUcqnauYh
 m1NZP7y8ftL1ACXpXwV4iXpO99vJVB1w/64nq9U91/5YC1qFUhvgjaXGonUftH9S/XQj
 ls3N7VZgW/22bBi6/SotOAglamzD+qziRssJ3y4PxOW2dN1SSblMdqB19a5JZZZUW/ao
 nLcw==
X-Gm-Message-State: AOAM532xKbTjnEK6CnCqg+pWVvYZqBXQJxLZl0hP69fnevu1T5DQv2Lm
 wt1DUgXib+OJoCAYCx0hfJzOoPeDBrc6e2fbl30=
X-Google-Smtp-Source: ABdhPJwgtrnUVZ5tV/HHgi8WrV/Cc+/+26iw5k1IXy0cgxw3NMHp2gAZwrF76seZVfMd8AZjn/YGIyLNHxZKtWompNM=
X-Received: by 2002:a17:902:56a:: with SMTP id
 97mr9045008plf.130.1599228370951; 
 Fri, 04 Sep 2020 07:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <1599225767.4733.64.camel@mhfsdcap03>
In-Reply-To: <1599225767.4733.64.camel@mhfsdcap03>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Sep 2020 17:05:53 +0300
Message-ID: <CAHp75Ve8WNuCuRmFcXaZHLjHMGfsvM=69ii5g4H+NYud6N95eQ@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_100613_424167_A0097D95 
X-CRM114-Status: GOOD (  27.58  )
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
 devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomasz Figa <tfiga@chromium.org>, Louis Kuo <louis.kuo@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 matrix.zhu@aliyun.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 4:48 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> On Wed, 2020-09-02 at 16:44 +0300, Andy Shevchenko wrote:
> > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:

...

> > > +   struct i2c_client *client = to_i2c_client(dev);
> > > +   struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >
> >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >
> > Same for the rest similar cases.
>
> We've discussed the issue in DW9768 V2.
>
> For V4L2 sub-device drivers, dev_get_drvdata() shouldn't be used
> directly.
>
> More details please check the Google Issue:
> https://partnerissuetracker.corp.google.com/issues/147957975

This is not a public link. Can you remind me what was the issue?

...

> > > +   if (!bus_cfg.nr_of_link_frequencies) {
> > > +           dev_err(dev, "no link frequencies defined\n");
> > > +           ret = -EINVAL;
> > > +           goto check_hwcfg_error;
> > > +   }
> >
> > If it's 0, the below will break on 'if (j == 0)' with slightly different but
> > informative enough message. What do you keep above check for?
>
> I still prefer to the original version.
> If 'bus_cfg.nr_of_link_frequencies' is 0, shouldn't we directly return
> error?

But that will happen anyway. I will leave this to Sakari and
maintainers to decide.

> > > +   for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> > > +           for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> > > +                   if (link_freq_menu_items[i] ==
> > > +                           bus_cfg.link_frequencies[j]) {
> > > +                           ov02a10->freq_index = i;
> > > +                           break;
> > > +                   }
> > > +           }
> > > +
> > > +           if (j == bus_cfg.nr_of_link_frequencies) {
> > > +                   dev_err(dev, "no link frequency %lld supported\n",
> > > +                           link_freq_menu_items[i]);
> > > +                   ret = -EINVAL;
> >
> > > +                   goto check_hwcfg_error;
> >
> > 'break;' won't work?
> >
> > > +           }
> > > +   }
> > > +
> > > +check_hwcfg_error:
> >
> > out_endpoint_free:
>
> It seems that OV8856 keeps the same pattern.

So, we can do better than that, right?

> > > +   v4l2_fwnode_endpoint_free(&bus_cfg);

...

> > > +   /* Optional indication of physical rotation of sensor */
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > > +   if (!ret && rotation == 180) {
> >
> > Can be simplified (but I'm fine with above):
> >
> >       unsigned int rotation = 0;
> >       ...
> >       fwnode_property_read_u32(..., &rotation);
> >       if (rotation == 180) {
> >               ...
> >       }
> >
>
> Sounds like the readability is improved using the latter style :-)

Yes and makes it clear that this is an optional one.
Also you may consider the following

      unsigned int rotation;
      ...
      /* Optional ... */
      rotation = 0;
      fwnode_property_read_u32(..., &rotation);
      if (rotation == 180) {
          ...
      }

> > > +           ov02a10->upside_down = true;
> > > +           ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > +   }

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
