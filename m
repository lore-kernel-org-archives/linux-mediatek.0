Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A114AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuDnJNLg1DSi2IHDv19vszLfxDNRnbsAsLdkpra8x7k=; b=c0U+/zZiDYe+RDeuKholYatxIQ
	RSW4J7m7oinB7cD1sy9ILyPfKYk+qym4buUMNlVd01TnBEuZHjGXJNP00G9JN+GdTtQT3NPtE3Szt
	zKjd+8WrWvt41ZJiRvBysaAkO+fyYnAE5uF6m31iE7WU+oMs7LtWyfqAvh2zYWZOhlNiMvWekeQRa
	JoFMiaCB9yct3lp0CR99yzHI3sqPka8vTi2molKeejjNlfZJujSl8nWRkKIh7Mauy2wuBUsQ52yqi
	e4YFwZDTX/Luce8ro3JG79iFJvwmMqdDMf+CrCs6tVm7GrWeZJ0801OZ0gAglBu2dvKU1JNaxQX/0
	PB6Dn9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM24m-006AvU-2F;
	Wed, 19 Jul 2023 07:58:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM24l-006Auy-36
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 07:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iuDnJNLg1DSi2IHDv19vszLfxDNRnbsAsLdkpra8x7k=; b=dJ22VR1hGeBpHYJv6FP4zyD4aQ
	QnmyHD4Wr6mycHddtnaMrbmm4GJlRBu6v+fHATaQrHv+w5G/pEI/1XhYYtFHK5ZZSdz9Fvt7tkLF3
	lUX+BxLAVJnh5BYULM3yVgeVfntCebIeaCG6/XlMNEDE4rdIp40JsqJq5GXYhL69B95L4qOAbTV6r
	rzXSu6vs+J9bUyJYyhFxm9nQObhMUr7TtxX2zmc37OJTMHx2K/iqPUhWl+VWJW6iSsEo1lnPPy+zs
	faTf+SKHFL+SPGjCpTuuDLB8RlxmrvhUsbPaKZSgmoEDwSIIguws9lkOy9MR7XjPzpVUKC5cCg3eT
	AGJDpoYw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjB4-00BTYP-2a
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 11:47:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-991c786369cso728232366b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 04:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689680793; x=1692272793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuDnJNLg1DSi2IHDv19vszLfxDNRnbsAsLdkpra8x7k=;
        b=KmZCYYUnlbZx+41kc3ZIroQqHthEIf8tMdv/piRFlvkdADgfygYtXYQ/6wWVzEb/W5
         mrpURoLoDj/ir8jmXbnHZhThVElMCFH9t+twj/fSuYxMPBiti/SxKH6kiTP8dx138+iX
         nxsLcbp/qM0YdpvQXY1hGcs4ziQdk4AeQnbPOY39B2fu24RTjN2qDUGwAGhf6LbY5mmo
         uhhYT+mrGDYjn18UuYIYgp9chFCkT5T7X6sqrZ0HlOKJ0bqgtB/3xbz1jGfIiXKdNOD+
         AECw2aypwFiZSEiGO8Vsw3dzGTsMmLTbWvtDivpJXi/xw0/2ugQtbJJB2NhgEmBz652P
         9vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689680793; x=1692272793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuDnJNLg1DSi2IHDv19vszLfxDNRnbsAsLdkpra8x7k=;
        b=iMFY4AhtFMO+Hl+Bbmpw2swVk07Uad5/q6u8iDYn3HBHYkYeu2ojfpnbYmWgRNRKN0
         fMcIae3xOGJuAECgWzs/eFGBqUFuqLrz1IKbi+30IVO0/STlozotp74wPkgkImcBqKqy
         fheNBgGn5fYGo1nWTkpwe6SsvUW2jKYt8EI1Cy36KkL78lmvlncBXsX8En1vQEPH0NdC
         uhyZp/IDbMtH9BgnP9hgwwLY1n97F7JpLU0M/jzZ4ELw43yYvXHiBWBDAvQfW42RaYX9
         injtj7pN7PeQCu4X3TrTaKeYY2sdp/1S2MlrWFypxH+Myge6Oc2P1tnfMV8M247KMbbI
         peIg==
