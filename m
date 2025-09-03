Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC21CA0FF2
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHZN4q7ULscnLBVN5oyiAwBFdj4bB2ZTF7RZxwdQl7g=; b=Vcah6pZ8bdfm+R7KEhRvOqajkv
	O8oEzoOn4L1EhKjbpOgcmVP99hs0DmOXrqfEpNQUAWYFBZ+x2wMnacnxm7kOyLFNFSx/O9Xhn6APg
	w5K4nPtcar0m7/NUMSaJzRCuqbbg0rPQ2z3sMg3DvjWvarl78lPcs3SgEAa93qpmCtPsVzjD4F5zi
	sEJbBU5iYAXqnvNlJ42otj3ztMMcCxeTQqXuogO3xqKzioMgy+UgIiLVEmONLNuNz03OFkJIgmIHv
	QF0zTgEEChMfRrs1G10Tq8e63IoXHCMSQ5A5pMUGuC6GWTMpS3uI8eF10YN1k3Ho2yUiGuZfU5wJ3
	3jlXhzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmvp-00000006SLO-2GYH;
	Wed, 03 Sep 2025 12:49:45 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm2E-00000006HeF-0xB9;
	Wed, 03 Sep 2025 11:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756900338; x=1788436338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rCkMsvnUjuBn7HONdhIgvsPhXdCF7ZF1EijdEX8RKxc=;
  b=kKny0KDGjeWU6AUNiIgDwk82a849XrXLFERs7ASz2e3leJApksTDR90g
   WwUNd2l5X5wj/LPeYwqG23/tmTmLJZ0dc40Sx78F5TvUQRFS0fDK8fGhH
   r48wWp8UqXymF4xEnUkgneo2wXvhbfVEozq+l5zfCxVNJAYZpq/43FEM1
   aUD1AEDPRzBTXsDCwo6A7QDFR1eYUK0Yrtu25eQqfpTvAmgrwsEac6JIW
   uo1x4I1SBcNSnjw0WAZMEVhChLkVfdKHyapK6Jvv931o6ETC6pZupB0In
   QzWiE+cy+LScvIKKamERBPVwLAuzpn108fw2ngEBCbPIwAqkYPnCWxBnf
   A==;
X-CSE-ConnectionGUID: vXLf7T+0RGK6aToVLR5hwA==
X-CSE-MsgGUID: rxW5JvCsSXq26ixDnriE8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63043878"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63043878"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:52:17 -0700
X-CSE-ConnectionGUID: LSXzFaryTGiV559A8n4EkQ==
X-CSE-MsgGUID: vvcyrhQPS3KYbuchLY9f0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="176849676"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:52:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utm1v-0000000AyQf-39cY;
	Wed, 03 Sep 2025 14:51:59 +0300
Date: Wed, 3 Sep 2025 14:51:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
Message-ID: <aLgr30rvGBCcsOWa@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_045218_302518_9C44F98E 
X-CRM114-Status: GOOD (  22.95  )
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

On Wed, Sep 03, 2025 at 12:18:18AM +0200, Linus Walleij wrote:
> On Tue, Sep 2, 2025 at 1:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> > other platforms as well) where we mux a pin to "gpio" function using the
> > `pinctrl-X` property in order to configure bias or drive-strength and
> > then access it using the gpiod API. This makes it impossible to mark the
> > pin controller module as "strict".
> >
> > This series proposes to introduce a concept of a sub-category of
> > pinfunctions: GPIO functions where the above is not true and the pin
> > muxed as a GPIO can still be accessed via the GPIO consumer API even for
> > strict pinmuxers.
> 
> This is what I want for pin control, and fixes an ages old issue
> that pin control has no intrinsic awareness of if a pin is muxed
> to a function providing GPIO.
> So patches applied!

No objections, let's move on.

> Any remaining code nitpicks can be fixed in-tree, I need this
> to be able to apply the much desired Broadcom STB driver,
> so this needs to go into -next now for cooking.
> 
> I also want to strictify some drivers using this, bringing GPIO
> function awareness into them, which is a good thing!

Well said!

-- 
With Best Regards,
Andy Shevchenko



