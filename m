Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C21CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmdrGDAR7TdsnUQwe441iPRP1Cf70dqXLkRfk4G128Y=; b=abJxqssIQy5Uq/
	u5MLYSpTgSgVevg1nzgQoiy6ukKrLRWIbu2aVh3fs0anX1S+RtIPqOjzi+7pz5SjC55WUHNBsL+iM
	w5f/XkDl1hUG27vRMxVaDrEuSCwAr232RJW5EmAkE6LP3wydETsZl6L63GSY64ez8RWuByMX6D0Vv
	h3ViUHy/rcwYuSWMrwZ+ZJM8b1YLn9Yw8pdjpPsKjusjnNq/vK++FWpXwyJ+bVUE59axVVgNAojuH
	IF3Cg5IxDtnEUrnKGS+d1/CXHZ6pHToLQQ/An9xXkOlUfygI2Jsb3ntSEPEV/Ex8pArLYqMTFDm8U
	doXbp8jA1yiu4A/kHJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzzNq-00A3SK-9f; Wed, 22 Dec 2021 11:02:10 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzzNY-00A3Pg-1z; Wed, 22 Dec 2021 11:01:59 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="220607942"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="220607942"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 03:01:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="586982419"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 03:01:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1mzzM5-000jZb-Dv;
 Wed, 22 Dec 2021 13:00:21 +0200
Date: Wed, 22 Dec 2021 13:00:21 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Marc Zyngier <maz@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-unisoc@lists.infradead.org, Gregory Fong <gregory.0xf0@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused local OF node pointers
Message-ID: <YcMFRb6A43ma/hFi@smile.fi.intel.com>
References: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
 <CAHp75VcbaYXfDpc7xE=asSqUspscRoHfqrg-yMtx=uo5UNqxfw@mail.gmail.com>
 <CAMRc=MfWqV8UFWLaJO7JSo7N6MhYVMWdquMDJU7xR5gu8604AQ@mail.gmail.com>
 <CAHp75VfhY9zFxC_vDj0OH0Y0ah3RUgEEYO9p_uQsm7Xe63QF8w@mail.gmail.com>
 <CAMRc=Mfn9P30niRMNqV4f7VByzV0a+Sf2vS4OcU1qPa4o1O8Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfn9P30niRMNqV4f7VByzV0a+Sf2vS4OcU1qPa4o1O8Lg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_030152_166558_44FBC39D 
X-CRM114-Status: GOOD (  11.96  )
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

On Wed, Dec 22, 2021 at 10:06:53AM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 21, 2021 at 9:21 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Dec 21, 2021 at 9:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> > I see. Probably I missed that somehow.
> > Nevertheless, do you want a new version or can you just revert that
> > particular change?
> 
> I removed it and queued the rest.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