X-Gm-Message-State: ABy/qLbEpw/Ls0vg8mWscGr+8Of2mtO/hL+cQ2tIMKQt/k+BXrNZwnd/
	2jnAiNMGBcNJKinK3ZolEgzpBg==
X-Google-Smtp-Source: APBJJlGS61+osXViXxDbApOvqLzVXb+fOy9jdzDfgRrkCLEjedJ6+KDyKzAW0phOXuWgXGnT7qqMwg==
X-Received: by 2002:a17:907:7656:b0:993:f6c8:300f with SMTP id kj22-20020a170907765600b00993f6c8300fmr11821366ejc.15.1689680793651;
        Tue, 18 Jul 2023 04:46:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709063a8e00b00988b86d6c7csm913001ejd.132.2023.07.18.04.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:46:33 -0700 (PDT)
Message-ID: <24425fcb-608d-e5be-a799-ac839b0b5953@linaro.org>
Date: Tue, 18 Jul 2023 13:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] soc: mediatek: mtk-socinfo: Add driver for getting
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
References: <20230718112143.14036-1-william-tw.lin@mediatek.com>
 <20230718112143.14036-2-william-tw.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718112143.14036-2-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_124739_115784_35D60A60 
X-CRM114-Status: GOOD (  28.52  )
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

On 18/07/2023 13:21, William-tw Lin wrote:
> Add driver for socinfo retrieval. This patch includes the following:
> 1. mtk-socinfo driver for chip info retrieval
> 2. Related changes to Makefile and Kconfig
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---

...

> +#if IS_ENABLED(CONFIG_MTK_SOCINFO_DEBUG)
> +static int mtk_socinfo_socinfo_debug_show(struct seq_file *m, void *p)
> +{
> +	struct mtk_socinfo *mtk_socinfop = (struct mtk_socinfo *)m->private;
> +
> +	seq_printf(m, "SOC Manufacturer:   %s\n", soc_manufacturer);
> +	seq_printf(m, "SOC Name:           %s\n", mtk_socinfop->name_data->soc_name);
> +	seq_printf(m, "SOC segment Name:   %s\n", mtk_socinfop->name_data->soc_segment_name);
> +	seq_printf(m, "Marketing Name:     %s\n", mtk_socinfop->name_data->marketing_name);
> +
> +	return 0;
> +}
> +DEBUG_FOPS_RO(socinfo);


No, there is socinfo for this.

...

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
> +	mtk_socinfop->soc_data = (struct socinfo_data *)of_device_get_match_data(mtk_socinfop->dev);

Why do you need the cast?

> +	if (!mtk_socinfop->soc_data) {
> +		dev_err(mtk_socinfop->dev, "No mtk-socinfo platform data found\n");
> +		return -EPERM;

EPERM? Is this correct errno? How is it even possible?

> +	}
> +
> +	ret = mtk_socinfo_get_socinfo_data(mtk_socinfop);
> +	if (ret < 0) {
> +		dev_err(mtk_socinfop->dev, "Failed to get socinfo data (ret = %d)\n", ret);
> +		return -EINVAL;

return dev_err_probe

> +	}
> +
> +	ret = mtk_socinfo_create_socinfo_node(mtk_socinfop);
> +	if (ret != 0) {
> +		dev_err(mtk_socinfop->dev, "Failed to create socinfo node (ret = %d)\n", ret);
> +		return ret;
> +	}
> +
> +#if IS_ENABLED(CONFIG_MTK_SOCINFO_DEBUG)

Drop #if. If you need to make it conditional, then use standard C code.



