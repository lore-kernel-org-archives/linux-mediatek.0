Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFC7C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 09:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gEWxDYmxSOuXv/yS5X5ZyaRIIvqFTYJ+VFz8rs8OEo=; b=CMh/eb4+6+wbRXe1KnYBApHQkN
	UuS9yzfpWVDgO6cwHIwqD0TwM2jv+x8/NOZ11Xj6QrYXYmklvN0JbGBWE/kAl3C9vkT/38xRScf0y
	/3ZgYDtMndz2xeOUO6ZK4oE6iAprUipL3HSz5qGxLqOb99JRcjdckYHBIIbgHoJZlt6M1bldOBeAH
	KICdWYHpNVoJRVoMWtP1CAZY+vXl21U80RpSbveqzRNFcGba8oJVOu2+FDTxTCtTNHCJ8wObXpg7j
	5qktMLYulYeJBhctNuUscbcr3eN65Uw+8RW9ldwFop4CUGLxQ6EQW4+ytQil2PVuRcMHLOsz2b4mR
	sVTYWziA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovb1u-00C0sP-BI; Thu, 17 Nov 2022 09:17:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovb1r-00C0qj-TM
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 09:17:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F167A6602A93;
	Thu, 17 Nov 2022 09:17:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668676665;
	bh=+3trhUpoX/ZER/bgVCe7lqj7hlaCm7bEoi7xml2ME+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mKRMliuHq0j2e1YDmvQbui9tZVaOhBrryb8IZeGbqEMnaTZ0xL57rwxlUD5ukFpol
	 m0slQAD4VpplPGwL7ifkB78jYcaZpQPSCqqmu4dixctE57EUbR2mAR6MMJK3OCwuFI
	 CilS6phNK1bUqP8wEz+FdvTqNLGcTgifobjjqlkBHqL44sx0w8icgCsekuGgux49ax
	 2NKUYy/bCjv3G+cQ6WQJvJj0H2ByeLWGs+qzBVAhCJdJpzSvto4GMO+bN/eJ/q7rgZ
	 FeDDy0SdEstP1ETvknoNGjvkoncGv+/AJaKf9d2y5k+YZ7gcmOIpakmOQbDvMcfx7S
	 qevX8u9iTURaQ==
Message-ID: <1aae3f77-8228-5d69-15a3-1f44fafb87d4@collabora.com>
Date: Thu, 17 Nov 2022 10:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5] drm/mediatek: Add AFBC support to Mediatek DRM driver
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 matthias.bgg@gmail.com, daniel@ffwll.ch, daniel@fooishbar.org
References: <20221116193335.36320-1-greenjustin@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221116193335.36320-1-greenjustin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_011752_135323_9FF75F4A 
X-CRM114-Status: GOOD (  11.78  )
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

Il 16/11/22 20:33, Justin Green ha scritto:
> From: Justin Green <greenjustin@chromium.org>
> 
> Tested on MT8195 and confirmed both correct video output and improved DRAM
> bandwidth performance.
> 
> v5:
> * Removed some dead defines.
> * Refactored mtk_ovl_set_afbc().
> 
> v4:
> * Move modifier validation to format_mod_supported function.
> * Add modifiers to drm_universal_plane_init() call.
> * Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
>    DRM_FORMAT_LINEAR being equal to 0.
> * Gate AFBC control bit writes on device compatibility.
> 
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>    AFBC.
> * Minor code cleanups.
> 
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Can you please move the version log to *after* the "---"?
That's not something that should actually end up being in the commit description.

After that, or if the maintainer wants to take care about removing that
while applying...:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


