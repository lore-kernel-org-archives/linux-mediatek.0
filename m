Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F537C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7Z/1hd3gxAintNas8wkObhjpWpX1lIohXHvI5SO3Sw=; b=qUYXWz5HZGthEJ
	7t+8aklWTNtxtR6LbMDcyjlA9XKDhvfY30yt+iRV2bv1u4MS94e3yEmH/8ZtR9P0lCSFB/wbSge4f
	ME2yMSxuVPYlPO5E5rFrEp0UCsIW7HL8DDH2BVqvL6754OCeAuOUM6N4Tf+HHmt+VoAwDWTyPDB2W
	zxirkn0NTWq0BfFdPe8xIReqPrPhfeCWrLpCs0qv/GHiRaVIYZxOhI//555HIrIgv4IcfWid4CziD
	xDIStHJnjWhCdeGyq5dk/FkTM+hjcJbbTf+BTJV/7u4ST+4z7TtPhTlU7/898AzlE7cLFR5Y74ZNs
	ZX5GYy2eUY4vY6hIC2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx80U-00EBzk-BK; Tue, 14 Dec 2021 13:38:14 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx80H-00EBw2-4e; Tue, 14 Dec 2021 13:38:02 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238788682"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="238788682"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 05:37:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="604284845"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 05:37:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mx7z9-0068is-01; Tue, 14 Dec 2021 15:36:51 +0200
Date: Tue, 14 Dec 2021 15:36:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Sean Wang <sean.wang@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Baruch Siach <baruch@tkos.co.il>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Gross <agross@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: Propagate firmware node from a parent
 device
Message-ID: <Ybid8lFy8aS1cTVI@smile.fi.intel.com>
References: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
 <20211214125855.33207-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211214125855.33207-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_053801_251319_789750F1 
X-CRM114-Status: GOOD (  13.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 14, 2021 at 02:58:55PM +0200, Andy Shevchenko wrote:
> When creating MFD platform devices the firmware node is left unset.
> This, in particular, prevents GPIO library to use it for different
> purposes. Propagate firmware node from the parent device and let
> GPIO library do the right thing.
> 
> While at it, slightly modify the headers to reflect the usage of APIs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed compilation bug (LKP), due to above reshuffle headers in the rest

...

> +#include <linux/mod_device_table.h>

He-h, updated code, updated bugs...

Linus, can you, please, apply the first patch if you have no objections, so I
won't spam a lot of people again with no changes beneath?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
