Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zM2oTYjcq0Qi5LWjerDCXLFWkDZ6bBojudGD3He1B4o=; b=y8Ozpq9K3jDYKEbJ4pqYqINNZm
	D21qfasfLG4yn2pkwKod1Tola+SWOU8rPloxoPoCQboxlk5EF2iuA5/NLa9Qv/1iyb/3c5zZ1B7Xr
	5P4Ay+sT1DYjDKYdL4gmEH7BrE0Y0ue+q6h2nLM5ZE/paYvYLLZWFI3XffsJ3VL9LcovM4TbAaxPt
	jINfOP4cHMbQUgkaqWGnGtWl80jIt+vqPwXoP/MCAW9ZALK/vZCaqR7yf//18LiAO8UeHB7Zn2a0L
	1p22ujxeVZ8JL8qRXk6J08kaksjq4dad9Ja4pf7rqbP2GUvt9lCTBviz4cHBDITZSVp+fmTDZzIUi
	+SGSAgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHxz-0059VQ-JP; Tue, 11 Oct 2022 16:18:51 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHQy-004usp-A4; Tue, 11 Oct 2022 15:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665503084; x=1697039084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ptjxKpKMe9ZpYpWkzy6xCUEZZDC37TWs3lCOeMWbyI=;
  b=E9w8nzHNkFWiOgm49apidWLyZU3FlJ/1ngIrtNjIsSmEVU1zl7ZVeigy
   n2UOfnU0IimMPuiEcASZG9N4Iqp1TUZLiRXW0WQjCz69JnCXdlMJDtYAP
   6EridFneeB8OYOQaNebBB57D7ucJhg4O9LV4vq8Lgox6KqDaZylYiuiUv
   0lGHip0UE872bStL5yPvz6bFtF5sbeetCHFqskYVO0IEC1L0pgOcf/pUz
   ampspyufh87s9rWimTWfaBOVoFdyvz4S4dafR5wa+StwHrHMDkrPji2wf
   +SAeqJ3Di5R5Je8a/Wod5N8CzOvLJ2/O5PXuGrfRAqtJ99qVhQ3BeF55a
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="302148752"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="302148752"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 08:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="715553658"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="715553658"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2022 08:44:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiHQo-005OPV-2A;
	Tue, 11 Oct 2022 18:44:34 +0300
Date: Tue, 11 Oct 2022 18:44:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kent Gibson <warthog618@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0WPYuZ/9//jxwQ2@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
 <Y0V57gI75ik4ki3A@sol>
 <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
 <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
 <Y0WJcXzkkK4oGbrR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0WJcXzkkK4oGbrR@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_084444_397072_DD977969 
X-CRM114-Status: GOOD (  10.58  )
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

On Tue, Oct 11, 2022 at 06:19:13PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 04:39:46PM +0200, Geert Uytterhoeven wrote:

...

After all this patch is not needed. However, during checking of the necessity
of this patch I realized that seq_file is used in a few GPIO drivers without
any actual users, so I will prepare clean up series for that as well.

-- 
With Best Regards,
Andy Shevchenko



