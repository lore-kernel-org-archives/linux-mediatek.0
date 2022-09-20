Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47CAECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 06:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nQv18pCIw8SGLAwbUpmj6Xh8P4iaLkLy7yN+PyXPvI=; b=EssVa98hUnyYQc4Wx93Ew+YoSl
	XM5YpA3E6Ol2ZYW1Mvdxouy4TW2tzeH3hUHMACeHdJL2LMVlXvymg8in/vB54gV7ZzcL1srSS5wy1
	6ftmBNBACoCTYRUctyRIMM51VkvzkDrASBtaxF46PDioRVyG7oSVSrpkd0VJDw1vz9GD22IPPl5tP
	Ghy4hB8sgK/4wwsQcLvG8fwlwVhL7tmFlADsuAFJyYNZWZ5PVNlvUb2kIpsQxJoUGddfX1lHWzK9u
	YTlvcYtgCDnCJzQUQYmUeZhIo/CSrfWy8v5PJKK+yDLGkebavQvaCYm1AOD3wIhw52PfOHDyWFNbY
	pDlxKFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWTG-000uN8-8C; Tue, 20 Sep 2022 06:11:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWT9-000uKn-9e; Tue, 20 Sep 2022 06:11:00 +0000
X-UUID: 6c9b37e3f0c94cd091bad38afcef89dc-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4nQv18pCIw8SGLAwbUpmj6Xh8P4iaLkLy7yN+PyXPvI=;
	b=ftoappUONeA+80T7w6O2ECTcXJcnSpyidrKcC7xrNaMjdfok5XVcrhgugjhpKUm7p3+KOWhrfO42G4mNNnEd6tpaj/iFWpzHLQJ/LfOiu7bltJSrJyoFPtk9LQ2J9mLHO/mCUO4mK6AaXQ1P88q2Z36j7wGLX7DP3V7JvM6gqP8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d9cb4462-0cb7-4781-a5f1-4fc68426b8d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:fb51fdf6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6c9b37e3f0c94cd091bad38afcef89dc-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 672957017; Mon, 19 Sep 2022 23:10:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 20 Sep 2022 13:20:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 13:20:11 +0800
Message-ID: <4a7e5e729f85c112a235e6bdd8bd337f90eabbf5.camel@mediatek.com>
Subject: Re: [PATCH RESEND] dt-bindings: timer: Add compatible for MediaTek
 MT8188
From: Johnson Wang <johnson.wang@mediatek.com>
To: <daniel.lezcano@linaro.org>, <matthias.bgg@gmail.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 20 Sep 2022 13:20:11 +0800
In-Reply-To: <20220818124602.20394-1-johnson.wang@mediatek.com>
References: <20220818124602.20394-1-johnson.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_231056_278812_126022ED 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, 2022-08-18 at 20:46 +0800, Johnson Wang wrote:
> Add dt-binding documentation of timer for MediaTek MT8188 SoC
> platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-
> timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-
> timer.txt
> index f1c848af91d3..8bbb6e94508b 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -25,6 +25,7 @@ Required properties:
>  	For those SoCs that use SYST
>  	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
>  	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
> +	* "mediatek,mt8188-timer" for MT8188 compatible timers (SYST)
>  	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
>  	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
>  	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)

Hi Daniel,

Just a gentle ping on this.
Could you please review this patch and give us some suggestion?

Thanks.


BRs,
Johnson Wang


