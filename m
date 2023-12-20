Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A00DC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFpK51Ft68fDOZZrl4vnm0TNSXwDn9DPHy4FWH1NQI4=; b=gFg7z8xfOEcUBSmsoX45YVMm3U
	eBM1htaqTj/wNP8VmHRKCMxvRLIVXR0+pSkFw4n842Za2czQDXbIBkHzbjpHoM1mtoodLpWdMl2GZ
	U7qcLpEEKSTJ6z6Vfvo1Xj0JQLb78SCmEsJKXg9LVEdvUfaW2miVsvBnF0Q2t3YLbgJF+YdAijoCL
	iaEU8jqPVyIWj2bKnLmwDhCKtmBU1Hoc44FTChZDpC/Q/9CGS8Thew4yDJyLkRhebLvwCFB4jM4aD
	t2uNaDw9Sx5D7ftPF1TXTwu5g98qEAp4sO3fVL6m/f2vR4/hfGrjIff7CCl/L0cTZPTDGGLrlRm0C
	xowfBVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuCe-00Gzgk-0o;
	Wed, 20 Dec 2023 10:53:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuCa-00Gzg2-2e;
	Wed, 20 Dec 2023 10:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703069603;
	bh=0wM6NyIYfWx3GSl8Kay+3vfdMz3CT7HUYXvuXwJK47Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vkBmQruw2EZdYOqARFcL+ugM0MlOmpY0fyvpp6IOKlTDg1ArOZp4RjMs7N984koTr
	 7v02x3UYEGBX7Nbo0cLlKJtIWe5uaLpXAYwFfRkGEIXmR0jPof8U1x/RVEmgygHMWi
	 baqcjXQm5NvfACedg/Jz2EYYx3TKiGQqo4+QP6w0MhIaq6YlYWGw9lvq1rNjjp/xmU
	 xtlXkDXDw9cqg4gFOeUDv5bjBoFvW3YlHimcbGOed5k//uGcXkAvSu1zbpRajQZY2/
	 Quf3tPADJ8moAGmHd30mk451URTfCpxkhm2SCqeI1O/lLGXMCQdkSui/RzajLD3WTp
	 GRZd1txjf43uQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A80B3781FC8;
	Wed, 20 Dec 2023 10:53:22 +0000 (UTC)
Message-ID: <508c9b5a-61d9-4e42-8faa-c6f48f453235@collabora.com>
Date: Wed, 20 Dec 2023 11:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: mediatek: mtk-socinfo: Add driver for getting
 chip information
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231220103901.22180-1-william-tw.lin@mediatek.com>
 <20231220103901.22180-3-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220103901.22180-3-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_025324_997485_9E943102 
X-CRM114-Status: GOOD (  23.23  )
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

Il 20/12/23 11:39, William-tw Lin ha scritto:
> Add driver for socinfo retrieval. This patch includes the following:
> 1. mtk-socinfo driver for chip info retrieval
> 2. Related changes to Makefile and Kconfig
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig       |   8 ++
>   drivers/soc/mediatek/Makefile      |   1 +
>   drivers/soc/mediatek/mtk-socinfo.c | 186 +++++++++++++++++++++++++++++
>   3 files changed, 195 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mtk-socinfo.c
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 0810b5b0c688..f34d93977ba6 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -68,4 +68,12 @@ config MTK_SVS
>   	  chip process corner, temperatures and other factors. Then DVFS
>   	  driver could apply SVS bank voltage to PMIC/Buck.
>   
> +config MTK_SOCINFO
> +	tristate "MediaTek SoC Information"
> +	default y

Add the dependency please.

	depends on NVMEM_MTK_EFUSE

