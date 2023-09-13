Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA967CA550A
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqU1RJ1WXE7C4umw9vF83cEtO7a8YH9G1bytA7ixHHU=; b=DMN7tEy9sWkXB2
	Sc4kTsEnytduJG/XGqSVaxKmvdT9GrQ+EF7omEvPaCkYckpotsPnCyo6O+reuQhMgGE4GTZNa0KNN
	b3mZiOgTb8C6Rtqtm2VoZ7OZANecVTjgt5T9v5zseZmCc5kTzSWrOyo6Fj2XLc/MeE/eoqBkqMkqz
	P/wvbBzo/seCa1tHTbJGjPEBMAa+4JbsHebxAJkudnMRYLnjeF4bifrVLkMWeMU7hPReToMN05ixg
	R40IPY4wkSx9vetlIClfvRg5xyhqed6KHKK8LO1w6zoWNQhaHGP/qoPPqb9lCMSRUyYHF5S3ny7QV
	HbXkh63EBKvKWHai000g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLL4-0057EI-1d;
	Wed, 13 Sep 2023 08:35:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLL0-0057DD-1Z;
	Wed, 13 Sep 2023 08:35:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5251D660732B;
	Wed, 13 Sep 2023 09:35:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694594105;
	bh=b1+U2pGflwc/V1Z4xgUhLMPjPG7gNXIcxF/u4aJVNLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HIt2c3/+tufCzvGPr6PR1hR57aag53jqn1I5ql+1dQscZQAyXpGYCsLgTUuEJ9nDM
	 yVYqUD7YtKlFfXn4vrkeKKBSVsgPsGsX2jxEIU+NoxwY38Q5I98qWrbYqxROUcm4MM
	 pCp0Q1vqc8ICoTFYzmUCNJu9IsglY8B9QQv6zSJGZyHqL+tmhHqZiUovsu+hIyd5kJ
	 cJEPdxyhYZyIgZIBg2qU5Qn/Htrv9I8OKECZr+psUWMXjqjoCY/6dCG4KJyjKGgmqg
	 Jbtq0fjIVYDIa5SKatpvytljZluz9rXCE9vswZWrb5018EtXV/vCsQ5dFoUiPaaEjS
	 SNPvtrFk6Hykg==
Message-ID: <5a4a0d12-d16a-0836-f6c5-6e6c2f3a9097@collabora.com>
Date: Wed, 13 Sep 2023 10:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_013506_675511_C27CB3F0 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org, Shawn Sung <shawn.sung@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/08/23 15:26, Jason-JH.Lin ha scritto:
> Add spinlock protection to avoid race condition on vblank event
> between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
> 

Hello Jason,

Can you please provide more information about this race condition?
(check below)

> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..128a672fe3c9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -746,6 +746,9 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>   									  crtc);
>   	struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
>   	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>   
>   	if (mtk_crtc->event && mtk_crtc_state->base.event)
>   		DRM_ERROR("new event while there is still a pending event\n");
> @@ -756,6 +759,8 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,

...because my suspect is that what creates the race condition in this function is
the unlocked *assignment* to mtk_crtc->event, not the rest.

If I'm right, you don't need to unconditionally spinlock at the beginning of this
function hence ever-so-slightly improving performance compared to this version.

Can you please try this one and check if this *also* solves the issue?

	if (mtk_crtc_state->base.event) {
		mtk_crtc_state->base.event->pipe = drm_crtc_index(crtc);
		WARN_ON(drm_crtc_vblank_get(crtc) != 0);

		spin_lock_irqsave(&crtc->dev->event_lock, flags);
		mtk_crtc->event = mtk_crtc_state->base.event;
		spin_lock_irqrestore(&crtc->dev->event_lock, flags);

		mtk_crtc_state->base.event = NULL;
	}

P.S.: I'd try that myself, but I can't seem to reproduce the issue.

Regards,
Angelo


