Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6996C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z01vGcuw2xoUkLuO+RUIoBrbPKoeri7SOWFHPffxs7I=; b=3+hozfmKaxY7cK
	zVQRV4X4OuzxquMYO9hstFRTYXyYzAw5+gMWx85NVpBVV/a26rimLSSN5h6Vio/bS0cnSIn2O4EDq
	2avhH+OZD7Kr/JUx7xH3xcABxA0KU6wkT9oO0OiTdyvDdyAZH2QqFbkrZ4nLb7dZDcNb33atjx4tT
	QYnN3ORFXWz+Ifw8dQ06mt876Z/+DeIVPkx6WoMvQAaD9WWf0NzLDClkJvMFBugfqaGvtWnRhlqbQ
	FJ5Q3FB8X9AMsAr1e5wnqqqCXLZSC6C4vDca4r7E0qCnADXCkO6I9nxdEabMkgqxic21jd1ixEqfq
	y/Ofvp4vKSBufKL8NXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCPa-00BYLI-B7; Fri, 04 Mar 2022 18:12:18 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCPO-00BYG2-Lg; Fri, 04 Mar 2022 18:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646417526; x=1677953526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ymhrhqjpe7iYgeVft/Kn+RQXzNz7BxHaO/WuLNq0Oig=;
 b=XI6dRXxvJWD61QIQqdWPkaz2znPY39fVVaHMfGPt8LCwuJ2FflvNVNbr
 xRR85qGbipTirQch1jgo+1QCmkjt4mei/dzGtIP6VXFQVD4pjfbRaORTb
 OjvRkfMieV4JvQ0srxRMHWa0Z4ZOY4nWcsRqD6vkuQcsuQIDdk8mzNMl0
 K8JrrjVg+8frQUnhy1iH2JpknKDOtBWTdtO15KV5yQMpIA/7FYTKc5cz+
 pmz9y9A7bpTwb0EsQl+GenEt3duCj/n2ZmLYyn3ky8rGRo/YykcBd4oqO
 vc2DsLFqrA3ba/BcKiKB378Sxb/OmgBVI6B8YQGRhBUWbJRB1CGO3kwB5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="278722644"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="278722644"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:11:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="511936238"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:11:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nQCOU-00BKGo-SR; Fri, 04 Mar 2022 20:11:10 +0200
Date: Fri, 4 Mar 2022 20:11:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/1] serial: 8520_mtk: Prepare for
 platform_get_irq_optional() changes
Message-ID: <YiJWPhWGEGg63zbe@smile.fi.intel.com>
References: <20211217181547.48182-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217181547.48182-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_101206_749795_9E243252 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 17, 2021 at 08:15:47PM +0200, Andy Shevchenko wrote:
> The platform_get_irq_optional() is going to be changed in a way
> that the result of it:
>    = 0 means no IRQ is provided
>    < 0 means the error which needs to be propagated to the upper layers
>    > 0 valid vIRQ is allocated
> 
> In this case, drop check for 0. Note, the 0 is not valid vIRQ and
> platform_get_irq_optional() issues a big WARN() in such case,
> 
> It's safe to assume that 0 is not valid IRQ in this case since
> the driver is only instantiated via Device Tree and corresponding
> OF APIs should never ever return 0 for valid IRQ. Otherwise it is
> a regression there.

Can it be applied now?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
