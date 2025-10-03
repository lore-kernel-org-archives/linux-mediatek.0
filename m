Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA62CCA470
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpcyMyT3BPOuOYcdlEjXrtADsU+I5N2sdX8ymNKvCfY=; b=iIgt172P8XGe/KKDOv9EWczCum
	+flgjey9dnoKuGZq5ocHiyj90EUmT0ICg7ZmDalgfy51U+t3Eifd++0iMqZB4K9WYwj58u9L4+oGw
	KsY8ZaLHKn0eiDdENuxcGkcMOgH/saTsprUCcLotMutLWoxUstqH33s6751oKUELVHgdEKYIefwMH
	8FXOlg2606N/f8wjIku/RSNzjrdobx4Jo57foWS1BgF+nWYyzGfwYyrcY/IOHy/HVqTQ1lLeF1Ro9
	ID2c0Z6mAFCy1T/Qe23dCmbbpNHWJTk59hvgrXzr1rN7zRLtKksvNop7NM9wNYq2OSvY6zPGgDXl0
	Lbwjf2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4b1M-0000000Bs30-33wN;
	Fri, 03 Oct 2025 08:20:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4b1K-0000000Bs2J-0U6X;
	Fri, 03 Oct 2025 08:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759479603;
	bh=ITjlkM0aGbos1XSt8ueuI2NEXdJ0dWrdlYRm6k9TIrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O9dz+Yxq50GBeUPj/rHINpU4WkHjjZFDuyxvTgrx3OVsWKoiEnfxmAR0+VIOIzxAP
	 rLVYoNKtfhFJWcSoAxaq5kAuUjxHt5SebW5fxERuO73qn0yF2ko84OIBIFdV7idXyx
	 23ncQAwcVx6CXmV8k7qy6hodmoDpBKGw75yvdhV4z8jlExPfcc8g+dykS08bZiXtVg
	 4hKHTicInZfc6yYalFDczTANuxVmPOs0Rt3Io/ZJqmPe1riuA3/pnjY7JCoXJqt5by
	 s/VIXnI9c2Bk2G9ZfHHUcbKv2iHZ78FDl9QWT+rf/x8GVLe6kpgi9JvhwzSy08YoDN
	 h2ZQqrQgka7/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE23D17E129E;
	Fri,  3 Oct 2025 10:20:02 +0200 (CEST)
Message-ID: <6ad27d61-5907-437b-afda-6e1453a19f88@collabora.com>
Date: Fri, 3 Oct 2025 10:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix refcounting in mtk_drm_get_all_drm_priv
To: Sjoerd Simons <sjoerd@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Johan Hovold <johan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, stable@vger.kernel.org
References: <20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_012006_354150_1FF4A4E5 
X-CRM114-Status: UNSURE (   7.44  )
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

Il 03/10/25 10:08, Sjoerd Simons ha scritto:
> dev_get_drvdata simply returns the driver data part of drm_dev, which
> has its lifetime bound to the drm_dev. So only drop the reference in the
> error paths, on success they will get dropped later.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9ba2556cef1df ("drm/mediatek: clean up driver data initialisation")
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



