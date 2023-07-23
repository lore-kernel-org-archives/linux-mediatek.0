Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59561C001DC
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jul 2023 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sqXcPDWv+O+jfVeXiPd/H8D+JnGD9FSBKovJI0XLCI=; b=Wf2WHEUvPFvDsxsSkpEspNkNVL
	bMMi6mpiOKDt/DWgt3r6FMAwfAoe1cPlp15BtGl5I0m4mwnujDCZ+I+rfAYTAnEuVDc5/ERA5HKDh
	CJ3oI/AUfwWOXqg8HyGX9kxZLg0O947mkYtxiZzujEkIhmHXUwxcvJlvlu90hT+WfR4uamj+uPdBS
	kO+RxJjsAfDAMiGkW9zxyECQqxUpDMj1AbklG86X4MJT3rN9NUvz4GQYmG/5U6vEZA+EgRYfwNwUz
	mR8PnZYseXCXKS8C6+euRPEpePpdjfcF3JXcgdVVQfcxl6c2rowNgAg6HMgNi/na2MTFadxn90m7n
	ZGfc6akQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNfcu-001nUz-09;
	Sun, 23 Jul 2023 20:24:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNfcr-001nTw-0e;
	Sun, 23 Jul 2023 20:24:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 440A460E98;
	Sun, 23 Jul 2023 20:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F886C433C8;
	Sun, 23 Jul 2023 20:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690143858;
	bh=f8gObTjVO0ERFlmH3AL/oRX017qbf1NfDe3+e3e3X1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B76f5Ogiw5r+ZSnn4N6mc/puCTJCuYQEDJq+DYeWnOLidGSnc2Z3RuO09pWNEQr1U
	 Od6xSr7PB9qQJpENwyCDWgQoWieE1x/9iuwMHvintNhJNDiDHIBgJjiw0y3heGLGAz
	 ToLj2vuYb8J5kojRYF+IiLsOibiE0TqgEezapcRPeUYNXL4H8s8LbhGbTqDS7Mdpy/
	 ZHdCddNFbNRTd1oKGuURq7TGolqT0n6yW5wZxXyVDpk96AdYFygUEBwlCiy5nlTCPa
	 IlT+q75wKR3lodezANXotV8ujPgcIYuAyYzqQqA/WxEmzxDiDh3KEJiPJ+m3xc5Zvc
	 k7Pv54rli/baA==
Message-ID: <87dfe310-520d-b3d7-a3ff-2bf5a19f9155@kernel.org>
Date: Mon, 24 Jul 2023 05:24:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] devfreq: imx: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20230714174425.4054393-1-robh@kernel.org>
From: Chanwoo Choi <chanwoo@kernel.org>
In-Reply-To: <20230714174425.4054393-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_132421_351733_2311AB3F 
X-CRM114-Status: GOOD (  20.03  )
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

On 23. 7. 15. 02:44, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/devfreq/imx-bus.c         | 2 +-
>  drivers/devfreq/imx8m-ddrc.c      | 2 +-
>  drivers/devfreq/mtk-cci-devfreq.c | 1 -
>  drivers/devfreq/tegra30-devfreq.c | 2 +-
>  4 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index a727067980fb..86850b7dea09 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -7,7 +7,7 @@
>  #include <linux/devfreq.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/pm_opp.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index 16636973eb10..e1348490c8aa 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -3,9 +3,9 @@
>   * Copyright 2019 NXP
>   */
>  
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/devfreq.h>
>  #include <linux/pm_opp.h>
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
> index 6354622eda65..83a73f0ccd80 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -8,7 +8,6 @@
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 503376b894b6..4a4f0106ab9d 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -13,7 +13,7 @@
>  #include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/reset.h>

Looks good to me.
But, need to change the patch title with 'PM / ' prefix 
to keep the consistency of previous devfreq patch and then
this patch touched the other devfreq drivers except for imx drivers.

So that I think that it is better to change the patch title as following
and then applied it. Thanks.
- "PM / devfreq: Explicitly include correct DT includes"

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi


