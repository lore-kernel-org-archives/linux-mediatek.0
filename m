Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631E3C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:07:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2D16100C
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2D16100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J72qvHfz3LKnGAywzO/hyl84tYS+VBPgu3SF8XJ4eUA=; b=PuChpbwpbL/V4nP672sNVw9AHQ
	2qzgdH9LYKwR/VLPmYS/brNVtRNFfc7hG+bln++QHRetdujnws0HaXGM6axB3wCwll8l3m3RqzRR9
	R1GGYhT+WtfIqWu0dvHOvviHSKmM6K8Cv5qE081Yyl/8ds2H9qYvJhEk25fHtiPF3adKzwjUiLumq
	h/LJbxiWb/GFpX/BRviahrorWXk8agY08qS1L9x2U8HoUCn9yBtXuX7fVxyHAaUGWd8LBWJ2XK84I
	lxWGP3rMbx0G1urqSnqIMh0um9x45c3ZNYUwj0v8ldxMT8lCtZC252ocsefdjZzcwn5ziGtwQT7e0
	Myca8Oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5NMh-008Y10-W6; Mon, 19 Jul 2021 07:07:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5NMU-008Xyq-7e; Mon, 19 Jul 2021 07:06:47 +0000
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown
 [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4B571F422EC;
 Mon, 19 Jul 2021 08:06:43 +0100 (BST)
Subject: Re: [PATCH v2, 01/14] media: mtk-vcodec: Get numbers of register
 bases from DT
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Collabora Kernel ML <kernel@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-2-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <77ec9eec-0b93-102c-4e6e-a1a491d0ae7a@collabora.com>
Date: Mon, 19 Jul 2021 09:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-2-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_000646_463019_052BF753 
X-CRM114-Status: GOOD (  27.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 17.07.21 10:12, Yunfei Dong wrote:
> Different platform may has different numbers of register bases. Gets the
> numbers of register bases from DT (sizeof(u32) * 4 bytes for each).
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: no changes
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 38 ++++++++++++++-----
>   1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 55ae198dbcf9..d3f34cd04759 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -78,6 +78,31 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
>   	return IRQ_HANDLED;
>   }
>   
> +static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
> +{
> +	struct platform_device *pdev = dev->plat_dev;
> +	int reg_num, i, ret = 0;
> +
> +	/* Sizeof(u32) * 4 bytes for each register base. */
> +	reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
> +		sizeof(u32) * 4);

'reg_num' can also be negative if the 'of_..' function fails. So this case should
also be checked

> +	if (!reg_num || reg_num > NUM_MAX_VDEC_REG_BASE) {
> +		dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < reg_num; i++) {
> +		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
> +		if (IS_ERR((__force void *)dev->reg_base[i])) {
> +			ret = PTR_ERR((__force void *)dev->reg_base[i]);
> +			break;

you can replace this two lines with "return PTR_ERR((__force void *)dev->reg_base[i]);"

thanks,
Dafna

> +		}
> +		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
> +	}
> +
> +	return ret;
> +}
> +
>   static int fops_vcodec_open(struct file *file)
>   {
>   	struct mtk_vcodec_dev *dev = video_drvdata(file);
> @@ -206,7 +231,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   	struct resource *res;
>   	phandle rproc_phandle;
>   	enum mtk_vcodec_fw_type fw_type;
> -	int i, ret;
> +	int ret;
>   
>   	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>   	if (!dev)
> @@ -238,14 +263,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_dec_pm;
>   	}
>   
> -	for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
> -		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
> -		if (IS_ERR((__force void *)dev->reg_base[i])) {
> -			ret = PTR_ERR((__force void *)dev->reg_base[i]);
> -			goto err_res;
> -		}
> -		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
> -	}
> +	ret = mtk_vcodec_get_reg_bases(dev);
> +	if (ret)
> +		goto err_res;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>   	if (res == NULL) {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
