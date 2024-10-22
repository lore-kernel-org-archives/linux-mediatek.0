Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86027D2C54C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSus7RMkzLitkzwQA6tWX8JkTbH/W+3fXpakmG15dPs=; b=In1wklDZokzFoaj0wH/6jteVP7
	UxKWcWJVJY4+psmXjvTiGNxu5IEnSwsHOX4wT6gCEoNrdeaTxiv26RFlB9vxwv4j7vKGN2C5NTam8
	lgp0hLBzYZocTr9BVR2LV3UX/TrMab3C6jtn1LRLSs/1C77UEegDmC4kdBt/e6WxZaGicjnp2FAT7
	GUb1sbawRtddGg9awrjZ2+E12/NKMZkDiJVy8iyrsHc1Pl8ErZChjRBp1FGX2lg52BhalT1DL/2Tv
	LNt9uYGgqtbm6gYhCyv5UDvnojx6QNp1lvknA0BT3MtQRQCmBHF0F0OGAGqpghZPSgM5M5Bnv2JnX
	Lj7m8p3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EbR-0000000AuNQ-2ej3;
	Tue, 22 Oct 2024 13:07:13 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EbO-0000000AuMU-1dic
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Oct 2024 13:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729602430; x=1761138430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LxK9dOQy9ZT1voxqBg5jjMACV/hPHIhBynHpfUsk3ro=;
  b=I6Lk4I1oSiJDv8/i5QUfpuC10RG4gaDGrZNvxuey5gjeIIn9uotJtmpm
   jC5Q1wfCnIESp/vYq2ENGtK2A+qeSqHzfIN85Dj6lMhOuCZvH4BXOf/Mv
   cEEtD4MbisLg+SNE3nLdL6VXniJN6grriPlzsDuRmPXHLtNgpT8BNhAfq
   1fiwTy7js5OTJBKIDJk7kTg9SAA4Po8jogfpez1jMrOiyGO1ruEvqdpaH
   bvSvie+LSczFM1sW3t769FmiS++n0Iph/xPyEw3ii2jKACuVozL25vFsc
   iKqOAhPwAyrcBiZSXWAMsBjHjm/L01DX60HobQqqa53jXIZn7udIYoZKj
   A==;
X-CSE-ConnectionGUID: p1XxxxWGRq6BcX39Pz5szQ==
X-CSE-MsgGUID: z1wf7oG3SHa1IQPTmrDz8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39718635"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39718635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:06:50 -0700
X-CSE-ConnectionGUID: m/aDOiOKQjO7CCmW/la81g==
X-CSE-MsgGUID: e9oeB9FcSvWhS3UGdlUT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79929622"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 22 Oct 2024 06:06:47 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 22 Oct 2024 16:06:46 +0300
Date: Tue, 22 Oct 2024 16:06:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Message-ID: <ZxejZnvO4mlKT4j8@intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
 <20241003111851.10453-10-ville.syrjala@linux.intel.com>
 <574344f74186e9cf930fb20289a0ed48d7ee436b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <574344f74186e9cf930fb20289a0ed48d7ee436b.camel@mediatek.com>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_060710_467045_D3ECA251 
X-CRM114-Status: GOOD (  12.07  )
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

On Tue, Oct 22, 2024 at 09:46:24AM +0000, CK Hu (胡俊光) wrote:
> Hi, Ville:
> 
> On Thu, 2024-10-03 at 14:18 +0300, Ville Syrjala wrote:
> >  	 
> > External email : Please do not click links or open attachments until you have verified the sender or the content.
> >  From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Allow mediatek to be built with COMPILE_TEST=y for greater
> > coverage. Builds fine on x86/x86_64 at least.
> 
> I don't know why need this greater coverage?

It allows people to make subsystem wide changes without
having to cross compile on every single architecture to
see if the code still builds.

> This driver always execute on ARM.

COMPILE_TEST (as the name suggests) is only about compile
testing the code.

-- 
Ville Syrjälä
Intel

