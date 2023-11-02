Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A909C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4noGxVeBaozZSr63hPAI+0rSprh0astSK1St0pl2xws=; b=2Q3fwsHeh163AKtrOpkBZq3o27
	nZ/omAm2oq8KwGBBe2hlR/iwkDEd5u3Z5ebhqGF+gsDVCnkydbKLT//X7oPehRsrC6pr1MCbDU0ku
	yycbBLDrJeYpJ9bQ30nx5cSXWRaP3ccKvzYhFm7kgjsjDi0hGc8kxE5agoHIdYwXX7Xq45V3aFQ2H
	iAsCcTxw0Anowffv588IZpWAwZY/hDZLTEx9hUZDdVGZ7X18jkY2+i/4kDytU9OuXS6HFQnCFlNn9
	d5YGSK42dK/WTXRgrYReo9r6ZVAhRIDVS4C59i5+tEliyin2Js80LjCmhKLVOOJWKAGmTJztQVVdI
	UKgnYmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyXGP-009UQG-27;
	Thu, 02 Nov 2023 12:57:33 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyXGJ-009UP5-23
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 12:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929847; x=1730465847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMDM7reEs0Ot39FWgYWerv/kjGQiEL5fgEgqqZjutMA=;
  b=ehrURnF44BgN+dj9bmJFI1DgTVSBUvbTR5negKvjLwGBD7h/WXMtKArE
   ctZ3J/r4dhtvWI6Ic4fnOIc9VLLk8w3pop1BPVxEQZ36rAs1g6Sb2KcyS
   8kk3578GsrTb0BaTk3s+euYnQgkh2by9gWflm+9eWEcJZ7L65iSHuSkvG
   oOWa9hR2b6oupowRJbftofdb8/DkrnGrKEClndklY3sSxjXntmj0B+TDR
   iEXQ96BWbuXpWikPIi8UT1HHhQ/v2jfsCaGCiGtQGF9bwkVVBJzfRTkWH
   VQ0g51pz/0oqMua7/4FrMjPtd6/JMQSV+uQqr0Tp7Yz+VdZRawx4KUNdo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368910189"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="368910189"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="904999992"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="904999992"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:57:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qyXG2-0000000Agsi-2RZT;
	Thu, 02 Nov 2023 14:57:10 +0200
Date: Thu, 2 Nov 2023 14:57:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, rafael@kernel.org
Subject: Re: [PATCH v2 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUOcpr01VRWdBL-E@smile.fi.intel.com>
References: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
 <ZUIfSIWze4llNJfd@smile.fi.intel.com>
 <ZUIhr1Wiy96PMEKx@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUIhr1Wiy96PMEKx@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_055727_691506_FDAB39EF 
X-CRM114-Status: GOOD (  17.08  )
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

On Wed, Nov 01, 2023 at 10:00:15AM +0000, Sakari Ailus wrote:
> On Wed, Nov 01, 2023 at 11:50:00AM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 01, 2023 at 09:27:29AM +0200, Sakari Ailus wrote:

...

> > > - Use size_t type for len.
> > 
> > Strictly speaking it should be ptrdiff_t according to the code.
> 
> It'll be compared to size_t right after. ptrdiff_t is signed and we know we
> have a positive number here so size_t seems like a better choice.

Yeah, this is downsides of C language and typing system.
But diff between pointers returns ptrdiff_t result.

...

> > > + * the comparison to either '\0' or '@' character
> > 
> > NUL is a human-readable substitution to less parsable '\0'.
> 
> I can send v3 with that but I'll wait a bit if there are more comments.

Why not? You got tags, so I'll give mine with this being addressed.

-- 
With Best Regards,
Andy Shevchenko



