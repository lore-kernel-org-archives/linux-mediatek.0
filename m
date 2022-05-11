Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 02:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJQazqCoPzblC3xd9y72NzoEQhEyP9I7VRL9rAt3awE=; b=TmU56cbEFHU1Gk
	8WmtvriHcc9o6kmhX6QnJLKwNyzm5zh5ub1+dyBiHZFPPJtoKbx8wYvO8O+Fiyd4JdyeO09RX9f6z
	BrE+oNTgnmlONVDLw4FYz6aITz0vwaoEaewrEWTv9svaZNha2n5TqL7IkD8NsDAED/7K6qKSR/qFN
	mv22VofKe3UtRCX74UfXLxi5LmaQNG6T2xf80hmIE9bL7TnOx0mq61UkouyKNfZnmfds0SOaG0O2w
	5cxo5nG0YlifObGSPVQykFf8E2SuyontmF9sevMVJZ5Wt5zDLYxNo1yAKcYGmn4goR6YpJENox6ai
	YHGD0VW87sZStXnrAx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noc9C-004o4h-Dn; Wed, 11 May 2022 02:32:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noc90-004nyx-HD; Wed, 11 May 2022 02:32:07 +0000
X-UUID: 3c52d7b1ac7443d4a061d2bcf81d8f44-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8a0959ab-11ba-45de-a83e-b334aa4d2538, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:081e59b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3c52d7b1ac7443d4a061d2bcf81d8f44-20220510
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 349938764; Tue, 10 May 2022 19:32:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 19:31:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 11 May 2022 10:31:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 11 May 2022 10:31:57 +0800
Message-ID: <3c2dd0f91c0ce007151093f1f3cb5bf8f49cd248.camel@mediatek.com>
Subject: Re: [PATCH next v3 2/2] arm64: dts: mediatek: mt8195: enable usb
 remote wakeup
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Fabien Parent
 <fparent@baylibre.com>, Pablo Sun <pablo.sun@mediatek.com>, Bear Wang
 <bear.wang@mediatek.com>
Date: Wed, 11 May 2022 10:31:57 +0800
In-Reply-To: <20220510121027.19041-2-chunfeng.yun@mediatek.com>
References: <20220510121027.19041-1-chunfeng.yun@mediatek.com>
 <20220510121027.19041-2-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_193206_616582_353454B6 
X-CRM114-Status: GOOD (  16.67  )
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

On Tue, 2022-05-10 at 20:10 +0800, Chunfeng Yun wrote:
> Enable USB remote wakeup of all four xHCI controller
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: add reviewed-by AngeloGioacchino;
> 
> NOTE:
>   based on v5.18-next/dts64 of matthias.bgg's branch
> 
> v2: no changes, based on new version of mt8195.dtsi
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index d5bc4cf5f4ac..3ad14e0e0956 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -573,6 +573,8 @@
>  				 <&apmixedsys CLK_APMIXED_USB1PLL>,
>  				 <&infracfg_ao
> CLK_INFRA_AO_SSUSB_XHCI>;
>  			clock-names = "sys_ck", "ref_ck", "mcu_ck",
> "xhci_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -636,6 +638,8 @@
>  				 <&apmixedsys CLK_APMIXED_USB1PLL>,
>  				 <&pericfg_ao
> CLK_PERI_AO_SSUSB_1P_XHCI>;
>  			clock-names = "sys_ck", "ref_ck",
> "mcu_ck","xhci_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -655,6 +659,8 @@
>  				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
>  				 <&pericfg_ao
> CLK_PERI_AO_SSUSB_2P_XHCI>;
>  			clock-names = "sys_ck", "ref_ck", "xhci_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  
> @@ -674,6 +680,8 @@
>  				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
>  				 <&pericfg_ao
> CLK_PERI_AO_SSUSB_3P_XHCI>;
>  			clock-names = "sys_ck", "ref_ck", "xhci_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
> +			wakeup-source;
>  			status = "disabled";
>  		};
>  

Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>

Test method: test build pass and boot pass based on 'for-next' branch.

N
ote:
System suspend and resume of MT8195 has not been ready or enabled
on mainline. We cannot verify USB Host remote wake-up on mainline code,
but the settings and function works when applied to MediaTek's internal
working tree.

Regards,
Macpaul Lin



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
