Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195EDC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gs7Xo10Jt7OfMuw2uR29gE8uOV1atf7qNNss0U80ym0=; b=YSEdXiXgBAqmbTyL1qPIHUH7aR
	G4/z1bjWDHZmjrxxp3Bjh0RyJHrmptuTqjIWNKvvHjgu4cCM756TqlBbDe/U6ZOicwrWdgks36bNL
	SeuZ9V1h1y1l5cUdhU0kw1QGkqbUKJFraVtm67JVxo8zSxYZfx05wNPqieu51B3ngVDUrvOcGKmNi
	e3giAUKGS/rf6gcBwua+f0IohwtS9T4mzcqFQGXSYO49pVtZIsncU64l7D2hU7SRTboas4GwuC+a6
	WUyMJf6VgXhQizxj25vhqjsvhxUmPaIjGLsmde3/ihRMmQ5gD57lWyl0G+ZXvIIX+sE524cTdB5BE
	GwkJOFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2XF-003W9w-M7; Mon, 20 Feb 2023 09:32:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2Wy-003W80-Sv; Mon, 20 Feb 2023 09:32:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1475260CF5;
	Mon, 20 Feb 2023 09:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BB1C4339B;
	Mon, 20 Feb 2023 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676885538;
	bh=WP/C8hKVpvdrRvMRdROd3OdMlXuM01497fljMlMi13o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ne24zRzA9QCyMRSpjrif2y6f5rLPcC0ETThe1iYNjjAPHbITeX6qnCpTIr2gRpBkn
	 naztHHw2oEfx4t2zDq3yhKTbnS0Sg37tjoNdzIdlxq4jD39qyFFkH5z3alt1AO6paw
	 yTGE9rnUoKgvZ6swolAIHfOSiUV2kDoGxVkmESi4aqJt7EwX6xXguI1aAI1TdS66jK
	 seazaUZJ6ZHubyphkZ5IqmH3qhiinYEdlbPADku+RKCMy8yUjJAsPofF7dxPkfOJ5h
	 Px4s8Xh+WmsO3wo8T6F3qBcZ8BKpC4hJxE4K9EC9gxVZG9rBt5q1mC5veXVbW5+/Wh
	 VJjXz/e91+JSQ==
Date: Mon, 20 Feb 2023 15:02:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephen Zhang <starzhangzsd@gmail.com>
Cc: jejb@linux.ibm.com, artin.petersen@oracle.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, beanhuo@micron.com,
	bvanassche@acm.org, avri.altman@wdc.com,
	yoshihiro.shimoda.uh@renesas.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, zhangshida@kylinos.cn,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] scsi: ufs: Add select to CONFIG_PM in Kconfig
Message-ID: <20230220093210.GA27366@thinkpad>
References: <20230220083256.997470-1-zhangshida@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230220083256.997470-1-zhangshida@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_013220_996375_D3C2C4AD 
X-CRM114-Status: GOOD (  18.50  )
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

On Mon, Feb 20, 2023 at 04:32:56PM +0800, Stephen Zhang wrote:
> From: Shida Zhang <zhangshida@kylinos.cn>
> 
> From: Shida Zhang <zhangshida@kylinos.cn>
> 
> In a configuration with CONFIG_SCSI_UFS_MEDIATEK set to 'm' and
> CONFIG_PM set to 'n', errors occur at compile time:
> 
> ====
> ../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_suspend’:
> ../drivers/ufs/host/ufs-mediatek.c:1621:8: error: implicit declaration of function ‘ufshcd_runtime_suspend’; did you mean ‘ufs_mtk_runtime_suspend’? [-Werror=implicit-function-declaration]
> ../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_resume’:
> ../drivers/ufs/host/ufs-mediatek.c:1636:9: error: implicit declaration of function ‘ufshcd_runtime_resume’; did you mean ‘ufs_mtk_runtime_resume’? [-Werror=implicit-function-declaration]
> ====
> 
> This patch fixes these by selecting CONFIG_PM from CONFIG_SCSI_UFS_MEDIATEK.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> ---
>  drivers/ufs/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> index 4cc2dbd79ed0..f9786f085b54 100644
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -71,6 +71,7 @@ config SCSI_UFS_QCOM
>  config SCSI_UFS_MEDIATEK
>  	tristate "Mediatek specific hooks to UFS controller platform driver"
>  	depends on SCSI_UFSHCD_PLATFORM && ARCH_MEDIATEK
> +	select PM

Forcing a dependency is only valid if the driver won't work without it. PM is
an optional feature, so it shouldn't be forced. Moreover, in your case the
drivers were not used but instead erroring out because their definitions exist.

Here you should guard the ufs_mtk_runtime_suspend and ufs_mtk_runtime_resume
functions with CONFIG_PM instead.

Thanks,
Mani

>  	select PHY_MTK_UFS
>  	select RESET_TI_SYSCON
>  	help
> -- 
> 2.27.0
> 

-- 
மணிவண்ணன் சதாசிவம்

