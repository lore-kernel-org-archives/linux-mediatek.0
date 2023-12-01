Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6D6C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPqiUiPCPNPhwMLzEhzzorYJqCCUbvNbmn1BqKTadRY=; b=35Yw/9ahtXK/qMDRT17j7FlOPr
	DrSX/H74b70L6MPYxwTrZVr74y0vUARaNXiiS6crRNXZXLbUIiIPFyQkLY4Aye+pbPrQPbGOLnQgC
	nXcsackUrHP42aM+Z4K5suV6Z60/rjf6DFXEuQk83obXdmLO+sWh19cSREgoaSR81hBzEHmv4KfAJ
	OY3037gjRQkDQ35Kry1YzvR7KYlNiM3BxgnyDobXdJb6KntMqKo4tLwbjt/SiwaSopszopS5NF4Cn
	KBL2uxDGMq8EM8Vjk9KM7pKcc0DCdWhU2NUxyAtV9aCsIpRKILrY393ilgCuHoPyENp30Peh8eVd8
	OFsdxBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r94NK-00Durw-0H;
	Fri, 01 Dec 2023 14:20:14 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r94NG-00Dur5-1N;
	Fri, 01 Dec 2023 14:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701440410; x=1732976410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Nohkkl4s3y6AfXGiwW4EpCBCQ1susQG/vrKsFqWPPH0=;
  b=kXXy48D5wT5Dgt5+XNtSlI5nFgFeBVD8BhZWiBh9NSMjAr9Wl6LyIOGk
   OF+ofjYKOMexlsBMEK4vREjcBdApNIqiwL/vSTs0vJkRBd2wcSpvVSIt0
   Q3FLHDMAr27+J6VNvkgzxMvsCO10biqsmTaC1U6wvFCHZE1eBwKI+iLa8
   WT5okDo2NEQEemfRUXTD4/pZ1FPZYvyyM8J4an8pJ0Do9+jn8OszHGPFB
   opAVr6Vv27D9b3QhLkYijeLyCpxDiOz+zKksojD/qvb5bj2rAWgemuzuh
   5JABVHxKsyAAhl8L5umCBhjxYwV3XlTwcO6ts5dblMozFlBCOt7ZDdGJD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="378535810"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="378535810"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 06:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="1101323341"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="1101323341"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 06:19:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r94Mz-000000010dH-0tMb;
	Fri, 01 Dec 2023 16:19:53 +0200
Date: Fri, 1 Dec 2023 16:19:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
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
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use
 struct pingroup
Message-ID: <ZWnriFqDsEEE1vlJ@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZAriTP3iOgmwvoAH-3-aO_ugoEkBHE7mHH5YLxhMXSXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZAriTP3iOgmwvoAH-3-aO_ugoEkBHE7mHH5YLxhMXSXg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_062010_513260_7D008E26 
X-CRM114-Status: GOOD (  11.45  )
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

On Fri, Dec 01, 2023 at 03:05:30PM +0100, Linus Walleij wrote:
> On Wed, Nov 29, 2023 at 5:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> I applied the series to devel so we get some rotation in linux-next,
> augmenting the relevant commit messages as discussed!

Thank you very much and have a good weekend!

-- 
With Best Regards,
Andy Shevchenko



