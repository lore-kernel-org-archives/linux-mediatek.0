Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BF7C74A4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N91TGvsmSaP5NEO0YARY7/DqGhtZsqpXGDz3H96Hv8M=; b=w+HE6STuriMhW1paejHk81N3aW
	lMEXqcyFlxWFA3kMc5J6xFJe4HSaHy3W/FqvE/WGziVAIehWm2R4PnGPlE2zL1uG8kBu0TySgi9jl
	+NyHG+1d6X+hyMbo6A+wJTWZGKMIQyv2ht7WxhpESmSMSmuWR7QCA7DDnjXBnMHUoGIiZX0xrzgf8
	gIu8MLY6C6p7TKqKyEr1WqolVU5WwIUI+RuwL4DNrPB11/Ev4g8uhpaDIjXnhqulhnN5lxgzZJ5Xs
	nEzehKvgkoIUZ3gf3gjO9FwziBj2XtQ31pwmObLGFPsbvCv1+vaBdw0P9964BO2ZO1I5oWNvKyU74
	mG+R41RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYxR-00Dsdy-2S; Fri, 10 Mar 2023 09:22:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYxK-00DsZc-B5
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 09:22:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3487B660305B;
	Fri, 10 Mar 2023 09:22:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678440147;
	bh=y3JYGM2yZUXBDvbqEx9Ff7WwuKMXGRyyYSyk1UCnius=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PaqiiyBQ9ln52ppxN0TkvEvlTEtvAeGlTZdHPKREKnEiTJd9Ag//2fZdUUXElFSLv
	 mA3ZUwBqFR5TzRGCZ98F/Xtf7xI4rNVJo/UPqfVA5FjJz4YEcbyT9u87aZBPVYnC0S
	 mDJty6/GP4YJDeiubGqIivJ8wYz+j+xBpWqUpJzz6zr4X/yrkM7dwUpjB9hhkDt9eo
	 7vMV+hYwLJr+rNHWwJ1hbfr8wchzI/2zfTVQ1oNkNKNTzLSb6CmOCxi+gWsjdM4quC
	 CBM5Q2MYQa9y+4eUliCU+iZWyao+I1QTj3zUxJOjGoz083wKrC03GuI1NFKoWYMuw8
	 Q95vzMtwj1nDQ==
Message-ID: <fc28d7cf-7ef1-4505-630b-87f6bc74a77f@collabora.com>
Date: Fri, 10 Mar 2023 10:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 2/3] drm/mediatek: Add support for AR30 and BA30
 overlays
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 daniel@ffwll.ch, daniel@fooishbar.org
References: <20230309210623.1167567-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309210623.1167567-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_012230_625161_25114477 
X-CRM114-Status: GOOD (  12.60  )
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

Il 09/03/23 22:06, Justin Green ha scritto:
> Add the ability for the Mediatek DRM driver to control the bit depth register.
> If the DTS indicates the device supports 10-bit overlays and the current format
> has a fourcc of AR30, BA30, or RA30, we set the bit depth register to 10 bit.
> 
> The next patch in the series actually enables 10-bit overlays for MT8195
> devices, but this current patch should be a no-op. This patch was tested by
> simply running Chrome on an MT8195 and looking for regressions.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



