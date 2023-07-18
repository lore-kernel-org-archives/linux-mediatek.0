Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F58EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVSJ+GUtgjM/9lYbCvuJW6/WEZea92X8iN9RA0/Xmkc=; b=1WeI5n5wRlqobnQPicdcrTx8Qy
	6KG/jMbCtaRwpNLr9//q/6WZfyAQlM5YYwDpu4u9GSGxt5qCtGJvpk0gdyQ/yHZFd18Z4MV/J3Kfv
	tmSxl9KiZyADfUsMlTOiDH7xiF+mLxi4rUdECMVqdWd4dkthyhtA3xrtK/VPTajuIQ/uOaEyOO3ry
	B0Uas8jLUPgbba3EXJpvD3djhZqtP1EXcLOHtEAKJs8DwWyLEBz834ZHyjkMn/HRwz2YURj5ZEvI8
	l5kgcNKi7Z8sv845o6ymqlyUS1Y4TTh1O6AcEi/7Bzc/G48MfDV8q7mP4+S9cJtWfbJ1WTnxuuvNG
	Mx/KmswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzuW-005N0W-0d;
	Wed, 19 Jul 2023 05:39:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzuU-005Mzy-2X;
	Wed, 19 Jul 2023 05:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cVSJ+GUtgjM/9lYbCvuJW6/WEZea92X8iN9RA0/Xmkc=; b=d8i9tHtzB8hgYOez+3awxgv8vu
	XUE//q5qnKCcRjhWEZLamcmqwSV34INx3ZAdWxtP8CNONowyjO1ExQcHQOF5ebDdMU/jGAqPFCIOV
	sEsocjLr+btA+cnxvpJWDeqSFo279LvwABeTJdv3MokYvdu8tzaV9M07MkR1lfAFvnWhJVGWAgNsa
	KXv8U4Y8KxxdEvjM1TCC8qgO2WuBQScjZcnOX/5xUhAI6bGnZq5XgszqbEvSc6alWfDWXnxBexbKk
	C5rH1lOpdpn1Tl36VgYMy4UpW0a2V/8EQcDm2t2ILOef2UIgJItoL8Nt/j22glaPMQ69iZW718rNT
	egUiHHtg==;
Received: from mga04.intel.com ([192.55.52.120])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLl6o-00BaZf-1A;
	Tue, 18 Jul 2023 13:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689688282; x=1721224282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z280C0QnfRU4Fge1sZLeOEz0ioQaTHytM42PyAGyTZA=;
  b=NKh1wzEuKCsey+xNgnKfcMyivWWc9wIXaqqRLuwlHZn8hHjvQMWdfrs7
   zIOeyaTc/qPzS0b+3wWG6u/QpDtAOZzSjX7QXiUale5DcU7rdO1DG+VcI
   CJV8N9oURtzjAO5RCCxRX7g6D5f58kXMhrXhbEB5xqzRpj5YOSau/b0Dv
   HAx98noIZOfKT17mizofnQtZMLd10EnnIXcDDbLD1NbVJHkS0dhTNTSYO
   dVy1US5QeKmG7LsLbwV45zqo8jmiE/bUVan2kebjI8jTthf4bebNJqMqs
   z9KZrur8v0KnVyVzLsTfwT1aX+VnotI5TJBW8Jh4BljraLGTFRmtcfAP6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365087315"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="365087315"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 06:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="700903622"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="700903622"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 06:50:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qLl6A-00Fp8w-0P;
	Tue, 18 Jul 2023 16:50:42 +0300
Date: Tue, 18 Jul 2023 16:50:41 +0300
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
Subject: Re: [PATCH v2 02/10] pinctrl: baytrail: Make use of pm_ptr()
Message-ID: <ZLaYsdwnqj1ef3o6@smile.fi.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-3-andriy.shevchenko@linux.intel.com>
 <20230718105322.000074ca@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718105322.000074ca@Huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145122_939690_4E1A325B 
X-CRM114-Status: GOOD (  14.92  )
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

On Tue, Jul 18, 2023 at 10:53:22AM +0100, Jonathan Cameron wrote:
> On Mon, 17 Jul 2023 20:28:13 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Cleaning up the driver to use pm_ptr() and *_PM_OPS() macros that
> > make it simpler and allows the compiler to remove those functions
> > if built without CONFIG_PM and CONFIG_PM_SLEEP support.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> LGTM but why is it in a set that claims to be about NOIRQ PM helper?

Have you chance to read a cover letter? I explained that I added them as
they are "kinda" to the topic (PM related).

I can apply them and drop for next version.

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko



