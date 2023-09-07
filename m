Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F367EEC8721
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNizPIv3qbcJPhdO7ShSaiEDB62ZdEmazV6mRioLy1Q=; b=TS5mN4xvODO8nWH1cyYqpiLZlN
	7YXb3auebBXVLr6VDB9NAqaX6yi1/Zc7B16lpVC4+gcKJT3K5876QoRy73LK+B+5mGizShn9pbUHE
	j793J2CNXIbqMviXXj/CBQXSOXaTijDKZaIoUKLFSPbyuPdvYpef42DieV3/EYdIGeo6YDV3ZBlXX
	99IyYkKZFju8QlkoR0jBQhkcXclxmCe+VIAP5lz5fm32CsCdstph72bNxQpwHltunH6Um3ksaKlCZ
	l6f0xJE6900cmmeIRWz6MkBugdErLIyF7NI+lGRcnRPFWfDdl+LeNNrlnRdVZQk1MiRYtqmCe1NCi
	LKFuf4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeECW-00C5Yj-36;
	Thu, 07 Sep 2023 12:33:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeECT-00C5Y5-1V;
	Thu, 07 Sep 2023 12:33:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 692EB6607313;
	Thu,  7 Sep 2023 13:33:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694090012;
	bh=jc2UvrrZDMDCN5bgnaY8vkhBi8ZpUIWYdaEXMG6s9sU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ui7b2zrJo+ssZiDi9E0vSrxlBE+DazJqtVv8lC++DLGn3kP2QFt9S0NBGWTCFsDBV
	 wfAd0PoXN9vSyq0IzSvVYYSe4fa9owZ7t9H3JvmZGJiQr0W2DK0Nd4Yaqkms5lhcVk
	 TY6nYQ65XHqIEvcYUQ7C+gQW09HtuPCtw+Hz7+eQZ8b4BO7eVlQkPUFNQS1r8100eQ
	 SnNPPmmuVL8ABKvtEV8jwCqkiz2yIS0bboCiCofOsU9w6A8bAXK4nkUU0uDXW7D2VG
	 UEeggcXvChnEazxC5AetBiLaFE+xIem71kWye8nN0LsAec+EoUeKLgQ1/WXtvYzSPV
	 CueDkq31ZquCw==
Message-ID: <d43e0d7b-1e93-f9ae-df3f-cbf8a3381a70@collabora.com>
Date: Thu, 7 Sep 2023 14:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 13/15] drm/mediatek: Add missing plane settings when async
 update
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
 <20230823151332.28811-14-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230823151332.28811-14-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_053333_635490_8531E1C1 
X-CRM114-Status: GOOD (  14.91  )
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

Il 23/08/23 17:13, Hsiao Chien Sung ha scritto:
> Fix an issue that plane coordinate was not saved when
> calling async update.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

 From what I understand, this is a fix for an issue that was present before
your newly introduced code.

This means that you want to add a Fixes tag, and that you should also send
this commit separately from the IGT series. Please do that.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index ca22d02375d5..dc19827f6927 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -210,6 +210,8 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>   	plane->state->src_y = new_state->src_y;
>   	plane->state->src_h = new_state->src_h;
>   	plane->state->src_w = new_state->src_w;
> +	plane->state->dst.x1 = new_state->dst.x1;
> +	plane->state->dst.y1 = new_state->dst.y1;
>   	swap(plane->state->fb, new_state->fb);
>   
>   	mtk_plane_update_new_state(new_state, new_plane_state);


