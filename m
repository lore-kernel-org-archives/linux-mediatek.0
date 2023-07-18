Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11B4EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKiYWZdsKxeZoIlWBn6AT0ci7mAfahJFtV+A7m2aWb4=; b=1viTxG3zCvitbyPq9pEiq6NgfK
	GgCYuD1Zub19gX8IJS+7Lb5Z7wc2rZEWKg4IVtPhcI4aHyerhCS6PnELX7tOcxZTTWn7v/oGA5LGY
	Rka6q4Q/art8QqX8DpY51MUZO9gnlYa5VgUXiG/vNbHPiwgiRk776YIkQ5QsqDon3fkPe7lKkqUXB
	9eM89SQkc83fvG636BzUtuTRLAhQw0qCXwrzUd6mla6nyYNJZ5DQMLmibFVR7VGcJ5PVvyXUbcIVt
	6xNGd29qRTKqrgW6bG/yQgj35Yyo9RG7tWjTXUoD/sYq+WyT5c0h1VLHtpf4TTxxy6P7vjjJqX09N
	Ht5PoWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Hf-005Wwb-23;
	Wed, 19 Jul 2023 06:03:35 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Hd-005Wvh-1q;
	Wed, 19 Jul 2023 06:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XKiYWZdsKxeZoIlWBn6AT0ci7mAfahJFtV+A7m2aWb4=; b=br71az7Qz5OHJ/uIkiqUQpOF4a
	1JAZ33ZSC5XjqCyBptDgBOgUiBDRFMbWs81DZVP/fhD/G09RfiED3cjXYZPx15lhub/inI6WaH/rl
	3UcL28rwC9dUZ307K3TqXTo13XtGLBYEhTQcciPlMcO1fkYP1JdC4vYZfPSOl+gZSdLBrR08Njmhm
	b0PgoRNKa5T0RBimh5Nse+HXtyLFoa8fl4p26fF0Ia6oC64FgfgEGxA/Q8OF8mq8+y8bYQqnMvbFZ
	K2Usyj57YFPiFm6cX2haXpHHkSSe8T3qPAXe9g2w7kCXJ8NnQ09cSS8AT8F0gudhFM8SPYQDkSf4t
	7sXxM4xg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhbq-00BOlc-1m;
	Tue, 18 Jul 2023 10:07:12 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4vdp31L5z6D8ZD;
	Tue, 18 Jul 2023 18:02:54 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 11:06:51 +0100
Date: Tue, 18 Jul 2023 11:06:50 +0100
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
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>, Andy Shevchenko
	<andy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Len Brown <len.brown@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
	Sean Wang <sean.wang@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>, Pavel Machek
	<pavel@ucw.cz>, "Matthias Brugger" <matthias.bgg@gmail.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 06/10] pinctrl: at91: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <20230718110650.00002f1c@Huawei.com>
In-Reply-To: <20230717172821.62827-7-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-7-andriy.shevchenko@linux.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_110710_789726_79D39374 
X-CRM114-Status: UNSURE (   5.51  )
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

On Mon, 17 Jul 2023 20:28:17 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