> +	ret = mtk_socinfo_create_debug_cmds(mtk_socinfop);
> +	if (ret != 0) {
> +		dev_err(mtk_socinfop->dev, "Failed to create socinfo debug node (ret = %d)\n", ret);
> +		return ret;

No, we do not print failures and definitely do not fail probing on
debugfs! Come one...

> +	}
> +#endif
> +	return 0;
> +}
> +
> +static int mtk_socinfo_remove(struct platform_device *pdev)
> +{
> +	if (soc_dev)
> +		soc_device_unregister(soc_dev);
> +#if IS_ENABLED(CONFIG_MTK_SOCINFO_DEBUG)

Same

> +	debugfs_remove(file_entry);
> +#endif
> +	return 0;
> +}
> +
> +static struct platform_driver mtk_socinfo = {
> +	.probe          = mtk_socinfo_probe,
> +	.remove         = mtk_socinfo_remove,
> +	.driver         = {
> +		.name   = "mtk_socinfo",
> +		.owner  = THIS_MODULE,
> +		.of_match_table = mtk_socinfo_id_table,
> +	},
> +};
> +module_platform_driver(mtk_socinfo);
> +MODULE_AUTHOR("William-TW LIN <william-tw.lin@mediatek.com>");
> +MODULE_DESCRIPTION("Mediatek socinfo driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/soc/mediatek/mtk-socinfo.h b/drivers/soc/mediatek/mtk-socinfo.h
> new file mode 100644
> index 000000000000..8fd490311c8b
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-socinfo.h
> @@ -0,0 +1,213 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_SOCINFO_H__
> +#define __MTK_SOCINFO_H__
> +
> +#define MODULE_NAME	"[mtk-socinfo]"

No, drop.

> +
> +#define DEBUG_FOPS_RO(name)						\
> +	static int mtk_socinfo_##name##_debug_open(struct inode *inode,		\
> +					   struct file *filp)		\
> +	{								\
> +		return single_open(filp, mtk_socinfo_##name##_debug_show,	\
> +				   inode->i_private);			\
> +	}								\
> +	static const struct file_operations mtk_socinfo_##name##_debug_fops = {	\
> +		.owner = THIS_MODULE,					\
> +		.open = mtk_socinfo_##name##_debug_open,			\
> +		.read = seq_read,					\
> +		.llseek = seq_lseek,					\
> +		.release = single_release,				\
> +	}
> +
> +#define MTK_SOCINFO_DENTRY_DATA(name)	{__stringify(name), &mtk_socinfo_##name##_debug_fops}
> +
> +const char *soc_manufacturer = "MediaTek";

global variable in the header? No, drop.

> +
> +struct soc_device *soc_dev;
> +struct dentry *mtk_socinfo_dir, *file_entry;

Why do you need them in the header?

> +
> +struct mtk_socinfo {
> +	struct device *dev;
> +	struct name_data *name_data;
> +	struct socinfo_data *soc_data;
> +};
> +
> +struct efuse_data {
> +	char *nvmem_cell_name;
> +	u32 efuse_data;
> +};
> +
> +struct name_data {
> +	char *soc_name;
> +	char *soc_segment_name;
> +	char *marketing_name;
> +};
> +
> +struct socinfo_data {
> +	char *soc_name;
> +	struct efuse_data *efuse_data;
> +	struct name_data *name_data;
> +	unsigned int efuse_segment_count;
> +	unsigned int efuse_data_count;
> +};
> +
> +enum socinfo_data_index {
> +	INDEX_MT8186 = 0,
> +	INDEX_MT8188,
> +	INDEX_MT8195,
> +	INDEX_MT8192,
> +	INDEX_MT8183,
> +	INDEX_MT8173,
> +	SOCINFO_DATA_LAST_INDEX
> +};
> +
> +/* begin 8186 info */
> +#define mtk_mt8186_EFUSE_DATA_COUNT 1
> +static struct efuse_data mtk_mt8186_efuse_data_info[][mtk_mt8186_EFUSE_DATA_COUNT] = {

Nope. Don't put variable in the header. This code is not yet ready to
upstream.

Work with your colleagues to submit something passing basic coding
style. Please send something reasonable, after doing internal reviews.

Best regards,
Krzysztof


