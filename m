Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DCBC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:36:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E4B221F8
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55E4B221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lVNOS7PUAKtwxKY3xVjqNqxNibAaVOarrwSD1p1H760=; b=IkSdgx1hOdV4Uif3aSiBhUXZn
	+H1KLOgG7EB/HI0hvHnvtT5LoPxq1lahsDAfprkugcAMahdYBT8Qk7vlWMExgpBdttTxKIVOXe60k
	ae9sd9EYybLVCnlbTsxqpcUSYZlXGOjG7V46lwdphF1y/0mPJrDZsCwF573hSQILVh5GUIoKeSanp
	H1Fb6WcaDjhA/eLPpBtSwK/wyhO1AvZlPZLcQ+Ls5m++twZeYduTR32CZjdrTYYPk/bGr1kGUbZF+
	anApYtI0oIkOfIhMkMDlwL3rvjjMUqqcz2nPDq5rC6KK9gnqg5W2h8P8yFzVzWPzn0zJ/D6qdIbK5
	qWKuhSdsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwUiC-0000BN-Gd; Mon, 04 Jan 2021 18:36:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwUi4-00007E-BA
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:36:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id y23so191363wmi.1
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VcMfSSwNdSOxEd5dJy/2gbjQYKroue8Hj5qE0mEd/LI=;
 b=nLkvHP1hgzQdgENVXqsGNMFNdD1I9EHbRnziEi54DWLtNOZvie2eR4CU2sqag2LMwU
 YZgqOU3yQcSVVjAnjvBDuhRljq7ay80IJ6Rvf7/I1o4JAlpJowNI7kwqEJaSdbDEhgR8
 u9KFTfic/fAWKYzkLB26ypwxiq8MXhtY5UDeYlzSgts3Lw1/yJNkvuBJCstjrsWhSq1d
 nmn3MJiw/sJZfCZYeE112MpcSVhWKlaHuAwmx+GYPdir6b5ks19ciFX9tBRdnE3xSoGc
 GQlO6VBa1iFXwQu3Xa0eIz1yuLaIjyL7koGs8XUdZRUlrVQoeY/dcuEMZTqi//u2epx6
 b3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VcMfSSwNdSOxEd5dJy/2gbjQYKroue8Hj5qE0mEd/LI=;
 b=tzcghTzAnUKt32O0j6f5xTXEo9D5VqYXXkQC0Uh01fV8rF2PekzlYPp9fykkQ49E6n
 AFI7MjhKvmPkjVFFNI5QVFWYHrg9GfvNKSHJnZM1AVlb5FHe5S87n8BidFJQ1lJnULno
 EKd/+UuUxnnt00lPPDQhcB8rhTy1cyOsLiF43peXZec6Vgd43uzN+ch6yF8DmfmRpkAf
 NgzSBOHef9AnkcRA+WQrEZKewqcpFMw1NC2IPPHhRoyOr7GUrrbFAvaKm0j+hq6HIHn6
 nUBDsTcW7c0vm5p9C6ogNRag5deF95mjDcS09DJ+LYzx1/eaTgb5seufoPCHX8PkgBQ6
 Q6Xg==
X-Gm-Message-State: AOAM530+jKUKe2QqtCqy+g24pFUMpF6F13J+R4L49OoxHpzNIAoJDCmD
 NkOWiE36XwgKsh1v0r6PLBjM4A==
X-Google-Smtp-Source: ABdhPJzELvss8TLuNgoP16gx9BnAupDOxbh0Wn4nAypeRpHgDOw6kAZ1sZnbdXYevsvWrmsQ3sVmJg==
X-Received: by 2002:a1c:9acb:: with SMTP id c194mr178273wme.43.1609785363181; 
 Mon, 04 Jan 2021 10:36:03 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id h184sm298255wmh.23.2021.01.04.10.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 10:36:02 -0800 (PST)
To: Henry Chen <henryc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>,
 Mark Brown <broonie@kernel.org>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-9-git-send-email-henryc.chen@mediatek.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH V6 08/13] interconnect: mediatek: Add interconnect
 provider driver
