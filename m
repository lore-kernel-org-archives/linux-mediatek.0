Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCB9EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u67rW3CZx1RukpL4hju2ubMftSjW/WoGxi3f0+QwuI0=; b=fhYpdkbTWo3+4n96s6+OAObysT
	gdzqlrgXLrVwrK5Tro48rkxaEoZxArCAJW/6DJOEx/B3MRmc8fXE8YOBp4VHWjrfBZ9tAdsZDFFLu
	+5zUJmo4RqPUb67J7kRgKyOtHq4SmRhblbDrFObQFOjVU2Ey1lrBswBZkIxTrnCiQUWLCmi/dWlQ4
	1Rb/JhxFoTMLiSfEjjZJ5SNYYnWik3jfoQR+nT5/uF2msOFXNb3Js4SI2ZDlGpaMXkI993ywbbexs
	rlvgb3am8/A2oG22voT7mTnMVSu+Fu2t1R4C4/u8nAD1YTyc7SMKsblkgeRwuEFqyhwiRLs+KhgGm
	eRUhuDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzRc-005AJ5-0y;
	Wed, 19 Jul 2023 05:09:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzRa-005AIl-2P;
	Wed, 19 Jul 2023 05:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u67rW3CZx1RukpL4hju2ubMftSjW/WoGxi3f0+QwuI0=; b=frZqrCaemVQEC6+NdpNuopa0jJ
	q5s+0/3NVkfaZINjBz0JlJ4ziJrIa6a4E771whrh77vQazLQTqwsPxj0RTsTWjy4cNuyC/VQ1XG7o
	wxsko/7/T8Npg6vewBOmlE5gO/loduexTe47VcUZKm889da4wnZMsxKNa7KKsbg4gSU9uem4WoQcb
	QCNnmfBdjOjoflDtO6r3TK3U4gWfJs5n1OvFDkjQxOX9SaQWNTyr7yMymdB+gMoZM/axMFw5w7kNP
	uoJr7lTpZlqQcTDEUIEcwcjACRzfGdqxwchgTyaR2N3KWGwZl3hmpfkIGO5uHNuFbvZGDsSGS4iOE
	+GOrfCEg==;
Received: from mga12.intel.com ([192.55.52.136])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLl7t-00BacJ-0J;
	Tue, 18 Jul 2023 13:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689688349; x=1721224349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ek4HQDqASP1346ScIwRLDWKoFoS68Rokb5r5BxIupU=;
  b=RvKCJ97oohBr+7Z95y1rt2i4lsbXBmQEljgv8Q3SQo+93wj4thHhkBgU
   lFnxoDiNMiM1Khw3lJK7YVBbLDU/o/TUHA1x3PM7UUJ6bhyidaxYHqQ3d
   Q3KWrlb+1Od2qPhhM3s0xcMWc8WiWQ8mKGpo41NxnZSwzjnqOdIMIG8VS
   4a+dimaE0L6jxQRRjcYiSVQuUjpKlm5h1HMOOw28oblEou0Pmgr5w26Kb
   WbkgrQrWIpVzWXd1qPvdj1/9cVK6Ugr+bz3DMhSHUszTtbZf795Z8dJvX
   kJlyEDeN+WDFjps1xdGj7vB8TpDbgJA+JPZ9R33j2lXQ/3OD2Fcqu8NWo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345803141"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="345803141"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 06:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847707771"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="847707771"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 06:51:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qLl74-00FrDv-32;
	Tue, 18 Jul 2023 16:51:38 +0300
Date: Tue, 18 Jul 2023 16:51:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sean Wang <sean.wang@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 03/10] pinctrl: cherryview: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <ZLaY6vAahWPatEIV@smile.fi.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-4-andriy.shevchenko@linux.intel.com>
 <20230718105453.00004dc3@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718105453.00004dc3@Huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145229_979291_ECD5BC79 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 18, 2023 at 10:54:53AM +0100, Jonathan Cameron wrote:
> On Mon, 17 Jul 2023 20:28:14 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks!

...

> > + static DEFINE_NOIRQ_DEV_PM_OPS(chv_pinctrl_pm_ops, chv_pinctrl_suspend_noirq, chv_pinctrl_resume_noirq);
> 
> Very long line and readability not hurt by breaking it.

Sure.

-- 
With Best Regards,
Andy Shevchenko



