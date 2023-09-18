Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B42C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOyUQzbxbHJBVWdLqEE/MMYKB8vqaJSCYQKz9awiF60=; b=d6LooVhaTeH4zQsm1j4PZGS2b5
	OFm9nwW/qG9h5PZ4MjQiTC/XM/8mL187+FIZnLvCfujwDinwTGg1ykWC7Up6BDOHkq/InR5tMaLut
	AG3nt+sXDdWwsgdv9iZAyS7CWUkWHOWsIp9qek5xWzrwhsilDTtuXhELlnFBZzUwD2EXQe/NcIs3t
	8kDUX4YNQqv68wEnmkHKfZxCOjqfOgMaA7a250rOL1EUW5ZNd40hooaCoWMXTkx1YAXvjhdysWN+M
	tGcZi8YRPYSVaS25wHXUTr4Za4bCq9WQPo5rDDDMhXJ3NGk6BLU3L2UzYqrnKQl5lyOboGVtI/94M
	dMMZ7Qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiA5H-00EtUn-1L;
	Mon, 18 Sep 2023 08:58:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiA5E-00EtTz-14;
	Mon, 18 Sep 2023 08:58:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 52EA16607038;
	Mon, 18 Sep 2023 09:58:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695027498;
	bh=SUXiUUTJBd6EsiVrsXV6DfZkNyX+jZm8fkuFz0ratxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FXV+c/ERhX3eMolpXIjwEvqYoyhXSTQ3ptIBGDw/n6dWDNRlQsUesqpCkr/yJ58e4
	 NbGvw+XSiMGGBT26UxNpHnjEuhswjuvx+zeeQDMIbnHE6L9bG76wTTYjk2dfVyZmrp
	 M/eDosVlznjzrLWp2iAEeRR5kbE2fYRKWwUy7oLQ1TRnB83GaLjiUgb4sT6cfmQ8iT
	 PUC3LbPxoDJ7H9wrnA1nUMrUb+G3mixhwhrIUHo6rbNX0jEMONDRDt8tbz+dBqCsrK
	 nGrlxyT6VAHSXUg3Xduhsns9tl/ULKdGrJEmf8IoHPIj5UlAJOFaVE7pqDOOuzaMcj
	 uyF6dFBk5HKvg==
Message-ID: <4327d3d3-49fe-14ce-6556-31f4ccd7f02a@collabora.com>
Date: Mon, 18 Sep 2023 10:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] drm/mediatek: Fix errors when reporting rotation
 capability
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230918071011.18481-1-shawn.sung@mediatek.com>
 <20230918071011.18481-2-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918071011.18481-2-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_015820_503560_835B24AC 
X-CRM114-Status: UNSURE (   8.26  )
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

Il 18/09/23 09:10, Hsiao Chien Sung ha scritto:
> For CRTCs that doesn't support rotation should still return
> DRM_MODE_ROTATE_0. Since both OVL and OVL adaptor on MTK chip
> doesn't support rotation, return the capability of the
> hardware accordingly.
> 
> Fixes: df4444577118 ("drm/mediatek: Support 180 degree rotation")
> Fixes: 84d805753983 ("drm/mediatek: Support reflect-y plane rotation")
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



