Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmXyVMiqBORUSM4dO0i8KhUHZfqp64xd3Hl7Ym/wPfY=; b=2rITfBLEuOnFP3
	Qm50B9Eu6E9ToUieOZWtrpZKl+WnQLC7Mxjjz7E8S32ZhHj80W4y1mfdib/+lbJChJ+MCCDeifMAT
	gmAafa+NYUG2IVY5sXTv4Ol4ltT71YywU/+QB0ihb+4iOnqHs4gcWM9tACkYesn9/em10yEhR8W/H
	WvPR16PIKrT5VYr/K+btiUwhC3lWy76OLnJkQLwQT5gUjebr9Wm6K3Jw5Wq8bP+lQ3XGLKdZq6m1d
	1kZudsDDCg32rtRKRElonzHN9n14lQZc7iehItN5g5EWtZXSf11xNJQEO/GrNNmVi2F3jHMyEo4rn
	G3kcW7u/MO4MiVQfVStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9k4-006E2s-A3; Mon, 21 Feb 2022 14:32:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM9iX-006CzK-Ms; Mon, 21 Feb 2022 14:31:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9BD311F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453868;
 bh=N4Q5wrYBCEyiwQyMO1QGIB213vHWLXUeGyE8Au/Swq8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=JRVIx99hM8g0lJMG67zLddemt5gjDyjZUbDkYQbSqtrBmsi82foU/EAk4UNAufyLe
 Y00fiAtDkBFmyCX+li9ig3sc1ZE8ftZNVDIvh1bVV58hAQvnEIpOry6qvo/xLRIcrD
 LI0EKe4zonX5xyEZRPM4ypRqrTc3pS5Q5KgL2cxbedw6jLN/5G4k+lM7TOdHvkl/BP
 8UJU+RI26fI1cbrO4eWVN6ieNyqYWhk02U8pOMpbrJUKWEoqZ3yjLD9YvKFfIXHsZg
 y/oc6efDT4+LFvLxarPxYeEDexrDj7Tki1D2wlLI7SbWAjBm/5Yiuk8H6rM38Jc6xc
 Q2P67OHDdcqOA==
Message-ID: <ac28d599-3fe3-96d2-a8a9-b32fff2e7a89@collabora.com>
Date: Mon, 21 Feb 2022 15:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 09/19] drm/mediatek: dpi: move dimension_mask to board
 config
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-10-granquet@baylibre.com>
Content-Language: en-US
In-Reply-To: <20220218145437.18563-10-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_063109_945622_13E3CBF6 
X-CRM114-Status: GOOD (  12.19  )
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

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Add flexibility by moving the dimension mask to board config
> 

You should really fix both title and description for this commit,
as this is moving hvsize_mask, not dimension_mask.
Also, s/board/SoC/g.

> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 8ca3455ed64ee..0d3acd08ea358 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -129,6 +129,8 @@ struct mtk_dpi_conf {
>   	bool swap_input_support;
>   	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)
>   	u32 dimension_mask;
> +	// Mask used for HSIZE and VSIZE (no shift)

C-style comments please

> +	u32 hvsize_mask;
>   	const struct mtk_dpi_yc_limit *limit;
>   };
>   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
