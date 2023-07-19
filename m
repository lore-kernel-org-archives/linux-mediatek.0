Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE873EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lI/94qfzuzKRHrdkGIwDiN5uszp+7IfUFtp23EtylMo=; b=jZP9abuUiMTyDFEfMerXUxbHut
	NIm++/9JKAZr5Ii+SUV+lSRabDTWI3kbuKGBmJnFlqAjkVM2Duoiaks7VOCMaHVrMcpP1Uz//KQOu
	6sUPNH2rZwp59YUbaRC/FD4LKhzBovR8mVHVeArASgYR1R4osk8SvmAIuDSQkUrfcy2gG0+zowigZ
	VF2fwtV0QDVFvbkMU1qAvfCnWVnoYqq9fwYZJo0XBlQOI6x0HctCxCp9XWfRjMwEjcblTMHANfULk
	KQIz974745qQdHdGLyp31x39vcttf92aLdpQKXIpLY9WhYc4kmsO8VIMYtkT3tsxpevUEY2Ga+nVh
	oHHNy5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4Z2-006jC9-21;
	Wed, 19 Jul 2023 10:37:48 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4Yy-006j9y-0Z;
	Wed, 19 Jul 2023 10:37:46 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R5XJM4DzNz6J6X0;
	Wed, 19 Jul 2023 18:34:59 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 19 Jul
 2023 11:37:32 +0100
Date: Wed, 19 Jul 2023 11:37:31 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij
	<linus.walleij@linaro.org>, Balsam CHIHI <bchihi@baylibre.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <thierry.reding@gmail.com>, Paul Cercueil
	<paul@crapouillou.net>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>, Andrew Lunn
	<andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "Len
 Brown" <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>, Sean Wang
	<sean.wang@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Ludovic
 Desroches" <ludovic.desroches@microchip.com>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 04/10] pinctrl: intel: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <20230719113731.00007248@Huawei.com>
In-Reply-To: <ZLaZWcyJAnQMK87f@smile.fi.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
	<20230718110451.00001227@Huawei.com>
	<ZLaZWcyJAnQMK87f@smile.fi.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_033744_624655_9603CC3E 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, 18 Jul 2023 16:53:29 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Jul 18, 2023 at 11:04:51AM +0100, Jonathan Cameron wrote:
> > On Mon, 17 Jul 2023 20:28:15 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> 
> ...
> 
> > >  EXPORT_SYMBOL_GPL(intel_pinctrl_resume_noirq);  
> > 
> > Can you check if this is successfully removed?  I think it won't be.
> > Not immediately obvious how to tidy that up given these are used
> > in a macro called from lots of drivers.  
> 
> That's what Paul noticed I think with his proposal to export only the ops
> variable and make these to be static.
> 
> > Maybe just leaving the ifdef is best we can do here.  
> 
> See above.
> 
Ah. I noticed it was a macro, but not that all it did was
set the name of the resulting structure (so thought you couldn't
use the export approach).

Indeed that's the best option here

Jonathan



