Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77695CA100E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/e8OrCn7tyJZ6JB9iUKgm7HoNe0cFN9wyIlu1mO1DA=; b=XrWkj8gjBS1jm03LHlA7YLXUql
	UDxZS9DJTWy1ya/hHDey2u8CUJwMAjkxfF8FsYPqtlcZtN3+Mg7ioLnlR4PjSuwpamUv2Yx1QXv/M
	rtAKEYTcN0kgo9nxuyqZvAYajkeUuPpWXxnyNn5qLjr2GEO43xxY7Vh6NKbmCw0aegnixlUK8AtU4
	BgN0/QWz5DeuGNnkgcLi5N9q3z4t7Ph9barfC28oZwtCe2J6/k7sr5heAbcz0l6ZgdrUoYseRb4a+
	dQqXhBozvdZ8/jGwiV7Ovd0GaypZ+lozZCgq9oYanMrL4WrnWjNptw9TnDkFXOfoMmXz0Jsax+Uf+
	q2tJV2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNd-00000001ZAr-2dEh;
	Tue, 02 Sep 2025 19:09:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQii-0000000HWHj-3w5m;
	Tue, 02 Sep 2025 13:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818405; x=1788354405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=304mhcCsZ3DPW/ZeHF0UCdKTce70KODDh/J7W7FbB/E=;
  b=QpKW6+X4MRSSuP03/rAOknhuHGjeES7EQI4oWlaZWcih2vlftGjqGrkU
   T3C6dMqCNYdcKhEQnGCNYPVrfMZd0bkKkLOAlF6KfjUuOuG0IO/ij8u84
   iExXyOcxbtiCLHrCUnLqa6CXURWuzOzx9RQlc09VOFH51dL9yNL4SUQCr
   paYcRg+lRJapK2TZXMhHXPZkHLQd3AHnQcMAEmMShzSfCihpP0AN7S9iz
   S4PoQ0x93ljEkoJLLOvOKLMBgf+wf7VIHJdAgXowXKZoWyPC+iMf10SZb
   XOSTUFFbmbo2SjxM3jVN7klog1Z4dd8txPCcdzOajA287C+vjno8RAYX2
   w==;
X-CSE-ConnectionGUID: /Jg5kSB3SU+o9qZIGyiCIQ==
X-CSE-MsgGUID: mOYNdiPES7mS6QAUkjcJHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59028192"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59028192"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:06:39 -0700
X-CSE-ConnectionGUID: ahJv6su8QkCwIee8PybbEA==
X-CSE-MsgGUID: WBNgT/TJTkOlqIdmDhs4Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171432863"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:06:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utQiN-0000000AhP0-4600;
	Tue, 02 Sep 2025 16:06:23 +0300
Date: Tue, 2 Sep 2025 16:06:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
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
	stable@vger.kernel.org
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of
 pinmux_ops::get_function_name()
Message-ID: <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_060644_987506_334F7CF8 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> While the API contract in docs doesn't specify it explicitly,

So, why not to amend the doc at the same time?

> the generic implementation of the get_function_name() callback from struct
> pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> NULL. This is already checked in pinmux_check_ops() so add a similar
> check in pinmux_func_name_to_selector() instead of passing the returned
> pointer right down to strcmp() where the NULL can get dereferenced. This
> is normal operation when adding new pinfunctions.

Fixes?
Reported?
Closes?

...

>  	while (selector < nfuncs) {
>  		const char *fname = ops->get_function_name(pctldev, selector);
>  
> -		if (!strcmp(function, fname))
> +		if (fname && !strcmp(function, fname))
>  			return selector;

I would slightly refactor this:

		const char *fname;

		fname = ops->get_function_name(pctldev, selector);
		if (fname && !strcmp(function, fname))
			return selector;

>  		selector++;

-- 
With Best Regards,
Andy Shevchenko



