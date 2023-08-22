Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E8AEE49AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 18:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZZX1qwcSN/Zve5lO59czMHrqLaGMnaz+cybdv1PRn4=; b=vb61lmPrWyVWlJLZtGpQuxe7RM
	yFy0T5Z2FjGVDfNcwsdILU91hBAi8uoG/5k0Hj0T/HEl0NL9boOfkMd9CT+O+87xm8OI/g7ouKTJh
	RaurWGrbdKTpXG3EHrMJpS/wTO3YF2jWgzP3F/XE6iVQ5A/2GZOYs3lpMpzdmXTaHfKoieBB/gFXW
	npsu4wpB88axwP4c79quiTG+ain8DLB4DvIXNvbnVMV+MnaVIYFTeEnkH+4cexlQ2mhk+Z+MPoDQY
	EUqBmAPL/gko+o92Z9na5qdHQOJ7fL4HKUEI+UKttmb6kgptyAGFfq3S4eMi5qTR6s9R+6yk3RFSe
	G0E7RQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYWTT-00GfP6-1L;
	Tue, 22 Aug 2023 18:51:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYWTP-00GfKj-1w;
	Tue, 22 Aug 2023 18:51:29 +0000
Received: from [192.168.2.162] (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A30E6607215;
	Tue, 22 Aug 2023 19:51:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692730282;
	bh=96QsXlllSAmKWT08tjveeH16MND/0hMOFl/BbnCS+9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XcLtWDpBAhL3HbrCDa5nr+o9ID1FljKb/J+OChjddSGuwxJBEEFTsEnZUmHlVAyKg
	 VV8/2oCl30divtpbZeVsuiYS5uLWf+vfogZwM2wOM19DwVm9rChb6QJ8ZlrzGUAuOg
	 Ls1w25kK4CoaG1vVG/qM0bzyM+T0pxw5Qt7bHn3vafNseLmH6s/ILGpZOk1y7a+KP3
	 gyLtyEWVlfJ/gnY7DJ0TAJOOvp1lDGirbLreIH9Q67CBQRqzIDzZeNxd+Iwk/Hzfgb
	 jSbIC+7butS4PHBrKxrq59WQ7hXiiyOMuv2KnFvXqSIqu1sWEywn/E8CWebngBoU2W
	 6/xfqlXkx9rTA==
Message-ID: <8c8bd3ec-a5a4-32e4-45b5-ee16eeeac246@collabora.com>
Date: Tue, 22 Aug 2023 21:51:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com
Cc: bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com,
 security@kernel.org, hackerzheng666@gmail.com, 1395428693sheep@gmail.com,
 alex000young@gmail.com, Collabora Kernel ML <kernel@collabora.com>
References: <20230707092414.866760-1-zyytlz.wz@163.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230707092414.866760-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_115127_766011_E3EE8513 
X-CRM114-Status: GOOD (  24.15  )
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

Hello Zheng,

On 7/7/23 12:24, Zheng Wang wrote:
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> and mtk_jpeg_enc_device_run may be called to start the
> work.
> If we remove the module which will call mtk_jpeg_remove
> to make cleanup, there may be a unfinished work. The
> possible sequence is as follows, which will cause a
> typical UAF bug.
> 
> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> 
> CPU0                  CPU1
> 
>                     |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>   v4l2_m2m_release  |
>     kfree(m2m_dev); |
>                     |
>                     | v4l2_m2m_get_curr_priv
>                     |   m2m_dev->curr_ctx //use
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
> - v2: use cancel_delayed_work_sync instead of cancel_delayed_work suggested by Kyrie.
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 0051f372a66c..6069ecf420b0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1816,6 +1816,7 @@ static void mtk_jpeg_remove(struct platform_device *pdev)
>  {
>  	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
>  
> +	cancel_delayed_work_sync(&jpeg->job_timeout_work);
>  	pm_runtime_disable(&pdev->dev);
>  	video_unregister_device(jpeg->vdev);
>  	v4l2_m2m_release(jpeg->m2m_dev);

AFAICS, there is a fundamental problem here. The job_timeout_work uses
v4l2_m2m_get_curr_priv() and at the time when driver module is unloaded,
all the v4l contexts must be closed and released. Hence the
v4l2_m2m_get_curr_priv() shall return NULL and crash the kernel when
work is executed before cancel_delayed_work_sync().

At the time when mtk_jpeg_remove() is invoked, there shall be no
job_timeout_work running in background because all jobs should be
completed before context is released. If you'll look at
v4l2_m2m_cancel_job(), you can see that it waits for the task completion
before closing context.

You shouldn't be able to remove driver module while it has active/opened
v4l contexts. If you can do that, then this is yours bug that needs to
be fixed.

In addition to this all, the job_timeout_work is initialized only for
the single-core JPEG device. I'd expect this patch should crash
multi-core JPEG devices.

-- 
Best regards,
Dmitry


