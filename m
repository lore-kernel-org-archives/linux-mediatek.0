Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60386C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elMWRE3uZ5VNUXzTIH2X8MI9+sP4dS/M0w/dwAC8VTY=; b=2p26rQl+KJ30toSA1PBYSa2fnw
	WqatRGgFJs9U5eDdrWXX7qiIvmwpLNTd27WAUFCtrbk14eirFxlhK3Xeg0pHJaqqKCJPW1KY4OaKY
	ZL8gOqUwQ7RyxZgAcdgpOycRpxGaaQdUBsE6LY5Dz0LtcFKgu4tEdAIq3Cs3wPzyYi3h7ak+dPrt6
	jHMEoM/EfrgSM7J2eLRt+u8Pv64CY1ldXFJnpnKleQlzIqmbmrmDOkYHu8ON5a3CYBGGCkJSDL0oI
	E/u8jsaSMWgDiNG0Rh+QaFYvymkIRbeinbSRVJQzquniH3RxQw3k92fnSL70spLILuAgM19KQYdUn
	DI38+IEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NFG-00FIgY-0R; Thu, 07 Jul 2022 08:52:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NF0-00FIbA-PC; Thu, 07 Jul 2022 08:52:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C58B86601978;
	Thu,  7 Jul 2022 09:52:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657183925;
	bh=SjXlu1BzuvgJQEAcx1sxLxqh7TiY97I1x76gXwjySes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kzkTWUseHgOvVQr0JHkPjpthKMs8Sww3IzGGNp873z7NY5x92yxSgqt/fEi71T+dd
	 glOjmCXytRchOCrS3yUmpJTVU03hA6coXTjkvjsJn2YB2RHNvvmZCbtn2taRjvJPkl
	 QUZ0Fw9og8q9lCrtmAiEHEjZBIb5mVT+uZo8F2pfYmLcXCSLlc52tDXtwytHaBz5KY
	 WHZUAQ0ErbM1vqSeEb6sXJ7eVW2LRBwRB4BrwLzYz8sGW64grdIu56VcdB8Lw1iJFc
	 pQR07I7/FbCqm4Hz21SeLkrvEGyvFdLIRZqzcyZLcYpNINzIFSg6K0Mv4qXZKiNcjf
	 y0mJVzTkArkvQ==
Message-ID: <5916c91b-41a1-c97a-84b4-7d48739a0639@collabora.com>
Date: Thu, 7 Jul 2022 10:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiandong Wang <xiandong.wang@mediatek.com>
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
 <20220705122627.2273-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220705122627.2273-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_015207_033503_5D2866D6 
X-CRM114-Status: GOOD (  13.24  )
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

Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
> Add mdp3 mutex compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>


Please drop this commit. Adding a mdp3-mutex compatible is not needed here.

> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 627dcc3e8b32..234fa5dc07c2 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -30,6 +30,7 @@ properties:
>         - mediatek,mt8173-disp-mutex
>         - mediatek,mt8183-disp-mutex
>         - mediatek,mt8186-disp-mutex
> +      - mediatek,mt8186-mdp3-mutex
>         - mediatek,mt8192-disp-mutex
>         - mediatek,mt8195-disp-mutex
>   




