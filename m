Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF5BC44500
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 12:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VB/Yde9WwUZSzHZNla+a60srDPe+CyYZ3Qn4u6zv1U=; b=FX5bS4ogcqjFuT2cltEu3DKE0o
	LLkLMTGBTfz7u2s/VG/FLZyHIbgdj6hqKJd6rSPmcVgAiAy0heqCMwin23gESRmByLdir9A3FEGuj
	SnU/MYyyzPudbvt3dsHP6ahy/tSHD/hWCLTAiGt6kTON4HxXDAcL/l9RKsdr7d+MTquiEA5ZJVaa2
	AcIAzF5nugcZArx1sK8mFie97bkhbCmhhr0PHdXID67uOIR6BGW0P7C2u6GFZ1sDsovZ0hO17A4Xy
	bXwETeoeDN023KdOKy7GKRAEZfeQI42gm8BP3aCDQdiBAXCljhOJuyLavZQYjNvN3ecxkKdlbIlta
	MTEJ827A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLXZ-00000009HWg-0mRT;
	Sun, 05 Jul 2026 12:01:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLXY-00000009HWR-0Lxt;
	Sun, 05 Jul 2026 12:01:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7747141B70;
	Sun,  5 Jul 2026 12:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D151F000E9;
	Sun,  5 Jul 2026 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783252899;
	bh=8VB/Yde9WwUZSzHZNla+a60srDPe+CyYZ3Qn4u6zv1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d7HINp2y+EbqNdMnO9hjINkAv1BTljVXoU9l/WQkQylgqp1wUqygEwKuykG4iF/TO
	 oBHZIuEZGTiKKxP/vO1bsyvQCd8uoCYkDQDuLGLs21awr0o8gLYA8M5dLpmFFEnoZF
	 yXnJ/3UbOWi2qbjLhMWThhR1cK3YIx1CQNIuz3NVlWqxv7LQjjwhl+dnDkO3WfePkg
	 O2h22C5QJUtsIjJPQkNUyDkC0Luq8xuLJ4vmMxon6UuKomitHxqm+K/ZbPFift0HAa
	 X9LV7W8D5bZQ7yR+aOGYI70QVWsWt/vQ5R7I5widBxjVeg7hGgeg4nFX35UmVxRLbc
	 RAVB2W8TqgdOw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgLXU-00000001PSw-45fs;
	Sun, 05 Jul 2026 14:01:36 +0200
Date: Sun, 5 Jul 2026 14:01:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
Message-ID: <akpHoM1a4r64iIhi@hovoldconsulting.com>
References: <20260704174113.255485-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704174113.255485-1-lgs201920130244@gmail.com>
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

On Sun, Jul 05, 2026 at 01:41:13AM +0800, Guangshuo Li wrote:
> mtk_hdmi_common_probe() gets the DDC adapter with
> of_find_i2c_adapter_by_node() and registers a devm action to release the
> adapter device reference with put_device().
> 
> The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
> adapter. This is not paired with the find helper and it drops the adapter
> device reference before the devm action drops it again.

You should mention that i2c_put_adapter() also puts a module reference
that was never taken (of_find_i2c_adapter_by_node() does not take a
module reference, unlike of_get_i2c_adapter_by_node()).

> Remove the extra i2c_put_adapter() call from the HDMI v2 remove callback
> and let the common devm action release the adapter device reference.
> 
> Fixes: 9545bae5c8ac ("drm/mediatek: mtk_hdmi: Fix probe device leaks")

This is clearly not the change that introduced the issue as this driver
did not exist when it was merged.

This should be:

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")

You should also CC stable.

> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> index 7bbf463056c9..e668506daf67 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -1501,9 +1501,6 @@ static int mtk_hdmi_v2_probe(struct platform_device *pdev)
>  
>  static void mtk_hdmi_v2_remove(struct platform_device *pdev)
>  {
> -	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
> -
> -	i2c_put_adapter(hdmi->ddc_adpt);
>  }

There's no point in keeping the empty remove() callback.

>  static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {

Johan

