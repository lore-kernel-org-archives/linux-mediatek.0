Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5998DC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073E9603E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 073E9603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yT/O2Ji/q8eDbULxr5uHxCdviVpNskapLQwRRzosGJE=; b=NygpY0XhFHo4kn
	DPyas8tAcg+I1egVMEjpRpjPyXOzzP2F+8R9W0xHkDK0GgozLzCBzft6LcLVpNXJmkaP+eLBczmT6
	2TA1A6sFC2xfLlniaEZ2JhvUdBkb6a0bkLcpJtZLRiMkLeIcUdBhg8fS03vf1Zn1D6ozGPB3/vxFV
	OPRdT4hrrk6+32JLpdWiEPD53ecTEgl9caNtPg8ua0kF63gnRUUmmPnvRYl/PB2NG+s52V63/KcG3
	fwW6CKkjU9xse5F9D7INyoGuDJcKLYoT1FY2Mop6ly2ukvXC4gtvAhqv9n0Jc/HYVCVPKlA9GrUaV
	7xEnPyndvC81bVdy5ZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7udN-009oJm-Gw; Mon, 26 Jul 2021 07:02:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ud9-009oGf-9k; Mon, 26 Jul 2021 07:02:29 +0000
X-UUID: 2c4ae02e6dab487ca6cb97d535d1103c-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TnDpOLMBPd+DG/4dxckfQjpW0HbygoqTWQXU0LBOEZs=; 
 b=gYvJBEnGEZAVHkpa3Vk06R9je8KqvFBgOzAjg04DIxuYx0UNnmHkW/Rw7WBLgUjcbLYPGZ2Up1rgB0b3JfN5ZlkR4mry9V45xQ9h7iAsFKAeZGkJzHOKRXhcDjiUHrv+pCNr6HwAjZWrlJLB1ryPTgMDltxbSQpotoyLYQts6JQ=;
X-UUID: 2c4ae02e6dab487ca6cb97d535d1103c-20210726
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1538724826; Mon, 26 Jul 2021 00:02:17 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 00:02:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:02:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 15:02:14 +0800
Message-ID: <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree
 <devicetree@vger.kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 <singo.chang@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Fabien Parent
 <fparent@baylibre.com>, Nancy.Lin <nancy.lin@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 26 Jul 2021 15:02:14 +0800
In-Reply-To: <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
 <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_000227_373491_9F9C33EE 
X-CRM114-Status: GOOD (  22.22  )
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

On Fri, 2021-07-23 at 13:13 +0200, Enric Balletbo Serra wrote:
> Hi Jason,
> 
> Thank you for your patch.
> 
> Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 22
> de jul. 2021 a les 11:26:
> > 
> > There are 2 display hardware path in mt8195, namely vdosys0 and
> > vdosys1, so add their definition in mtk-mmsys documentation.
> > 
> 
> Just having 2 display hardware paths is not a reason to have two
> compatibles, isn't the IP block the same? Why do you need to
> introduce
> the two compatibles?
> 
> Thanks,
>   Enric
> 

Hi Enric,

Thanks for reviewing my patch.

The reason for using two compatibles is that vdosys0 and vdosys1 are
different IP blocks.

Because mmsys provides clock control, other display function blocks may
use them as clock provider.

E.g.
1. mmsys with compatible="mediatek,mt8195-vdosys0"
[v4,1/6] arm64: dts: mt8195: add display node for vdosys0

https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-2-jason-jh.lin@mediatek.com/

ovl0: disp_ovl@1c000000 {
	...
	clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
	...
};

2. mmsys with compatible="mediatek,mt8195-vdosys1"
[v2,06/14] arm64: dts: mt8195: add display node for vdosys1

https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-7-nancy.lin@mediatek.com/

vdo1_rdma0: vdo1_rdma@1c104000 {
	...
	clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
	...
};

Regards,
Jason-JH.Lin

> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> > this patch is base on [1][2]
> > 
> > [1] dt-bindings: arm: mediatek: mmsys: convert to YAML format
> > - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmknH8f2P$
> >  
> > [2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
> > - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmju2GBrD$
> >  
> > ---
> >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
> > 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 2d4ff0ce387b..0789a9614f12 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -30,6 +30,8 @@ properties:
> >                - mediatek,mt8173-mmsys
> >                - mediatek,mt8183-mmsys
> >                - mediatek,mt8365-mmsys
> > +              - mediatek,mt8195-vdosys0
> > +              - mediatek,mt8195-vdosys1
> >            - const: syscon
> >        - items:
> >            - const: mediatek,mt7623-mmsys
> > --
> > 2.18.0
> > 
-- 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
