Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5000C369CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNB11M0iw96JFsI3NeD4d9INw4bMHLX226YBdsnQT5c=; b=XSD4wKoErDgK8e54DrBZb1VEcI
	Gt8JiQ5Yur61Laake5xP5b0YNn3TaK3oPAQ7wD7Bpz1J9PMlF2E9Bg0DscJ+WxiRVni3SViRWl+LK
	cKyb8/3r2m4UlbqGA9AMSiUv0ZEaOUttVTqBVfwA45l6HeELDnxgOxXFzzgVYMhpaAMMYGlyf7NGh
	sLrQ6K1Cv3YwAukYLMFAEBX6KpXEO6bOwjVwmjzAqnZSj3fDICfC/eOn8YR0YXL8Zgh2IaF9FJBR+
	C7sHJ4RlJ63UM6koA0wqkNzzq3A7fo1aHbOqnPbIt2MINuADCwFGSM19mc84eyaIFZKYEm1oefbOW
	DUdW4E2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPfE-00000004nN0-3tWs;
	Wed, 25 Sep 2024 10:54:32 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPe4-00000004nH8-1vNK;
	Wed, 25 Sep 2024 10:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727261600; x=1758797600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UrggVek0lwhDuqSp26+4KJb/uG5YqBJR8jmgQcSwkr0=;
  b=CSibQZSzRK4IAF2pnryeCYY9BqjUN+L7sIJ1HgpuA3PBBRrA+iXg6fT2
   C7K1kTpGeVjW5APXztyNZk9zP/7FaQzBQtqzf5BDY0e9ofqyAVu/AMptx
   b8ygCN6cTDuZzAIxOTjU0+uHr8m7hmS+O2txQUJrIKYyDaJDaYS1AAvC4
   iohCyWKj85Lg2Kf314MfvFkfAag2yYJdJjaTYSq7XqgJFeYD0nURRvWwY
   KKbxo0aXPo/JTc3KRYWUinTIPqY28IjKTiZJtUZZq+GCrpUdjV7mtarVw
   XIguB9QvUVxqYKUUhFkzVTFb/LgpvZlFMu2hQWVJRoTjKPUppx1Ru5sNb
   Q==;
X-CSE-ConnectionGUID: +4zWE3EPRmit+Z5tmzwWLw==
X-CSE-MsgGUID: pvD7En8gQ9a15eHLgABYCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43778481"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="43778481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 03:53:19 -0700
X-CSE-ConnectionGUID: tE8JEtRNTYaDYeepXkZmYg==
X-CSE-MsgGUID: F12ogL8UTO6fX6+00sK67A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="102491039"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 03:53:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stPdw-0000000Cmma-3y2V;
	Wed, 25 Sep 2024 13:53:12 +0300
Date: Wed, 25 Sep 2024 13:53:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v8 1/3] regulator: Add of_regulator_get_optional() for
 pure DT regulator lookup
Message-ID: <ZvPrmJo5WWqAHrhb@smile.fi.intel.com>
References: <20240925093807.1026949-1-wenst@chromium.org>
 <20240925093807.1026949-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925093807.1026949-2-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_035320_573181_3E86ADEE 
X-CRM114-Status: GOOD (  15.49  )
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

On Wed, Sep 25, 2024 at 05:38:04PM +0800, Chen-Yu Tsai wrote:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> Add a new of_regulator_get_optional() function for this. This mirrors
> the existing regulator_get_optional() function, but is OF-specific.
> The underlying code that supports the existing regulator_get*()
> functions has been reworked in previous patches to support this
> specific case.
> 
> Also convert an existing usage of "dev && dev->of_node" to
> "dev_of_node(dev)".

I thought I gave a tag already...
Whatever, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



