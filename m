Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A55FC48295
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xCWTNdZ1Bx0D1TRBKxbuVflPjQjkwmE1NHO3OHv9eM=; b=sRyr+tJ9+Q18LkPjmp+o6mFgBI
	lI8CTLZBMevMzpFwJAJT+5ceiQqQmBf/vMlyElNlHt5vvah+XOs8F+s4fZidurW2M2LFhCMCQNyn/
	N0S8MA4fQG5/ocITJLaEUhq8J9o8eBv89FX3Nw7RswQ+iAPClk5He39WJKt4B8o4PAyP/V3pPouaP
	dj68cXgHZjMLSmCwUvyWwjvb+jHZrXXfSLsp/Q8xVCk/gZUaXlkU7uVDgKIPDfpWf+Cg/QxT8b4mk
	8ETZD30Uk7k0NxOADNwlFGYVUrHV2MmddVVRRszNQdiEBNPmxjw23PC6hq/Qco/VES1KbceHLYsMT
	yrvrJAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX14N-00000003q1g-2MEN;
	Mon, 05 Feb 2024 15:39:39 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX14K-00000003q0A-27ZI;
	Mon, 05 Feb 2024 15:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707147576; x=1738683576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rv8CV7EZj9twbDgExrfO0rqgaNqI6EazAjEyAvqafJ0=;
  b=XSKqBAGJZV6zCROXf4SDEQcqsTtwpA4TTPxY7wz0KD+8uzebasq4Aj4o
   oXxj2RXl/09ECfITYIvn9S3ONr6ilAHGzo2DgZoiK5ITnR77fkI69oqH/
   zMor1LsRfhMykBfZLosG0M9Che+6asbvLInZEIj/T85hhnNwCjMbnuBDR
   EHNrNQBUAwQsk330orzkM3I6iE93gR/+bFrv6BGc0v7oRILYrENq7KVLz
   ne2tr3sTbapsBQkpgFZNTkh87yKnoGb37Llp/lWVFGVyFAuupXg5dOQIe
   9Nz0whGdTbGjAoeo4BCIk5ayPm/RWk8rLjR8GOMPEkMRNDwnK6bphM1m2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="17966635"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="17966635"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 07:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="31830670"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 07:39:25 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B935D11FADC;
	Mon,  5 Feb 2024 12:53:10 +0200 (EET)
Date: Mon, 5 Feb 2024 10:53:10 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 17/17] linux: v4l2-vp9.h: Fix kerneldoc
Message-ID: <ZcC-FjF5pJUKz9Ir@kekkonen.localdomain>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <ZbTTb-SdK-EubGdc@valkosipuli.retiisi.eu>
 <201ae1d1-1e03-40e2-9cc4-49df70abb8da@xs4all.nl>
 <8f3bab1f-8697-40c0-91f2-de934b4b9ddb@infradead.org>
 <e565f8bd-19d2-4574-8c6d-5573733a8185@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e565f8bd-19d2-4574-8c6d-5573733a8185@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_073936_598664_1ABA6122 
X-CRM114-Status: GOOD (  22.90  )
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

Hi Hans,

On Mon, Feb 05, 2024 at 11:44:13AM +0100, Hans Verkuil wrote:
> On 05/02/2024 11:39, Randy Dunlap wrote:
> > 
> > 
> > On 2/5/24 02:29, Hans Verkuil wrote:
> >> On 27/01/2024 10:57, Sakari Ailus wrote:
> >>> Hi Ricardo,
> >>>
> >>> On Fri, Jan 26, 2024 at 11:16:16PM +0000, Ricardo Ribalda wrote:
> >>>> Kerneldoc cannot understand arrays defined like
> >>>> v4l2_frame_symbol_counts.
> >>>>
> >>>> Adding an asterisk to the name does do the trick.
> >>>>
> >>>> Disable the kerneldoc notation for now, it is already ignored:
> >>>> https://docs.kernel.org/search.html?q=v4l2_vp9_frame_symbol_counts
> >>>
> >>> Wouldn't it be nicer to fix kerneldoc instead? It might not be difficult at
> >>> all.
> >>>
> >>> Feel free to, but I can also give it a try.
> >>>
> >>
> >> It would be nice to have this fixed in kerneldoc itself. I'm holding this
> >> patch back for two weeks to see if someone wants to work on kerneldoc.
> >>
> >> If not, then I'll take this anyway to fix the noise in our build.
> >>
> >> Note that while this header is indeed ignored in the documentation, that
> >> is really more a bug and it would be nice to actually include this header
> >> somewhere in our documentation. So fixing these kerneldoc warnings one way
> >> or another is something that we should do.
> >>
> > 
> > It's just waiting for Jon to apply it: (from Sakari)
> > 
> > https://lore.kernel.org/all/20240131084934.191226-1-sakari.ailus@linux.intel.com/
> 
> Ah, that patch was CCed to me but not to linux-media, and I only searched linux-media
> for it so I missed it. Good news that this is fixed in the right place.

My bad, somehow I missed linux-media from the distribution. :-(

> 
> I marked this 17/17 patch as Obsoleted in patchwork.

Thank you!

-- 
Regards,

Sakari Ailus