> +	help
> +	  The MediaTek SoC Information (mtk-socinfo) driver provides
> +	  information about the SoC to the userspace including the
> +	  manufacturer name, marketing name and soc name.
> +
>   endmenu
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 9d3ce7878c5c..6830512848fd 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
>   obj-$(CONFIG_MTK_SVS) += mtk-svs.o
> +obj-$(CONFIG_MTK_SOCINFO) += mtk-socinfo.o
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
> new file mode 100644
> index 000000000000..4a257b5c8eda
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>
> +#include <linux/sys_soc.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +
> +#define MTK_SOCINFO_ENTRY(_soc_name, _segment_name, _marketing_name, _cell_data1, _cell_data2) {\
> +	.soc_name = _soc_name,									\
> +	.segment_name = _segment_name,								\
> +	.marketing_name = _marketing_name,							\
> +	.cell_data = {_cell_data1, _cell_data2}							\
> +}
> +#define CELL_NOT_USED (0xFFFFFFFF)
> +#define MAX_CELLS (2)
> +
> +struct mtk_socinfo {
> +	struct device *dev;
> +	struct name_data *name_data;
> +	struct socinfo_data *socinfo_data;
> +	struct soc_device *soc_dev;
> +};
> +
> +struct socinfo_data {
> +	char *soc_name;
> +	char *segment_name;
> +	char *marketing_name;
> +	u32 cell_data[MAX_CELLS];
> +};
> +
> +static const char *cell_names[MAX_CELLS] = {"socinfo-data1", "socinfo-data2"};
> +
> +static struct socinfo_data socinfo_data_table[] = {
> +	MTK_SOCINFO_ENTRY("MT8173", "MT8173V/AC", "MT8173", 0x6CA20004, 0x10000000),
> +	MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x00010043, 0x00000840),
> +	MTK_SOCINFO_ENTRY("MT8186", "MT8186GV/AZA", "Kompanio 520", 0x81861001, CELL_NOT_USED),
> +	MTK_SOCINFO_ENTRY("MT8186T", "MT8186TV/AZA", "Kompanio 528", 0x81862001, CELL_NOT_USED),
> +	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 830", 0x81880000, 0x00000010),
> +	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/HZA", "Kompanio 830", 0x81880000, 0x00000011),
> +	MTK_SOCINFO_ENTRY("MT8192", "MT8192V/AZA", "Kompanio 820", 0x00001100, 0x00040080),
> +	MTK_SOCINFO_ENTRY("MT8192T", "MT8192V/ATZA", "Kompanio 828", 0x00000100, 0x000400C0),
> +	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EZA", "Kompanio 1200", 0x81950300, CELL_NOT_USED),
> +	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EHZA", "Kompanio 1200", 0x81950304, CELL_NOT_USED),
> +	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EZA", "Kompanio 1380", 0x81950400, CELL_NOT_USED),
> +	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EHZA", "Kompanio 1380", 0x81950404, CELL_NOT_USED),
> +};
> +
> +static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
> +{
> +	struct soc_device_attribute *attrs;
> +	static char machine[30] = {0};
> +	static const char *soc_manufacturer = "MediaTek";
> +
> +	attrs = devm_kzalloc(mtk_socinfop->dev, sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	snprintf(machine, sizeof(machine), "%s (%s)", mtk_socinfop->socinfo_data->marketing_name,
> +		mtk_socinfop->socinfo_data->soc_name);
> +	attrs->family = soc_manufacturer;
> +	attrs->machine = machine;
> +
> +	mtk_socinfop->soc_dev = soc_device_register(attrs);
> +	if (IS_ERR(mtk_socinfop->soc_dev))
> +		return PTR_ERR(mtk_socinfop->soc_dev);
> +
> +	dev_info(mtk_socinfop->dev, "%s %s SoC detected.\n", soc_manufacturer, attrs->machine);
> +	return 0;
> +}
> +
> +static u32 mtk_socinfo_read_cell(struct device *dev, const char *name)
> +{
> +	struct nvmem_device *nvmemp;
> +	struct device_node *np = dev->of_node;
> +	u32 offset;
> +	u32 cell_val = CELL_NOT_USED;
> +
> +	nvmemp = devm_nvmem_device_get(dev, "mtk-efuse0");

Are you sure that this is supposed to be "mtk-efuse0" and not "mtk-efuse"?
Looks strange.

Everything else looks ok.

Cheers,
Angelo



