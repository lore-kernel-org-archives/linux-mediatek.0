Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583BFE7716E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 22:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfVc7s7/hLD8j8ZyJv9aBYPSXiFnjcqIpj74JGkIcMY=; b=H/mXKgp6UrBCPNEGk5oSIBNdYV
	hXhuGvUd3uY5AP51v7u2Xlo/Q34jxK2dYAbZR0HvssqHpyIb4KbetBerqxnFXTJ7DcVkZZzsID1AH
	lNTi4vsnqN57H2+4MoVAOfhxxvIwQoL8isedr1z1apzYSs2uha6q9QOAKGDeNKcTWEh/4Bjdjm/wF
	HWaaBhbTi+8q+bXcnfa3q93yyLN8YB6fY/zE0tKkS4xZG3TPQtNsYXsHha0F+7wb3pCqXH7Fe2G9W
	2ma5PMxh5cNXaHF/lx6z8WJzU5oZjsIZd9XhdUwG60hPEIRKRW1g2p3aBjMSfaTM2Co6J+Wv1rj4g
	f8Nw4iTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKg7-0000000HW2U-1eIn;
	Thu, 05 Dec 2024 22:50:35 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKf1-0000000HVn2-2p52
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 22:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733438968; x=1764974968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ou2gxSX0BGU8dCJZomlYlLR0SXr+L0Qw1dH4P4elyPw=;
  b=VlVn95htHPGKlPbJ34c35WKnHa1gvh+7ExuDsdnK9be2kzGHVu3jtWa1
   rWRSMkMfVztsIZL935NAgdyJUiCI/HKLDREdBm2QkC6nW5fFWB7dPaeAm
   fy+EoWcd4ASQhEuhxRTEROEo41lM8o/DrN2KeqzTY+qtYD84klLSL2bFy
   6Oyx+ZuI+CpHmMtEYEvHp1gjZmUr6KxTtdExf7B5poR0O+jrkSpCu5Wtu
   hNxLk5Xv9Lz94ZP6kpmFtm+Bk0Pqb+eaR6wrJOiYGy3sMdeGo+e5mfLTe
   cUcyoRRbwEKFMgo1ddG2H7+YV8egcExgQtaTA/CDLsONeG0ISpzUUjWX5
   g==;
X-CSE-ConnectionGUID: Qh10ZYQ7SEmFTuqUVzlrUQ==
X-CSE-MsgGUID: coxC7/qyTseRZ/S+9aHcWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="34022301"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="34022301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 14:49:27 -0800
X-CSE-ConnectionGUID: G9L0aRp/QR2YhMCrZdSRAQ==
X-CSE-MsgGUID: rpoBs8CmRH2FtJjzsBGktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94042939"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2.lan) ([10.125.108.192])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 14:49:26 -0800
Date: Thu, 5 Dec 2024 14:49:23 -0800
From: Alison Schofield <alison.schofield@intel.com>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v3 10/11] cxl/pmem: Remove match_nvdimm_bridge()
Message-ID: <Z1It83v8xuNuLrOt@aschofie-mobl2.lan>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-10-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-10-1611f1486b5a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_144927_720875_718BC029 
X-CRM114-Status: GOOD (  15.73  )
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

On Thu, Dec 05, 2024 at 08:10:19AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>

Suggest conveying more detail in the commit msg:

cxl/pmem> Replace match_nvdimm_bridge() w device_match_type()

> 
> match_nvdimm_bridge(), as matching function of device_find_child(), is to
> match a device with device type @cxl_nvdimm_bridge_type, and is unnecessary

Prefer being clear that this function recently become needless.
Something like:

match_nvdimm_bridge(), as matching function of device_find_child(),
matches a device with device type @cxl_nvdimm_bridge_type. The recently
added API, device_match_type, simplifies that task.
 
Replace match_nvdimm_bridge() usage with device_match_type().

With that you can add:

Reviewed-by: Alison Schofield <alison.schofield@intel.com>

> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/cxl/core/pmem.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
> index a8473de24ebfd92f12f47e0556e28b81a29cff7c..0f8166e793e14fc0b1c04ffda79e756a743d9e6b 100644
> --- a/drivers/cxl/core/pmem.c
> +++ b/drivers/cxl/core/pmem.c
> @@ -57,11 +57,6 @@ bool is_cxl_nvdimm_bridge(struct device *dev)
>  }
>  EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, "CXL");
>  
> -static int match_nvdimm_bridge(struct device *dev, const void *data)
> -{
> -	return is_cxl_nvdimm_bridge(dev);
> -}
> -
>  /**
>   * cxl_find_nvdimm_bridge() - find a bridge device relative to a port
>   * @port: any descendant port of an nvdimm-bridge associated
> @@ -75,7 +70,9 @@ struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port)
>  	if (!cxl_root)
>  		return NULL;
>  
> -	dev = device_find_child(&cxl_root->port.dev, NULL, match_nvdimm_bridge);
> +	dev = device_find_child(&cxl_root->port.dev,
> +				&cxl_nvdimm_bridge_type,
> +				device_match_type);
>  
>  	if (!dev)
>  		return NULL;
> 
> -- 
> 2.34.1
> 
> 

