Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7D8C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZvjBeHjmV69CgMVNZbE0cIToofesYTCR9zR6lGEUxw=; b=FRKxBRlcJt5WaY64RoOkLFgLt8
	v+L3ng2trSUSgUr+13MxkZAa3zt+tFIXuXv5LJK3LWRdJ667Bd2xer25yTq57Jxu86FCYo8sk9/s0
	71lyLOunObOepoEHmqLJU38scSZ1bx5Lfk79F3AFaxWd5R9eyTKfD0eVL6lhqOZmijDeRVZgggC0Y
	IZzP154g3ynLLlbDsRo0l046IhSNeYaYrAnennne7105m1U5qCfjscdfOTQwcnumJ0BBWeVGnQozs
	4YhV6PVmmC8Nq7fDcdT+wbIf0QWremafj5Ndyd+oCJEUi6V/XQVDVXB3i8EoUEo9GCaI/m0tvBd7+
	mwc581uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7ra-006zK9-2R;
	Wed, 01 Nov 2023 09:50:14 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7rV-006zJX-0f
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Nov 2023 09:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698832209; x=1730368209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zDiWeh0tO0Ei/h8vXh3lQTonMfi7WIE4tqSqr/o3WIQ=;
  b=cbEYbcudVGSn6XziMFLlRyKNyrMPNlOk9tmxdJJU6S7mqpgv8nz8r3tj
   4a6L41+rAizg+sVhMUnVi/9gHGirrTPMfPMII+/oUsF7aRB5Rz0IHsToV
   NcRITrt0ZtM8/wfZbsVTVDNVFKj5k+Nj7h23NQVMVk/QOMr9gNOPtnaSw
   BXQ8vrLz5MR3L5MmK/avjUG84U8PosbHtw+njh3ZWoF+wOkPI/fk1RPkg
   KdscAvTotPlzHGtKvnCJOKjhFUFcmOc/3OfWOLoabsDxsK4FCZqvIueaq
   MWbetcos6viZVJI33MkTj8hUtuLQ2Hr/GwBXZRgX8UZSirMwNb44unLfU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388287350"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="388287350"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="904594825"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="904594825"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:50:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qy7rM-0000000APbY-2ezT;
	Wed, 01 Nov 2023 11:50:00 +0200
Date: Wed, 1 Nov 2023 11:50:00 +0200
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
Message-ID: <ZUIfSIWze4llNJfd@smile.fi.intel.com>
References: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_025009_261402_01E9336D 
X-CRM114-Status: GOOD (  12.71  )
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

On Wed, Nov 01, 2023 at 09:27:29AM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides '\0') is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.

...

> - Use size_t type for len.

Strictly speaking it should be ptrdiff_t according to the code.

...

> + * the comparison to either '\0' or '@' character

NUL is a human-readable substitution to less parsable '\0'.

-- 
With Best Regards,
Andy Shevchenko



