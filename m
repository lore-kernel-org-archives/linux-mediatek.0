Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD8C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXMgenTpSygNkNvR5d7AnyFCChnZ5KrW9SFPNHSqigU=; b=HiA57sRE6/zwjDXFyj4YNwfBIi
	GtTf8IHiaevyQPz6VPWT0MjAlxuLCqmZjM53VeWuxrEk04pvRPs7pVLHLPnFs5+hppF9gOVrtpJvU
	xbUS/FqYBK8WYbGZK2J5IV4WummvaouM8ykX4iCip0PgBmZe8YpnCpgEkMKgRYJ2n2OnB7s6XIAuf
	iQD8KDc1gNeP05RsckQUvwu35mj5NL9rTGScy7gT/6+a0a51GI5LlKtaMoW3yWFO4e5nQZTEVfhOq
	qiC1T7GLtUTxe+4j1o65tPhY/ErSBhtJnncHzypI4mqy8L0nhnqrm8Jomp8fBxFRONbACnM0jGYVJ
	0/Fh045A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjX5-003Byl-IH; Mon, 26 Sep 2022 08:32:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjWc-003Bni-Cb; Mon, 26 Sep 2022 08:31:47 +0000
X-UUID: fcd3274c30cf4b3b9d4c5fd53f51eb22-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=lXMgenTpSygNkNvR5d7AnyFCChnZ5KrW9SFPNHSqigU=;
	b=i+9idP55wVDvnLRd/sPx2Zsb9gt5TuMUeE864Ku8vcw3nFa4gn9/Rt26rtIeNOwj0pcXT7KgyTHeL5Mjnxqudur/t5lvGgYBdlo6v8ekzez9Dx/FSDYeAieZNKy32Z9F+qPtBQP/g5u9U9VR/LB3LJHPCMyoCUykLnCw0+5NlKs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c3eeecee-d399-416b-9321-98dfb5faf839,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:0d4c3ae4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fcd3274c30cf4b3b9d4c5fd53f51eb22-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2055846638; Mon, 26 Sep 2022 01:31:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 16:20:57 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 16:20:55 +0800
Message-ID: <47e878e35e67664aa5155fc4c449240fdb18bd57.camel@mediatek.com>
Subject: Re: [V14,08/15] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Irui Wang <irui.wang@mediatek.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, Rob Herring
	<robh@kernel.org>
Date: Mon, 26 Sep 2022 16:20:55 +0800
In-Reply-To: <eb8883bc-1328-acd8-2c41-af877cecbfa4@kernel.org>
References: <20220915064337.2686-1-irui.wang@mediatek.com>
	 <20220915064337.2686-9-irui.wang@mediatek.com>
	 <3bbdfb31-2ba2-7345-54c7-82a67d95e30f@kernel.org>
	 <f0b80a0d60172e9c286c0cd3b599875a345ae4f0.camel@mediatek.com>
	 <eb8883bc-1328-acd8-2c41-af877cecbfa4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_013138_438710_7C7F0FC0 
X-CRM114-Status: GOOD (  26.01  )
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

On Mon, 2022-09-26 at 08:36 +0200, Krzysztof Kozlowski wrote:
> On 26/09/2022 03:56, kyrie.wu wrote:
> > On Fri, 2022-09-23 at 13:28 +0200, Krzysztof Kozlowski wrote:
> > > On 15/09/2022 08:43, Irui Wang wrote:
> > > > From: kyrie wu <kyrie.wu@mediatek.com>
> > > > 
> > > > Add mediatek,mt8195-jpgdec compatible to binding document.
> > > 
> > > Use scripts/get_maintainers.pl to CC all maintainers and relevant
> > > mailing lists.
> > > 
> > > > 
> > > > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > > > Signed-off-by: irui wang <irui.wang@mediatek.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../media/mediatek,mt8195-jpegdec.yaml        | 169
> > > > ++++++++++++++++++
> > > >  1 file changed, 169 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > > jpegdec.yaml
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > > jpegdec.yaml
> > > > b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > > jpegdec.yaml
> > > > new file mode 100644
> > > > index 000000000000..9135cf889d1e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > > jpegdec.yaml
> > > > @@ -0,0 +1,169 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: 
> > > > 
https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml*__;Iw!!CTRNKA9wMg0ARbw!yu00-_vltBz3bkDyzkeH2PENGyfi_megjPx815JiqrNVa28ZU7kcFYidMEos_id7$
> > > >  
> > > > +$schema: 
> > > > 
https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!yu00-_vltBz3bkDyzkeH2PENGyfi_megjPx815JiqrNVa28ZU7kcFYidMAikt6uh$
> > > >  
> > > > +
> > > > +title: MediaTek JPEG Encoder Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> > > > +
> > > > +description:
> > > > +  MediaTek JPEG Decoder is the JPEG decode hardware present in
> > > > MediaTek SoCs
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > 
> > > You do not have more than one item. Skip items.
> > 
> > Hello Krzysztof,
> > 
> > The device node has the compatible of "mediatek,mt8195-jpgdec",
> > if skip this item, it may case dt-binding checking error.
> 
> No, this won't happen if you use correct syntax.

Hello Krzysztof,

Thanks for your guidance, I have fix those issue according your
suggestion. and it would be updated in the next version.

Regards,
Kyrie.
> 
> > For another, we may extend this items in the future.
> 
> Not really, that would be change of ABI. If you have already list of
> devices, include them now.
> 
> 
> Best regards,
> Krzysztof
> 


