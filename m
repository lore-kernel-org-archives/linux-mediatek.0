Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2989C48BDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 01:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF4B61356
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 01:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF4B61356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6VQWXC7yWEo3QlYBmg14MzvyExbmxdAcpFDnb75SvQ=; b=KZ/zQIad6uJjcy
	yHvD2L1lBUal3v/Xo11BR/D7WYmdwWBNEhwFZx2090j705C3ASaAjWjWqqMMD4I4p2RfDTfG4V55H
	GRfjm7u7JpcnI7qvqrgzNAYAfiF/uxn3N+ZFRkZge4KAV6+cLNMKWsfpSvq77EJWrN+hzZXiZ3Kpj
	63a1jLEreGoFztEcl/iFRrhZgK1D+wxlWM8n6wHxsl/ABwJCxwosJoYj00vnsBh2GMnquy05hGcHJ
	TfgtuW2ov31AcPiMwcBVFcgAITJWdmzI4qiBNEVp6Opq24AlVzstq0qENy3HUKk8X58DG7Cx3yQ+b
	XLFQmQl6gS0KZaFHAeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltKSt-004NK7-76; Wed, 16 Jun 2021 01:35:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltKSq-004NJN-Ne; Wed, 16 Jun 2021 01:35:34 +0000
X-UUID: c681f7dec74f4c9b88dfa1d001d7f99e-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bN1zFdu+kgnFsjJiRGRT8DKoz4fiLgKY4mbL1c8VCqU=; 
 b=qqQg9rdv09NK1kVK9mzM0bPxsZP1WSKYAWETMCKF2x77NhyCQfmWVm/eMgWFXAY3ueSHIGEGWbuaFHn0iir2VBIKJI80J1CYhxI5vRQWojUJJ74cGARuAOygb+Bps8JVZ3sMuksx2//k3gGFUohUhNLg3tk2UruyHb3xe3f6d8k=;
X-UUID: c681f7dec74f4c9b88dfa1d001d7f99e-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 94676190; Tue, 15 Jun 2021 18:31:52 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 18:30:11 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n2.mediatek.inc
 (172.21.101.101) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Jun 2021 09:30:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 09:30:02 +0800
Message-ID: <1623807002.15910.8.camel@mhfsdcap03>
Subject: Re: [PATCH 12/27] arm64: dts: mt8195: fix mmc driver
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>
CC: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 16 Jun 2021 09:30:02 +0800
In-Reply-To: <20210615173233.26682-12-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
 <20210615173233.26682-12-tinghan.shen@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_183533_107778_EB5811EA 
X-CRM114-Status: GOOD (  15.47  )
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

On Wed, 2021-06-16 at 01:32 +0800, Tinghan Shen wrote:
> From: Wenbin Mei <wenbin.mei@mediatek.com>
> 
> fix mmc driver with proper clock for mt8195 SoC.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 539f405a4f3d..327ff1b856d2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -926,22 +926,32 @@
>  		};
>  
>  		mmc0: mmc@11230000 {
> -			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
> +			compatible = "mediatek,mt8195-mmc",
> +				     "mediatek,mt8192-mmc",
> +				     "mediatek,mt8183-mmc";
I have submitted a patch to fix the
dt-bindings(http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025456.html), Now which should be:
	compatible = "mediatek,mt8195-mmc", "mediatek,mt8183-mmc";
>  			reg = <0 0x11230000 0 0x10000>,
>  			      <0 0x11f50000 0 0x1000>;
>  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
>  			clock-names = "source", "hclk", "source_cg";
>  			status = "disabled";
>  		};
>  
>  		mmc1: mmc@11240000 {
> -			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
> +			compatible = "mediatek,mt8195-mmc",
> +				     "mediatek,mt8192-mmc",
> +				     "mediatek,mt8183-mmc";
Ditto, this should be:
	compatible = "mediatek,mt8195-mmc", "mediatek,mt8183-mmc";
>  			reg = <0 0x11240000 0 0x1000>,
>  			      <0 0x11c70000 0 0x1000>;
>  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
> +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
>  			clock-names = "source", "hclk", "source_cg";
> +			assigned-clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
>  			status = "disabled";
>  		};
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
