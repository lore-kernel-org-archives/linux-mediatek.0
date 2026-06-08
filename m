Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B19ECD8C92
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XMQ94f2NnI3UCxBWCQnjfay4QTl/Mm3LGr0hsRVrJs=; b=P3wxWrxPi46NcdDpRt6+QpPGQB
	pDf9ujcyI36TLPWq+WXlT95Vcr8C7ute1gJjWX6JHxJZBlo4UlmJ/u8SEVzUeiYotRMpT71GwCt6O
	acUxtv5I9904ZthqVxYqRoJ9SctkaxgazntgPRLpiSXxaM+8HjYBHVDrIRUs3AVkjfBniMkEd9o5W
	ppXKqT1PTTLj7yN2XwXzvqBnN2Lhvi+MrO70VwhUIpQdrLJIY2vC4FVjVuViDuJ+w1F2oAupBTSoS
	0Zvzc7RGeBSALVXAv3VJYtIOaSN3uOVobgu0uVah6+Ho2IX27vVDOnAruflWLSYVMfcM2T3/yJL3E
	Xuz2JVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbxm-00000003yDL-45S3;
	Mon, 08 Jun 2026 15:32:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbxj-00000003y81-0eul;
	Mon, 08 Jun 2026 15:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780932744;
	bh=0uQ4uyIwFgJ6UABF/dPRZy9vsW0+jj/YnI0z8Vmpot4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jq+6E7qudxZ0V2CHYxhfBJipqKAlt6Mxov3RXEjzJejvT2ibGt75aTCXfzjrhxPTZ
	 usd1emE5pSYqJ7ayp37E3jdG3q/bcYdOJcuJn3N42qZVt0pKtP6agDBZaGptC6NsNF
	 goQ5Px7Tqob6RRN1Pxm9ifD0igKLbesAB76rUvxkrAIpRKf0C4BkXMEKKxQpVfZsSG
	 Vc3w7ZKd9/6f7lMsGagAMIE+MusSoo7+XxdQGpmHx6qxnAucgmm1xM/gKrXHeVhCrP
	 KM8Gz9VqfHuCKk1iG+6XqxchOURVS6v26y6IigKMlb8DCct9cPq0wzWtYAcKf0+2EA
	 +SrD3edhCRVPw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7907817E0DE1;
	Mon,  8 Jun 2026 17:32:23 +0200 (CEST)
Message-ID: <95c71d2a-4d4d-41cc-9dec-e72b93647440@collabora.com>
Date: Mon, 8 Jun 2026 17:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 50/78] drm/mediatek: dpi: Switch to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
 <20260608-drm-no-more-bridge-reset-v2-50-0a91018bf886@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-50-0a91018bf886@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_083227_339336_7883F636 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

On 6/8/26 16:36, Maxime Ripard wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


