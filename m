Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FA6C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++air7jTgnc2rN2S7QJhr+Ceh3kYZNrop+C6giJD+ts=; b=mwsCj47QEhJvBP56ZoJjlIicnV
	xPpHDoOJlKSw0ZG9DwKTBJtCZjPhbdKsYx3JTEJOYr9hCZnCe55fuK9yR2Qly1PJHxz+1p6RkqJIR
	4VunVWMraIqhuOkRMejo3Rp7LMLBtQouSjS8+lHdVXg0phuNPvk+vuwc10rC1l10w0hT9QTz/VAO0
	4RNNp0/vq1Qw9wJT/KZg1oSGQwya32wv+rMX+Bf7LatTeUqHy3wsTNGiEjdx7rwQrStufI02ufAwc
	Ew7PtiMVa5xUM7puFPSxHoJoo4BvLmbJph4BqJAgeKKbjZCPxrH00g0Zsg1sp32u5JIF2XW8vbqM8
	UqLGjfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVg8-00F7lt-T2; Thu, 02 Feb 2023 09:14:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVg5-00F7lI-TO
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 09:14:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A1F66602EDA;
	Thu,  2 Feb 2023 09:14:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675329284;
	bh=kJVMCUJpyDJwkWtgM+hXBLW2SmGxN8YP7dAvyuM/vFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=igEIQVhUKu6p+1rwaQMxBD5dfVZSA+M5+dFbUB9seJEIJVHngm4ZW0R5n6CmoskBx
	 6l0A57/6OsGLVAVP92hBy64sP0OndboXMpy6Bk4GkH69rTh3YOb9lCA1bd227XA/vx
	 TXhNSGL/O5L7YO9sIrSUI4JmjN3ijhJHXe16AOJb/8uktexyHlsLVOvQ8L21RubloB
	 TafxIXdNI673qvgUllCHWEU5J9d1UJXjkeXgjrU9+MP6qUfE2jXAR6TzWqB43DvQu4
	 M3tSWTXjDlszi+AjzZjzt5IDnN05d5lgMXQ0FV9WKPvx6uJWKp1CMk9rJ2YDAGe8BF
	 71E6bYGMCy8qg==
Message-ID: <e2e02a7b-0e0c-e0f8-df49-ae2ea27c4440@collabora.com>
Date: Thu, 2 Feb 2023 10:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/mediatek: dp: Only trigger DRM HPD events if
 bridge is attached
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>
References: <20230202045734.2773503-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230202045734.2773503-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_011446_102668_6C14CF52 
X-CRM114-Status: UNSURE (   9.90  )
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

Il 02/02/23 05:57, Chen-Yu Tsai ha scritto:
> The MediaTek DisplayPort interface bridge driver starts its interrupts
> as soon as its probed. However when the interrupts trigger the bridge
> might not have been attached to a DRM device. As drm_helper_hpd_irq_event()
> does not check whether the passed in drm_device is valid or not, a NULL
> pointer passed in results in a kernel NULL pointer dereference in it.
> 
> Check whether the bridge is attached and only trigger an HPD event if
> it is.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



