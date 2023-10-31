Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DBDC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 05:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2axISbsw723dKU4BEgqutDQIWsYQsGKvmhqOnKx/Gk=; b=G/IETVGMz0zuy99mSS1euYWpS7
	ta3rJeDjeY8zLlsu7kGoSJiiJs6A7lmYIyToHpi2bZxnEndGiCaV76RuE7ROkbYV07seKJ8engA8Y
	P6eLgGFR2U0Q12AY8YIRIK5yyYl7ZdJJWDV7UCTKNWb6mqTU/07Q11aXZfbitz7GOPAHBPMsNceCL
	iMhgcfmvJ5nv2n8O0Nc4Pp9Yw7zoWQx0AxfLma3Yf0ekza7xHKMUhmxfiVvUHIceO9DibDLFJUZ3A
	zFhrbZAYlmJUaaHRyfYFiOTQmhQAgbq8K0q+vz8/qNgndmZWcOoKQmQqmnigYpbnhBvBlCqXKW3AX
	z/GpTlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhdX-004agJ-1W;
	Tue, 31 Oct 2023 05:49:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhdU-004af8-2H;
	Tue, 31 Oct 2023 05:49:58 +0000
Received: from [192.168.2.70] (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F99B6607377;
	Tue, 31 Oct 2023 05:49:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698731391;
	bh=dI0wOQPLuDm+aGKLEQyqzfOoUl5FiiF7FA+cauBzgdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UpybmT78QGHVrCgg20nLAL3XcfXO1e6trAm3Jw2dbBTne1Y5BvyDo2y1cP7kPalgB
	 HNQwjuhPQBTcwyR+U4lPwsgTXt55QC6Njb2oO8lrcTNztb3P7kLRCM/29XJnRJPOab
	 kfZIYegagYS5bBsWjLkvbeiNgO9vf0vmVUlUdeHe74RezqP7Pev5Bfi/Ce1VGXLpaA
	 Kd/vSEgq04rQlq0XltIgjzFasUMsJ9BRUjtKQ3/OQ2cSFOBjBi6v5UbDSNPPuVhMd/
	 N44Fi1OVEi2Rb5QP0jZ975gZFtefVvNHgsOCop+GkRPwHCaxIHBc2vaG7qo6DZng1h
	 x4UKILASZMQgQ==
Message-ID: <b9407b5d-3dba-3e7d-139b-075728b8346c@collabora.com>
Date: Tue, 31 Oct 2023 08:49:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/2] media: mtk-jpeg: Remove cancel worker in
 mtk_jpeg_remove to avoid the crash of multi-core JPEG devices
To: Zheng Wang <zyytlz.wz@163.com>
Cc: Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Irui.Wang@mediatek.com, security@kernel.org, hackerzheng666@gmail.com,
 1395428693sheep@gmail.com, alex000young@gmail.com, amergnat@baylibre.com,
 wenst@chromium.org
References: <20231027091612.38896-1-zyytlz.wz@163.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231027091612.38896-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_224956_932691_355FAF7E 
X-CRM114-Status: GOOD (  17.97  )
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

On 10/27/23 12:16, Zheng Wang wrote:
> This patch reverts commit c677d7ae8314
> ("media: mtk-jpeg: Fix use after free bug due to uncanceled work").
> The job_timeout_work is initialized only for
> the single-core JPEG device so it will cause the crash for multi-core
> JPEG devices.
> 
> Fix it by removing the cancel_delayed_work_sync function.
> 
> Fixes: c677d7ae8314 ("media: mtk-jpeg: Fix use after free bug due to uncanceled work")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 7194f88edc0f..60425c99a2b8 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1403,7 +1403,6 @@ static void mtk_jpeg_remove(struct platform_device *pdev)
>  {
>  	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
>  
> -	cancel_delayed_work_sync(&jpeg->job_timeout_work);
>  	pm_runtime_disable(&pdev->dev);
>  	video_unregister_device(jpeg->vdev);
>  	v4l2_m2m_release(jpeg->m2m_dev);

Please send all three patches as a single series and version it with v2.
Add cover letter with changelog.

# git format-patch --cover-letter -v2 -3

-- 
Best regards,
Dmitry


