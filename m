Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C34C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 10:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05CC61246
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 10:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F05CC61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JX9NDDu8ZjgEXyKJYQfAtERPAkb/mFL6833VxYynT/0=; b=ht5/9PyoeZFRJ2
	Q7sen9cOj3QDJ1l9kcIuEYSbnT0aS6itxZCOiWsGE/fhM1FydnGL87OmO5joe3eRK3LRkjclmIYOS
	05Cr1X3/d1+yljbQc6KcqrL/OxCbVJfLpAKbIfN7tCPvZTSqQgzLoQWXI8NHY37llO77FhMRxk/ht
	9R5ZkoLh0Py6jsy7RNSx1Qscw6NGHBSTUqe82RFdTFE46eHJ9kUMgaHbP/pEPxnxK8nqBKmM/B+vg
	8iMqxH6cU4X32xgDU+/BhevaKs95fhJaFtoEfeiZ/QEfV/dUdRVIi3NtZee6ZZDqgoGtex81Dd1Lb
	eYWGXtSWYkQWL/GoSjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI6mO-00GEuc-6h; Mon, 23 Aug 2021 10:02:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI6mJ-00GEqp-66
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 10:02:07 +0000
Received: by mail-pj1-x1033.google.com with SMTP id j1so11592036pjv.3
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a83R/B9Lm/qgVoAlx8qnij+Ld74e3iDN4AlBrXWn3Xk=;
 b=YZAtljkGqZOJTdpRv6gq3v0m2WWXbAf3uPSSoPDrKNT7qchBAg69QpaFsao25+MF+w
 HtHHW7Xa3yHKhgbPyYjKcjpcuIY67qgVoPIzkF+0JqcXxgMhml9BkAsrUVsEi3Hvr/Yw
 ghdLNA3EoSYqVEhybvndDhd3KlSRoZ9Ctz7bZQJa4arwFKkUbcwzvwto9nAuG4oNm9sb
 U8Ln9GL1z6ZUsb3QdhRRTO5kqRTyf9FVQg/n+4XuaLKkZYzDbGN50oWhWdoDDT+5QYXG
 K2qKN2aKdOwgp6ik/5WSHkHQsbvQSBjSfbAXPs4dbrsrD2J+gdq+fzTXW9ESrBIurWGT
 Uu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a83R/B9Lm/qgVoAlx8qnij+Ld74e3iDN4AlBrXWn3Xk=;
 b=Fspf/Eh71DysjQ9JjhRHiasAJ1fcFB9yP6rfIWCFuEgzEd9H1C1V84MaVS0sv6viIl
 p0T4HVAtMXqhKtmWmGULTJ+Jk9z0zPAF66y7KkHH/SKzs9AVz0Wroeu6ZmiMaqPQmO2d
 R0qiu2LtcqEDvJ7Pr0QEb0blkrMMEsSEIOgZ7gpYf4q9eULYbm4XFRhuq7JuXXoN+PMQ
 siMTpA4rnp34xPJgHWqiZ3oMquoT/hp9jxkyNxa170cyQJ8YzDM/BGQc2MX9LcaNy0vt
 KpKKz+5jjnd1OzQPS8GSnQlPm3SXfeFHO17bnOMyk31uQT/wiVhkVKqYe6qA9hAaNidp
 oxmg==
X-Gm-Message-State: AOAM531T6UqGPfdYl3lvluVD9YHCvsglHSriNZ/vF85Rrqfy41z96JpL
 ncREyRQT/QosSBa6UB48oDJWKA==
X-Google-Smtp-Source: ABdhPJz+hz17o/gcGS8iJUfbpeh537f4BVJ+xiYeyWgkJMD344jXhdt++YyEDBEi6/n1J0b8QZSPZQ==
X-Received: by 2002:a17:90a:4584:: with SMTP id
 v4mr19165244pjg.169.1629712906127; 
 Mon, 23 Aug 2021 03:01:46 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:bc5a:af6a:3f08:a084])
 by smtp.gmail.com with ESMTPSA id g13sm15458871pfo.53.2021.08.23.03.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 03:01:45 -0700 (PDT)
Date: Mon, 23 Aug 2021 18:01:40 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 2/9] media: mtk-vcodec: Use component framework to manage
 encoder hardware
Message-ID: <YSNyBE4yF6VDt3cC@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-3-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-3-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_030203_269541_34CF5372 
X-CRM114-Status: GOOD (  29.19  )
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

