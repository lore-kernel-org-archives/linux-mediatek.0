Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F07E77170
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 23:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g43fO1XuHKj/UFmCvOtyhjBKPFIbyyOxQAQAQzXxI+g=; b=vO49Or1C1baTnIvKz0lNh5kU35
	Y2lxNKamzHY3xw845MQmw+eMosQjRe7RETAYGDiIBnWle0OJKsxaxzGX1YwOzNAwYedKri4gPNFkX
	wplr4vW/DkMAWUcFr1X75aWKp1n2C6mKZ5Rq7PbNcVYm30oum7Oc5DAS5S5lPjXlH0tlxRYV9bzja
	x6sUdtTlaimEtdlP6DoG1ArNCG1OrxtARYygys/spdfJqObp3dlGZcleeiHV5mNiAZmf3wIrzE5uy
	yoFzyIo4Qv3321bgJ6h2hsOmxYt+yFjS7n7S/WHpB5gvyws1x+fOBow0JPzaTGJUZr71TdGdn2d0/
	zKR61m/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLIr-0000000HZPx-1rgF;
	Thu, 05 Dec 2024 23:30:37 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLIo-0000000HZPL-0z6n
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 23:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733441434; x=1764977434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/Bbmecpn8RogQU7kB8TZf0KJSzLC1/N7kmtot7TRMo=;
  b=JE0tvGEWNjPJAckGWBnkJ7c+VSFyRVxcSyzR34a+kUsYPxaXxAY3cFiW
   GIWPe1WmQlkNqzEUY/YAWpTvrVszAYSVUMFtdos2TmpqhATdGj3ePoQYL
   AZiJ6G9c/fJnyANFabFOGkm5wf+R6skCvG3pT77yBZ88pBzvIrVBjiuYi
   6kAsKNFTzYxpwwzaFb7GHfyyllHGXzWNot93Zvz+xI+ZzeqJjWwN/f5Sh
   92wArqHtnDOcQYw7WWTOvG4l4sdvi8K9PC+FGeyqiJt5DUP1XaPXIxWb3
   80oxed/zdnuBbBz7GbW3/Y9mXUfDzv7De+Aww/QTBMLeNht0otfO/qiLR
   g==;
X-CSE-ConnectionGUID: Qh2bPel9QsWLRkKZUt151w==
X-CSE-MsgGUID: WmVWas9WSQmiTQwA8uK1rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37564426"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="37564426"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 15:30:34 -0800
X-CSE-ConnectionGUID: kigTlvqHQOmnUT1IudSx6A==
X-CSE-MsgGUID: FlGBZXefRl6sPWVdfnP/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="98312134"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2.lan) ([10.125.108.192])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 15:30:31 -0800
Date: Thu, 5 Dec 2024 15:30:29 -0800
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
Subject: Re: [PATCH v3 01/11] libnvdimm: Simplify nd_namespace_store()
 implementation
Message-ID: <Z1I3lSpcnIIbc7S1@aschofie-mobl2.lan>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-1-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-1-1611f1486b5a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_153034_323713_B53EE2A2 
X-CRM114-Status: GOOD (  13.88  )
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

On Thu, Dec 05, 2024 at 08:10:10AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>

Hi Zihun,

Similar to my comment on Patch 10/11, this commit msg can be
explicit:

libnvdimm: Replace namespace_match() w device_find_child_by_name()

> 
> Simplify nd_namespace_store() implementation by  device_find_child_by_name()
                                                  ^using 

Otherwise you can add:
Reviewed-by: Alison Schofield <alison.schofield@intel.com>

> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/nvdimm/claim.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
> index 030dbde6b0882050c90fb8db106ec15b1baef7ca..9e84ab411564f9d5e7ceb687c6491562564552e3 100644
> --- a/drivers/nvdimm/claim.c
> +++ b/drivers/nvdimm/claim.c
> @@ -67,13 +67,6 @@ bool nd_attach_ndns(struct device *dev, struct nd_namespace_common *attach,
>  	return claimed;
>  }
>  
> -static int namespace_match(struct device *dev, void *data)
> -{
> -	char *name = data;
> -
> -	return strcmp(name, dev_name(dev)) == 0;
> -}
> -
>  static bool is_idle(struct device *dev, struct nd_namespace_common *ndns)
>  {
>  	struct nd_region *nd_region = to_nd_region(dev->parent);
> @@ -168,7 +161,7 @@ ssize_t nd_namespace_store(struct device *dev,
>  		goto out;
>  	}
>  
> -	found = device_find_child(dev->parent, name, namespace_match);
> +	found = device_find_child_by_name(dev->parent, name);
>  	if (!found) {
>  		dev_dbg(dev, "'%s' not found under %s\n", name,
>  				dev_name(dev->parent));
> 
> -- 
> 2.34.1
> 
> 

