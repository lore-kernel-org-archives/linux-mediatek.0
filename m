Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khent0y+NM5jEH+iBgVxGBfd7cpG4skGg1A7Cj7+c90=; b=f8mOLlXo8oAgjU
	C/T21aniy7B9Ntw6keMnUHF8nZivlOKUdSC2E4sG0DaI/n11TGNX2u8l+GOA5rI1dZWK30zRpiZPa
	rSnTw41n8W/YslckyP7Q81ICHB4B9tEM10+f2qort0N+vmxcvrmbMOQlcTwSdJ5h8CvQvqhoUWaXs
	GIT9Gjn+9aPNmIvzyjqNzAnjXqpznjDsq5t6AFWN7U0SYZB9xRFpXC1hXHRQH5tTg76eUav4HHtaZ
	T6Vv/jKwToY1pmM72khlGs0pSKWFyRMQFeMrJSFZG2ON3S+S+Z/vMzayDT5Co4zSENo2Em8O1LRWk
	aU3E2WDt7u91Igq5i/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAXwj-00BoBv-TC; Thu, 20 Jan 2022 13:57:49 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAXwh-00BoAy-FD; Thu, 20 Jan 2022 13:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642687067; x=1674223067;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MtPKbTXvTh6ak1y3SGppvN/XkoH+ghr8tdmxMpz+yQ4=;
 b=f4p7cvSzKSFI5FsMFB6Lw2SzWs6yqOZ5xbtk5qJNoPiwxC9f//m0WH3K
 AKrfwtGhNrB2o49Hv8BShdnRv6lfESSB/woybHrRRy9/ForAHTBS26wuW
 kThq0lii9EQpRo1Z9BnqfIcGdxFjI+oxwXZzsEF5Su98a3X8LAZV6W5PB
 J6pg4o2x3PubTz9Xxfc8fLC1gkybRQn5VYSYUO5t3pHKD1VcByMlLLoyI
 zFgi6BtQ5M80wRuv5ALM77o5rvAIkdQ0835N3OAw3riTh5dWhJGWEBHtV
 qej7s7TgaAFQRuPl6zyHrglSzlbWN7W38ZhIkwWzaf/ARCiikKLzhry60 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="331705440"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="331705440"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 05:57:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="477793978"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 05:57:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAXvS-00CWgc-Kv; Thu, 20 Jan 2022 15:56:30 +0200
Date: Thu, 20 Jan 2022 15:56:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lucas Stach <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 angelogioacchino.delregno@collabora.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>
Subject: Re: [PATCH v4 3/3] mmc: mediatek: add support for SDIO eint IRQ
Message-ID: <YelqDifksEmtMv44@smile.fi.intel.com>
References: <20220119103212.13158-1-axe.yang@mediatek.com>
 <20220119103212.13158-4-axe.yang@mediatek.com>
 <Yehq7L36yfJ8D/j2@smile.fi.intel.com>
 <0b6ef0ce05bb92cd458043be2441101e20166242.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b6ef0ce05bb92cd458043be2441101e20166242.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_055747_555732_0A578332 
X-CRM114-Status: GOOD (  18.67  )
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

On Thu, Jan 20, 2022 at 01:34:08PM +0800, Axe Yang wrote:
> On Wed, 2022-01-19 at 21:47 +0200, Andy Shevchenko wrote:
> > On Wed, Jan 19, 2022 at 06:32:12PM +0800, Axe Yang wrote:

...

> > > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > 
> > The submitters SoB must be last among all SoB tags. Please, read
> > Submitting
> > Patches document carefully.
> > 
> > > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> > 
> > Who is they, why their SoB appeared here?
> 
> Yong Mao is the co-developer of this patch, I will reorder the SoB
> chains.

And you will need to add a corresponding tag.

...

> > > - * Copyright (c) 2014-2015 MediaTek Inc.
> > > + * Copyright (c) 2022 MediaTek Inc.
> > 
> > This doesn't feel right. Why did you remove old years?
> 
> I should keep the publish year 2014 of this driver.
> But I still think range 2014-2022 is the most appropriate way to change
> the copyright time. Over these years, mediatek is keeping maintaining
> this driver continuously. What do you think?

I guess I already showed my opinion on the topic? The common sense tells
me that it should be as simple as '2014-2015,2022' there.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
