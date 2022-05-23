Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E205C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghqfc6YWPO34EcjXJuPJ5jYHkGpxJiDlAfojqtpZgxI=; b=EseYHGaXAkwgBz
	tHVQ6qOgVOhddhWaWdszKJRI8P6zdBlR4EZSKwmTeTVwR0H2hDL2iapKS6wPcNneCXRdvt5cilGDx
	AZ4pgV3AIBYKrmN4yGenJGKPDrLOxlRs4xsWs3e2BYZIQDNG6RarEL4pD3HuYGmstlDGJxDLnSw2f
	cvuhsMZ2AysQ86C26PeBRGPnIIxKEfAS044gu7snH+E0ORzXKrPGS1jAYxcvApLgqJ8E8LzITnN4O
	GTkz/6xE3sCec/BH7bYyOqdJKNKqZC2QY1J2d0uasUA2TO2Zpo+zfjYQd6yNzl0OavGgQ9JTrrFKP
	jTX/U1IaJGHAv80OpKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6A8-003fd5-UC; Mon, 23 May 2022 11:23:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5VJ-003L5E-VP; Mon, 23 May 2022 10:41:39 +0000
X-UUID: 7f43226e069e4792b4990b0a1c721f99-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:6eace708-51fe-460c-90e3-85ad4ffc7279, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:6c323ae3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 7f43226e069e4792b4990b0a1c721f99-20220523
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 437158327; Mon, 23 May 2022 03:41:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 03:41:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 18:41:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 18:41:25 +0800
Message-ID: <40eb8f7ed5b5d6dc3aeb5b82e04986049a2e47f3.camel@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: mtk-xhci: add support 'resets'
 property
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Date: Mon, 23 May 2022 18:41:25 +0800
In-Reply-To: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
References: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_034138_061164_1857F8EF 
X-CRM114-Status: GOOD (  15.41  )
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

On Mon, 2022-05-23 at 17:04 +0800, Chunfeng Yun wrote:
> Add 'resets' property to support IP reset usually by top pericfg.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> xhci.yaml
> index 084d7135b2d9..892718459d25 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -113,6 +113,9 @@ properties:
>    vbus-supply:
>      description: Regulator of USB VBUS5v
>  
> +  resets:
> +    maxItems: 1
> +
>    usb3-lpm-capable: true
>  
>    usb2-lpm-disable: true

Hello Chunfeng,

Which soc we will use this reset?
I am upstreaming another series for system clock reset.
I think you should add how to use for this series base on [1].

[1]: 
https://lore.kernel.org/linux-clk/5067ec46-7a82-6b7b-5b07-3102cfaefbf6@collabora.com/T/#m5b6abb9bd2109e4ed9a1a3eeee6e7976892cb8c2

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
