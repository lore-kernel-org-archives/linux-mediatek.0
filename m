Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457E1C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Oct 2022 04:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWjBZCkykQbBc1ryP13P2V1hr38xsz+ryzAbDiTxDkw=; b=NkyD0e2iIx4iZRnTjBHBNmGTQs
	v67hQ/s1P18UgNwCY/zZ6imhwgUFYR2fpBStJ3h/WzkWrivoK5m4wjnLTfHjQS71cjBe5mmjnYN7n
	0LhLKBQ3JqLJMjj0Av2Rztr8iG7iOVdyfLSW8x0lyNk+ZHSu5N5/5ovCvXPW7mHW0bPM1jJ3/kJ6t
	8u7CMpOjFX11g69CXBFzeboGKimcGERbz15FygNx4ZcNQ5N40BeH3RpF+eMkwgq8wPnYU3jkH8mYc
	W+R9rE1klgiKWXfk0knVzEyVyDXtVpsDVLJh6Rc8fpl/fbkcMTPdi9bZQ5w82vMB5ZkoHl3NIoWEn
	Kv4RG48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojYaR-00GPqf-3w; Sat, 15 Oct 2022 04:15:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojYaG-00GPpT-2Z; Sat, 15 Oct 2022 04:15:37 +0000
X-UUID: 19c4852b1aee4364aa44c0e9f830ba91-20221014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DWjBZCkykQbBc1ryP13P2V1hr38xsz+ryzAbDiTxDkw=;
	b=gWajdWnJGrqJzQ6YV77ZpyNOzAWE43yaTRMwh7Kh4p5CsjPZyDWFqZmjmrmf2qwWQk3R+x1utJ58NOwgwTijRccrQ0X/D3+MSPh4U/yJkf/54Qu4SH7cyAr1cytPGKBz/OUu822vmqx4Jlzf2EOM29S1GX26dLb0k/xGYpESXxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:eb2e7e55-d7ed-4d91-b42d-001f5be61735,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:7b0cd6a3-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 19c4852b1aee4364aa44c0e9f830ba91-20221014
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 686710255; Fri, 14 Oct 2022 21:15:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 15 Oct 2022 11:25:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 15 Oct 2022 11:25:21 +0800
Message-ID: <5bd2c5d63cde6fdf8e92d6aa385687b1369922ad.camel@mediatek.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: iommu: mediatek: add binding
 documentation for MT8365 SoC
From: Yong Wu <yong.wu@mediatek.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel
	<joro@8bytes.org>, Will Deacon <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-mediatek@lists.infradead.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>, Amjad Ouled-Ameur
	<aouledameur@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>
Date: Sat, 15 Oct 2022 11:25:21 +0800
In-Reply-To: <20221001-iommu-support-v4-1-f1e13438dfd2@baylibre.com>
References: <20221001-iommu-support-v4-0-f1e13438dfd2@baylibre.com>
	 <20221001-iommu-support-v4-1-f1e13438dfd2@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_211536_134259_24F6BB25 
X-CRM114-Status: GOOD (  13.82  )
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

On Fri, 2022-10-14 at 10:45 +0200, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add IOMMU binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/iommu/mediatek,iommu.yaml  |  2 +
>  .../dt-bindings/memory/mediatek,mt8365-larb-port.h | 90
> ++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index fee0241b5098..4b8cf3ce6963 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -81,6 +81,7 @@ properties:
>            - mediatek,mt8195-iommu-vdo        # generation two
>            - mediatek,mt8195-iommu-vpp        # generation two
>            - mediatek,mt8195-iommu-infra      # generation two
> +          - mediatek,mt8365-m4u  # generation two
>  
>        - description: mt7623 generation one
>          items:
> @@ -130,6 +131,7 @@ properties:
>        dt-binding/memory/mt8186-memory-port.h for mt8186,
>        dt-binding/memory/mt8192-larb-port.h for mt8192.
>        dt-binding/memory/mt8195-memory-port.h for mt8195.
> +      dt-binding/memory/mt8365-larb-port.h for mt8365.

"mediatek," is needed here.

After this:
Reviewed-by: Yong Wu <yong.wu@mediatek.com>



