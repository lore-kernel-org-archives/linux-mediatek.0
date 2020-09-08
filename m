Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01262C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 09:47:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB3EE2076C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 09:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dYGQb6Px"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB3EE2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M+kt62XN+DdpEAbL8abDFLTpSpzGWk9iJuqTJjdKz40=; b=dYGQb6PxkhzJr+H3ySpLGtwl3
	MF4qbMNCj0mAGSLMmTcQdjLX5OhiyeAFDHvkAAeEErQnsXPb6y1XXb7wjbxe+ADv4TTvOONuIff8o
	Ifu14/HH1MEezB7KmLuuGmEZGbLuQu5Nq02R5YSk320J7B0NCaaaSS4PQyovkYbY4dH+KMEPqXiSl
	z4viuvQiBpH1HjNj1VqAN8QIj8fYUFdzM7bDs9oXjh62RQqn1YzY8BVgnUvMT07ghX3QHEYMj1KSy
	Uf4/fouY7QGQfW3p1KW1pG3jipTrJxGOPg+DKcikcJdQ7H6CrZ8YbYDwOdpO/yq61g+dDqOdq8kN+
	FWzKWZIxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFaDH-0002ed-Uf; Tue, 08 Sep 2020 09:46:56 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFaDE-0002dD-BM; Tue, 08 Sep 2020 09:46:53 +0000
IronPort-SDR: mGBess5HoJ8NcTfR0HxgLEAbe0//j+rNgI25xnEhbCzV/lyGX71p1hxs13XpYPkGVItdAHjoBD
 mo21H5yB+kZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="159074552"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="159074552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:46:49 -0700
IronPort-SDR: JCsKZbWN6Vz7RQqkJklFsmCFoRp3eDltO1H9Br0I7dMd8eGpZYQvSQ/sNUdHZcUaYgBJuURuQp
 SpE2unAMwpsg==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="299732273"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:46:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 5DEE920765; Tue,  8 Sep 2020 12:46:43 +0300 (EEST)
Date: Tue, 8 Sep 2020 12:46:43 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20200908094643.GE27352@paasikivi.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <20200902135145.GO1891694@smile.fi.intel.com>
 <1599226354.4733.69.camel@mhfsdcap03>
 <CAHp75VezE2iGBarXke4P9z31SmymBgPH5fwoknt9vBfFTw0u=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VezE2iGBarXke4P9z31SmymBgPH5fwoknt9vBfFTw0u=w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_054652_533130_B29A0BFA 
X-CRM114-Status: GOOD (  19.41  )
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomasz Figa <tfiga@chromium.org>, Louis Kuo <louis.kuo@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 matrix.zhu@aliyun.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

On Fri, Sep 04, 2020 at 04:55:56PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 4, 2020 at 4:38 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > On Wed, 2020-09-02 at 16:51 +0300, Andy Shevchenko wrote:
> > > On Wed, Sep 02, 2020 at 04:44:21PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:
> > >
> > > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > >
> > > > > + ret = fwnode_property_read_u32_array(dev_fwnode(dev),
> > >
> > > > > +         fwnode_property_read_u32_array(dev_fwnode(dev),
> > >
> > > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > >
> > >
> > > Btw, can somebody explain, why it's fwnode API and not direct use of device property API?
> > >
> > > In all above cases I see no reason why not to use device property API directly.
> > >
> >
> > From the fwnode API's usage:
> > @fwnode: Firmware node to get the property of.
> >
> > It seems dev_fwnode(dev) could return dev->of_node->fwnode if CONFIG_OF
> > is enabled, or return dev->fwnode if not.
> 
> So?..
> 
> Shouldn't be the above an equivalent to device_property_*(dev, ...)?

Yes.

V4L2 does not have a dummy implementation for almost no V4L2 driver has no
use without V4L2.

-- 
Regards,

Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
