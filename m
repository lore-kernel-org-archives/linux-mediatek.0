Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51272C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VizX/aLbRZi55PY5QW+H0tCx/rvKI+kxDnUPit2nQg8=; b=H+bTH188CCJK+X
	TCcvMja13KtnXOgnIL5zsPbY4gtR//bj3h8DOFKk7b3lUZAnuJ0H0WXVIC9DhUGfL5gMQRUm6GkMX
	dZlWxz5xNA0ao+MNoIIMel8XtsFXG5dcUYJ8YC3CBrN3qFxVfxR9OC5x5Pmdl6ok4xSVsX5gY/ay/
	U4eLqcyQtplgtYCt8i/hYGeY6oJPRRJqLhM6PtNMWwduWC127EvbfUn+AL/wf9EjubkoGkK/QfMtB
	flqryC+TbIJYrfDSOCsyBGtUp+OZ8g30abDYimTFwvibxrcVf+IlRYcbbvH4V+nJ/x/QdOzzioVpk
	l6ayV+uOreuSho0HTpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njbp3-000BXf-Ql; Wed, 27 Apr 2022 07:10:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njbo6-000BCV-D0; Wed, 27 Apr 2022 07:09:55 +0000
X-UUID: fd06fcb50bd549e4975be92f05275778-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f76a29c2-4a97-459b-bff5-be48cb780d06, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:1876dd2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: fd06fcb50bd549e4975be92f05275778-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 920233014; Wed, 27 Apr 2022 00:09:45 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 00:04:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 15:04:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 15:04:31 +0800
Message-ID: <88817065acf58278fcac014b7dfd6478eb8e567d.camel@mediatek.com>
Subject: Re: [PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol interface
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Kevin Hilman <khilman@baylibre.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>, <tzungbi@google.com>, Chen-Yu Tsai
 <wenst@chromium.org>, <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>
Date: Wed, 27 Apr 2022 15:04:31 +0800
In-Reply-To: <20220407130338.28939-2-allen-kh.cheng@mediatek.com>
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
 <20220407130338.28939-2-allen-kh.cheng@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_000950_522828_B14B6056 
X-CRM114-Status: GOOD (  35.08  )
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

Hi Matthias,

Would you please take a look at it?

Thanks a lot,
Allen

On Thu, 2022-04-07 at 21:03 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
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
> Reviewed-by: Pierre-Louis Bossart <
> pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/mediatek/Kconfig             |   9 +
>  drivers/firmware/mediatek/Makefile            |   2 +
>  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161
> ++++++++++++++++++
>  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
>  6 files changed, 239 insertions(+)
>  create mode 100644 drivers/firmware/mediatek/Kconfig
>  create mode 100644 drivers/firmware/mediatek/Makefile
>  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index e5cfb01353d8..605ae3f47adc 100644
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
> diff --git a/drivers/firmware/mediatek/Kconfig
> b/drivers/firmware/mediatek/Kconfig
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
> +	  Client might use shared memory to exchange information with
> ADSP side.
> diff --git a/drivers/firmware/mediatek/Makefile
> b/drivers/firmware/mediatek/Makefile
> new file mode 100644
> index 000000000000..4e840b65650d
> --- /dev/null
> +++ b/drivers/firmware/mediatek/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_MTK_ADSP_IPC)		+= mtk-adsp-ipc.o
> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c
> b/drivers/firmware/mediatek/mtk-adsp-ipc.c
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
> +int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx,
> uint32_t msg)
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
> +}
> +EXPORT_SYMBOL(mtk_adsp_ipc_send);
> +
> +/*
> + * mtk_adsp_ipc_recv - recv callback used by MTK ADSP mailbox
> + *
> + * @c: mbox client
> + * @msg: message received
> + *
> + * Users of ADSP IPC will need to privde handle_reply and
> handle_request
> + * callbacks.
> + */
> +static void mtk_adsp_ipc_recv(struct mbox_client *c, void *msg)
> +{
> +	struct mtk_adsp_chan *chan = container_of(c, struct
> mtk_adsp_chan, cl);
> +	struct device *dev = c->dev;
> +
> +	switch (chan->idx) {
> +	case MTK_ADSP_MBOX_REPLY:
> +		chan->ipc->ops->handle_reply(chan->ipc);
> +		break;
> +	case MTK_ADSP_MBOX_REQUEST:
> +		chan->ipc->ops->handle_request(chan->ipc);
> +		break;
> +	default:
> +		dev_err(dev, "wrong mbox chan %d\n", chan->idx);
> +		break;
> +	}
> +}
> +
> +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_adsp_ipc *adsp_ipc;
> +	struct mtk_adsp_chan *adsp_chan;
> +	struct mbox_client *cl;
> +	char *chan_name;
> +	int ret;
> +	int i, j;
> +
> +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
> +
> +	adsp_ipc = devm_kzalloc(dev, sizeof(*adsp_ipc), GFP_KERNEL);
> +	if (!adsp_ipc)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (!chan_name) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +
> +		adsp_chan = &adsp_ipc->chans[i];
> +		cl = &adsp_chan->cl;
> +		cl->dev = dev->parent;
> +		cl->tx_block = false;
> +		cl->knows_txdone = false;
> +		cl->tx_prepare = NULL;
> +		cl->rx_callback = mtk_adsp_ipc_recv;
> +
> +		adsp_chan->ipc = adsp_ipc;
> +		adsp_chan->idx = i;
> +		adsp_chan->ch = mbox_request_channel_byname(cl,
> chan_name);
> +		if (IS_ERR(adsp_chan->ch)) {
> +			ret = PTR_ERR(adsp_chan->ch);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to request mbox
> chan %d ret %d\n",
> +					i, ret);
> +			goto out_free;
> +		}
> +
> +		dev_dbg(dev, "request mbox chan %s\n", chan_name);
> +		kfree(chan_name);
> +	}
> +
> +	adsp_ipc->dev = dev;
> +	dev_set_drvdata(dev, adsp_ipc);
> +	dev_dbg(dev, "MTK ADSP IPC initialized\n");
> +
> +	return 0;
> +
> +out_free:
> +	kfree(chan_name);
> +out:
> +	for (j = 0; j < i; j++) {
> +		adsp_chan = &adsp_ipc->chans[j];
> +		mbox_free_channel(adsp_chan->ch);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_adsp_ipc_remove(struct platform_device *pdev)
> +{
> +	struct mtk_adsp_ipc *adsp_ipc = dev_get_drvdata(&pdev->dev);
> +	struct mtk_adsp_chan *adsp_chan;
> +	int i;
> +
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		adsp_chan = &adsp_ipc->chans[i];
> +		mbox_free_channel(adsp_chan->ch);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mtk_adsp_ipc_driver = {
> +	.driver = {
> +		.name = "mtk-adsp-ipc",
> +	},
> +	.probe = mtk_adsp_ipc_probe,
> +	.remove = mtk_adsp_ipc_remove,
> +};
> +builtin_platform_driver(mtk_adsp_ipc_driver);
> +
> +MODULE_AUTHOR("Allen-KH Cheng <allen-kh.cheng@mediatek.com>");
> +MODULE_DESCRIPTION("MTK ADSP IPC Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/firmware/mediatek/mtk-adsp-ipc.h
> b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
> new file mode 100644
> index 000000000000..28fd313340b8
> --- /dev/null
> +++ b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + */
> +
> +#ifndef MTK_ADSP_IPC_H
> +#define MTK_ADSP_IPC_H
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox_client.h>
> +
> +#define MTK_ADSP_IPC_REQ 0
> +#define MTK_ADSP_IPC_RSP 1
> +#define MTK_ADSP_IPC_OP_REQ 0x1
> +#define MTK_ADSP_IPC_OP_RSP 0x2
> +
> +enum {
> +	MTK_ADSP_MBOX_REPLY,
> +	MTK_ADSP_MBOX_REQUEST,
> +	MTK_ADSP_MBOX_NUM,
> +};
> +
> +struct mtk_adsp_ipc;
> +
> +struct mtk_adsp_ipc_ops {
> +	void (*handle_reply)(struct mtk_adsp_ipc *ipc);
> +	void (*handle_request)(struct mtk_adsp_ipc *ipc);
> +};
> +
> +struct mtk_adsp_chan {
> +	struct mtk_adsp_ipc *ipc;
> +	struct mbox_client cl;
> +	struct mbox_chan *ch;
> +	char *name;
> +	int idx;
> +};
> +
> +struct mtk_adsp_ipc {
> +	struct mtk_adsp_chan chans[MTK_ADSP_MBOX_NUM];
> +	struct device *dev;
> +	struct mtk_adsp_ipc_ops *ops;
> +	void *private_data;
> +};
> +
> +static inline void mtk_adsp_ipc_set_data(struct mtk_adsp_ipc *ipc,
> void *data)
> +{
> +	if (!ipc)
> +		return;
> +
> +	ipc->private_data = data;
> +}
> +
> +static inline void *mtk_adsp_ipc_get_data(struct mtk_adsp_ipc *ipc)
> +{
> +	if (!ipc)
> +		return NULL;
> +
> +	return ipc->private_data;
> +}
> +
> +int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx,
> uint32_t op);
> +
> +#endif /* MTK_ADSP_IPC_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
