Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A46C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eb2NJhaHb162FCeMckcqlXEW9/YxpDDcj+oyTypsW20=; b=aps/TaPRTHtBD1GvfSVyaovuv+
	GZFALLIaugDR0NHWa5Q0jIr63QfWabhk0uAs1++7M83bhUJntms38S7WloxzoVSEJ84ekAjkmG1FV
	8b+WM9mlp2NrpFluX77rEWxd83bz0BjImNQQIuGoEe6sEYBiMkQUGIOlJZGXRePpIjrcJLHSfOCmf
	0BybcOR/LFd7tMIs37AEIWxEiA4cx1UcD4TEhSpJP868iy1VIynril0AQViYOrs4xhCfRHHwwlLGd
	LVVh2tyWuEgo+PHq8467VtVhlIT4xFfXu7z9X+1xKOSXK0mducK9b3SRlMB3rFcU6y6C/xZ68QtDe
	2basuitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXNS-0000000CQfp-1FCh;
	Tue, 19 Mar 2024 11:11:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXNO-0000000CQen-3BFt;
	Tue, 19 Mar 2024 11:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710846684;
	bh=XLZQhDlAD4mGZyqkQQ7Cw1CYIVAv0BwYXJwNdutyW+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rWyGfBz6jTgE+fURzrNGsS7ysMw8I5U/In6BKGLLjVfYalulyLenSkuyYURO6jXeZ
	 Ld7G5G2xqGjDDkj0tftXN0xBgjbBSeXAKLoO05hHh9HfPFzQU1t2KNSgvEHUzzhqLr
	 Fm/PNlzxa5SxE+zmy6MH/nwlZ83U+G6KkX8E6P+G6GrpdRcS9JYGVIRYqwStOAFKBA
	 7+aut8iY5HF4hkfuqXDka3I7f3n9XyjIFIllrrgyR0WQUJn3F85Pss0Fi7g13iGucJ
	 TV7dmVB03XNM/AsfUL7Gbs8qKCO4vYLSMxOFl1AvDy9ZLtsQmAKio+rTKHye/NFfuP
	 EQbHcSbOo5V1Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6F7E7378149B;
	Tue, 19 Mar 2024 11:11:23 +0000 (UTC)
Message-ID: <4c2ffd1c-d059-4448-9b2d-142ea87d6bd8@collabora.com>
Date: Tue, 19 Mar 2024 12:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] drm/mediatek: Rename "mtk_drm_ddp_comp" to
 "mtk_ddp_comp"
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-3-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240319070257.6443-3-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_041126_960851_8F9CD7BC 
X-CRM114-Status: UNSURE (   8.93  )
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

Il 19/03/24 08:02, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename all "mtk_drm_ddp_comp" to "mtk_ddp_comp":
> - To align the naming rule
> - To reduce the code size
> 
> Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>

Shawn, I don't know if I typoed my own name (which is actually possible, since
I write the tags by hand), or what actually happened to my Reviewed-by tags on
the entire series.

Can you please fix the typo in the tag?

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Use this one, please.

Thanks,
Angelo


> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>


