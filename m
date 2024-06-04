Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A84C25B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dubi3csjEeyMXT07abDMc2Zi8LmeKweHD5wC9nyqQWM=; b=ErNFhJcBpONcCDPuC69oRLJ+D3
	4xf99LiU92zvF/jwicKMy7HsmW6jCXg9y+pffCPTSqRIiiujWrdL+L9BmQGdzJ5jQJsSbUy14/g49
	M0Mj6tyP7+qoI0BpbKYX4CoXqjwxkJaIKfqktoGZPKWxNU+A52bzb25fczBOf8uvInFy9aLPPEokT
	Lsd0Ri39kKqPXBpf6j8rSw3q5tynZkb2TUH5W9yzqhMUsAXT/hGh7Hv+VYf0F3bL0X8A9/k26wYf1
	N9I2PtJfgwUfJr6z3YQgMf8fMQVJ47DPm3Ei4RpqYBw9tRYtme7qv+lbq35o443doMFv7TSZTkUZh
	hdBo++2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPI7-00000001dSH-0AAg;
	Tue, 04 Jun 2024 08:13:11 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPI4-00000001dQC-0TEB;
	Tue, 04 Jun 2024 08:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717488788; x=1749024788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IUW2B66zglTPFtJQ8pWUpEiPWX7KR3/WKlHiDVvPWBs=;
  b=a/JZzGxDwwJ9bxsB/xYnspiDv3FeMX5LONaRH4CVtXuWL3b+n30Fz6M2
   jNBQw6Ff62S0JxWfAfBwPECupbFlJXnFWLUubFcZUKZBQZfcBFe7PQ+JE
   YwTd4+7WU25EOfeYcv3T9euJibPY1/EJWvcQk/7TT2R/X+DE48/1JfZSQ
   Ng3ybKjqJrUE0lWPYjaP3u7Y8RGiCcQiznPmNzhlm2w8hs8DaHgS4gTOH
   3plFeyJknuF36kfMvTiX7yVkGaws0aqLX5WItIq35G68rxDk6gs5XS421
   NfUSlwTXRC44Efdm3MG5eC7kV8uO5tS6EI6mkdLYVmRQ9L0wzZxJataJk
   w==;
X-CSE-ConnectionGUID: BGi/69QKR+ico8fr5mfxlw==
X-CSE-MsgGUID: LSh60izWSemyq5pQPK53og==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13825744"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="13825744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:12:59 -0700
X-CSE-ConnectionGUID: a/q7GY0wR4mKWYbZhvEtcg==
X-CSE-MsgGUID: 5Z830YFKT+GoDQ3tx2NI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="60325023"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:12:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BE57C11FA4A;
	Tue,  4 Jun 2024 11:12:50 +0300 (EEST)
Date: Tue, 4 Jun 2024 08:12:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, 10572168@qq.com,
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
	gerald.loacker@wolfvision.net, andy.shevchenko@gmail.com,
	bingbu.cao@intel.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 0/2] media: i2c: Add support for GC05A2 sensor
Message-ID: <Zl7MgsleDr66xMAi@kekkonen.localdomain>
References: <20240427052233.8915-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240427052233.8915-1-zhi.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_011308_173475_C94A62AA 
X-CRM114-Status: GOOD (  14.36  )
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

On Sat, Apr 27, 2024 at 01:22:30PM +0800, Zhi Mao wrote:
> This series adds YAML DT binding and V4L2 sub-device driver for Galaxycore's
> GC05A2 5-megapixel 10-bit RAW CMOS 1/5" sensor, with an MIPI CSI-2 image data
> interface and the I2C control bus.
> 
> The driver is implemented with V4L2 framework.
>  - Async registered as a V4L2 sub-device.
>  - As the first component of camera system including Seninf, ISP pipeline.
>  - A media entity that provides one source pad in common.
>  - Used in camera features on ChromeOS application.
> 
> Also this driver supports following features:
>  - manual exposure and analog gain control support
>  - vertical blanking control support
>  - test pattern support
>  - media controller support
>  - runtime PM support
>  - support resolution: 2592x1944@30fps, 1280x720@60fps

I was about to take the set but then I noticed the driver and the DT
bindings are missing a MAINTAINERS entry. Could you post a new patch adding
that. Same for the VCM driver, I think it was missing one, too.

-- 
Regards,

Sakari Ailus

