Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92648CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOtKhfc1lc7m06lIfJzqufK8TAi65b8itrWydHLnlJE=; b=iL2+g2tFPC5Ix0cBp2vdSdUC8W
	o69XpHCAbY5d5ZHJOmhT1kv2Zxp6xYYObkGz7gPUQINQbcA2fRV6MMXZuPcFoMzQwQfunt7aFGW+n
	oYvinh8ehf1EwV7ZSWsdF903zi9eWVkkqPUHBnamrDXLt/Xe9hz7PgDSz4XbroWFQ5wlYgPIzocgC
	Hqy9iO7bi2pSSCN05JGWfgc3d6LcIxU2ueJW2qEL1Q7hXsaz+dxw9gqYWVxI8b6+VOT+o//zRMLFq
	zhtFPVWVpy6GIDoIAmqBMUnqiMNaalgY3q3NUJfbktxfM6pQBq2qfdoYdSkX0tAY8yl3TwDzugzqo
	MQgR6/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st3zF-00000002DV1-1vDe;
	Tue, 24 Sep 2024 11:45:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st3vg-00000002CjM-0tGs;
	Tue, 24 Sep 2024 11:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727178122;
	bh=+fsK5xp17nTvCAyZ/wFo8VTI8Bqp558Z+p7y9KUbR8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TYUC6mb1OIjY9Tr4ZxGTLJPC5ICHePECuoh+hbdqqWwlnd3qgZaJRM5v6doRGjr4E
	 JssL9RyNYt5kthsIhU+xnWA8wxsQ6HgsAnsCTr+on15AtWym1LAfL3QFAEJQV3UIrE
	 jgNHeU0+9wT2d0+AOn4Nl3kHCb5I+pYYMbBoMiS8MnkGipijHC222pyGsy8wf+DwVy
	 3prdbZ1y6xMH2um7supv3bRfkkPU/FYWqq28nvEfAq2GQMDTmVqFcnBfQgS8SluzAz
	 epQ8kO5TXXkI0TPtiJfC0P4bjNw7dh1f5uRGmP0LAr0Fm2Hb/aerekXUorzNzFbX9S
	 LU2kNeswr0z4Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DAC317E107A;
	Tue, 24 Sep 2024 13:42:01 +0200 (CEST)
Message-ID: <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
Date: Tue, 24 Sep 2024 13:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924103156.13119-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_044204_457367_50926794 
X-CRM114-Status: GOOD (  14.25  )
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

Il 24/09/24 12:31, Macpaul Lin ha scritto:
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>    display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, add "maxItems: 3" to the 'clocks' property in
> the DT schema.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,split.yaml     | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index e4affc854f3d..42d2d483cc29 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -57,6 +57,7 @@ properties:
>     clocks:
>       items:
>         - description: SPLIT Clock

That's at least confusing (granted that it works) - either add a description for
each clock and then set `minItems: 1` (preferred), or remove this "SPLIT Clock"
description and allow a maximum of 3 clocks.

Removing the description can be done - IMO - because "SPLIT Clock" is, well,
saying that the SPLIT block gets a SPLIT clock ... stating the obvious, anyway.

Cheers,
Angelo

> +    maxItems: 3
>   
>   required:
>     - compatible


