Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90495C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 07:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6x6syHYv6B5JOmlNh5XvQB7b07Sol2Uh3+zOoIhcFs4=; b=qIwTt13kw7jLIsY1VfMh9Fs7r4
	U7ZPqtLkRKSGo+Stez6Vafp170lC4kBdjJH91SU7nqwevrqSlLfOh9W3hef4JSGGbMFlPlecCoJx+
	zx0lmmk6FbjC7cCshKzpv55Z79qwkxFqbWPJkd9nsxp1/12AwnD/Zu6DuoyA2GdIfiqeJfOCTOTbm
	AZI6W5rYmpas1PrsF+K4P1Bx/zq5VB23LCULfu1Fzy7oszgd95yqeCfV6VdPhZXkz5rjlBLgRLKhb
	HYmEXJlh9qQup3NqDSPcQZNAJHvx2LKjonjFAWLdzSgY133Lb4DD/KVqyuodbsaDhY7qoLAo82OSL
	Qbb2p1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qztgp-00Fylz-2d;
	Mon, 06 Nov 2023 07:06:27 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qztgn-00Fyl9-09
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 07:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699254384; x=1730790384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G9ErlH/+M/Rbhu99aimM6BxS7FI2wLaofzX009O7Z7A=;
  b=LkZ7LKVUcPdCP6tAZipzaUvEEsGS2yNZgkroTffs4kpH2K0Y3ofLKsVj
   4kh4tBurqjY2wn+mB323zW1zFjgF2olo0lUAvCjczGRArr0DZmh8lqBix
   l71VDWH20c9cL8BGQXEHimspfohkk8Pzu6TBBuQIm0uaSoFq8fi1ZDZm2
   It2sn0+cZh1e4bzUT6PbHDoSAfoo9gaqbmVfiZHX6Fj/JaXuane3Dm2ZS
   KAAfrb7UoRpOzBjvmZ6ZbUNAWVVAPd8RvAQCdQXA8KmDAv3phR8X8rzV2
   cqoVBtDEzAFJvHO6KMrAcGRe6ydlFagdHbutya2jl+7R6ApI7rnBc+A72
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420334508"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="420334508"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 23:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828122027"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="828122027"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 23:06:14 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7DCEC11F724;
	Mon,  6 Nov 2023 09:06:11 +0200 (EET)
Date: Mon, 6 Nov 2023 07:06:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUiQY9s0DKmkbzAR@kekkonen.localdomain>
References: <20231102081611.1179964-1-sakari.ailus@linux.intel.com>
 <CAJZ5v0h5q__nbfxLUN-cZDSvjTCJHSZwoDEz_cq+bUJGSn1u-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0h5q__nbfxLUN-cZDSvjTCJHSZwoDEz_cq+bUJGSn1u-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_230625_117199_2063AEC9 
X-CRM114-Status: GOOD (  16.75  )
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

Hi Rafael,

On Fri, Nov 03, 2023 at 03:48:23PM +0100, Rafael J. Wysocki wrote:
> On Thu, Nov 2, 2023 at 9:22 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides NUL) is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Hi Rafael,
> >
> > Could we merge this via the media tree (pending further review comments,
> > if any)?
> 
> This would be fine with me, so please feel free to add
> 
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>

Thanks!

> 
> to this patch (when ready), but you need to ask Greg about it, because
> he's been handling device properties changes lately.

I must have missed this somehow... I'll resend v4.

-- 
Regards,

Sakari Ailus

