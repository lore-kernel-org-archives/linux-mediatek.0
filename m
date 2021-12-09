Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCE7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGbhCTn22ckUk8lFKRIXSXDHuizkVkdos4SKDJF8Ogo=; b=sSIa1nmyOtss97
	JUvu3E2RiZphLbL07YjpYFLwy8FJC+jLH7hsqiWlwXJp05vEy0zc+wtir+bNjMPYsv3V9JohVx6cP
	6Exeyi/mSMi3VQgd/gqRatr04xD2xM7pSF0i+NF12kzcipiwlQA8stbl+B75mloVD2tT88ehP3pH5
	BbmXNXmrID+6J7eAFN8jKWJFIHLIbWi9I5Ld2zPKhO9TNtUzNWalf4oPmEoj3a7Fvse5Z5vmpiNew
	FI4/hadKQaCzMGofWrKmP2dS6QDjoJfoZkU2H50fpxj/krg789xbDi454z8RaqyMnXvsI3btfbFi1
	lRyJ9i7wuray464GvwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvMro-00GrnK-5n; Thu, 09 Dec 2021 17:06:00 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvMrb-00GrjI-9u; Thu, 09 Dec 2021 17:05:48 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="236890207"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="236890207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:02:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="601625797"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:02:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mvMnG-004B17-4s; Thu, 09 Dec 2021 19:01:18 +0200
Date: Thu, 9 Dec 2021 19:01:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: Sort Kconfig and Makefile entries
 alphabetically
Message-ID: <YbI2Xb7gBfN4Kyid@smile.fi.intel.com>
References: <20211209113456.33977-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209113456.33977-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_090547_394678_B66D3D6E 
X-CRM114-Status: GOOD (  11.18  )
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

On Thu, Dec 09, 2021 at 01:34:56PM +0200, Andy Shevchenko wrote:
> Sort Kconfig and Makefile entries alphabetically for better maintenance
> in the future.
> 
> While at it fix some style issues, such as:
>   - "Say Y"/"Say yes"/"Say Yes" --> "Say Y"
>   - "pullup/pulldown" --> "pull-up and pull-down"
>   - wrong indentation

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v3: fixed more grammar issues in AMD text
> v2: rebased on top of very recent pinctrl/devel (Linus), added some grammar fixes

I have noticed that you applied v2, thanks!
Do you want me to sent a followup that fixes AMD help text?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
