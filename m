Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86429C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YZbDwFgsviCIHChNTX38QMl3GiLScb55+OGzhWTw58=; b=etb+ImF2DurYUI
	xFg8jibN58ObjZfVHvyAh2ZyFSoUbjS4WszKdGJlP9+3S6YaHY8Hl8KyiWUgWrLB85k3E2sK62Sb7
	9WdnYdWVp/VvLL+wbHVCx7VZEKS/zYVGE7m+5xtdS5WE3m1QLymM2eRYD6gwUxcItC3OibxRAFNss
	Mx+TvmKVOnFQMXDstgebNA9U3hrow5kJQjgsVMqgwesaGJAgdxkbA4PlS58Ybi6pW2isEIxuBs/Zf
	l6so/hM4sj7MtvUBGFT65s9Nyn+Lepr9suf4xLpxZ36SeNfsNLcSaotm2qOd33AIQxRAy1aG2iMw1
	0Pzne8rJ8yjAzciNYx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJcTA-00FgUx-CA; Mon, 14 Feb 2022 14:36:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJcSy-00FgSs-AG; Mon, 14 Feb 2022 14:36:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id A7D7D1F43ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644849393;
 bh=wf2zalaLWrqugtdnfYQlVBuLQAqyoGaCbOOlATCb0jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SlZrULvrjsLlfdwVpA7hx9V7Rx7uDIEctf8kIovI/mrTeCkhQpi3v3M0r7xPiIf88
 Rx9MNAhdCyTF7hvvryM3MTBXzbC/2s1KnXlHc6i2K38hVEjgRVGocwuTuM2UYf8Djt
 dysTtfPYtvMyGcCQzUKrWTn/dMY61QNjj9UVIfr43DirOTrfh5WNUdK9teFwdN5CSG
 86Go8Ge6NMIuuCpVfUPP4FLSaDc5iuT+JLtmWum1Hwlt1dkIOOAwR7gWQiNCAm3y6x
 0zH3GsJqYcaWGGcUXI5koAtagt7c41iofN01svFYyRkwzoVH5Gd8uUzD0eMkZ1ZDBs
 /PVdQTHEBpi1g==
Date: Mon, 14 Feb 2022 09:36:26 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, yongqiang.niu@mediatek.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] soc: mediatek: mt8192-mmsys: Fix dither to dsi0 path's
 input sel
Message-ID: <Ygpo6rB+d9Qd8gY7@maud>
References: <20220128142056.359900-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128142056.359900-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_063636_534948_CAAD4877 
X-CRM114-Status: GOOD (  19.01  )
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

> In commit d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing table"),
> the mmsys routing table for mt8192 was introduced but the input selector
> for DITHER->DSI0 has no value assigned to it.
> 
> This means that we are clearing bit 0 instead of setting it, blocking
> communication between these two blocks; due to that, any display that
> is connected to DSI0 will not work, as no data will go through.
> The effect of that issue is that, during bootup, the DRM will block for
> some time, while atomically waiting for a vblank that never happens;
> later, the situation doesn't get better, leaving the display in a
> non-functional state.
> 
> To fix this issue, fix the route entry in the table by assigning the
> dither input selector to MT8192_DISP_DSI0_SEL_IN.
> 
> Fixes: d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing table")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mt8192-mmsys.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
> index 6f0a57044a7b..6aae0b12b6ff 100644
> --- a/drivers/soc/mediatek/mt8192-mmsys.h
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -53,7 +53,8 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
>  		MT8192_AAL0_SEL_IN_CCORR0
>  	}, {
>  		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> -		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
> +		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
> +		MT8192_DSI0_SEL_IN_DITHER0
>  	}, {
>  		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
>  		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,

Tested-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