On Mon, Aug 16, 2021 at 06:59:27PM +0800, Irui Wang wrote:
> +static struct component_match *mtk_venc_match_add(struct mtk_vcodec_dev *dev)
> +{
> +	struct platform_device *pdev = dev->plat_dev;
> +	struct component_match *match = NULL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_venc_comp_ids); i++) {
> +		enum mtk_venc_hw_id comp_idx;
> +		struct device_node *comp_node;
> +		const struct of_device_id *of_id;
To be neat, prefer to define the variables outside of the loop (i.e. at the beginning of the function).

> +
> +		comp_node = of_find_compatible_node(NULL, NULL,
> +			mtk_venc_comp_ids[i].compatible);
> +		if (!comp_node)
> +			continue;
> +
> +		of_id = of_match_node(mtk_venc_comp_ids, comp_node);
> +		if (!of_id) {
> +			dev_err(&pdev->dev, "Failed to get match node\n");
Need to call of_node_put() actually, but see comment below.

> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		comp_idx = (enum mtk_venc_hw_id)of_id->data;
For getting the comp_idx, mtk_venc_comp_ids[i].data should be sufficient.  If so, of_match_node() can be removed so that the error handling path won't need to call of_node_put().

> @@ -239,6 +314,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	phandle rproc_phandle;
>  	enum mtk_vcodec_fw_type fw_type;
>  	int ret;
> +	struct component_match *match = NULL;
It doesn't need to be initialized.

> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (res == NULL) {
> -		dev_err(&pdev->dev, "failed to get irq resource");
> -		ret = -ENOENT;
> -		goto err_res;
> -	}
> +		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +		if (!res) {
> +			dev_err(&pdev->dev, "failed to get irq resource");
> +			ret = -ENOENT;
> +			goto err_res;
> +		}
res is not used.  Can be removed in next version or in another patch.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
> new file mode 100644
> index 000000000000..4e6a8a81ff67
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/module.h>
Would be better to maintain an order.

> +#include "mtk_vcodec_enc_hw.h"
> +#include "mtk_vcodec_enc.h"
Would be better to maintain an order.

> +static irqreturn_t mtk_enc_comp_irq_handler(int irq, void *priv)
> +{
> +	struct mtk_venc_comp_dev *dev = priv;
> +	struct mtk_vcodec_ctx *ctx;
> +	unsigned long flags;
> +	void __iomem *addr;
> +
> +	spin_lock_irqsave(&dev->master_dev->irqlock, flags);
> +	ctx = dev->curr_ctx;
> +	spin_unlock_irqrestore(&dev->master_dev->irqlock, flags);
> +	if (!ctx)
> +		return IRQ_HANDLED;
Here is a read lock for the curr_ctx.  The patch doesn't contain the write lock part.

I am not sure if the following situation would be happened:
1. curr_ctx is not NULL.
2. mtk_enc_comp_irq_handler() gets the curr_ctx.
3. The curr_ctx has been destroyed somewhere.
4. mtk_enc_comp_irq_handler() finds the ctx is not NULL so that it continues to execute.
5. Something wrong in latter mtk_enc_comp_irq_handler() because the ctx has been destroyed.

Does it make more sense to set curr_ctx to NULL to indicate the ownership has been transferred to mtk_enc_comp_irq_handler()?  For example:

spin_lock_irqsave(...);
ctx = dev->curr_ctx;
dev->curr_ctx = NULL;
spin_unlock_irqrestore(...);

> +static int mtk_venc_comp_bind(struct device *dev,
> +			      struct device *master, void *data)
> +{
> +	struct mtk_venc_comp_dev *comp_dev = dev_get_drvdata(dev);
> +	struct mtk_vcodec_dev *master_dev = data;
> +	int i;
> +
> +	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
> +		if (dev->of_node != master_dev->enc_comp_node[i])
> +			continue;
> +
> +		/*add component device by order*/
> +		if (comp_dev->core_id == MTK_VENC_CORE0)
> +			master_dev->enc_comp_dev[MTK_VENC_CORE0] = comp_dev;
> +		else if (comp_dev->core_id == MTK_VENC_CORE1)
> +			master_dev->enc_comp_dev[MTK_VENC_CORE1] = comp_dev;
> +		else
> +			return -EINVAL;
if (comp_dev->core_id < 0 || comp_dev->core_id >= MTK_VENC_HW_MAX)
    return -EINVAL;

master_dev->enc_comp_dev[comp_dev->core_id] = comp_dev;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
