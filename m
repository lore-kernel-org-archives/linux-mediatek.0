Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED69C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mw2n05YkjSy12vw33Ws0O7I3Ym/zCEmuwVV6atP2pTQ=; b=yGDT23jCGUnXoYwYYi5VJbvY9w
	4jfTWb0K3gQWiAhgLOJoj2//U0bfssuMfeq1e2aRH09iinqsFjcA+y/LSS8UFGb/j5fk+mwJwgr4z
	BQx16cP+n26XhHpnP32izAFHiP1n2Mq3gz5wIWYeUz5h0SbM/TcdgUfjoMPdxwlgQNvrK45hSphLv
	9b/KhM3nY4uHBsdz/akwiLzwsOYLoWShWqUIUGrrrsOakS2wnQ1VP8CaxZW5LS6PFzlfvYU8NxaMm
	KQ7Z2nNKaaDdiVq/P9KR+lgzRLD/XwjjWUigUpNuLTF3JhuG8SWVilSWDYMzXBOBzS7O+GLgmWWej
	KzvCbS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7znl-00FTpv-P2; Wed, 21 Dec 2022 14:10:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7zYH-00FKck-Pr; Wed, 21 Dec 2022 13:54:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 941B16602C60;
	Wed, 21 Dec 2022 13:54:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671630872;
	bh=uRpuNCKUngRkdpvBDnBL2vpNR+gY/XoPcezBtl5F5ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UV4hyzLgHTk+VLRFh3Nz0P0IWPiEsGWmyp3JPJSbOKIedipZbhNWJl8GoIOafcy1E
	 a2rIkTU8Dcw0n05Vfjn17g9ks0COCZ1I+JyLmcOsmKDGvYgKaDLYQRHn7BkVeX9W2j
	 kiZaiHFXtIjoTzYyHNcpTc7bd6JzKj2u9L9Jr+mZ1K5eXB+A+PeO+XcvoFXYFFzVmZ
	 VL3n2YtBIJs5lmTTU5EBH2MNwcPq0Al2yTxXOy8ARql1P27FaXxvIRCFgt9mzSYADj
	 ruuAUnkU0qbhHXP4C3bRyYz/Fq9fEYg+8OivxVCLEsJwreSDVhtCyaOLoBDJruhfBH
	 zAovyEBiOGJ4w==
Message-ID: <8911df4a-e581-3792-ba8a-7c150ed8407e@collabora.com>
Date: Wed, 21 Dec 2022 14:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 0/3] Add vcodec lat and core nodes for mt8192
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_055434_037728_258EB024 
X-CRM114-Status: GOOD (  13.71  )
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

Il 07/12/22 06:51, Allen-KH Cheng ha scritto:
> This series is based on linux-next.
> 
> Change from v5:
>   - Add required interrupts for mediatek,mtk-vcodec-core
>   - Rewrite commit message for 'Remove "dma-ranges" property for decoder' PATCH
> 
> Change from v4:
>   - Add patch for removing dma-ranges
>   - Update child names to video-codec
>   - Update patch title and message
> 
> Change from v3:
>   - Drop `vcodec_lat:` and `vcodec_core:`
> 
> Change from v2:
>   - Add a dt-bindings patch for changing "vcodec" to "video-codec"
>   - Rename child names for vcodec lat and core nodes
> 
> Change from v1:
>   - Replace node names with video-codec
>    [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> 
> Allen-KH Cheng (3):
>    media: dt-bindings: media: mediatek: Rename child node names for
>      decoder
>    media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
>      decoder
>    arm64: dts: mt8192: Add video-codec nodes
> 
>   .../media/mediatek,vcodec-subdev-decoder.yaml | 68 ++-----------------
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 59 ++++++++++++++++
>   2 files changed, 64 insertions(+), 63 deletions(-)
> 

Matthias, can you please pick this one? It's all good and tested.

Thanks,
Angelo

