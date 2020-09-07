Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18B7C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 13:52:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C10A2078E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 13:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w0Shvv6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C10A2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xIzJWukHyMbLpYKmd0laiThOYpdOzb0cP8KpZrJ2V8c=; b=w0Shvv6Co6ch54tL365unnfv5
	EpHHCyFITmU+0KncLqENVYN6f2OQnm3d+YGvXasta/i0eYnoTVxzlqRrABJcGLfqVtlGo09+jcQfE
	Q/AnNDBLVauK7yWUHnxfX3lNvtYgcO5ONdY90QZL51FGiusSS01XlnjWtS7GXpKfFGD2tNdk0a7LV
	lbhtEeNCoqnlvqZoM4NoJRbBJWBlbHh94495BhB12jUMeLHJPRqaLHb0mEYrZ1ekkzjGu3ESW6ZzB
	eD7ia0i92hZq7Edn0jHgVweMxz+tcSVULNg4gMI2VBMonKmb0nOU+zPyQ2w3AlkuGshiFCs/LxlEV
	hvThiVy1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFHZ8-0008Be-3G; Mon, 07 Sep 2020 13:52:14 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFHYD-0007i1-Bz; Mon, 07 Sep 2020 13:51:39 +0000
IronPort-SDR: WUl4IFx02Nz3fodOJOhHcglROX6aF7Uws0TF7UkDk1/LfAwKjaKdme6po19rHDZC8/XQuBocUB
 yWI1qMK7/9Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="222214405"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="222214405"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 06:51:10 -0700
IronPort-SDR: QA6tpQQPK2xO+vA9bWsf8yc3XQicbfmqmYZRNKcI7GVnV/iLwnJM0rEc48iraNGRgHIudDeUA0
 ypJW6zZghdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="333169136"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 07 Sep 2020 06:51:06 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1kFHXz-00ExtQ-Ge; Mon, 07 Sep 2020 16:51:03 +0300
Date: Mon, 7 Sep 2020 16:51:03 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20200907135103.GI1891694@smile.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <1599225767.4733.64.camel@mhfsdcap03>
 <CAHp75Ve8WNuCuRmFcXaZHLjHMGfsvM=69ii5g4H+NYud6N95eQ@mail.gmail.com>
 <CAAFQd5BH4NZrhg=abqc=P9Uzf+t4Davn4SP9i3QktS4Q05WtzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5BH4NZrhg=abqc=P9Uzf+t4Davn4SP9i3QktS4Q05WtzA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_095117_561431_D7991607 
X-CRM114-Status: GOOD (  21.43  )
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
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 matrix.zhu@aliyun.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 03:15:17PM +0200, Tomasz Figa wrote:
> On Fri, Sep 4, 2020 at 4:06 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Sep 4, 2020 at 4:48 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > On Wed, 2020-09-02 at 16:44 +0300, Andy Shevchenko wrote:
> > > > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:

...

> > > > > +   struct i2c_client *client = to_i2c_client(dev);
> > > > > +   struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > >
> > > >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > >
> > > > Same for the rest similar cases.
> > >
> > > We've discussed the issue in DW9768 V2.
> > >
> > > For V4L2 sub-device drivers, dev_get_drvdata() shouldn't be used
> > > directly.
> > >
> > > More details please check the Google Issue:
> > > https://partnerissuetracker.corp.google.com/issues/147957975
> >
> > This is not a public link. Can you remind me what was the issue?
> >
> 
> v4l2-subdev framework uses dev drvdata for its own purposes. However,
> that problem was about the driver setting its own drvdata and having
> it overridden by the framework. There is nothing wrong in using
> dev_get_drvdata(), assuming the correct type is known and here it's
> guaranteed to be v4l2_subdev for the v4l2-subdev framework.
> 
> In fact i2c_get_clientdata() [1] is just a wrapper that calls
> dev_get_drvdata(&client->dev).

And funny future would be that if we don't do this now we will have plenty of
janitors to DoS attack us with the fix in the future.

> [1] https://elixir.bootlin.com/linux/v5.9-rc3/source/include/linux/i2c.h#L351

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
