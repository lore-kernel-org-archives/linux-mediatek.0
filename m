Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9786C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 12:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk0y88nMjOYqhJeT1FSq7+zFzT8zxP9lb3FcmVqd/PQ=; b=ySRtPJ2gXQ60g0FsfUkKgUsu4Q
	D0OCIDpBpp3yt5XlNuT9R8kBkYrk5GulDj5XOcRr/ryCRfpWU3IAtElj6fDzEgkQYAiGMlz6CQcmj
	xpKnCAPAdwovldDGLR1i3TPaUCFjwg9mRKuND8kMwknmkNHTOs4z6OKtSsTgao6J3w1GEU0lJsio4
	MmOs/ZJraPL3KQs0s0EVJi6qSaVUbrNtLvHb2Q8ax+6B7AqSmthlSpfHcZjKLPHA+9dxWM+ldih4T
	espg6KOYi3ulwBUsn2b2rKYl1T6QY1vs0X3eQDNWCsz6XhzmJ/sOXIcjt9B+rL4Es6NvrFP9tYc2p
	NybxNGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaH3-00000000cwB-15ZP;
	Mon, 26 Feb 2024 12:40:01 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaGN-00000000ccd-442a;
	Mon, 26 Feb 2024 12:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708951158;
	bh=zWqIhRQomq+Rh9bLslaOnZhfog8T1JQg0iJ7/d0GPd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WD6sijNuZnnQtTu35pRonXDaVFGxoPRTZxZ5rm4CcuzIkAfa6wrwnLRsPPjvmu99c
	 HklfblJ8KPo2km9o8/f82uy3DKNj1eIA7jh+yl8XR4t7lOG0UcM5Jp04JkwNQ5gqnA
	 BUoV99J3lsa2Zpoa/aw+XaE0CEVILQx3HaOjSvMvsZDQZ98AE9l1/RRdxU9APe2qsk
	 kYBc5wGZqE47O8+0tUVzgOgQGLJ0PQPlsRjMGDFSKNodprbBF8zh6lrTugKPvfAbvr
	 d9qEZk6qsEGv7OWPjDMy3OUdPhFLVk23RYTSWBKNcmUg8xuTpVKYCTCGu3TLCInodf
	 nOQbA07w+jB+A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C697B37820C6;
	Mon, 26 Feb 2024 12:39:17 +0000 (UTC)
Message-ID: <9e007c06-333c-4618-98a5-17eb9283fda3@collabora.com>
Date: Mon, 26 Feb 2024 13:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/mediatek: Rename files "mtk_drm_plane.*" to
 "mtk_plane.*"
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
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-9-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226085059.26850-9-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_043920_191586_1A4E985B 
X-CRM114-Status: UNSURE (   5.15  )
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

Il 26/02/24 09:50, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename files mtk_drm_plane.* to mtk_plane.*.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>


