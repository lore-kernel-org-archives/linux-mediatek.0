Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C60AC67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09kzDSeBY1bDEVzXFyzjlKFFBS3B45ldTLZliU9eor4=; b=tT7Q5Dx2fzPHNM5NEAHdkykTTT
	1h72sAJ7whDB9zO9i/qz1UhT4PHSbj0tjAtmY3MF5JT4kKqAW7Fp1mzTvWYtnFALdtI6nam3/BRot
	OSmCi4C2WYf2EA4621VkLFoW+EH1wkITw40msxItWeRR3rd8S96LE9Wdz7f31owRK7aJMkkx+n0gs
	1fZD5JBAoq1KNXz+o0o4awZ+MMYKcZZ8a62ypXypgpZbDnhX4qmIHb7s/XPHkQRw++/NvlJkqVxv8
	3b319Q+0X0MQaUt7cBEPBf0OYnnPwC8XD529aJVmCMyf4r9GkpWWo/w/9rvblxgE8zUWRdhbphtVQ
	HAKd/82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtobB-0000000FcPm-2kEK;
	Mon, 08 Apr 2024 12:59:45 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtob7-0000000FcNP-3xzN;
	Mon, 08 Apr 2024 12:59:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rtoas-0004Ly-2b;
	Mon, 08 Apr 2024 12:59:26 +0000
Date: Mon, 8 Apr 2024 13:59:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	William-tw Lin <william-tw.lin@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: select CONFIG_SOC_BUS
Message-ID: <ZhPqLGYxK3NRCSXl@makrotopia.org>
References: <20240408125506.1594257-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408125506.1594257-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_055942_038259_F70A7CE4 
X-CRM114-Status: GOOD (  17.08  )
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

Hi,

On Mon, Apr 08, 2024 at 02:55:00PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is needed to avoid a link failure:
> 
> ERROR: modpost: "soc_device_register" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!
> ERROR: modpost: "soc_device_unregister" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!
> 

I've tried to take care of this in the exact same way a long time
ago. Don't ask me why it didn't find it's way into stable yet

https://patchwork.kernel.org/project/linux-mediatek/patch/cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org/


Cheers


Daniel

> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 50c664b65f4d..1b7afb19ccd6 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -72,6 +72,7 @@ config MTK_SOCINFO
>  	tristate "MediaTek SoC Information"
>  	default y
>  	depends on NVMEM_MTK_EFUSE
> +	select SOC_BUS
>  	help
>  	  The MediaTek SoC Information (mtk-socinfo) driver provides
>  	  information about the SoC to the userspace including the
> -- 
> 2.39.2
> 
> 

