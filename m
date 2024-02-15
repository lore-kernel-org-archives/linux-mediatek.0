Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37778C48BEF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmTJrHbLSbdAGuiqOoS1WUCDbNnb8x5OUWK8pk/ji7E=; b=0TUUEia2QbwwYq
	Vf9eOFX9fSBbYVT1+bW6bg8qyr04wzLbgITJHKJggnCtm2GR8Fl4gd96SmhNb1gWU919wrQt73cxX
	KBR/XdFuPxwSyL4YnOf/R6jLdLeC1o7GRsJQC98NAXOIpfRGqe7x/3oMCahznIpDDdYWwt+IEcUly
	83NhZmYUH6c/OWsRUznQFyFbm6En6GwI3e/UxUh+1YPQUse6+W1knxS/HVvU4Ajxz0xPQt1NlaZbZ
	1NF+/vQKEebBj17t4l7ejOk0/uzpG9T7CI77gn4dzqLXC9iZ5j8G1WI21qAJB+IIOsxTRsVFgd0iJ
	37tEkU7jebJ9lFnY6LMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZG7-0000000FroH-3FNz;
	Thu, 15 Feb 2024 10:46:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZG4-0000000Frls-1bHr;
	Thu, 15 Feb 2024 10:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993983;
	bh=YbT37hERPMotSbqysWVXhccVGhmIL5NWBAzDOuVxwJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3xpIKCTiI4T2EIGKteQ1V5vk5Ykel3u0GclVdzPNz2BVTzI+JuiTpjFJ9OO8VrMQn
	 Q7Z12jsjx/DJGyab5s9d0jv5M1DhUkaHD9hyLV4yn+5mnONLSWcXJ8ysyRtBQJXJEZ
	 3TzWRL2OpuvR3gZxxAZ1xkgqbwJoNEhlG5cmPL4b8uWp+/RZpR41s5Ys24593D9hUX
	 SBiPR2kqz7O06TpoKA+buky6hJincltVxPygzHSYS8cjkSY/FxJgwkYJEGGafwqNWA
	 4xlA9DWhjyFSIV6DVNOgifAVu72GEMWw4gMQZzy+kQ+W28gal2MX2ddqJuVh2taRHY
	 qXnHq6ptKefnw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D0DF83780FC7;
	Thu, 15 Feb 2024 10:46:21 +0000 (UTC)
Message-ID: <96cbca68-052f-42dd-a410-da9061d54c06@collabora.com>
Date: Thu, 15 Feb 2024 11:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] drm/mediatek: Support alpha blending in display
 driver
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-8-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215101119.12629-8-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024624_581264_574E9F46 
X-CRM114-Status: GOOD (  14.72  )
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
> Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
> adding correct blend mode property when the planes init.
> Before this patch, only the "Coverage" mode (default) is supported.
> 
> For more information, there are three pixel blend modes in DRM driver:
> "None", "Pre-multiplied", and "Coverage".
> 
> To understand the difference between these modes, let's take a look at
> the following two approaches to do alpha blending:
> 
> 1. Straight:
> dst.RGB = src.RGB * src.A + dst.RGB * (1 - src.A)
> This is straightforward and easy to understand, when the source layer is
> compositing with the destination layer, it's alpha will affect the
> result. This is also known as "post-multiplied", or "Coverage" mode.
> 
> 2. Pre-multiplied:
> dst.RGB = src.RGB + dst.RGB * (1 - src.A)
> Since the source RGB have already multiplied its alpha, only destination
> RGB need to multiply it. This is the "Pre-multiplied" mode in DRM.
> 
> For the "None" blend mode in DRM, it means the pixel alpha is ignored
> when compositing the layers, only the constant alpha for the composited
> layer will take effects.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



