Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A1C19F2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Aug 2022 03:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LV9X3K0473c6ImlEQLa2K80dlVlE+kCm+u2RLt7EbA=; b=3A9vYg9MEolZuMUrhOZSgqlHnk
	V3Y9q80+n++guqHzAYq+42lnjNbdCkvtxnedPZYmtoEU/JpFVyPpiSJtsnePBj/q+HdAHEn+7v733
	ydHea2cjoWszpnWkPjZF9o1Pjn0tIdzV6XFRizd8ouQt+OXElbi7Lt2q0Mb+c+HcNNM55pzURaX+m
	ia62Jj1NgzHi7ZA+kvfB1K8Rwky3CIrtAxIy4SezEOuvEMBwoKxuFD4+3dvPz1jftUm4DCH9DPIfT
	U/2cqmMBAb7kzS7bTes49aWMSocfQ5l9gu0zDQLIX2MxlQOWot4LFX6o0eDtnYOMpM3t+sv9GSRKz
	Ojj0J29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKt0h-008L4x-7E; Mon, 08 Aug 2022 03:00:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKsJV-007vIn-3T; Mon, 08 Aug 2022 02:16:18 +0000
X-UUID: 031f83a31ee04076a2759913bd1792b0-20220807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3c596621-4e32-49cc-87a4-f8a466c8e87a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:12,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:17
X-CID-META: VersionHash:0f94e32,CLOUDID:f4cb29ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 031f83a31ee04076a2759913bd1792b0-20220807
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <qii.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1558138742; Sun, 07 Aug 2022 19:16:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 09:45:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Aug 2022 09:45:32 +0800
Message-ID: <4e7fb6b799182d2dc088d94385faf1ec0b81b6bb.camel@mediatek.com>
Subject: Re: [PATCH v5 1/2] dt-bindngs: i2c: update bindings for mt8188 soc
From: Qii Wang <qii.wang@mediatek.com>
To: <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
	<yuhan.wei@mediatek.com>, <ryan-jh.yu@mediatek.com>,
	<david-yh.chiu@mediatek.com>
Date: Mon, 8 Aug 2022 09:45:30 +0800
In-Reply-To: <20220806100249.12375-1-kewei.xu@mediatek.com>
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_191617_192973_BDEB9999 
X-CRM114-Status: GOOD (  13.45  )
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

On Sat, 2022-08-06 at 18:02 +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the mt8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
> v5: add Acked-by owner
> v4: resend patch
> v3: add reviewed-by owner
> v2: no changes
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 16a1a3118204..4e730fb7be56 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -27,6 +27,7 @@ properties:
>        - const: mediatek,mt8173-i2c
>        - const: mediatek,mt8183-i2c
>        - const: mediatek,mt8186-i2c
> +      - const: mediatek,mt8188-i2c
>        - const: mediatek,mt8192-i2c
>        - items:
>            - enum:


