Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84397C54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 13:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v52uno4cAyHm+/aF5q+som1Xwk1TTlVsieUH5YPySzk=; b=qGyWoRyIMwCvmVMdAauzuHoFW/
	t6NOJzjNHeTz8yOFNXXeAHiEq9UGbJIcDKjuX2z8dK0XKktueHRGEblB8aOinvP1PLrr68E+wOPoo
	WcWg98O5/xqg+JTgDS5iysvzou7OJpUwxjwjaNU9Km2PA8+8tV0SAHg/6IUEF7YdTdxquWZRS9Xv7
	i+EUISwoLOtLM61O6Vs7KWJ2KlurzqMlPs3WOUkX5CDoPEUcRP3pqp0zlxpqzcsCE1ZM3vfrDlBBL
	PTBCQBPQXflms8aqUziyTV3xiFbwVStYml8IL8RzRF8tK+hUkkvVWmj+lgGLdzyZ8oQNE+YyjADq8
	7PIvNgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexUD-00000005NXW-0Fc6;
	Tue, 27 Feb 2024 13:27:09 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexU9-00000005NVJ-3Yc6;
	Tue, 27 Feb 2024 13:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709040426; x=1740576426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yYxg/i0g4KAnPdT2UJlvna1xTvMCnP9hCbmuoj80UwA=;
  b=aKZkoIq4d0zi1Kt57LE9nObCzO3nb9H9fT/R5z5lxmMRgt5kl5NmElyv
   +1C6Ky5fBpMfLuPjcMW7kHZdd+BFPfvbq1rBF8rmz5NLPoKUVHCGidkKU
   s7J9r1GSXKKMPq+9VD+xcD1VvdDEmunY3Np5L0DzH/hKfVPhxyrIs1Ydt
   LwGJGBDQxZpmGksdaskQcCe+sWeFXX3YRSZZfdoJaBpM79XhMKDHAsIio
   327V6H6BwuFwj9RX196OJ1MgKlMiJahlUaNhLbWonhpCf0/Qb0v/SU2JF
   vuTtrmz32sRs/PTZO2KYEALjDnDpiKv343XAN/ZRfpCSlCgdhR6TUnW8C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3507310"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3507310"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="38075100"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:26:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 031C511F855;
	Tue, 27 Feb 2024 15:26:52 +0200 (EET)
Date: Tue, 27 Feb 2024 13:26:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, 10572168@qq.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	heiko@sntech.de, jernej.skrabec@gmail.com, macromorgan@hotmail.com,
	linus.walleij@linaro.org, hdegoede@redhat.com,
	tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
	bingbu.cao@intel.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 2/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <Zd3jG2HC3mR0dQR3@kekkonen.localdomain>
References: <20240227013221.21512-1-zhi.mao@mediatek.com>
 <20240227013221.21512-3-zhi.mao@mediatek.com>
 <CAHp75VciCJuoOwC8ozanWYqSCM=vWpiaqymJ2-gQfrSt5Ts6fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VciCJuoOwC8ozanWYqSCM=vWpiaqymJ2-gQfrSt5Ts6fQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_052706_024226_9852E372 
X-CRM114-Status: GOOD (  18.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

On Tue, Feb 27, 2024 at 02:46:54PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 27, 2024 at 3:33 AM Zhi Mao <zhi.mao@mediatek.com> wrote:
> >
> > Add a V4L2 sub-device driver for Galaxycore GC08A3 image sensor.
> 
> ...
> 
> > +/*
> > + * gc08a3.c - gc08a3 sensor driver
> 
> Drop the filename from the file, it's impractical (esp. if the file
> will be renamed for some reason in the future).
> 
> > + *
> > + * Copyright 2023 MediaTek

You could update the year.

...

> 
> > +       endpoint =
> > +               fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > +                                               FWNODE_GRAPH_ENDPOINT_NEXT);
> > +       if (!endpoint) {
> 
> Strictly speaking dev_fwnode(dev) might be NULL or an error pointer. I
> dunno how the graph is implemented there and if it's possible to get
> an error pointer out of it. At least this probably needs to be aligned
> there at some point.

This is fine---the fwnode API returns errors (for functions that can) for
NULL or error pointer fwnodes.

The patches are in my tree already, please post a patch on top of this that
I can squash.

-- 
Regards,

Sakari Ailus

