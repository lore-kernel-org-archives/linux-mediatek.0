Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A58C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 22:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4/jFR7fSfBpiGOxzADNAHNAH5ATZiVw6E/eSyMTVVY=; b=Dl/06Qv2nfMLfb
	7ThdiJi1SgCr5+y6zRK5BNLaVl5xxLu8DImJXpyTrVjvcFceYIrJmfsHzIzWkh8/3+EYkbT+12W8p
	+rMqCwTZVQ4t4fpoAjmJoqisiAng92gxyvnYxeYjiIl1cPMzoP+KgXda3QRXop2xP83+FdFRE803u
	6VuCXHnsqiKW7KD7aYKrxN6Wb+t7dY4sjY97zf+4g31F9y/vq2q9dBSMyPAgUfS2KTxrdS6aWeDIW
	aG0oTiFyd6sZzWO5t+FRYtfyxMCu0Ml7/rFjuQnylqAVCaBey8wPa0WiYlYJqwLr0AgUGlIaejfNc
	VvMjR9XZYMuQX6eR5WmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmk3v-000QCi-Ds; Thu, 05 May 2022 22:35:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmk3a-000Q3c-Im; Thu, 05 May 2022 22:34:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3821161F57;
 Thu,  5 May 2022 22:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA22C385A8;
 Thu,  5 May 2022 22:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651790085;
 bh=FGb5UR006KfZMpikx+bLVdLJYMjB2a8HujAnk3x3PNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zPhbqAzN+cP39KbbUbk1rg1C5Bp0o3WxqSHIDNm36wQHJWrMicsuJo73I9FU2FKs8
 uWIEbySkyFZLwESHkaH9n6tG7gQVSCYMLHzfZbf2eZOYl5uEJsnoWlK00AnXtOGiFc
 17B45hda7Yr5Uc/LFYfapEEWuaiwne5vxdEZCPI0=
Date: Thu, 5 May 2022 23:11:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Borislav Petkov <bp@suse.de>, Michal Suchanek <msuchanek@suse.de>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 John Stultz <john.stultz@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 YC Hung <yc.hung@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol
 interface
Message-ID: <YnQ9h6k0yFN8f+Ui@kroah.com>
References: <20220505053048.13804-1-tinghan.shen@mediatek.com>
 <20220505053048.13804-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505053048.13804-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_153446_754733_7CC36C37 
X-CRM114-Status: GOOD (  28.16  )
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

On Thu, May 05, 2022 at 01:30:48PM +0800, Tinghan Shen wrote:
> From: TingHan Shen <tinghan.shen@mediatek.com>
> 
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
> 
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
> 
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> We use two mbox channels to implement a request-reply protocol.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/mediatek/Kconfig             |   9 +
>  drivers/firmware/mediatek/Makefile            |   2 +
>  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161 ++++++++++++++++++
>  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
>  6 files changed, 239 insertions(+)
>  create mode 100644 drivers/firmware/mediatek/Kconfig
>  create mode 100644 drivers/firmware/mediatek/Makefile
>  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index d65964996e8d..c4d149b28944 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -300,6 +300,7 @@ source "drivers/firmware/cirrus/Kconfig"
>  source "drivers/firmware/google/Kconfig"
>  source "drivers/firmware/efi/Kconfig"
>  source "drivers/firmware/imx/Kconfig"
> +source "drivers/firmware/mediatek/Kconfig"
>  source "drivers/firmware/meson/Kconfig"
>  source "drivers/firmware/psci/Kconfig"
>  source "drivers/firmware/smccc/Kconfig"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 4e58cb474a68..88fbdc110100 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
>  obj-$(CONFIG_EFI)		+= efi/
>  obj-$(CONFIG_UEFI_CPER)		+= efi/
>  obj-y				+= imx/
> +obj-y				+= mediatek/
>  obj-y				+= psci/
>  obj-y				+= smccc/
>  obj-y				+= tegra/
> diff --git a/drivers/firmware/mediatek/Kconfig b/drivers/firmware/mediatek/Kconfig
> new file mode 100644
> index 000000000000..6d1e580b967b
> --- /dev/null
> +++ b/drivers/firmware/mediatek/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config MTK_ADSP_IPC
> +	tristate "MTK ADSP IPC Protocol driver"
> +	depends on MTK_ADSP_MBOX
> +	help
> +	  Say yes here to add support for the MediaTek ADSP IPC
> +	  between host AP (Linux) and the firmware running on ADSP.
> +	  ADSP exists on some mtk processors.
> +	  Client might use shared memory to exchange information with ADSP side.
> diff --git a/drivers/firmware/mediatek/Makefile b/drivers/firmware/mediatek/Makefile
> new file mode 100644
> index 000000000000..4e840b65650d
> --- /dev/null
> +++ b/drivers/firmware/mediatek/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_MTK_ADSP_IPC)		+= mtk-adsp-ipc.o
> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
> new file mode 100644
> index 000000000000..87cee61dbf32
> --- /dev/null
> +++ b/drivers/firmware/mediatek/mtk-adsp-ipc.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Corporation. All rights reserved.
> + * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> + */
> +
> +#include <linux/firmware/mediatek/mtk-adsp-ipc.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +/*
> + * mtk_adsp_ipc_send - send ipc cmd to MTK ADSP
> + *
> + * @ipc: ADSP IPC handle
> + * @idx: index of the mailbox channel
> + * @msg: IPC cmd (reply or request)
> + *
> + * Returns zero for success from mbox_send_message
> + * negative value for error
> + */
> +int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t msg)
> +{
> +	struct mtk_adsp_chan *adsp_chan;
> +	int ret;
> +
> +	if (idx >= MTK_ADSP_MBOX_NUM)
> +		return -EINVAL;
> +
> +	adsp_chan = &ipc->chans[idx];
> +	ret = mbox_send_message(adsp_chan->ch, &msg);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * mbox_send_message returns non-negative value on success,
> +	 * return zero for success
> +	 */
> +	return 0;

You already said this up in the function comments, no need to duplicate
it again.

> +}
> +EXPORT_SYMBOL(mtk_adsp_ipc_send);

EXPORT_SYMBOL_GPL()?  I have to ask, sorry.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
