Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAA6CD37B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JIa9sKem751lDpMUwpI4aXYmaNMMt1lA1ZVv3nBMnY=; b=3i0zmU5q1dCa4hTvxRqjkl0yfz
	jyG5igvaIadukzQkHl6hDmWyFD4DgNtz2BzkAoJL/vrgpHFBzDENSiNPfgWBcvSuT5PWpWYqexT4R
	gl3eAZsNnJsy/q+iMJQgkiUV+i0qlGcOjtM2ZDnlrQVJn8mZPWtsbA5OMUaZfwpODi8FZ9U8ICdUv
	pk62fSzq8IHJfgDY1NcvZ+0+mVso6dbQZt0rnbvY/GAuvGKBd73G+0R+CtblPDo9KSBzT01ZOSic/
	z/Zi0/7hHWywagJxHTVev1a9iIW7LiwlOtJV/UX6ZSjbcVWW7Ur3C5yd6+D6ErUH/1YQ2NxygTjJ4
	Crg+w6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnAk-00DK9y-1w;
	Sun, 17 Sep 2023 08:30:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnAh-00DK98-0F
	for linux-mediatek@lists.infradead.org;
	Sun, 17 Sep 2023 08:30:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-986d8332f50so469333166b.0
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Sep 2023 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694939425; x=1695544225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JIa9sKem751lDpMUwpI4aXYmaNMMt1lA1ZVv3nBMnY=;
        b=l1xkYaXVNHjryc8L3V43ATtPrPMgi9xCAu6Gx0SVmgq3x3Stj3yqbzrMpnRJpfi/kw
         aIiv49fHpHP4fZvECT1uMmuTin4Sr47OqYqE0Ns0W4NlUnXeMQqzWCPaBT2uZIniESPl
         GT4ZmlAmfkTVrTW0ndWHiZ/xg+cVhNgLRP39R2a2e23SEBVvInqn3wA3v+f2B1OldeVG
         p5kXrAck4rBtMx9h7iDjWMMHXOodGzW7SnCYxuU1ONvBC2CpZ/0QfJhBPMsP9j0x5PVR
         sZ3KYZ0S+jJOBMjuUifaI0iWkIU7wXK6boM3FZgWxCOXLCIWPeL3W7DRuSsI6SP5YnrS
         AL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694939425; x=1695544225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JIa9sKem751lDpMUwpI4aXYmaNMMt1lA1ZVv3nBMnY=;
        b=aLrvnR/m9SpDvHSDAG+U7dqDjcJ4hANM94LKYy3f+63Vk05unum7BKID/dQts8CPiX
         dm49dYxB7BYBDJzazVYTrEOFPbr6ar8qJQ037bSzE9i55PbGWCuzyOOyqEYPFhuRFOhU
         32glSRBrfH7Hayq65nweWwTZfvAxVibD8T2wL2Rb6ImfRrJ/DPwgwYxwD5UUoeP+MODY
         MLNkVfvA9FHIoQnHijdkLPsMEERzdaI6o2tRKfZcPMHvpVdQ+V2gyL4UrMM6wi8UoSiG
         mRWaKeqsiL18VaA9bqwSKslllqF4OLPzSLUrVzkINszqTkblCIskSS9j/fGfqNQcvANA
         V96A==
X-Gm-Message-State: AOJu0YxG08fwPR5AUUkUEtIrVyLzYxk2O5JA3cM9PqEVdSOntwUYBtRf
	u3gwdsyfUKhByee9IWzQHK1i4Q==
X-Google-Smtp-Source: AGHT+IHhi6GC+F/irZBZ7YZb2+9MkbI5j14NYPY+m4qpl+A2BdAezlhoI5cUV4BgjrblwRm/mCuOIA==
X-Received: by 2002:a17:907:2724:b0:9a5:b8c1:8bfa with SMTP id d4-20020a170907272400b009a5b8c18bfamr5311516ejl.28.1694939425384;
        Sun, 17 Sep 2023 01:30:25 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id lj23-20020a170906f9d700b009930c80b87csm4762883ejb.142.2023.09.17.01.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 01:30:24 -0700 (PDT)
Message-ID: <f9321dac-eaa3-dd24-2887-9d033ff5e07d@linaro.org>
Date: Sun, 17 Sep 2023 10:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/3] soc: mediatek: mtk-socinfo: Add driver for getting
 chip information
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230915152607.18116-1-william-tw.lin@mediatek.com>
 <20230915152607.18116-3-william-tw.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915152607.18116-3-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_013027_122341_9458B955 
X-CRM114-Status: GOOD (  31.51  )
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

