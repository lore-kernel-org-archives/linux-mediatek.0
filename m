Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA33C10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/gKBDwqQgafoTliSVEVRhvLsMUHiQefkd1Ccr/C0zM=; b=vyt6TB+ZB/vVPikkwbuDVZVvoJ
	eMSyhNH+55H08+oId2mJZMr6kbggPhVCfoKjyOL2ZXX2AG1xYpN7wrGvs539gc+7/Hg7AmFeCfRRN
	VGLYPLNCvNW4vZsCc0KVrhrml2vpmzmdbvadHODV5H2Z5/5odNwMgWsabRjZhnZhZ+b5PbyjWc1OA
	vzRxKmsO4LkuW+ylpsLWFFxyqdaIpHOY++QfeUX3vdwoq/1LHzJUzRTtfBmXTmxv2wuIy4fFYEuJX
	30y75UzKPTjzrEoe12BZHT9tfYzxf4GnciosRD4TCRRKKZ2bMQ83U3Ggf3zH7XNNXngVcmToCxw22
	RqDgD7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAGX-004qS4-2r;
	Mon, 04 Dec 2023 14:49:45 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAGT-004qPl-1w;
	Mon, 04 Dec 2023 14:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701701382; x=1733237382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OyK5xaD2gXFqzuWV1aJ86M25ufVghrDbW/job7rkqCU=;
  b=ESVI8+z4wEHXxi9MnCJR/5i/texdIXY4Ac5AAzK2HfeE2VR7dxHvV+JK
   mxmu5pCp/o5bEDtwydmAwKtLZvKwcCXXxxkZ04ngV+9QN847byb0i/zB/
   +EGn2CwhOe61YzzBs3ysAZp9N4mftj1nQb3s0wYgcVA28Spd/SK4EKqMq
   2L5/27I/gZ7UV29s32/Ht7UOj8lanbUf134+ikkmf5K72+rfk9o8tH/BP
   eKPBLT6gQSNULDXE7Osiikr460yELs8DmbbrwW1tLe6Tc43W8s0CI0k6P
   mWyyeSDFigJt+qCPnJEkxreplD0+ULmqR7zOZ6jW/EjYFDgbjWIgQxqTQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="591899"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="591899"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841075936"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="841075936"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:49:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rAAGG-00000001mUw-3BG5;
	Mon, 04 Dec 2023 16:49:28 +0200
Date: Mon, 4 Dec 2023 16:49:28 +0200
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
Message-ID: <ZW3m-KDhs39i0E5n@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_064941_827906_FBA5BD3D 
X-CRM114-Status: GOOD (  15.90  )
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

On Mon, Dec 04, 2023 at 03:38:43PM +0100, Linus Walleij wrote:
> Hi Andy,
> 
> due to compile errors on arm32 and arm64 I had to drop most of the
> patches again but I kept the preparatory patches so your
> patch stack don't need to be so deep.

Thank you!

...

> >   pinctrl: core: Make pins const unsigned int pointer in struct
> >     group_desc
> >   pinctrl: equilibrium: Convert to use struct pingroup
> >   pinctrl: keembay: Convert to use struct pingroup
> >   pinctrl: nuvoton: Convert to use struct pingroup and
> >     PINCTRL_PINGROUP()

Hmm... Why these to be dropped?

> >   pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
> >   pinctrl: ingenic: Make use of PINCTRL_GROUP_DESC()
> >   pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
> >   pinctrl: core: Embed struct pingroup into struct group_desc
> >   pinctrl: bcm: Convert to use grp member
> >   pinctrl: equilibrium: Convert to use grp member
> >   pinctrl: imx: Convert to use grp member
> >   pinctrl: ingenic: Convert to use grp member
> >   pinctrl: keembay: Convert to use grp member
> >   pinctrl: mediatek: Convert to use grp member
> >   pinctrl: renesas: Convert to use grp member
> >   pinctrl: starfive: Convert to use grp member
> >   pinctrl: core: Remove unused members from struct group_desc
> 
> I dropped these (because they all cross-depend...)

-- 
With Best Regards,
Andy Shevchenko



