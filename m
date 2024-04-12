Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7ADC04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Lou0bS4uPC+nMvECmQ63ca/WnvfQtn4Qs8gE8IZX/s=; b=bD/CesGARB58uhn6c0Bj5PLn0a
	bod+SEAi9ct1Sxs5TNjJl2doPVplSkEEgB3rGRtpB2L65G7nw7uX51xo425cG0ztzv0lB8ZYMehib
	EY9Vb3zKDUDa3hjN3WqSWVKhY+ZTKEPGhjrqbLXCx570JXNv59dVDCtPz4BuZ9p6/UAgyL7S6NEhA
	yZ+M6NQudEFnHTHyeTVY9j1QbvM875K07hG8cIYkPVk/Le6vUnAqA94G9yf0YFVRpFnelCduHXMI7
	cHUKT965Ek55K5jLdTud56plbDxjrnoa0RmAEsdmKlfGpMgTQLDWbfT/8TrfPcLl4G5NutoenYIm8
	CoYBKAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDN9-0000000GTuj-2jbU;
	Fri, 12 Apr 2024 09:39:03 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDN7-0000000GTtw-0Gd9;
	Fri, 12 Apr 2024 09:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712914741; x=1744450741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xhZLSdqjCJGkrq/1WHroNk1xCdiol0gprEN4wXQPrlU=;
  b=Oyc966U6AQSKPXz8WeHsn8245G4djhYxi2VH5JA6pqriz/6kragD1Pul
   MR8UIRYJKr5WlRtJvH+DCpblOhx8phlltOPOKfyxZ+cs8P+zzLG5Iox2F
   dVyMibwEeW5bpSUpelx3bVz8IHL9myFJCI1XazHAz2ctrtFaxSNPuntFt
   YSD0jdA/h1fZ7pjHGR/AbftfKpIdOcUG+ffi+xADANXq0ubkrVnD6pxOQ
   2Na9B9RFM9/06KfFxX+qp/GHFKliUE9Nx05J4WVKL1i5bpinR9mcGDEid
   iBQYuzWOcM6jBvDd18boDuaVTmGk7ogHkHsVMfWjZlgACFtsWVqq85PA7
   A==;
X-CSE-ConnectionGUID: Y8BOcXcgRFag+uYupHN02g==
X-CSE-MsgGUID: FspOjm8JSRKwvKGfTLk++Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12148184"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="12148184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 02:39:00 -0700
X-CSE-ConnectionGUID: TEnw0//TQtG62goI0XrVyw==
X-CSE-MsgGUID: XWlRxbLtQnW4iW48NYWBHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25988920"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 02:38:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 304D911FA58;
	Fri, 12 Apr 2024 12:38:51 +0300 (EEST)
Date: Fri, 12 Apr 2024 09:38:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Zhi Mao <zhi.mao@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, yunkec@chromium.org, 10572168@qq.com
Subject: Re: [PATCH 2/2] media: i2c: Add GT97xx VCM driver
Message-ID: <ZhkBIee2X0UY40yD@kekkonen.localdomain>
References: <20240410104002.1197-1-zhi.mao@mediatek.com>
 <20240410104002.1197-3-zhi.mao@mediatek.com>
 <CAHp75VfF0pbrKXjWZg7sTr-T=_CbjP+deFQP-VLCGX8ooahctg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfF0pbrKXjWZg7sTr-T=_CbjP+deFQP-VLCGX8ooahctg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_023901_135090_E3361C5F 
X-CRM114-Status: GOOD (  10.37  )
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

Hi Andy, Zhi,

On Wed, Apr 10, 2024 at 07:00:02PM +0300, Andy Shevchenko wrote:
> > +static int gt97xx_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > +{
> > +       return pm_runtime_resume_and_get(sd->dev);
> > +}
> > +
> > +static int gt97xx_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > +{
> > +       return pm_runtime_put(sd->dev);
> > +}
> 
> Hmm... Shouldn't v4l2 take care about these (PM calls)?

Ideally yes. We don't have a good mechanism for this at the moment as the
lens isn't part of the image pipeline. Non-data links may be used for this
in the future but that's not implemented yet.

-- 
Regards,

Sakari Ailus

