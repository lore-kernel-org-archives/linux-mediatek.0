Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3629DC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8c4Bvxn/y0fOP851xoUieuCSU6aOCHy2vj2i1qN96zs=; b=BtvOvbOizNZtMy+Ljx2NJLiYIc
	9qHCO9LmnQR73jjIZJ4NneUgb6j1had5RHpqhJq8qGJKjj+lvmaCNoYRIo5nAJ+Lqgu8o0oQbjFcJ
	lBXlJk4c7s/RypvW6TuhS+n+B45DapZhS6DKdMHroDjKUXeOga6p2R24yae/Fmib/JjIUFJDI92Ce
	PTfOcALluiGE8XbrtNxUepdmj4DMc0FjFT6EXzOjNF9Rwd5+Bxm7syek92xmfJwih1Mi3kzXa4fNo
	soAEqz1cmkYMEw/FggE2UhORq7Qb80UJKuoeR0Ft+71ECj9DkQo9DdZonzF7CCEyXRHs66zoChnE7
	bmOxGoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2Jj-00000000k8N-3WS9;
	Thu, 25 Jan 2024 16:11:03 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2Jg-00000000k7O-24Oy;
	Thu, 25 Jan 2024 16:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706199060; x=1737735060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=erA6r6+8c+fMm7TjsfyuG2K4tmIEaj6481Pqbo/gIRU=;
  b=j640R7nFPvDlQbFz1LayasTb7KBE10SjRfEJ5vEozwAUT1bh1x7jahah
   rNtym+L2q8vF6Uy6cfWsHgHwt2yLQso0oTkpNvlxESqzde8fIqaui+w0N
   Yib9rHLo7CpjkZhCkKt2+8epg7zrdB9DjUQWCP5+o4wA/9xb0INjiPQ9a
   Zdcz3rB/l/u12TBZ/uZFJBAiff1CzCxm7xyzCcDzw8hvFZMK/RfQ+Sr+0
   ZsEK97R/uTzK17Qx+ye5u0P6e5B2ZYvAwosLz4sFPFu1mRInlaJSYl3VV
   dzLMYdrwfwpO5ULxeBQpIEyw9Auwae0ivDdqLd1PN5dIhN06CvpiYyunJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="433358620"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="433358620"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 08:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736372656"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736372656"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 08:10:52 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 775ED11FAD4;
	Thu, 25 Jan 2024 18:01:16 +0200 (EET)
Date: Thu, 25 Jan 2024 16:01:16 +0000
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
Subject: Re: [PATCH v3 2/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <ZbKFzGxXhU0TABHZ@kekkonen.localdomain>
References: <20240109022715.30278-1-zhi.mao@mediatek.com>
 <20240109022715.30278-3-zhi.mao@mediatek.com>
 <ZZ0dcTEqxjYCohac@kekkonen.localdomain>
 <42cf05ea80a2413aae588b762e67c3418b9514d4.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42cf05ea80a2413aae588b762e67c3418b9514d4.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_081100_595557_15F1FFCA 
X-CRM114-Status: GOOD (  23.79  )
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

On Thu, Jan 25, 2024 at 02:24:52AM +0000, Zhi Mao (毛智) wrote:
> Hi Sakari
> 
> Thanks for your review code and comments.
> 
> On Tue, 2024-01-09 at 10:18 +0000, Sakari Ailus wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi Zhi,
> > 
> > Thanks for the update.
> > 
> > On Tue, Jan 09, 2024 at 10:27:15AM +0800, Zhi Mao wrote:
> > > Add a V4L2 sub-device driver for Galaxycore GC08A3 image sensor.
> > > 
> > > Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> > > ---
> > >  drivers/media/i2c/Kconfig  |   10 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/gc08a3.c | 1467
> > ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 1478 insertions(+)
> > >  create mode 100644 drivers/media/i2c/gc08a3.c
> > > 
> > > +for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> > > +for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> > > +if (link_freq_menu_items[i] ==
> > > +    bus_cfg.link_frequencies[j])
> > > +break;
> > > +}
> > > +
> > > +if (j == bus_cfg.nr_of_link_frequencies) {
> > > +dev_err(dev,
> > > +"no link frequency %lld supported, please check DT",
> > > +link_freq_menu_items[i]);
> > > +ret = -EINVAL;
> > > +goto done;
> > > +}
> > > +}
> > 
> > Please use v4l2_link_freq_to_bitmap() available here
> > <URL:
> > https://lore.kernel.org/linux-media/20240108151805.55584-2-sakari.ailus@linux.intel.com/T/#u>
> > ;.
> > We'll then merge both at the same time.
> > 
> 
> After got the latest linux kernel code base(tag: next-20240124), there
> seems to be not new API:v4l2_link_freq_to_bitmap() still.
> 
> Would you please let me know, how about the status about this API?

The patches are in my linuxtv.org tree's master branch now:

	https://git.linuxtv.org/sailus/media_tree.git/

-- 
Sakari Ailus

