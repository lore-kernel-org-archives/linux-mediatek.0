Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDBDCA100E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 19:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFfgn169VvA80SefCI8IpUZ827vddRaFufexbdxmOro=; b=MXM6UhNwGOgF3FFkNKWot1MEQn
	XRzgEgrRDBLUpejcE/pyI/ec3Y/HYumHfeqHMJnYJkNSe9D8qqz9gTgwISl/Rw1w1rYsIsRFzRmGK
	C5Dx/3W7aM6bQXDF0UaG1XaaKQ2oAcevR13bbvN8pWji0i8OncnqybPwZXohpvHFf2/sWdR8BmhKz
	DTiDoGDjpUQwc22Sw7fYWxM7KcXrngZSDYVcNUQ/dSF/6uHwUvygVtAuPRM0E4Pf+7wR6ALHF4o/3
	BwaSHraJkWiNzOg70wH8WJMSuDeyKRvaYQ6HEBKkbZvQGtpsCFUILWtAq58S0HcJrue5lzHsb9FCZ
	/qxIDM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWR8-00000001eRB-2Lq1;
	Tue, 02 Sep 2025 19:12:58 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSvK-00000000fqf-0MY8;
	Tue, 02 Sep 2025 15:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756826874; x=1788362874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pxDRyV6r3uWk5lkkZlh4n7lncpUrSzOFA8awI6XQfUU=;
  b=g/zSCtEJpEzZkWgiqbx2BzDseK32syQUMaOJjmLrv3bEQWv4QWPDuZgy
   +uQQm1Lr7g5LO3Kq4ijFEUyHRcsuJgHBaoUp2b/l3yyny6zroVhdt9zVB
   mGCsBsIG+muxEI0LV/0sJ3RC+/nmzPsUWk8IlhMZyQoCHViHjnE7JJU8x
   h8q3S8ExHijw1WZp5orM3nmJGzd//IGD0SnClJMUUJt16lVxyRf64U0u4
   jiCkIykVzHTYS6pSe5jwKwdl+RvkZblWg6FyV3MQDwz6LsD2Ui1LB04ea
   G5rXHby/exF9mfDrFM1gFoTgBhYMPqOyxYc8u2gPoHZZwvgShDnUkhH2S
   A==;
X-CSE-ConnectionGUID: igkzSRfiRNS631nfW9GL4Q==
X-CSE-MsgGUID: 0D9DOc5MQb2PVhIUKdgAnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58965299"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58965299"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 08:27:52 -0700
X-CSE-ConnectionGUID: Mff6GxWfTJyq2rWNK/1oVw==
X-CSE-MsgGUID: caNsXPCtQ0WFMdHw7a+vaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170562537"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 08:27:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utSv1-0000000AjNy-1oS6;
	Tue, 02 Sep 2025 18:27:35 +0300
Date: Tue, 2 Sep 2025 18:27:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
Message-ID: <aLcM58IEH8hGYLnx@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
 <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
 <1034c70a-da67-4914-b23c-8d006b7611bf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1034c70a-da67-4914-b23c-8d006b7611bf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_082754_210869_675D3CE2 
X-CRM114-Status: GOOD (  17.07  )
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

On Tue, Sep 02, 2025 at 05:12:24PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 15:15, Andy Shevchenko wrote:
> > On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:

...

> >> +	for (i = 0; i < soc_data->nfunctions; i++) {
> >> +		func = &soc_data->functions[i];
> >> +
> >> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> >> +		if (ret < 0)
> > 
> > Why not simply
> > 
> > 		if (ret)
> 
> Because existing code is as readable?

I don't agree on this. And Bart explained why. So, it's an API requirement
after all.

> This is just some serious
> nitpicking which is not actually helping at all at v7.

Agree, this comment is a nit-pick which can be ignored at v7 stage.

-- 
With Best Regards,
Andy Shevchenko



