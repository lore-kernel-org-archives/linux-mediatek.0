Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgB8DnRP5tCK989IewNm104g8u5+mXuErzmqfBsM3FU=; b=tZpfZwbvc3fuIS
	l06eI6kOpzoTiW9NkQVASoDorPgUH4RvyPugCHwN3uA7AREKg9eMZfgFoyqFwsUt9m1WxrQUhntbG
	D4t++KGLrIMb/jiV/VDKOy76LuncOaXpG9SjheLP3BDQkqm5NnM+aIsc3ZWcgknaRoS0yEz2afoig
	Hr9bPdspB6d4sum91rad17AvlVOgFcTaLJAmSCZjlZYnr65zWBLJlqVmqi+T7JV7iQ5nahV5dASf7
	CoELLidp80dFJtzq06WcNPkbCV2OIKu+pmdf+exVedX3MVLDuwG8jCFceOMaQ2mAXibPvqKTNuDoB
	jyA8lwVcJnQo8WF33yTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njasb-00HY6A-9o; Wed, 27 Apr 2022 06:10:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njasO-00HY3u-MZ; Wed, 27 Apr 2022 06:10:15 +0000
X-UUID: a2127585777a4adca8a62ac2b4c7f1ce-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e5383687-6648-4829-85c7-f2ff5aea0580, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:07ecda2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a2127585777a4adca8a62ac2b4c7f1ce-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 997248611; Tue, 26 Apr 2022 23:10:04 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 23:10:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 14:09:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 14:09:49 +0800
Message-ID: <26991dca6f52b2a8be11d03496cff084174222cb.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8183: add dpi node to mt8183
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Pi-Hsun Shih <pihsun@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 27 Apr 2022 14:09:49 +0800
In-Reply-To: <20220426164547.434324-1-fparent@baylibre.com>
References: <20220426164547.434324-1-fparent@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_231012_770875_A57AC026 
X-CRM114-Status: GOOD (  16.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-04-26 at 18:45 +0200, Fabien Parent wrote:
> From: Pi-Hsun Shih <pihsun@chromium.org>
> 
> Add dpi node to mt8183.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2: no changes
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 4b08691ed39e..49e662e34b36 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1507,6 +1507,17 @@ dsi0: dsi@14014000 {
>  			phy-names = "dphy";
>  		};
>  
> +		dpi0: dpi@14015000 {
> +			compatible = "mediatek,mt8183-dpi";
> +			reg = <0 0x14015000 0 0x1000>;
> +			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm
> MT8183_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DPI_IF>,
> +				 <&mmsys CLK_MM_DPI_MM>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL>;
> +			clock-names = "pixel", "engine", "pll";
> +		};
> +
>  		mutex: mutex@14016000 {
>  			compatible = "mediatek,mt8183-disp-mutex";
>  			reg = <0 0x14016000 0 0x1000>;

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>

Regards,
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
