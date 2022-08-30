Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478FFECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlIDzpm52XnhaRrcpRQTmi3/JHbrgQkEEjWidjU0wEY=; b=LfC1LNK77ammQOi8+wTBTMXVvE
	7IegHAlSKJmcmWMOFDcN4xqZCDzE4gtz0h+qA750d1+jGuGP4cB4cQzlr5F2+hD+EzBDu4Uyt4lYB
	/isCMphYeqIeIKdCnT8NW5fSAmrddM02b/6YaI/sATt4Ws1PMJkSr3ykPFCeJ0mqrNt5y4OLQAuMU
	uhIcr2TMekYbjrCvEOIbRZBTTgVP1g2ifZIp1yUPmAZ/f3EXJYehXobCbXoTPXd/TslmnMRVnd8ej
	IrEbDx6l4Ms+juCwql3UdKVE3nNnfqP/yMt1yAVj071HcZRpAky2ZM4Kci1jdNwSaTQRn93wqVjkO
	J0AqfZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwKy-00F4nb-10; Tue, 30 Aug 2022 08:11:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwEO-00F1tR-PA; Tue, 30 Aug 2022 08:04:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 985836601E8E;
	Tue, 30 Aug 2022 09:04:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661846659;
	bh=GJTT/+oC84VOzmoCMWQbYo6gCKJxXUVb6WsZq7befSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hY1arLLCHiudf/f8QWUU8Lj3X+uZ+7gf4C5dIzPmbYDSNd5XWXvzXQKRwA6SM9rAS
	 J7yIFjkQv93hBk1BeI86Hf7WP2y5TyiJBFKD3jnmo6evTEKAAaDnyhDu+1CE83SauY
	 arUn61LBtCFqlOVDQR/K0KglyQb2I28AP91KJ47DUUXgFT/45I32Kuefb+foFSQzQf
	 lbEqHBDzYpU7ipvqmbTWnqCAdnRADHyBzjHhJA3dPRClMIIVnzJNIZab5pOwafkwl9
	 GJJk0vRm+Wd+KbdxrTRAFZfcDbWMvSz1ZLLZivZmMXTTcFYBcwuJOACxRIuHiep4XL
	 w5XPoJIYwil1A==
Message-ID: <c34ba319-ad62-5ec7-55c0-94027265e77e@collabora.com>
Date: Tue, 30 Aug 2022 10:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: mfd: Rename mediatek,mt8195-scpsys.yaml
Content-Language: en-US
To: matthias.bgg@kernel.org, lee@kernel.org, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mandyjh.liu@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>
References: <20220825141656.15747-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220825141656.15747-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_010421_008004_BBC6625A 
X-CRM114-Status: GOOD (  13.15  )
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

Il 25/08/22 16:16, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The file describes the scpsys node for all SoCs and not only the mt8195.
> Rename it to reflect this fact.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

Makes sense to me... but you forgot to change the $id in the yaml file to
reflect the new name.

Please fix that, after which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml}     | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename Documentation/devicetree/bindings/mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> similarity index 100%
> rename from Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> rename to Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> 



