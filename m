Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE1AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KJU6nUdwaU/J1GeDb6UHBURiKWCq+v/WVsBacyuboo=; b=Hr35UYTzCkmESU
	LrV3uwHP5FDpnTRS4iEZYCOkB5IKW/KwBygk7DLLqSzkZD8DVJLNDmRRJhpS9LMx4iqxlEtrHp7Rg
	FHOmcip/I2eJyD4cqs7lbFW37UGOo4L26/nl0WpR6Vsw0Yg60OGm380NcjgFxa4jw1sLiUjtDdVoo
	aN+hXJvhSknprkujeCtUMN1lVg14LIz3bZhsaL8xj0qu19zlJCcrnJK4vaa0UwwSajh+e60mtqRMJ
	OpUGu/N5MBfjotvD591uW8SB9HNDrUL/bh9zPK04hyV/snlo70vplx09evaKrgRMu1Gi2tJuucenh
	KOHYtLi380C1ZLwUlOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvHcD-00Fnlv-1T; Thu, 09 Dec 2021 11:29:33 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvHbz-00Fni8-83; Thu, 09 Dec 2021 11:29:20 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="324340185"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="324340185"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 03:29:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="612468428"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 03:29:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mvHaz-00449T-QP; Thu, 09 Dec 2021 13:28:17 +0200
Date: Thu, 9 Dec 2021 13:28:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: Sort Kconfig and Makefile entries
 alphabetically
Message-ID: <YbHoUXnojMGspYYO@smile.fi.intel.com>
References: <20211209111255.67044-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209111255.67044-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_032919_322447_9F9BA1C4 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 09, 2021 at 01:12:55PM +0200, Andy Shevchenko wrote:
> Sort Kconfig and Makefile entries alphabetically for better maintenance
> in the future.
> 
> While at it fix some style issues, such as:
>   - "Say Y/yes/Yes" --> "Say Y"
>   - "pullup/pulldown" --> "pull-up and pull-down"
>   - wrong indentation

Scratch this, I have noticed more indentation and grammar issues int the moving
texts.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
