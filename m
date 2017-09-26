From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] soc: mediatek: place Kconfig for all SoC driver under
 menu
Date: Tue, 26 Sep 2017 07:55:58 +0200
Message-ID: <20170926075558.7e4c99c3@endymion>
References: <b7aeda2773ebd2f030ddd782b31a594a05fdef2c.1505982942.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b7aeda2773ebd2f030ddd782b31a594a05fdef2c.1505982942.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 21 Sep 2017 16:46:35 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add cleanup for placing all Kconfig for all MediaTek SoC drivers under
> the independent menu as other SoCs vendor usually did.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 609bb34..a2fcd7f 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -1,6 +1,8 @@
>  #
>  # MediaTek SoC drivers
>  #
> +menu "MediaTek SoC drivers"

Could it depend on ARCH_MEDIATEK || COMPILE_TEST? So that it isn't
presented if it is going to be empty.

> +
>  config MTK_INFRACFG
>  	bool "MediaTek INFRACFG Support"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> @@ -30,3 +32,5 @@ config MTK_SCPSYS
>  	help
>  	  Say yes here to add support for the MediaTek SCPSYS power domain
>  	  driver.
> +
> +endmenu


-- 
Jean Delvare
SUSE L3 Support
