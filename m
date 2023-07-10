Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A345BEB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMFba4uLzlwjRy1iK9jpvucdMeW3GucK3/5lMPaJ3a0=; b=pw2BHJxiVzTs6MmBeOeTKj0cSr
	BaPyfR4vpQLBOduYa2w2KcpYZeeN77rbf97pxch8J1knG0/kSttD4em6J+puV17O2GUBl4Psce4cf
	Lm73ARZvdQx42FpesS9H3ncMlK7d4Xivcz/sDNNk/T83bzgypCXqAYu6P/2aBkpu9xGsikEp5xME4
	Ug6+kIK8Y6vbQdwQmjj7O6p/GKKYDOpYnmq7JwFq7fRBhtRrvrru3H5pLC7I/pVgGGTdDz4n5mPk1
	RSUjdJLjZ1VOCsBQ8TABx1RRZpZ1U7/GY61hWeEq8Ngh/4sSjEWQFXKNs0RgjI5KvaSjzPOZEFZuI
	4wrGarJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInla-00BAJ8-0U;
	Mon, 10 Jul 2023 10:05:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInlW-00BAIC-2s;
	Mon, 10 Jul 2023 10:05:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 54749660087A;
	Mon, 10 Jul 2023 11:05:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688983507;
	bh=u8HTRU8wrVrudF2MAveUW0N9eNzWY3F4vzgevhqCiQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IF9J4hi0pYEAGffLfKmVtgTPdiVn24HTYtfornAzBxo04MLBnEeIIwXki1x4ve7wi
	 wRkIN7buGPp3pa9USfmJseHV9FYs1Uv1nT9x/biDVG6vMLzEEUPAW8kp3gb+MObGku
	 DDkYwraFt96YZEwqIlTHwMlRuz+A785fVNFCuGKLByfZpr65HUetbrQhuauNiEWkLx
	 53AU6D3jsrCQG0la2copWvPbZx9RR3zC+Gh7jV4pgD6qWAl98of7YGQQH6yUw21xhN
	 aWZNQ8yshQRmWeYDvP0aVasSqX8chqHkDMPCwkNpzoWRZXuLh2UaerxhfMb77CXQfx
	 T8Le9lpd0litQ==
Message-ID: <1afc6631-612d-e720-af3b-a7f19b7da965@collabora.com>
Date: Mon, 10 Jul 2023 11:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230710093253.32224-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_030511_113220_203A1D80 
X-CRM114-Status: GOOD (  15.93  )
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

Il 10/07/23 11:32, Jason-JH.Lin ha scritto:
> OVL layer should not be enabled before crtc is enabled.
> The plane_state of drm_atomic_state is not sync to
> the plane_state stored in mtk_crtc during crtc enabling,
> so just set all planes to disabled.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..51d10e65004e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -410,6 +410,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>   		unsigned int local_layer;
>   
>   		plane_state = to_mtk_plane_state(plane->state);
> +
> +		/* should not enable layer before crtc enabled */
> +		plane_state->pending.enable = false;
>   		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
>   		if (comp)
>   			mtk_ddp_comp_layer_config(comp, local_layer,


