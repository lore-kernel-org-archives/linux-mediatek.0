Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB78C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 11:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A55F60FC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 11:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A55F60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvEBGn8yPHYRzTchLMzpWs94aHd4xJNxMHbF2z16ng4=; b=4WryblT2nDSG3dE/JX20tXW4VL
	m3FXeyEO2vm71RwCU8qM9S5JtUI+S/P9rFlXu6rJfyKELO/yW54GYdxoWtsrbfUBHDP5qjgXCpDJe
	/CFM0EBPzZNpd8nTMGR40nCE6ghowDAtv+eJ4GK7HtFa8kIodABBs9LJgn7vfr13OXHPmNHlSrTju
	G3PYr3nBuyYxYxAOz5FPZcEp/nj5lnuejqT8L+lrPfpPUIuv/LN3HF8esQRKU5Od2OoYDM3goH8hJ
	GaqjRC8KjbDFNJ05EZYQE/9T0Q1cA7zW9cUZ8mmD9TCZ6LCrOlDn6Y7C3lVjLDcOrg7mQbUxxB6q5
	YMLCiJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgQHM-00An9P-1I; Fri, 29 Oct 2021 11:42:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgQH5-00An4S-1G; Fri, 29 Oct 2021 11:42:20 +0000
Received: from [IPv6:2a02:810a:880:f54:6141:93b5:19a6:af87] (unknown
 [IPv6:2a02:810a:880:f54:6141:93b5:19a6:af87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7CB8E1F45953;
 Fri, 29 Oct 2021 12:42:16 +0100 (BST)
Subject: Re: [PATCH v8, 04/17] media: mtk-vcodec: Build decoder pm file as
 module
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Collabora Kernel ML <kernel@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-5-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
Date: Fri, 29 Oct 2021 13:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029035527.454-5-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_044219_351336_52076CBC 
X-CRM114-Status: GOOD (  21.93  )
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



On 29.10.21 05:55, Yunfei Dong wrote:
> Need to build decoder pm file as module for master and comp
> use the same pm interface.

Do you still use the component framework in this patchset?
In the cover letter you write: "- Use of_platform_populate to manage multi hardware, not component framework for patch 4/15"
If that frameworks is not used anymore you should also change the commit log, and maybe this patch is not needed anymore?

Thanks,
Dafna
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v8: add new patch to build pm file as module
> ---
>   drivers/media/platform/mtk-vcodec/Makefile            | 6 ++++--
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 9 +++++++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index ca8e9e7a9c4e..5d36e05535d7 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -2,7 +2,8 @@
>   
>   obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
>   				       mtk-vcodec-enc.o \
> -				       mtk-vcodec-common.o
> +				       mtk-vcodec-common.o \
> +				       mtk-vcodec-dec-common.o
>   
>   mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		vdec/vdec_vp8_if.o \
> @@ -14,7 +15,8 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		mtk_vcodec_dec.o \
>   		mtk_vcodec_dec_stateful.o \
>   		mtk_vcodec_dec_stateless.o \
> -		mtk_vcodec_dec_pm.o \
> +
> +mtk-vcodec-dec-common-y := mtk_vcodec_dec_pm.o
>   
>   mtk-vcodec-enc-y := venc/venc_vp8_if.o \
>   		venc/venc_h264_if.o \
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 20bd157a855c..09a281e3065a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -77,12 +77,14 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
>   	put_device(pm->larbvdec);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
>   
>   void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
>   {
>   	pm_runtime_disable(pm->dev);
>   	put_device(pm->larbvdec);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
>   
>   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>   {
> @@ -94,6 +96,7 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
>   
>   void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
>   {
> @@ -103,6 +106,7 @@ void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
>   	if (ret)
>   		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
>   
>   void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
>   {
> @@ -129,6 +133,7 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
>   	for (i -= 1; i >= 0; i--)
>   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
>   
>   void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
>   {
> @@ -139,3 +144,7 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
>   	for (i = dec_clk->clk_num - 1; i >= 0; i--)
>   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
>   }
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Mediatek video decoder driver");
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
