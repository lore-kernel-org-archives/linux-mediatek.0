Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13308C61D97
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdag5RPl50dBLLPLFaCdiRv/n2nMzCf00U+BzmXFr4Q=; b=LDeb+goHMkJNXxQ1Lc4x32Qi9j
	91u+M1I0ktShOTcj8uuV1RrnFY4h4OFAAwl9uHjjDjN3r4G7Vv9VXxdyC9SdqVpTdFgoerWXMCoEc
	7LlsIkmOJ71NhrLP0OEbIjjQHlcKdpxcBC2mbWOG3qWWAGg/FCm5M4l6RZ2Gz6vauOhbWKU8xzPLg
	YgBTlq3caaxiLh6AnIgJ2x3PfF2MxI9kAcfXXvTVDMKJJTdrHb+vplbl6xTmhNGUl5HLXTgKwVqc2
	CCLZdagIYz68yUGNLzUdaaw88rJzfFAX3dizDuJqzEvjkQRV88BY3HMd24yr/oX+6B4C3BZ1OShUO
	NhBqs5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CGh-005G4x-2b;
	Thu, 23 Nov 2023 16:09:31 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CGe-005G2f-1a;
	Thu, 23 Nov 2023 16:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700755768; x=1732291768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fI5I6aNI+wBDXkBFPmA1tH6IH8G5H7oF7TFedUg2UCA=;
  b=eYr/ED0gFW4kDsUQ0OAwAr/4rW2NDYvKOX2Hd6oHxdvXJxi9I7SRfDHk
   9upS/cE4C73iEnUOfBo5OzGg9LRzLYZdl2dr2cmACNXdvBRQBODJnu5ul
   fnyyNqHYE61hwErJd/3Z3LqhRsJsFnuHMFL5VBaLf27lw1XmiAk+sho5U
   x4G7oyrhgV2KIAEBC1HrHHCqXI/xgz6T23YYWmUeD8Oe5nGhXJlb0DAT8
   YM9mgzw9E4MTCaRhr3NbM1BVuxKxD0+7sFM6sU4kEWgB8b+yM1RWx23j3
   pyI8rMeq34ZwF9naEoBISCS2qFZpEKqt+7dlv+Xmr2IWc81OiDqwpaBuA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423422209"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="423422209"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 08:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771023284"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="771023284"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 08:09:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6CGL-0000000GPTF-1VsT;
	Thu, 23 Nov 2023 18:09:09 +0200
Date: Thu, 23 Nov 2023 18:09:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
	Hal Feng <hal.feng@starfivetech.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH v1 00/17] pinctrl: Convert struct group_desc to use
 struct pingroup
Message-ID: <ZV95JewcPbh_eKYh@smile.fi.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
 <ZV8zQZyT4Kwom-m_@probook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV8zQZyT4Kwom-m_@probook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_080928_560207_7868B755 
X-CRM114-Status: GOOD (  20.38  )
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

On Thu, Nov 23, 2023 at 12:10:57PM +0100, J. Neuschäfer wrote:
> On Wed, Nov 22, 2023 at 06:35:32PM +0200, Andy Shevchenko wrote:
> > The struct group_desc has a lot of duplication with struct pingroup.
> > Deduplicate that by embeddind the latter in the former and convert
> > users.
> 
> It is strange to me that struct pingroup was introduced without any
> reference to the pre-existing struct group_desc, but it's good to see
> them unified at last.

Yep!

> Even better might be to move the definitions next to each other in the
> same file, so that anyone who finds one, also finds the other.

group_desc is a private to pin control generic implementation, pingroup is
generic for any pin control driver. Their current split is a right thing
to do, so no action required in this sense.

Thank you for review!

> > Linus, assuming everything is fine, I can push this to my tree.
> > Or you can apply it (assumming all CIs and people are happy with
> > the series).
> > 
> > NB. This series contains previously sent patches for Qualcomm and
> > Nuovoton. Here the updated version for Qualcomm that splits previous
> > patch to two and fixes compilation warnings.
> > 
> > NB. The function_desc is in plan to follow the similar deduplication.

-- 
With Best Regards,
Andy Shevchenko



