Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62280CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Udx6422GOLrRBKpYhSHxM2SQSXlSc3m1ynf4Jswy5A=; b=JdJfyht+K/QgBsEGAou1qIGLPa
	w8MMqaAQCecdMt7BJONcmwZ6gwHBbtn2R6BHdAph1rOHa6WQSZL2j4K6Hb+whG3YG4toOCVXYPljF
	FNwylJo2/pK2tTAZa+cvidXEWxks0BTC54aVkaprRTQm3WMYDhLo6voENrlmedJn9C5o6tTnaH5R9
	7EPQp6XlA/zAjLOtpzleeSWcYxJ/XtRDPIuZ6MuckOojlQvQaad9jz/AuumHvRmh3zvU/vM2KevWb
	rXYZTqZioSpOwo4wYFZ8cOvLPeOnxpSxQ/qCI+FBknmjW1sKlyJgMxArrJ8zL8kzq4KWvAuJ/AYXA
	/c3RbxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurYC-0000000BUYJ-0b2P;
	Thu, 11 Apr 2024 10:21:00 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurY8-0000000BUXO-2IfZ;
	Thu, 11 Apr 2024 10:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712830857; x=1744366857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1x/PkxfkX3229wBLwIHcxsQMEV1xkmCCZ2CTgH7kbKI=;
  b=iHoZjBXfUbVaj0F8ewWptL5vSxSDwIYTXMWZuufV9SzPKVtFM3WiOfv1
   xEBWreaKdjJCQ1rVZav47fvOI3Iq5WEodpXOTlkYe+6XYF+9ysx27rk16
   ez1fEN+6xzByyTvfx3rfd9i8UWw+yRCp2Xe3spadJpgZHhkMeYaZqFeJS
   YIdUcwNGqxtJM7y72Q5M+G4C6T8Qvk5+roJv782be7ELbIBpakizoi7nU
   yklgdmIfpmIbuy7c+ITVdt6YIvQzsctlInMxkliyvARMDQqXyA/sWgxyJ
   7pSUWnNveL+cQgYUNM2aHe/TUunRWMqjT/aALuS+QTNL3qRjZOdRMX6vG
   g==;
X-CSE-ConnectionGUID: rR2n1eXdQTCGZ+wTDV5EBg==
X-CSE-MsgGUID: P/aQYtQLQUyA/uT6DVcrjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18941119"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18941119"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915459522"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="915459522"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:20:52 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rurY1-00000003JuV-2NCD;
	Thu, 11 Apr 2024 13:20:49 +0300
Date: Thu, 11 Apr 2024 13:20:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Alexander Couzens <lynxis@fe80.eu>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH wireless-next v1 1/1] wifi: mt76: mt7915: Remove unused
 of_gpio.h
Message-ID: <Zhe5gbfhTh5V3jSh@smile.fi.intel.com>
References: <20240228200321.3607764-1-andriy.shevchenko@linux.intel.com>
 <ZhbOEqO4BIE4q7Vv@smile.fi.intel.com>
 <87o7agz4r1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7agz4r1.fsf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_032056_622412_9C9A1F69 
X-CRM114-Status: GOOD (  14.76  )
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

On Thu, Apr 11, 2024 at 11:24:18AM +0300, Kalle Valo wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> 
> > On Wed, Feb 28, 2024 at 10:03:21PM +0200, Andy Shevchenko wrote:
> >> of_gpio.h is deprecated and subject to remove.
> >> The driver doesn't use it, simply remove the unused header.
> >
> > What should be done to move this forward?
> 
> It's applied to the mt76 tree:
> 
> https://github.com/nbd168/wireless/commit/b648ed2b4645e9cd0285aba576cb6f800c218b30
> 
> It will come to wireless-next in the next pull request, usually there's
> one per release.

I see, thank you for explanation!

-- 
With Best Regards,
Andy Shevchenko