On 15/09/2023 17:26, William-tw Lin wrote:
> Add driver for socinfo retrieval. This patch includes the following:
> 1. mtk-socinfo driver for chip info retrieval
> 2. Related changes to Makefile and Kconfig
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig       |   9 ++
>  drivers/soc/mediatek/Makefile      |   1 +
>  drivers/soc/mediatek/mtk-socinfo.c | 166 +++++++++++++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-socinfo.c
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index a88cf04fc803..5746d3b4c67d 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -91,4 +91,13 @@ config MTK_SVS
>  	  chip process corner, temperatures and other factors. Then DVFS
>  	  driver could apply SVS bank voltage to PMIC/Buck.
>  
> +config MTK_SOCINFO
> +	tristate "MediaTek SOCINFO"
> +	depends on MTK_EFUSE && NVMEM
> +	help
> +	  Say y here to enable mtk socinfo information.
> +	  This enables a sysfs node which shows attributes of MTK soc info.
> +	  Information of soc info includes the manufacturer, the marketing
> +	  name, and the soc used.
> +
>  endmenu
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 9d3ce7878c5c..6830512848fd 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
>  obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>  obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
>  obj-$(CONFIG_MTK_SVS) += mtk-svs.o
> +obj-$(CONFIG_MTK_SOCINFO) += mtk-socinfo.o
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
> new file mode 100644
> index 000000000000..fe5a68925f58
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -0,0 +1,166 @@
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
> +
> +#define MTK_SOCINFO_ENTRY(_soc_name, _segment_name, _marketing_name, _cell_data1, _cell_data2) {\
> +	.soc_name = _soc_name,	\
> +	.segment_name = _segment_name,	\
> +	.marketing_name = _marketing_name,	\
> +	.cell_data = {_cell_data1, _cell_data2}	\
> +}
> +#define CELL_NOT_USED (0xFFFFFFFF)
> +#define MAX_CELLS (2)
> +
> +struct mtk_socinfo {
> +	struct device *dev;
> +	struct name_data *name_data;
> +	struct socinfo_data *socinfo_data;
> +};
> +
> +struct socinfo_data {
> +	char *soc_name;
> +	char *segment_name;
> +	char *marketing_name;
> +	u32 cell_data[MAX_CELLS];
> +};
> +
> +const char *soc_manufacturer = "MediaTek";

Drop, not needed, not even static/

> +struct soc_device *soc_dev;

Drop. First, it's not even static. You cannot have global variables.

Second, it's not even used... This is some poor code.

> +char *cell_names[MAX_CELLS] = {"socinfo-data1", "socinfo-data2"};

static

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
> +
> +	attrs = devm_kzalloc(mtk_socinfop->dev, sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	snprintf(machine, 30, "%s (%s)", mtk_socinfop->socinfo_data->marketing_name,
> +		mtk_socinfop->socinfo_data->soc_name);
> +	attrs->family = soc_manufacturer;
> +	attrs->machine = machine;
> +
> +	soc_dev = soc_device_register(attrs);
> +	if (IS_ERR(soc_dev))
> +		return PTR_ERR(soc_dev);
> +
> +	dev_info(mtk_socinfop->dev, "%s SoC detected.\n", attrs->machine);
> +	return 0;
> +}
> +
> +static int mtk_socinfo_get_socinfo_data(struct mtk_socinfo *mtk_socinfop)
> +{
> +	unsigned int i = 0, j = 0;
> +	unsigned int num_cell_data = 0;
> +	u32 *cell_datap[MAX_CELLS] = { NULL };
> +	size_t efuse_bytes;
> +	struct nvmem_cell *cell;
> +	bool match_socinfo = true;
> +	int match_socinfo_index = -1;
> +
> +	for (i = 0; i < MAX_CELLS; i++) {
> +		cell = nvmem_cell_get(mtk_socinfop->dev, cell_names[i]);
> +		if (IS_ERR_OR_NULL(cell))
> +			break;
> +		cell_datap[i] = (u32 *)nvmem_cell_read(cell, &efuse_bytes);
> +		nvmem_cell_put(cell);
> +		num_cell_data++;
> +	}
> +
> +	if (!num_cell_data)
> +		return -ENOENT;
> +
> +	for (i = 0; i < ARRAY_SIZE(socinfo_data_table); i++) {
> +		match_socinfo = true;
> +		for (j = 0; j < num_cell_data; j++) {
> +			if (*(cell_datap[j]) != socinfo_data_table[i].cell_data[j])
> +				match_socinfo = false;
> +		}
> +		if (num_cell_data > 0 && match_socinfo) {
> +			mtk_socinfop->socinfo_data = &(socinfo_data_table[i]);
> +			match_socinfo_index = i;
> +			break;
> +		}
> +	}
> +
> +	return match_socinfo_index >= 0 ? match_socinfo_index : -ENOENT;
> +}
> +
> +static const struct of_device_id mtk_socinfo_id_table[] = {
> +	{ .compatible = "mediatek,socinfo" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_socinfo_id_table);
> +
> +static int mtk_socinfo_probe(struct platform_device *pdev)
> +{
> +	struct mtk_socinfo *mtk_socinfop;
> +	int ret = 0;
> +
> +	mtk_socinfop = devm_kzalloc(&pdev->dev, sizeof(*mtk_socinfop), GFP_KERNEL);
> +	if (!mtk_socinfop)
> +		return -ENOMEM;
> +
> +	mtk_socinfop->dev = &pdev->dev;
> +
> +	ret = mtk_socinfo_get_socinfo_data(mtk_socinfop);
> +	if (ret < 0)
> +		return dev_err_probe(mtk_socinfop->dev, ret, "Failed to get socinfo data\n");
> +
> +	ret = mtk_socinfo_create_socinfo_node(mtk_socinfop);
> +	if (ret != 0)
> +		return dev_err_probe(mtk_socinfop->dev, -EINVAL, "Failed to create socinfo node\n");

Wrap your code according to Linux coding style (see Coding style
document, not checkpatch).

> +
> +	return 0;
> +}
> +
> +static int mtk_socinfo_remove(struct platform_device *pdev)
> +{
> +	if (soc_dev)

And how it could be NULL here? This does not make any sense.

> +		soc_device_unregister(soc_dev);
> +	return 0;
> +}
> +
> +static struct platform_driver mtk_socinfo = {
> +	.probe          = mtk_socinfo_probe,
> +	.remove         = mtk_socinfo_remove,
> +	.driver         = {
> +		.name   = "mtk_socinfo",
> +		.owner  = THIS_MODULE,

Really? We dropped it years ago.

Before submitting new drivers, always, *ALWAYS*, run coccinelle, smatch
and sparse.

Best regards,
Krzysztof


