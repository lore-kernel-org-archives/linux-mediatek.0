Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC1C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjFvZQXDW/MqZCdaX6JdN6vwHO0XnoXd7DmqA/Tt+z0=; b=kgHb+t0PcSlW+n
	BeZsrwlSCcX3vk9mP2dCm2jQdnucH6KCrOB/fHW/wUrqDn+YTSP/v4l3Oecl1os8nw6v0L1qQIGbC
	BHtmvTYXyMXdTiYKMxDo6r96Fog0133SSzoXb+na11CvV3tMzjfrJt95e6GtVTXnrTnbPQhE568wj
	lRtK6i/7YdT3Ecs9juQ4aCpMYou7FgfHt9u4dSpmwiIeLvBpQ7zuxLJsC6+Cq3XLokocwqBXkwWvF
	6rk6sN55JFjZ4YY6Qn/0NEXmHnftHvC5N0quAYSncU/r1I+lfDXCMEuEc/+MXFtDhw8XSQzQ7Adfl
	HMhhKIXgYiAN7gRuu3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZFi-0000000FrcP-45fR;
	Thu, 15 Feb 2024 10:46:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZFe-0000000FrYu-0UHB;
	Thu, 15 Feb 2024 10:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993956;
	bh=wuxysMNMqCk725hkpLxM7t6pHbp0NDW7ymjHD5cQXRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tCDSnKveaq5j/GLl1+L0oFpMDQgbIQ4NMt/FmFS8WugixvZe9Ca7nobUxropZiPHj
	 8/1+UaHZg3GK+4Y1zbP7J3z2QTF61t+UES2J59VDtFVVDNFzUcoD8c29/qqIN7FB6v
	 6Wh4nvjRgff92JXI3pyhNyk9ZhrHuyE4rowP5v/jt6Lo8Zhf/sKbboxkk0kby0nrdZ
	 D4MGUcnBXn1tD87uY36SsuivaK79yi+QVYTl3behqlYMoBcgx5YqlTeV8zgE5ZCJkM
	 9H0R2PeS5Q+i6tKSPdEP+IHw/llXSoy6vkGTwLBvH4IO58v/VZ7SpT+J0oGVkq+uvv
	 Upa/r6mNPmr3g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7FC843780FC7;
	Thu, 15 Feb 2024 10:45:55 +0000 (UTC)
Message-ID: <1fdf2c07-8240-4711-a708-b555932dabc6@collabora.com>
Date: Thu, 15 Feb 2024 11:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] drm/mediatek: Turn off the layers with zero
 width or height
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-7-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215101119.12629-7-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024558_358581_B499F79F 
X-CRM114-Status: GOOD (  18.74  )
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
Cc: linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <seanpaul@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/02/24 11:11, Hsiao Chien Sung ha scritto:
> We found that IGT (Intel GPU Tool) will try to commit layers with
> zero width or height and lead to undefined behaviors in hardware.
> Disable the layers in such a situation.
> 
> Fixes: 777b7bc86a0a3 ("drm/mediatek: Add ovl_adaptor support for MT8195")
> Fixes: fa97fe71f6f93 ("drm/mediatek: Add ETHDR support for MT8195")
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

This commit should be sent separately from this series, as it is fixing things
that are not related just to IGT, but also to corner cases in regular non-testing
usecases.

In any case, it's not mandatory as that depends on what the maintainer prefers,
so it's CK's call anyway.

Besides that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
>   drivers/gpu/drm/mediatek/mtk_ethdr.c            | 7 ++++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index d4a13a1402148..68a20312ac6f1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -157,7 +157,7 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>   	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
>   	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
>   
> -	if (!pending->enable) {
> +	if (!pending->enable || !pending->width || !pending->height) {
>   		mtk_merge_stop_cmdq(merge, cmdq_pkt);
>   		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
>   		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> index 73dc4da3ba3bd..69872b77922eb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -160,7 +160,12 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
>   	if (idx >= 4)
>   		return;
>   
> -	if (!pending->enable) {
> +	if (!pending->enable || !pending->width || !pending->height) {
> +		/*
> +		 * instead of disabling layer with MIX_SRC_CON directly
> +		 * set the size to 0 to avoid screen shift due to mixer
> +		 * mode switch (hardware behavior)
> +		 */
>   		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
>   		return;
>   	}


