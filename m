Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5C5C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3l07Hib/bEQA/sLx/rjhEuddp6gwKSmOJxjj2X17ZI=; b=vji5oB7YHyaQR5asxdn47f1scl
	Lty5kyRyzlsJD4nxQd0mR71me92LWrK+h2R7NTxU+a4rC0otJToyIY9WUohZTyPFvCG0z2cYUzBzr
	bXlOt3hvlP41crD2HhYHgUuqAppOFT657NA60P+GwCwtP4U6+HOUQGG2wo390yteQnH+mXuH3iYKR
	ZUiuldH7aI3LD3GhVL262KVqFREhgC4y/aVx9LcWfuz5tWuUgqYKOYPG0PkdSoJbS0qibfAq+Gilg
	qJhG+epNRCg8rBPmBLlPwZtMuxnE6pR7KLiM1WBOtYPs9UK4My0vU5MgQG0ErN0kOxxsq5/qTvdaQ
	mJYp/7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRW2J-0000000ARMt-1iDW;
	Wed, 10 Jul 2024 12:03:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRW1w-0000000AREr-3caH;
	Wed, 10 Jul 2024 12:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720612959;
	bh=pFQg0rL5fW1I1UxMVag+VV2uAJKmlYifpfa47HjQArE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kDvMJCWznATjN6tDrmVdtB8IImSF/hyQOdgm91XxNthE6zADEGRk1uCsdsc+FKYv8
	 w3HUrcwzU3Dep2bXtBHVesuS/q23vaD6tOcrUTkaU7I51LLGWtXZxgGPplbIUyGVQ8
	 o9eBnEXsd0Z673LdYtvFbhTm9Q/yFIWK98JA8sD+v24IERGrro1egsa5bgXQZsypR/
	 oaxSr5bVOGI6pVLfxJ3OfCYZ/3vd0PWMJrf64CAjkRTXx9TzmS1LqIyU5KBtuUdkkh
	 /FqJZQD6E9GsEoR7kJfXCaemIMt59OF95d5RLhZ8C0ZNW/4yizAyLV56N0KXNm60C2
	 wRq1Ae490MaAQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C74263781185;
	Wed, 10 Jul 2024 12:02:38 +0000 (UTC)
Message-ID: <0479483e-c6f5-4427-83c4-7fcf48ac76ce@collabora.com>
Date: Wed, 10 Jul 2024 14:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/mediatek: Support "None" blending in Mixer
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
 <20240710-alpha-blending-v3-2-289c187f9c6f@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240710-alpha-blending-v3-2-289c187f9c6f@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_050241_062897_7AD388AE 
X-CRM114-Status: UNSURE (   4.97  )
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

Il 10/07/24 10:52, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "None" alpha blending mode on MediaTek's chips.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



