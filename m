Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F18C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 17:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11FF610FC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 17:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B11FF610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IFHMWpuP70px4DYQGZgxHx/m6mX90fpHYgO4mGMFCuo=; b=L3CmyDl4WUUp/paUtwkM1beWWI
	zTlzoMJOQdtTTGyaJnikd9I56urPTYhiwAuB+W+/qoF8wZXnkUiYNo3HzarLPkmQgGXOAbej13zjt
	Mv4NP/A6mdCr6NLLkIbHHsChlaZOvzxLmYXXshM7eX/1jvLXX5rlF0KRmxke6haPsDdfdMZZbLnc2
	c+yEBGoIMQ0GtPeeatVjGUQW9OMwJFnh7J32ZQZGAvQhnaEOz4TtTNZu18V1DFR/Di9+ChEuF1nLH
	o8vlh/mEoTGxYevyOL73sr8BwhTy+WHp8MUtPwzG9qUwyz1OL/kadv9v8+yVs/bfZIsSqrhNWlNH6
	0fLnuBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC3kN-00D3AM-3P; Fri, 06 Aug 2021 17:35:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC3kA-00D37N-0o; Fri, 06 Aug 2021 17:34:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id c9so11989597wri.8;
 Fri, 06 Aug 2021 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gV269OIUhGTszW6Q8c+CYkGmUwrY5qfXqHnqAFsmSzA=;
 b=utNyYGZ+djwSEXtVwd3D4fowWShjRbQriv9sgUerDLdjj3US8bktFZlwMBygR2q4z7
 u9dOKN3DD7xDtziBa3EftFmyCmfzax3i1jb2iR1Bzzya0RhYOEHUNLZmKxBNSks5AqHe
 lgIiMO4R4x3kqe/SfuUpXu5fKdnZHIoRMObnd/WRAxgK0AGkDavMsajg/Qm4P0Fix/Px
 LKCrqR3TL50j9kTpyGqrOR2M74di1m8jMl09uKa3qAbm6AW+Muc/iE7Wrn8H/c/dXY/N
 zKq1PwsytRJgrHB6dcueS9fxl976/1ckPcL1jTS/Sw9sS5w0kw3XeDdD9AsXvYyqK/c8
 yVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gV269OIUhGTszW6Q8c+CYkGmUwrY5qfXqHnqAFsmSzA=;
 b=VRNHq4+GjRYG1G6D6+IRYZcXcVGYnz2CX6qQMmRY4anbpJ7huWcmYJIlNxiP+YnErX
 PEX4bOE1Hx92+7W6uAkHImRWoffHzZQk1PYA7JZXmJ9cKhx8ikvU0K/ELbLJq75CXoiu
 kjWC/ot1dv9t9PzHb54+KxK8eL5epsWiNDxIILSAxoC29dayvy3Bwqzd7eqtt52+qgc4
 UQssQfpl9z4rEqE+3jN2a73dZZuFb5/5B8ody7Xua2vw77l7l+kNlooLtisJmGwPApgm
 69Cao4Z2g/HoXW9SBb5xMCgCLEsTEFJYQONb1MVomnoQ0gqs7hjAxGNDY25/S4wVQ2tw
 zBFQ==
X-Gm-Message-State: AOAM5339KeO7JVrQz2vjIdG/wjqOq3K3PxTHf53ApWwp25wXqeHIECCd
 0yJ97gyKSkUK8pNHcT88CuM8f1q20KDWyQ==
X-Google-Smtp-Source: ABdhPJy5hRKXobHagFL31FeoP4BBTEq9NAEGv6N3mFMMrYd2T20tIldbtQDUo0iGUjBgFsneu5wqEQ==
X-Received: by 2002:adf:f544:: with SMTP id j4mr12260576wrp.51.1628271288260; 
 Fri, 06 Aug 2021 10:34:48 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id p15sm9060219wmi.29.2021.08.06.10.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 10:34:47 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] soc: mediatek: mmsys: Add reset controller support
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <91bee4b6-2b43-e4ef-52ab-72e4e0b0c7b3@gmail.com>
Date: Fri, 6 Aug 2021 19:34:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_103450_129875_7C772D72 
X-CRM114-Status: GOOD (  24.09  )
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



On 14/07/2021 12:11, Enric Balletbo i Serra wrote:
> Among other features the mmsys driver should implement a reset
> controller to be able to reset different bits from their space.
> 
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

I'm happy to take this, as soon as we have the updated binding description.

Regards,
Matthias

> ---
> 
> (no changes since v1)
> 
>  drivers/soc/mediatek/mtk-mmsys.c | 69 ++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.h |  2 +
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index e681029fe804..6ac4deff0164 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -4,10 +4,12 @@
>   * Author: James Liao <jamesjj.liao@mediatek.com>
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>  
>  #include "mtk-mmsys.h"
> @@ -55,6 +57,8 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  struct mtk_mmsys {
>  	void __iomem *regs;
>  	const struct mtk_mmsys_driver_data *data;
> +	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
> +	struct reset_controller_dev rcdev;
>  };
>  
>  void mtk_mmsys_ddp_connect(struct device *dev,
> @@ -91,6 +95,59 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> +static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
> +				  bool assert)
> +{
> +	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +	int i;
> +
> +	spin_lock_irqsave(&mmsys->lock, flags);
> +
> +	reg = readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
> +
> +	if (assert)
> +		reg &= ~BIT(id);
> +	else
> +		reg |= BIT(id);
> +
> +	writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
> +
> +	spin_unlock_irqrestore(&mmsys->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mtk_mmsys_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return mtk_mmsys_reset_update(rcdev, id, true);
> +}
> +
> +static int mtk_mmsys_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return mtk_mmsys_reset_update(rcdev, id, false);
> +}
> +
> +static int mtk_mmsys_reset(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	int ret;
> +
> +	ret = mtk_mmsys_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(1000, 1100);
> +
> +	return mtk_mmsys_reset_deassert(rcdev, id);
> +}
> +
> +static const struct reset_control_ops mtk_mmsys_reset_ops = {
> +	.assert = mtk_mmsys_reset_assert,
> +	.deassert = mtk_mmsys_reset_deassert,
> +	.reset = mtk_mmsys_reset,
> +};
> +
>  static int mtk_mmsys_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -111,6 +168,18 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	spin_lock_init(&mmsys->lock);
> +
> +	mmsys->rcdev.owner = THIS_MODULE;
> +	mmsys->rcdev.nr_resets = 32;
> +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> +	mmsys->rcdev.of_node = pdev->dev.of_node;
> +	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
> +		return ret;
> +	}
> +
>  	mmsys->data = of_device_get_match_data(&pdev->dev);
>  	platform_set_drvdata(pdev, mmsys);
>  
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index 11388961dded..f9f9e12ceab8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -66,6 +66,8 @@
>  #define DPI_SEL_IN_BLS				0x0
>  #define DSI_SEL_IN_RDMA				0x1
>  
> +#define MMSYS_SW0_RST_B				0x140
> +
>  struct mtk_mmsys_routes {
>  	u32 from_comp;
>  	u32 to_comp;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
