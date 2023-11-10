Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B9C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtxiMqRIq8+NWtEIgUxiI2updzqK0ImPVDt91Nu5bt8=; b=q8lZ52TJk052C7fJQx2vToMtJx
	roZx8xhoeU07nSkvXMuENY5FpRaATKbxpBv+ACr3hzY9VLOVeyHvsn2L2cXAU15vz1IprnqTXVH8I
	COgyyCBEdsdsRoPy94b6FJaPXlgTlnMG3g6oegxBo4KtFpq4J2hZgTVQFtHMu6npGnbowLfSRAJep
	Xgta49K6jmwID4FT4CtSQz4ZuexhchhGa77u8uhcbk3X9qeo8tXxeZNTN57FtUe2JagqhiY1wYta0
	E4DtYUaXaT9B2xoSVg77oTn1iAtG43AwSjDEqB/ku7o9kBWPkl9iMmxFdYR37P8lpfSQRjCzmBeBp
	JoCBDHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Q8Y-008XkW-2N;
	Fri, 10 Nov 2023 11:57:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Q8V-008Xhh-1K;
	Fri, 10 Nov 2023 11:57:20 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4221E66073D6;
	Fri, 10 Nov 2023 11:57:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699617438;
	bh=yxdMDAZYCs0R8XzpVH/gErPFhSqVtu/4cjaOro2h2b4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WO3nx56UqM87HIFLLfwM2R/w0GJjvdvHpUw6z00XcHu2y+woW1xgDbCtxrNmbLnbJ
	 etYOhBicHSRnRFOrs2OtpBKDwUUt9BfIC3SdbIFpOsOY4xeruQuEjin51sL+msfcei
	 YBN3so3JS8iJzJFVY+/AApKOYN90tP2IjNQqKDQEWW2QDN9BMANB9IYjCTtcRL3pnd
	 WoI/wxS/kE1UcePbmj8LvrfvAQRYxzvvExRX/UMuIATNSVY5Ros/TWFcBGBnIfYLWD
	 JqSK3iHF+sNyUgbFzfiPuY4mwZYYtZjL7xfp6qqLvVs3XA4C6in3jGgh9NvlYbCwze
	 jbVQZPB/+a2jg==
Message-ID: <b56b155c-25c0-4958-9f59-20669ee2ea01@collabora.com>
Date: Fri, 10 Nov 2023 12:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
Content-Language: en-US
To: Stuart Lee <stuart.lee@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Lancelot Wu
 <lancelot.wu@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 stable@vger.kernel.org
References: <20231110012914.14884-1-stuart.lee@mediatek.com>
 <20231110012914.14884-2-stuart.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231110012914.14884-2-stuart.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_035719_578668_86F7CB26 
X-CRM114-Status: UNSURE (   9.49  )
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

Il 10/11/23 02:29, Stuart Lee ha scritto:
> Add error handling to check NULL input in
> mtk_drm_crtc_dma_dev_get function.
> 
> While display path is not configured correctly, none of crtc is
> established. So the caller of mtk_drm_crtc_dma_dev_get may pass
> input parameter *crtc as NULL, Which may cause coredump when
> we try to get the container of NULL pointer.
> 
> Fixes: cb1d6bcca542 ("drm/mediatek: Add dma dev get function")
> Signed-off-by: Stuart Lee <stuart.lee@mediatek.com>
> Cc: stable@vger.kernel.org

Reviewed-by: AngeloGioacchino DEl Regno <angelogioacchino.delregno@collabora.com>



