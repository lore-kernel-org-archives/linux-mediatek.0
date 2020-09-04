Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB52C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 13:56:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D26D2065E
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 13:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AGtfmcep";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfxkyQAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D26D2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hiS3+wHF/ULc/dOvdw3fOjpFMGe6x+etNvPb0Kb7A7c=; b=AGtfmcephfdq0TiHIjOMS+mEv
	JB68Iv95NWi1a+16tRgngqKaTVg5cnUPLAqzvm/Xfm3JSfKn+mJMRQjN3Hr7/sl7YyCPQZ5KrhgQG
	oAOjjUt4MBl+aBFrAj1KexXKRaK7jz/K9S7APNuyJGn2Ux6aeKqRt74i3nO7WkWyU/DvNQHRpk0OK
	xdF3vWgWBmRn9M7xMgcBe9bXPMysb+CJeO3EnylmaAPj9YRyn0MuxPtPtS1+lWU2CFPqA+MarFevw
	fmDARpU6+Q4d9/FR+gK93UjeCMYn1HcL4wr9j3FDcurL5Iqv9w+l0P+dXuxZzmFunmhCq+juCGz8H
	b4ZZx/3QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kECCR-0002uZ-8V; Fri, 04 Sep 2020 13:56:19 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kECCP-0002ta-AR; Fri, 04 Sep 2020 13:56:17 +0000
Received: by mail-pj1-x1041.google.com with SMTP id t7so84071pjd.3;
 Fri, 04 Sep 2020 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pHS0OvNcUu22bKVNpK0d+GADbMdPHqwo2X75O5rIZno=;
 b=VfxkyQAiqVBk5fj5X7YOl1ZV7uG3cDScXBkjSYTxTJ/cgIbrTmyOEy3FzYQ50s3ZCj
 diEaFubYWxKAsBRLO3xL/T/bH0ErdNjjDlNm/eQ+L1+DnlO67T79Kk82b8gW9x7P3+N5
 k7izw3zLTqxZezUJjtdbuJPxV6ifOBMPULkvrVZlKsNoDLzi3D5Aj0bJCkqR8bz6GjwU
 SNwx1X+yU9opmmJ49q2zQhM16wwPKcHrwwvndAwroJcTzXWtb5Wrz+bdY/Xlg9BzZe3a
 sASa/HXljYKIJEl1o1SXvfWVAjV/VTJU+YFIz/G2co9vcg6SkPEPjvAmUshVdblO/g0n
 n5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHS0OvNcUu22bKVNpK0d+GADbMdPHqwo2X75O5rIZno=;
 b=lvRPylwGncgX1+gTY8Xp9KYcL8JAJr/1nCdLv7NXuCJY0dezR49gxW65IWhJNb1ZLB
 Y8rQOmCOYv77+mmhLH0NnvuGWEUpRz9JveymOKeeLnP+BOTTLxl4GP5i5HXVl3rL3xgl
 IbcfrVJGOmfvJtirASi5MrnQwzEUAU8A/DeyB7R9KdYrYXXEB++1l0Kdk/xKeo4rVE4D
 k/nhPSNVQV3oEVmTU53kBz/F9uWygKAQrblggP1PAvmj8RGMFoupotxC251es+VLGSnL
 UAcrfEyMIHrmwjGy6cH/K6AlPODHgf29/11kPkiCBdJkozJ2KPxJXTfNWYBuh2oa6y77
 uZMQ==
X-Gm-Message-State: AOAM531GzWZhx9ezxCT9FR0ybuAJYIQnb+8iQkyYNvN7tDYnIEIQgkip
 YwMyeuzQH1zl0vr4cRB3Yme/iW70GBaYx0mH8KM=
X-Google-Smtp-Source: ABdhPJwfDAE9oHcskAwcGQ9AKqYjIave8/BxWdL4hnwucBsyEsQiRYaLBcEhmhRNd1MhbYtbVhVrgwycKquIaba8YRY=
X-Received: by 2002:a17:902:ea86:: with SMTP id
 x6mr8794264plb.131.1599227773397; 
 Fri, 04 Sep 2020 06:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <20200902135145.GO1891694@smile.fi.intel.com>
 <1599226354.4733.69.camel@mhfsdcap03>
In-Reply-To: <1599226354.4733.69.camel@mhfsdcap03>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Sep 2020 16:55:56 +0300
Message-ID: <CAHp75VezE2iGBarXke4P9z31SmymBgPH5fwoknt9vBfFTw0u=w@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_095617_376118_19665D81 
X-CRM114-Status: GOOD (  15.34  )
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

On Fri, Sep 4, 2020 at 4:38 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> On Wed, 2020-09-02 at 16:51 +0300, Andy Shevchenko wrote:
> > On Wed, Sep 02, 2020 at 04:44:21PM +0300, Andy Shevchenko wrote:
> > > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:
> >
> > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> >
> > > > + ret = fwnode_property_read_u32_array(dev_fwnode(dev),
> >
> > > > +         fwnode_property_read_u32_array(dev_fwnode(dev),
> >
> > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> >
> >
> > Btw, can somebody explain, why it's fwnode API and not direct use of device property API?
> >
> > In all above cases I see no reason why not to use device property API directly.
> >
>
> From the fwnode API's usage:
> @fwnode: Firmware node to get the property of.
>
> It seems dev_fwnode(dev) could return dev->of_node->fwnode if CONFIG_OF
> is enabled, or return dev->fwnode if not.

So?..

Shouldn't be the above an equivalent to device_property_*(dev, ...)?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
