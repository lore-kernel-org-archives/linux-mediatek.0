Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A612C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoxMQSqOv7vvDAYBkEMCWq6frWY+pFf3hORuM+NLbTg=; b=4/n1KKnHqWFVDELWyD4eodWGUz
	2N+PxGXQoLGiTApGIK2be3kTTH8amaLZ1+Ya+vmXejtVx5DMWbjsbFtFQSpsFDwHf0MS2ssFVlgTZ
	RmiU/z4+FaDwXfzqOYDRZ5a9subHF46IhMkJIhf55zE6GucPRoP5EtJNrxYn/kM4YaWdDFYAY82hR
	LHlu40+YNYhN2hk3xAqpoBry/eeWz0/9Ayj1dwC7JQdvfK6jj0167emu4ovGfFxCfln/E//v+HxDh
	Od1Vmy+Tm9BHFOW5JZ62Bd2KNYJZ8qRwQVGKrVJSPw20w5hjrLp1xGFKvPwYcj0ZXohbkmNJ9BKTE
	D1jkakdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxnR-00GOEh-1l;
	Mon, 06 Nov 2023 11:29:33 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxnP-00GOEI-0e
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 11:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699270171; x=1730806171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVbgGjQlfi/ag2GwhO/7mrluIesj2NDfOw+Ao81CCzM=;
  b=NIs4fRk4JAi4oiKyUTv1qLzcz2oWgDksuC6ymjrldPCoW2eyGkRUt69M
   ZqXenNI40f7PkdfZ71yoLs6yRQAAFxOKzs6Bh0lvZn1yK8AIZNJrvCGdC
   THKfu70zvrv2+N8x5+MrdUixGIShzJvipSa9V22OAzK0uWXo1HN6rT4Rw
   Z03P0HC7M1CVPGofF9AGxNR4klXxbA95PkHIBLeRCk+uccbyO3LEzGHtw
   1KRjd4NulS7U969cWGyxEaFdQJBu/sr0/OLZEAgCiJXHFTBEBp8EyuwuN
   +gUgkMfpm5tyQCmR3Ol5x9NU05VUADZT2hbXLzdo4LMc9LUd2SkbG8gX9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386431926"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="386431926"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762294686"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="762294686"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:29:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qzxnH-0000000BmAW-0nCG;
	Mon, 06 Nov 2023 13:29:23 +0200
Date: Mon, 6 Nov 2023 13:29:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, rafael@kernel.org,
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
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUjOEsQSjom4SdOg@smile.fi.intel.com>
References: <20231103070631.1223643-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103070631.1223643-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_032931_252417_7FA20094 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, Nov 03, 2023 at 09:06:31AM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides NUL) is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I believe I gave already the tag...

-- 
With Best Regards,
Andy Shevchenko