Message-ID: <c8b951b0-6412-d905-99e1-6350283b57c1@linaro.org>
Date: Mon, 4 Jan 2021 20:36:04 +0200
MIME-Version: 1.0
In-Reply-To: <1608790134-27425-9-git-send-email-henryc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_133604_487894_2E19AC4B 
X-CRM114-Status: GOOD (  25.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/24/20 08:08, Henry Chen wrote:
> Introduce Mediatek MT6873/MT8183/MT8192 specific provider driver
> using the interconnect framework.
> 
>               ICC provider         ICC Nodes
>                                ----          ----
>               ---------       |CPU |   |--- |VPU |
>      -----   |         |-----  ----    |     ----
>     |DRAM |--|DRAM     |       ----    |     ----
>     |     |--|scheduler|----- |GPU |   |--- |DISP|
>     |     |--|(EMI)    |       ----    |     ----
>     |     |--|         |       -----   |     ----
>      -----   |         |----- |MMSYS|--|--- |VDEC|
>               ---------        -----   |     ----
>                 /|\                    |     ----
>                  |change DRAM freq     |--- |VENC|
>               ----------               |     ----
>              |  DVFSR   |              |
>              |          |              |     ----
>               ----------               |--- |IMG |
>                                        |     ----
>                                        |     ----
>                                        |--- |CAM |
>                                              ----
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>   drivers/interconnect/Kconfig            |   1 +
>   drivers/interconnect/Makefile           |   1 +
>   drivers/interconnect/mediatek/Kconfig   |  13 ++
>   drivers/interconnect/mediatek/Makefile  |   3 +
>   drivers/interconnect/mediatek/mtk-emi.c | 330 ++++++++++++++++++++++++++++++++
>   5 files changed, 348 insertions(+)
>   create mode 100644 drivers/interconnect/mediatek/Kconfig
>   create mode 100644 drivers/interconnect/mediatek/Makefile
>   create mode 100644 drivers/interconnect/mediatek/mtk-emi.c
> 
> diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
> index 5b7204e..e939f5a 100644
> --- a/drivers/interconnect/Kconfig
> +++ b/drivers/interconnect/Kconfig
> @@ -13,5 +13,6 @@ if INTERCONNECT
>   
>   source "drivers/interconnect/imx/Kconfig"
>   source "drivers/interconnect/qcom/Kconfig"
> +source "drivers/interconnect/mediatek/Kconfig"

Sort alphabetically please.

>   
>   endif
> diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
> index d203520..0643a24 100644
> --- a/drivers/interconnect/Makefile
> +++ b/drivers/interconnect/Makefile
> @@ -6,3 +6,4 @@ icc-core-objs				:= core.o bulk.o
>   obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
>   obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
>   obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
> +obj-$(CONFIG_INTERCONNECT_MTK)		+= mediatek/

Ditto.

> diff --git a/drivers/interconnect/mediatek/Kconfig b/drivers/interconnect/mediatek/Kconfig
> new file mode 100644
> index 0000000..972d3bb
> --- /dev/null
> +++ b/drivers/interconnect/mediatek/Kconfig
> @@ -0,0 +1,13 @@
> +config INTERCONNECT_MTK
> +	bool "Mediatek Network-on-Chip interconnect drivers"
> +	depends on ARCH_MEDIATEK
> +	help
> +	  Support for Mediatek's Network-on-Chip interconnect hardware.
> +
> +config INTERCONNECT_MTK_EMI
> +	tristate "Mediatek EMI interconnect driver"
> +	depends on INTERCONNECT_MTK
> +	depends on (MTK_DVFSRC && OF)

Would it be possible to enable COMPILE_TEST?

> +	help
> +	  This is a driver for the Mediatek Network-on-Chip on DVFSRC-based
> +	  platforms.
> diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
> new file mode 100644
> index 0000000..353842b
> --- /dev/null
> +++ b/drivers/interconnect/mediatek/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_INTERCONNECT_MTK_EMI) += mtk-emi.o
> \ No newline at end of file
> diff --git a/drivers/interconnect/mediatek/mtk-emi.c b/drivers/interconnect/mediatek/mtk-emi.c
> new file mode 100644
> index 0000000..9670077
> --- /dev/null
> +++ b/drivers/interconnect/mediatek/mtk-emi.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.

Just a reminder that the year should be updated when you re-submit.

> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk_dvfsrc.h>
> +#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
> +#include <dt-bindings/interconnect/mtk,mt6873-emi.h>

Nit: Alphanumeric order please.

[..]
> +static int emi_icc_remove(struct platform_device *pdev);
> +static int emi_icc_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	const struct mtk_icc_desc *desc;
> +	struct device *dev = &pdev->dev;
> +	struct icc_node *node;
> +	struct icc_onecell_data *data;
> +	struct icc_provider *provider;
> +	struct mtk_icc_node **mnodes;
> +	size_t num_nodes, i, j;
> +	int ret;
> +
> +	match = of_match_node(emi_icc_of_match, dev->parent->of_node);
> +
> +	if (!match) {
> +		dev_err(dev, "invalid compatible string\n");
> +		return -ENODEV;
> +	}
> +
> +	desc = match->data;
> +	mnodes = desc->nodes;
> +	num_nodes = desc->num_nodes;
> +
> +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> +	if (!provider)
> +		return -ENOMEM;
> +
> +	data = devm_kzalloc(dev, struct_size(data, nodes, num_nodes),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	provider->dev = pdev->dev.parent;
> +	provider->set = emi_icc_set;
> +	provider->aggregate = emi_icc_aggregate;
> +	provider->xlate = of_icc_xlate_onecell;
> +	INIT_LIST_HEAD(&provider->nodes);
> +	provider->data = data;
> +
> +	ret = icc_provider_add(provider);
> +	if (ret) {
> +		dev_err(&pdev->dev, "error adding interconnect provider\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num_nodes; i++) {
> +		node = icc_node_create(mnodes[i]->id);
> +		if (IS_ERR(node)) {
> +			ret = PTR_ERR(node);
> +			goto err;
> +		}
> +
> +		node->name = mnodes[i]->name;
> +		node->data = mnodes[i];
> +		icc_node_add(node, provider);
> +
> +		for (j = 0; j < mnodes[i]->num_links; j++)
> +			icc_link_create(node, mnodes[i]->links[j]);
> +
> +		data->nodes[i] = node;
> +	}
> +	data->num_nodes = num_nodes;
> +
> +	platform_set_drvdata(pdev, provider);
> +
> +	return 0;
> +err:
> +	icc_nodes_remove(provider);

Also call icc_provider_del() to restore the original state on error.

Thanks,
Georgi

> +	return ret;
> +}
> +
> +static int emi_icc_remove(struct platform_device *pdev)
> +{
> +	struct icc_provider *provider = platform_get_drvdata(pdev);
> +
> +	icc_nodes_remove(provider);
> +	return icc_provider_del(provider);
> +}
> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
