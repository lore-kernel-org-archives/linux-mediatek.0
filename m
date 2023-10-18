Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4EDCDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKDoS9hCi2bJWucktduGp5SRrJCScKITCZ/R9EkZz3U=; b=QTWmJMsKJHvqfo
	5mtX1gSQ22yH964lPGV9Btos9l1SCajV5OFrlJPxk8szs5vtC4hM4QbQyBb1iunS88vha0A4JWld1
	u+U/l9COm2TjliZXV96iljqabT65Byd5ddabss+lb6oRu8nEvVrb1t4TVW9B8xzpFGcPPFw38ayfP
	ZhFS8EQmmBSLI8hyEvoBv0pTD/pa2ZlFSZiP6BBkY1YF45I1IrNVVoH5bts/lm1VCE4BaTaMGxKRa
	tQxUjZQY1SLgT4yfKAA4xXNP8Rf/Lm2ZU7IZY5P7Sk17ZuQI8xBoXhxQXYUIW1Ae+d6BkTj2KwxjP
	tet5DKS/CdUTn9j6K4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1Ye-00E6Dv-0R;
	Wed, 18 Oct 2023 08:05:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1Ya-00E6D8-2A;
	Wed, 18 Oct 2023 08:05:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 514C166072ED;
	Wed, 18 Oct 2023 09:05:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697616331;
	bh=QqK3Qq/IcrlEdraizHHF1jjk88t7+0AEUmdS8lWGIZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XIzOvmtHMIURYqPL5tUpTTLhyIa9K+Xx7sHyL4caNB0k2/OJnFin6Wch6XHwR2tma
	 FdOiext+yURbhb9o97fSZu5Z9EeCejI+4vtA6WUK87rVspiR3YGzcBRX5PKO/BphnC
	 uRHM6zf9HP7BOQJbSqtLVmtNMg5NpnQ6mwZAk38yYp2Q07jqerZkOIFIryWJz/YPD8
	 5cv2dM1rscIVuL1mxtrByKNXnMCsrsf8Oro4vtgJbn0ejOG8Rr+2DLKsxL7mC8TIT8
	 WXE85G/2G5/erFrqpZQjIpPzHaw2QYPvSbu7DRiF3LyRCy8ujKsOLl6BAl0o1aIo+W
	 saADAWGoMGlWw==
Message-ID: <44f7f491-b8f5-4ed9-b756-db485a178694@collabora.com>
Date: Wed, 18 Oct 2023 10:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 18/23] drm/mediatek: Add Padding to OVL adaptor
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
 <20231018043650.22532-19-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231018043650.22532-19-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_010532_840979_D232D1AE 
X-CRM114-Status: UNSURE (   6.31  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/10/23 06:36, Hsiao Chien Sung ha scritto:
> Add MT8188 Padding to OVL adaptor to probe the driver.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



