Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1425BC30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InDLoF2m/XCmvuHDWKNuyQZpnjOo0ppbvToi7Mp9PHw=; b=QOnD3faT3B3BeyhzvKa4+GshLw
	+VLsDMJXrojW04jQOQbF+3sxjRD5y035kwytQ5f4xF0jNvyfpODPAdwNBxf9ealK76AycKkeR4A8N
	BCkV1JSDfykr4hrSjBf5O7tp5X4WssgmFJHJNnWvPU0YaS7LefUe4HzIMNsA/FQuaP4jBo19cvUTe
	kHZoYYJCkkA+K//nXXusEq1OL1AZdwjnHVol2UsDHcEUtom05BGhoIn+Ah/0m7BaofUgY3X6Kpccb
	JMjK2JcKAN4t9gjP9dcER4OiTLtvvU1FJ0CYvnzvOh5XZG6RkJHHvdOO1nXZHc0kocMVitLGTuYQQ
	8lFqPeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0oa-00000001ztm-2cmb;
	Tue, 25 Jun 2024 07:42:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0oT-00000001zs0-3daA;
	Tue, 25 Jun 2024 07:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719301318;
	bh=fTwKzgDAtpJ7fS3y7s9o/r1cT4erRfQd8eIF/4pTaM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z/7tCTKMxE5Tifq9HPtAVVlG40A6lcXzeY1tS/lPtujX3nCTC0AO+EYXvxtFjJV9d
	 ITh9rvkjXCVdH1T+gjaWifWQsWZp13jO61gkqNEDVbx+4NLEVnfgI2aD2U6Nw3mqsi
	 V19UoLzDZP0Tuy+1SfEcagDiCnBDNwFz5kdMwTCZlBlkuzv+EugVGzd28SBesTTZ7q
	 ybKjOKFX+GMAKQYwJO2cUIY5+e46FJQW/CT8WZqlMUQl+NDLl+Q1d0l335f3XfrLxo
	 RHGrVHw8+JUeiYyTGJPyu4w0Gq3GLUotTloXSy5jH+IcDvfOSyub0g8TPgLtAEYD3r
	 rR/KpHcGql7DA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3325C378216A;
	Tue, 25 Jun 2024 07:41:58 +0000 (UTC)
Message-ID: <8f3d6c71-4c4d-4f56-94ba-f61ae5b61dd1@collabora.com>
Date: Tue, 25 Jun 2024 09:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix bit depth overwritten for mtk_ovl_set
 bit_depth()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
References: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_004202_304398_2ADCF593 
X-CRM114-Status: UNSURE (   5.84  )
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

Il 24/06/24 11:57, Jason-JH.Lin ha scritto:
> Refine the value and mask define of bit depth for mtk_ovl_set bit_depth().
> Use cmdq_pkt_write_mask() instead of cmdq_pkt_write() to avoid bit depth
> settings being overwritten.
> 
> Fixes: fb36c5020c9c ("drm/mediatek: Add support for AR30 and BA30 overlays")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



