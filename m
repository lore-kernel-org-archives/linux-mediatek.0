Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B95C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2TjKwi5DcZeOZ4+hyV6NhPjlqzCiUUr/FGg6umO924=; b=ZuMrsd8mBTKQSU
	Zx4/Mo75FM8AlYqhxnK3FfMsoyGBZNBm4elQlyw7aQE/NNYELHC230NYva3ta/1gtJC5bo1VFpZXj
	hCFUHHigtelF4JMUiI1ugO9tA10kL4LDUZYkYRZZEBdXLzcF+hy1nLA0euxSfoyYIuJWrb8WNphYm
	+dsrDeYZs7tpa5e0BuqLyqwXtIvsgUKl6su9bYpgLdArcevNJolumURzs4j78DtAfy8NtfSNW4ODi
	g4N/4G/oOeiOt9b+6B4rp2dMofTKKjlrzhaeilwaympGaxgclpWmpTgz/wQIHwHtVeP/zN+abhLvn
	DFrlTGZhO1Bmh5wvYxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7zoE-0061SW-Ao; Thu, 13 Jan 2022 13:06:30 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.167])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7znf-0061IE-HX
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 13:05:58 +0000
X-KPN-MessageId: 7231cf3a-7471-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 7231cf3a-7471-11ec-9a2e-005056abbe64;
 Thu, 13 Jan 2022 14:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=8tarm9Eb2y0/4J8TWFMDOhVvR61nl2RNq4vCSEnRqMs=;
 b=c/Zkifzu63OHemWejBDo8h2ACmUytM5X8rOL2ThWoirMgkKL+PpsM8zIDqnfe56no560NqAMlTS/d
 PUv2zs0cNhdlGecj/xXMtNjOet1e9c8R6ruLneDvLebx+vpY34e9kAWdOu6BpbrlUn8eSNLAuHMr2P
 JmbcCTGOZ73xmhfKIPtalRV8cWnwzSSB1/mdmfSFTO3o5takA2rVaRie3tEYycAX7vatcGDX2+aqd3
 w/MzTmobswtua7Jh/E/hF6qDrPBK1CF4ReX9sMbmAd+QDFptvspXs58W0VioHqweriN2GIhT0bOIvU
 0V0qBPWoEMScwjAmwS+4fJtSlfP/BXg==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|SkHocp79pq2s1h7HGJF5ETDSzAV9Gk+XSv+yl7/l4u7ozfQ8zlQl05YyLtTqFcm
 vHE1B3bvHwCBPHQrpa+0rmQ==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id 87f19937-7471-11ec-83ab-005056ab1411;
 Thu, 13 Jan 2022 14:05:51 +0100 (CET)
Message-ID: <d66a7182-825f-b9a3-afc9-c0117ea846a2@xs4all.nl>
Date: Thu, 13 Jan 2022 14:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v2 09/13] media: mtk-vcodec: Drop unnecessary call to
 platform_get_resource()
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220111002314.15213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220111002314.15213-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220111002314.15213-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_050555_910778_AC4E9560 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Prabhakar,

I'm skipping this patch since if I am not mistaken this patch fixes this as well
(as part of a larger overhaul):

https://patchwork.linuxtv.org/project/linux-media/patch/20220113041055.25213-9-yunfei.dong@mediatek.com/

I posted a PR for that series, so that's on the way in.

Please confirm so I can mark your patch as Superseded.

Regards,

	Hans

On 11/01/2022 01:23, Lad Prabhakar wrote:
> mtk_vcodec_probe() calls platform_get_resource(pdev, IORESOURCE_IRQ, ..)
> to check if IRQ resource exists and later calls platform_get_irq(pdev, ..)
> to get the actual IRQ.
> 
> This patch drops an unnecessary call to platform_get_resource() and
> checks the return value of platform_get_irq(pdev, ..) to check if the
> IRQ line is valid.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * No change.
> ---
>  .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c    | 11 ++++-------
>  .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c    | 10 +++-------
>  2 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 40c39e1e596b..1509c2a4de84 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -200,7 +200,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  {
>  	struct mtk_vcodec_dev *dev;
>  	struct video_device *vfd_dec;
> -	struct resource *res;
>  	phandle rproc_phandle;
>  	enum mtk_vcodec_fw_type fw_type;
>  	int i, ret;
> @@ -244,14 +243,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (res == NULL) {
> -		dev_err(&pdev->dev, "failed to get irq resource");
> -		ret = -ENOENT;
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
>  		goto err_res;
> -	}
>  
> -	dev->dec_irq = platform_get_irq(pdev, 0);
> +	dev->dec_irq = ret;
> +
>  	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
>  	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
>  			mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index aeaecb8d416e..86e70d826754 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -236,7 +236,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  {
>  	struct mtk_vcodec_dev *dev;
>  	struct video_device *vfd_enc;
> -	struct resource *res;
>  	phandle rproc_phandle;
>  	enum mtk_vcodec_fw_type fw_type;
>  	int ret;
> @@ -280,14 +279,11 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		goto err_res;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (res == NULL) {
> -		dev_err(&pdev->dev, "failed to get irq resource");
> -		ret = -ENOENT;
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
>  		goto err_res;
> -	}
>  
> -	dev->enc_irq = platform_get_irq(pdev, 0);
> +	dev->enc_irq = ret;
>  	irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
>  	ret = devm_request_irq(&pdev->dev, dev->enc_irq,
>  			       mtk_vcodec_enc_irq_handler,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
