Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1535FC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWBmzHo1r7LJ9tfXpZ3VB6XSDdF7nqkxREeZNsylXeM=; b=HqOS2LdKRNlP6iXCct91V1/nOB
	dOqhPKBti2UfoRa95ZJHotOCNAQtcIdzqHIsR0EJuFLI1nIKSqERibTycPOKKMDAk2I4Im+tO5V55
	bTEsWBM4JOQYGexVB64zjdy+l82ePbd8B8RYAAys7sDwcTPpnsnFcbd2MfBXDW+5KI3VAN+GFaFsU
	jtGLK9tAcSlMZ46Y/8JZioadwR/C4sU2UF6xS8Ov0gHYhukhApjmqHgHxC20kjYLNtaOWu26jsCN8
	E5XoTRH7cmqOSEO9kT84ZcYswPBrrGfHvWdqHphLfC/HRgtuhHEexnljISUWPzAdvYeZGFebEyMf3
	T5uKYoBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNACZ-007nUH-2h;
	Tue, 09 Jan 2024 11:23:23 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNACX-007nPW-09;
	Tue, 09 Jan 2024 11:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704799401; x=1736335401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nri6MxrFIMHTBgggJZSrCHzG3uLau0be+hNOOAXuPX8=;
  b=mfYpP9EhGp3aO0l74P8UkwENKjsweMmO165j6UZOD6tPKiWSk6yhpHSx
   AcpMsvFnp5GZiZknQnLR1V0aFhtmrLfVTRVr9+j7BPsokd2cNnZ+SgUq7
   Ev09R58AIt04kTA+Mao0qUKPVmpe8vkDDsLimrRv9VSgB8eXj+wHpVCwI
   ctTXlI9VlPwMJDHgcV5do3+YInYfo+dn2zlrX8WLjykoH6MgwPInRhcWn
   X20YsQH0s0THn2CBaJ1PJcxJiqjDP/JOrd7qSTtEq4MunfOdc3if/rF4V
   E4Zsp6G0pdGWG3JoOYfSz4NgnP3/KZNf9SGJrJ/ZGGnTCRrhFlej+TC6+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11515181"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="11515181"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 03:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954987339"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="954987339"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 03:23:11 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B99CB11F913;
	Tue,  9 Jan 2024 13:23:08 +0200 (EET)
Date: Tue, 9 Jan 2024 11:23:08 +0000
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Zhi Mao =?utf-8?B?KOavm+aZuik=?= <zhi.mao@mediatek.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"10572168@qq.com" <10572168@qq.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <ZZ0snE1r0BnFHWUh@kekkonen.localdomain>
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
 <20231207052016.25954-2-zhi.mao@mediatek.com>
 <ZXGtqwjYruBQVaUr@kekkonen.localdomain>
 <d6772a73b61911954b1f0f75325b82da53ad0877.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6772a73b61911954b1f0f75325b82da53ad0877.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_032321_186930_408F78A6 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Zhi,

On Tue, Jan 09, 2024 at 10:41:15AM +0000, Zhi Mao (毛智) wrote:
> > > +static const char *const gc08a3_supply_name[] = {
> > > +"avdd",
> > > +"dvdd",
> > > +"dovdd",
> > > +};
> > > +
> > > +#define GC08A3_NUM_SUPPLIES ARRAY_SIZE(gc08a3_supply_name)
> > 
> > Please use ARRAY_SIZE(...) directly.
> > 
> [mtk]: About "ARRAY_SIZE", creating a macro with a descriptive name can
> improve readability of code, especially when it is used in multiple
> locations in codes. and it seems a common usage in sensor drivers. Can
> we keep this usage in gc08a3 driver?

It improves readability even more if you use ARRAY_SIZE() directly as then
it's easy to see you're dealing with a single array. GC08A3_NUM_SUPPLIES is
thus a useless definition.

...

> > > +static int gc08a3_g_mbus_config(struct v4l2_subdev *sd, unsigned
> > int pad,
> > > +struct v4l2_mbus_config *config)
> > > +{
> > > +config->type = V4L2_MBUS_CSI2_DPHY;
> > > +config->bus.mipi_csi2.num_data_lanes = 4;
> > > +config->bus.mipi_csi2.flags = 0;
> > > +return 0;
> > > +}
> > 
> > As you return a static configuration, there's no need to implement
> > g_mbus_config().
> > 
> [mtk]: we can not remove this function, because meidatek ISP driver
> will use this interface to get some information.

Please fix the Mediatek ISP driver in that case.

I'm also open to adding a V4L2 framework function to obtain the number of
lanes (and other configuration) for an upstream sub-device, either using
the local endpoint or g_mbus_config if the sub-device driver implements
that.

-- 
Regards,

Sakari Ailus

