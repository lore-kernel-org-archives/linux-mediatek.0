Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02881C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX1PY+4p7RuR3CsTNg5IVirKGiiOVC2+7mio5KEYWGk=; b=xS4cls+F5sqigy1lgyYtjxYU02
	sR3fbDR04Y+YO4M+mJlM+LcnyB0yPyijkTWp5BsNfLYrOTrSovmQqT09h4tcCs4IVlkz/E3ayevDY
	j4Fr8Gknaj4tYkwodUr3jH10YV6rBdZe56YUifrSVwi4KJ7RTptbz1GUcVBMV6ypOkhiikY2Rug10
	d9TqEILQXPj5s5UH/NgxfSh0XpN7JMIfOtxSm/VyfWIdKD3ELCBoqOf0uaanlRNN9xpXIKJifpA1K
	nkFrswb2Ty5t0INcj91qYH2MItdoKnu6Mx/iitWjtXC+AJeCDvROPDJcW26X/LbUJIdfyARJCFw3z
	IGHabRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Kb1-0086vG-Ui; Mon, 04 Jul 2022 11:50:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KVf-007zNP-BB; Mon, 04 Jul 2022 11:45:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B65B06601606;
	Mon,  4 Jul 2022 12:44:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656935095;
	bh=jjo/dyeQs/GxvVIxuo7XEbbDAa6wk9DN2Its8ccnRJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nbJnzWpIAwOdT1NnRPK3dzVlUURFg7owdJam04RFnvJ1M7R5J4KEmBvJsOP+V62Qh
	 cY5xqLdSoHcmUI1epUxuKG90LJlj5x7P9/YpS1EfHuyIYfayhQnnHzB9256yBDKyDP
	 M2ubH3i6prhjBmd1BXjyeoDFPIr+8Ccn1khWm1dNo6cRhlEz7hhqswvZxf/yFv8wM6
	 elWZfMriM/zOTb1xhCbkpKSl6ls0PEEQXcwEVLwMWnP8a71fKlm2EAr8VzXnKkUw2g
	 qj/elSmFNeBE3KTdMf4xaVV4bWxSfwIWabWi6niy/+tiqVJDzTFL/4QwFSbaxW7N+n
	 NedgxcEU4P/Xw==
Message-ID: <e405bbc2-c1af-f445-5b78-021b8e88090a@collabora.com>
Date: Mon, 4 Jul 2022 13:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/mediatek: ensure bridge disable happends before
 suspend
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220629190545.478113-1-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220629190545.478113-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_044459_572025_FA44CD4D 
X-CRM114-Status: GOOD (  12.41  )
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

Il 29/06/22 21:05, Hsin-Yi Wang ha scritto:
> Make sure bridge_disable will be called before suspend by calling
> drm_mode_config_helper_suspend() in .prepare callback.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> The issue is found if suspend is called via VT2 in several MTK SoC (eg.
> MT8173, MT8183, MT8186) chromebook boards with eDP bridge:
> bridge disable is called through mtk-drm's suspend, and it needs to be
> called before bridge pm runtime suspend.
> So we move the hook to .prepare() and .complete().
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 

