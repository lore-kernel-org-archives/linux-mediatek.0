Return-Path: <SRS0=uEYr=Z4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F5CC43603
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 04:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061AE2464E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 04:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kloj8Ho/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y52jFYLB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061AE2464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AN2pIgkl3uTkAVrW3OCuZ/CQjjlLDt/x6tY3+Yy9wSE=; b=Kloj8Ho/S+deuc
	0/bRywEshow0F8+WnabjVgNO5CsTZMzwaRoZYa1Rr8/gdzc+m19mNOew3iaJMLDvbitDxmcBVS82L
	NTFESYTyOiDKL8KKuBuv915zL/8EZQzUlgJVwW4MJVmwR8DKXJsDVVQ0MNZ+uvRw3BsWuP0tPqD5v
	u8fgH0qCdkGtMhmpIFoe17+5wuuIAspgOhuazZeJVsqoztotzmX893NTdY0iwbNHdR2g63+sk1qKm
	uQ7XbuoxKoWkaxYEX8SDYDMOVaRl9bE2p5VFaBIpsmWG5kBXXilbffvh2Ne0o1OmcssZ80pQtBNIY
	NaUNKByruJTtkEe8pgNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id4sG-0004x4-Sr; Fri, 06 Dec 2019 04:05:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id4s9-0004oi-Bf; Fri, 06 Dec 2019 04:05:42 +0000
X-UUID: 0a38db9cf884475684b993c59901454d-20191205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CV7DAlbfexttU47r175IIVk9wg60txROOSVKG7NLYFA=; 
 b=Y52jFYLB+9X280FVFRBpAuANp9f36YN5zyXlYCynNuptFZ/OLgJ0CBIPuaSgIw4z+zOjd4mZdyc0Q82fbWyAxSjE0+byY/oGMHC71qShnz8zmbqKpS4CvR/HORqdk+fIYJDPJiIoWVLfyFnldB0JaU+HQeqitXNKmAOtho/mQXc=;
X-UUID: 0a38db9cf884475684b993c59901454d-20191205
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1287684418; Thu, 05 Dec 2019 20:05:38 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 20:06:30 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 12:05:19 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 12:05:09 +0800
Message-ID: <1575605122.6151.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 05/14] arm64: dts: add gce node for mt6779
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Fri, 6 Dec 2019 12:05:22 +0800
In-Reply-To: <1574819937-6246-7-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-7-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_200541_403875_58C0C0A0 
X-CRM114-Status: GOOD (  11.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-11-27 at 09:58 +0800, Dennis YC Hsieh wrote:
> add gce device node for mt6779
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index daa25b75788f..10d59385f4a1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt6779-clk.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/gce/mt6779-gce.h>
>  
>  / {
>  	compatible = "mediatek,mt6779";
> @@ -159,6 +160,15 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		gce: mailbox@10228000 {
> +			compatible = "mediatek,mt6779-gce";
> +			reg = <0 0x10228000 0 0x4000>;
> +			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
> +			#mbox-cells = <3>;
> +			clocks = <&infracfg_ao CLK_INFRA_GCE>;
> +			clock-names = "gce";
> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt6779-uart",
>  				     "mediatek,mt6577-uart";

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
