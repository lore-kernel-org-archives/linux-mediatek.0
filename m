Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B503CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWqIbmlBGkxEm50Eu0ym9zYmlf4q8rTrvA9sB4aLZLs=; b=SXnChr5cZ/zAxd
	QIBU4dFIsWOd1/dQebz///vdjc+m86kqJ7Zqd1Xpn8A77axHbeP5WxRbLvoqN2FxF//AOEDp+Liek
	qDWIgl59RZ6ULLGRYbQa1XI9majN9WQbPE0fjYMbRpIbjk5E1GodUGBPW15QLgvn0HG2M7oxM0oCW
	noTNGTokCkTU4VoABmZi1KdYomMtRigJhuCo1NuvoC5Zpk1/VJ7J+6ERHI54nM9lN1kcDcxFMgBzP
	/nnB2SU9sCsZ1b+V67pe1OhGhqHff53aNGwzVxigRdHl7X4dNTS0CiCcTMqhrcne8nBD38bbGyxdI
	ku38TyvKPyzCQCdaNWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJsi-0000000E5o5-1HkD;
	Wed, 10 Sep 2025 12:25:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJse-0000000E5mg-3lI1;
	Wed, 10 Sep 2025 12:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757507094;
	bh=XG4risedyzhaJlFOa2WbFkhBXqEGFq2jhFHoD1cXqr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R/T4K4kZw5G7rkwD5a0Sq4j+YyADMkBxO1OodOyptZG1TrjWeBBUNrGXwz07dGe/i
	 aMdRNzMIysVJHM5r1dTVZWwgU6IN4udQAQxWsCN4JGGrEghdzLo0fHGImO7R7GKIZq
	 qRKwszp+DXoEE6PwPhewnq/V2q1DDhdD5D6GbU7xDN/8QMoJh6VTaNhR/bfbM3RGce
	 zrL3xlJn9wusBsIhmsO0npRkyFeAR00ja0YWxjfTPU/aVfd8NwVStvIFAQFmBx+UK7
	 0MnQDnXFDohowKRnJ4qxWqWOXgR+qrk+W3eVT5Aw4JGJk/VzvKRTmD1Eq1eSOV7tbY
	 Nvg8B3JMLxGsA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDD0A17E0125;
	Wed, 10 Sep 2025 14:24:53 +0200 (CEST)
Message-ID: <4367758f-77d8-460c-887a-946b1c7cdd68@collabora.com>
Date: Wed, 10 Sep 2025 14:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/19] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
To: Paul Chen <paul-pl.chen@mediatek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-19-paul-pl.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250828080855.3502514-19-paul-pl.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_052457_096615_37C02E6B 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: devicetree@vger.kernel.org, xiandong.wang@mediatek.com, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/08/25 10:07, Paul Chen ha scritto:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> To support multiple mmsys instances in the one mediatek-drm instance,
> providing improved flexibility and scalability by the following changes:
> 
> 1. Add DDP_COMPONENT_DRM_OVLSYS_ADAPTOR* to probe the
>    ovlsys_adaptor drivers and support different mmsys composition.
> 2. Added new component types MTK_DISP_VIRTUAL to support the
>    routing to virtual display components.
> 3. Added and adjusted the existed structure or interface to extend
>    the support of multiple mmsys instances.
> 4. Modified the component matching and binding logic to support
>    multiple mmsys instances.

This commit is huge and a bit difficult to read, but also you have split the
changes description in four points.

Please, split this in four commits, for each of the changes that you're actually
describing in the description of this single one: this not only makes reviewing a
bit easier, but will help understanding what's being done in case any uncaught
regression shows up "after the fact".

Thanks,
Angelo

> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_crtc.c     | 342 +++++++++++++++++++-----
>   drivers/gpu/drm/mediatek/mtk_crtc.h     |   6 +-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 105 +++++---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  85 +++---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  13 +
>   6 files changed, 421 insertions(+), 132 deletions(-)
> 

