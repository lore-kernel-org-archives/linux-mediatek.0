Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDF1EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uh9lXF/uf+A6tfSF9nV+iN1b+cIhgEsnvtCS6C6Qtvk=; b=MPBsfrLYcBiPyxKLZy6GinZ8n+
	qzciQUYAHAiveVKTRtLJKqWaZE+qi7Ujld5p3nFWtNWPab7zF+Sa/InpOtIN3KCs7iZ+BmOfxVk1w
	dGsQ20vQRlEl78u72pV40dK3jGWrl6wVkbBNO97KRa74BG0rFd2Jfidbv8xEEjXElHoDb0SvcE+67
	boBMuaB9Tkb919sU0eUgvCRwa6bx0GOBGg2EhxWeLdnRWU4sM9FY5IHL8cfi6M6P9u5T6o1Nquroj
	e29OkjW90sbh8IO3IjFB5NIvBYQbUJ7DnJ+0JwqVOUdFj9+wvrzknvJsVK/6GNnKr+emon7oZysD8
	PVC95dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlvb-00AnKQ-2p;
	Mon, 10 Jul 2023 08:07:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlvY-00AnIn-2s;
	Mon, 10 Jul 2023 08:07:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C05066057B8;
	Mon, 10 Jul 2023 09:07:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688976441;
	bh=+CLA7waOBRi0uCirQwBlUTqDiM39D3GMSmgXcTkwD4c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TI6UdQkKLMMlrvJSdXLC9IH4O9YMQpgO+OklDPxYvjs7Bijql4dTuQPyP8T5tPHJt
	 6JsanwVgWixeGdz8+lBPCZ3Q+qN6FQyx/PxhSxrEdQAvwPA83gV9AtsAROCvIEaQgV
	 ZPuwwa4CN91KgL2mVqGVmDA7kAEf32OKhV/d2/IhCV38bvHkZObQV0uK7JuPRWL8w5
	 J4edFHixQX848ItrgjpkQnsjyUkceWEGnQaOUQdpY23nDIewUIwBqJBLP8Vx0Pb2RR
	 Ipf+aLcgvJjRXq7LEwUD4tDV9+UfG8QOOofFkvrUwwiBKZT3PNBXrIO8PLbN0jKut5
	 Yfiw98o0SvYXQ==
Message-ID: <56a8fc90-337b-5ac2-be13-5420f2de6c5a@collabora.com>
Date: Mon, 10 Jul 2023 10:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] drm/mediatek: Fix iommu fault during crtc enabling
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
References: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
 <20230709162641.6405-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230709162641.6405-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_010725_063846_D47FD08A 
X-CRM114-Status: GOOD (  16.48  )
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

Il 09/07/23 18:26, Jason-JH.Lin ha scritto:
> OVL layer should not be enabled before crtc is enabled.
> The plane_state of drm_atomic_state is not sync to
> the plane_state stored in mtk_crtc during crtc enabling,
> so just set all planes to disabled.
> 

Please add the relevant Fixes tag and resend.

Thanks,
Angelo

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com> > ---
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


