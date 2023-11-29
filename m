Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF20C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSj+J4LUlheVRHvN9LiVCZcJmVMJFIe/vWRg2i8gEBs=; b=yoS5PLw8oRfRBsBY0nB5yk8EdM
	AJlXThX6EAmrSb7HCnpQHBINtm9Z5qRGGUVVLyM2f5qc4tI/lB7XTzWe6JzJ1559VpN7ihbV+Ab/3
	JNYzK5ZQrcLD29ihmpjs/52aWI0uaKXz+62pPnDp9i1uqR63gWByc7PIDVow2dgKLntIyYCaH1p4g
	Wn5Aux6Hujmo6JfVT3PymoUue1emfVIEpA/eVW4H1apzwqTxzXPHo2pZAL0ocysqvZaSDgsKPr/V+
	2mbXRxuqHJxkhGh3fSAIkHAhMCLnbCECWUCBWWqiE72gDue+PKzv/a0SmV8nwupyjE1g1oe6BAaTf
	BjiWZYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8OCO-008zA9-1o;
	Wed, 29 Nov 2023 17:18:08 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8OCL-008z9C-18;
	Wed, 29 Nov 2023 17:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701278286; x=1732814286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=185ZvfFqRVD2szICsAQ0eMSsZWL3PXBLr3ZpOvwJGm4=;
  b=R/EFnCioxDK/tvM9iRxCnAaI0LwM+dRyXcsKua6UV1aoznyjqM+Y+nPJ
   QL5TOVJDjEP+ghAe85UN5ClQERLIjAoyntCWqHtMG6xx7T4lp70LopJpG
   ZNv2Il4ricRx6IcKNWr+vy1Rn7QCQCaOyF9QkjVSG2NT04FY+PUG7iHhT
   v7YZCzB9mPXBj1M5MnyZLZEnUZSxDvKDYGMpLrq2XINhkfkUgffF0Z1dF
   zy1NC/HWlrQUUwAivx0db4lAAv6F1q2eEi3tjEkQMPFWieVAvZCs12NOi
   hq7RglTsKXBHe/41n4rmS7arnpipr0yNjdG6CygwuLIkbk6Zwuh1s9Xry
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11896965"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="11896965"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 09:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912914094"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912914094"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 09:17:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8OC2-00000000VEs-1I2z;
	Wed, 29 Nov 2023 19:17:46 +0200
Date: Wed, 29 Nov 2023 19:17:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
Message-ID: <ZWdyOc3pCoNihDtD@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
 <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com>
 <ZWduPKmBWkaIdLhi@smile.fi.intel.com>
 <CAOMZO5C_dhvx70nk1HOSZdw8hMMmED69tdsXgydXdpnxHTJ58Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5C_dhvx70nk1HOSZdw8hMMmED69tdsXgydXdpnxHTJ58Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_091805_433900_33893F8D 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 29, 2023 at 02:08:38PM -0300, Fabio Estevam wrote:
> On Wed, Nov 29, 2023 at 2:01 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > It's explained in the first paragraph in the cover letter. Do you
> > want to copy this into each commit message?
> 
> Yes, much better to have the information into each commit message.

Here it would be like
"Because other members will be removed to avoid duplication and
desynchronisation of the generic pin group description."

Linus, what do you think about this?

-- 
With Best Regards,
Andy Shevchenko



