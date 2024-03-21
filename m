Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EF8C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsEJhvSNzeNIYUMLx6fe4yYtRFQHMWVIB74hdV0MgUw=; b=4Lw5BI8OMmwcxuPn56Zh3uUFXd
	5yA2tV9bF3i2vLjW0+J5NDZCmyDt8La5y3jxL6qkIMt0rCQgI9hxACotPf1H9wJIggtT/h3Rtdxf+
	1pq8GrU8li+qGQ6gEuQIk7Do596bkprp0Gwfylg6fkavM8VLJe/rofWvrITZ0gNCa4cqXfFzP5B1+
	3sbj8pBDWDOkOihL0KsPHICrPO+1If35PzRRgfNuCqzRh4k/eyaYse1SRwkMxdvOO7sUWcX11P7Ya
	cej0gfjnVYAuLgK47hIlmEfNePzGeTtTTqK/tdy3E0i+9QXk+rBstKMJGloOrUgYe+Gd6aulk5uYJ
	e73p6V8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEMm-00000002Qr1-2RdK;
	Thu, 21 Mar 2024 09:05:40 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEMi-00000002Qnu-3viF;
	Thu, 21 Mar 2024 09:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711011935;
	bh=P7V6XrgrAvBiW0OBljHuvrds54kBtngXw5oTsR9kvH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=goNJS3Wn3dSJV2hDjj9YbzzI1Jm+6I/kMWzCxNY/Wck4qeIcAYbE56BW3QkgcCiMx
	 3D9VOn/bwj3fN71Eb/zuMV5s0ayp5ptj7AYLZBs05pi7yyrkgV26x/iZt2k/yqSBRm
	 PDGdiJa0rGltJaoEf1t9gttrhV6FEuPuOih2qNuAWhw6sl5YyGI7FNfCBCZIEGQVS/
	 xOBC0YGUOzuHFNt/njecwHdOYoh+q2kUgHiSzsE/jFwLVSLnxMbynP9lLb5K8K14tE
	 jJN3iVa0oYLdQ9Q/hq9eYBCp+wNjOH2UQJ369KWnIlhc/xZ8pvjy9RWyf1ApQFyuJz
	 sjVHBtPWUZx/Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 55B0737813E1;
	Thu, 21 Mar 2024 09:05:34 +0000 (UTC)
Message-ID: <b1ff4130-8e84-478a-a6b3-1cac677d8cbd@collabora.com>
Date: Thu, 21 Mar 2024 10:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/mediatek: Fixes for DDP component search/destroy
Content-Language: en-US
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, nancy.lin@mediatek.com,
 nathan.lu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org
References: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_020537_168267_616B5C3A 
X-CRM114-Status: UNSURE (   8.32  )
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

Il 01/02/24 13:53, AngeloGioacchino Del Regno ha scritto:
> This series performs some cleanups for DDP component CRTC search and
> correctly iounmaps the previously of_iomap() calls from drm_ddp_comp.
> 
> Tested on MT8195 Cherry Tomato
> 

Hello CK,
gentle ping for this series.

Cheers,
Angelo

> AngeloGioacchino Del Regno (3):
>    drm/mediatek: drm_ddp_comp: Fix and cleanup DDP component CRTC search
>    drm/mediatek: Perform iounmap on simple DDP component destruction
>    drm/mediatek: drm_ddp_comp: Add mtk_ddp_is_simple_comp() internal
>      helper
> 
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 113 +++++++++++++-------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
>   3 files changed, 80 insertions(+), 38 deletions(-)
> 


