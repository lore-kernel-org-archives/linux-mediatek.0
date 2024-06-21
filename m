Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D704C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r78KDnOJuLzlTTwXnPv8lrpYBFcerusx8vpbsnPxcBU=; b=oDiv+karZop5YKY/DejM4BFRht
	Bpk1ubDa/stBu4f3OB8kKgzAy3Quq8d8buKYzsWnOAU+R7YYhgKqvHF1RNWw+C/0v4g1PBHc96mez
	tf+EZAqy3l70zpsVMd0Sg++3abqaco2uxbmwUezBYPB47FKBSNrhnSijq5Uge9VwJZ3uzndc4tdT9
	6J1P0Uc0HmM7ydF8eWPJChuurloWTvVlEk53VxHQTlsN1XW3TqEh9LvVvHGqNwPhpRLzPPa+SBl7d
	/UKxIV/IjMCEgoHGnavMwOfzORdUPf4yZfWsCcCXVfVe9wsCLM+JfRQ+s9YqkoovExBgBfEXe4+qT
	Y57DDhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiBR-0000000A7Sw-1IbT;
	Fri, 21 Jun 2024 17:36:21 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiBO-0000000A7Ry-0haj;
	Fri, 21 Jun 2024 17:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718991378; x=1750527378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qcPvzmgYj12g8ImX1mzdEnkJ4xTcuDJBE3vsD6BBM/8=;
  b=JK/S3+5BYeMHCxQJjR+hDXtnn0LK2h8IvYp8iroxu5msbnaSJ0wv19FT
   j00iu15rBQphgYo9BsV2ZvPJ4fXyV87glOS0XFXwb6fZHSSmaBroLo3Ul
   PSXatz0sur9mfeUyN4i1ELAyq3Eo68tj5raTfcjLGVrT82BIaRM3oiTVn
   UzKD0qfL5b1CWc8K5E6j/cz1JXwnBhcJfDvzHr5tp85aZBVNv92nceVR+
   kX/2cvdNSU/IB+TfZry9O9uW83brW7nTaeRjD1PNA1nLJE5gJPvHrvNoD
   ynesxHSmTLK8oL5ZhK7xANIyw0yzfreAVeDS7ijMcZKtJnmth8y5mGph6
   g==;
X-CSE-ConnectionGUID: GdBijkCURZyquI2Howj9UA==
X-CSE-MsgGUID: XcLXkLCJTW6uD8+RmxsJ3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15793885"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="15793885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:36:15 -0700
X-CSE-ConnectionGUID: H9IYCJeiSDarIWFxa6sdhA==
X-CSE-MsgGUID: 3ooXh5iNSpCEYlpT4ljgOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="43333717"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:36:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A070711F855;
	Fri, 21 Jun 2024 20:36:04 +0300 (EEST)
Date: Fri, 21 Jun 2024 17:36:04 +0000
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Zhi Mao =?utf-8?B?5q+b5pm6?= <zhi.mao@mediatek.com>,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org,
	dongchun.zhu@mediatek.com, "heiko@sntech.de" <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Yaya Chang =?utf-8?B?5by16ZuF5riF?= <Yaya.Chang@mediatek.com>,
	Shengnan Wang =?utf-8?B?546L5Zyj55S3?= <shengnan.wang@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"alain.volmat@foss.st.com" <alain.volmat@foss.st.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"10572168@qq.com" <10572168@qq.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"mehdi.djait@bootlin.com" <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
Message-ID: <ZnW6BO0ZLPPI71TP@kekkonen.localdomain>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
 <20240612012019.19078-3-zhi.mao@mediatek.com>
 <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com>
 <18d2c28fc8b47889689a1506957ea2a308c80fa2.camel@mediatek.com>
 <171823714905.1550852.13442340621133903705@ping.linuxembedded.co.uk>
 <CAHp75VcA9yZ6bVt+10FrzB3L3wPj8fW5UBB9D7p0iHjLaxWCpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcA9yZ6bVt+10FrzB3L3wPj8fW5UBB9D7p0iHjLaxWCpA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_103618_322465_46DE34BA 
X-CRM114-Status: GOOD (  21.51  )
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

Hi Andy, others,

On Thu, Jun 13, 2024 at 09:51:03PM +0200, Andy Shevchenko wrote:
> On Thu, Jun 13, 2024 at 2:05 AM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Also - Cc: Dongchun Zhu <dongchun.zhu@mediatek.com> who is listed as the
> > DW9768 VCM driver author...
> > Quoting Zhi Mao (毛智) (2024-06-12 12:13:40)
> > > On Wed, 2024-06-12 at 09:07 +0200, AngeloGioacchino Del Regno wrote:
> 
> ...
> 
> > > Our project uses Giantec VCM hardware.
> > > For detailed vendor information, please visit: (
> > > https://en.giantec-semi.com/yqmd/164).
> > > The VCM datasheet we are referencing is provided by Giantec.
> > > Currently, the relationship between Giantec VCM and Dongwoon VCM is
> > > unclear, but Dongwoon seems to be another manufacturer of VCM
> > > hardware.
> 
> There may be plenty of manufacturers of the same/similar IPs, but it's
> not an excuse to have a duplication like this.
> 
> > > From the perspective of software driver development and maintenance, it
> > > makes sense for each vendor's hardware should have its own software
> > > driver.
> >
> > Personally, I don't think so. If two vendors make identical parts, we
> > shouldn't have two identical drivers.
> 
> Exactly! That's why we have compatible strings or other means of
> reusing the same code base as much as possible. This in particular
> reduces maintenance costs (of all means!) _a lot_.

Indeed. I'll mark these thus "rejected" in Patchwork.

If there's something that needs to be handled differently for the other
VCM, that can be taken into account in the driver.

-- 
Kind regards,

Sakari Ailus

