Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E8DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdQi0PEmn1vP2DY0+cii98eNvk67bLg+t3Z0eikrngs=; b=Ezool2VwarKhUr
	mBAlpxzmWZ7l2JD7UBUsfSNvf5ktj0d2L4J9oaPPSBzXYql4GeE59V4qZjYVD6BqsfnNfl73F6c0E
	MgdT3VXndPOFEyVlz0eCDHXwJ+i87zWTjTXs4ndaUkLHiDCrxm6a35n4BtSx21FGERlWoTrNAt6qo
	l/HJN83592Fnla+uCjDQnIH23ZTG7iLNm2HSubux4UQRlqmsmhWZzqvfYxkARU2SzJTBLOT9upDw5
	sV+OCt4+pWize2Gh2P9T7Lfnma/2plVIxCZkzMoEEl36feNAOR3cr6QRVnlM/JTzTeeFcyre70bxq
	vSUpUy5hZ1TECUC4rI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI6In-003OIo-RQ; Thu, 10 Feb 2022 10:03:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI6Ic-003OGl-2M; Thu, 10 Feb 2022 10:03:39 +0000
X-UUID: bb2caf8e05f642ceb88e22614010fb66-20220210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qKNN3hhynNKwB0A5jGLGwe/FZE6HuhllQkxcX24gPa4=; 
 b=N6r/JFvb/bU7v9zhRTBm9nTqJ7v3coZpOHG2Hla4S3W5ysxoBZ0BvrMjEbnfQ56eyfPVegtlOo433CMQqRoqOivffy50G7Do3STRw2V0j8nZxh4I7UXzFoSIDM6q0MWSwhi/A5PomTdrNCzchgLSWvbE8lIOKO2+oqL8pyHXD7Y=;
X-UUID: bb2caf8e05f642ceb88e22614010fb66-20220210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 88447083; Thu, 10 Feb 2022 03:03:32 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 01:59:54 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Feb 2022 17:59:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 17:59:45 +0800
Message-ID: <12deb1b056a68e742979c7dcaf1e2c627b982825.camel@mediatek.com>
Subject: Re: [PATCH v2, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 10 Feb 2022 17:59:45 +0800
In-Reply-To: <f807c862-d327-5b12-7443-c4fed6e1ef6a@collabora.com>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-2-yunfei.dong@mediatek.com>
 <YgQl8CtttQ99+8lB@robh.at.kernel.org>
 <aa72bec2064e25990e1a3641b920cb5528cfccd4.camel@mediatek.com>
 <f807c862-d327-5b12-7443-c4fed6e1ef6a@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_020338_143429_EABB3AD8 
X-CRM114-Status: GOOD (  27.84  )
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

Hi AngeloGioacchino,

Thanks for your suggestion.
On Thu, 2022-02-10 at 09:40 +0100, AngeloGioacchino Del Regno wrote:
> Il 10/02/22 04:06, yunfei.dong@mediatek.com ha scritto:
> > Hi Rob,
> > 
> > Thanks for your suggestion.
> > On Wed, 2022-02-09 at 14:37 -0600, Rob Herring wrote:
> > > On Fri, Jan 28, 2022 at 11:54:34AM +0800, Yunfei Dong wrote:
> > > > Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-
> > > > lat-
> > > > soc".
> > > 
> > > What's lat soc? How does this relate to what's already there in
> > > this
> > > binding.
> > > 
> > 
> > lat soc is another hardware, is related with some vdec larb ports.
> > Won't be used to decode, but must to write it in dtsi, or hardware
> > can't work well.
> 
> Hello Yunfei,
> 
> as a suggestion, writing the meaning of the "LAT" acronym may also
I'm very sorry, I can't write the meaning of the "LAT" acronym. You can
regards it as an hardware.

> help to clear some doubts around (please, also do that in the yaml
> file,
> other than the commit description).
> 
I will add detail message for this hardware in next patch. And this
hardware only be used for mt8195 at now.

> Thank you!
> Angelo
> 
Best Regards,
Yunfei Dong
> > 
> > Need to enable clock/power/iommus, no interrupt.
> > > The subject space is limited, avoid saying the same thing twice
> > > (dt-bindings).
> > > 
> > 
> > Best Regards,
> > Yunfei Dong
> > > > 
> > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > ---
> > > >   .../media/mediatek,vcodec-subdev-decoder.yaml | 49
> > > > +++++++++++++++++++
> > > >   1 file changed, 49 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > subdev-
> > > > decoder.yaml
> > > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > subdev-
> > > > decoder.yaml
> > > > index 6415c9f29130..a3c892338ac0 100644
> > > > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > subdev-decoder.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > > subdev-decoder.yaml
> > > > @@ -189,6 +189,55 @@ patternProperties:
> > > >   
> > > >       additionalProperties: false
> > > >   
> > > > +  '^vcodec-lat-soc@[0-9a-f]+$':
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: mediatek,mtk-vcodec-lat-soc
> > > > +
> > > > +      reg:
> > > > +        maxItems: 1
> > > > +
> > > > +      iommus:
> > > > +        minItems: 1
> > > > +        maxItems: 32
> > > > +        description: |
> > > > +          List of the hardware port in respective IOMMU block
> > > > for
> > > > current Socs.
> > > > +          Refer to bindings/iommu/mediatek,iommu.yaml.
> > > > +
> > > > +      clocks:
> > > > +        maxItems: 5
> > > > +
> > > > +      clock-names:
> > > > +        items:
> > > > +          - const: sel
> > > > +          - const: soc-vdec
> > > > +          - const: soc-lat
> > > > +          - const: vdec
> > > > +          - const: top
> > > > +
> > > > +      assigned-clocks:
> > > > +        maxItems: 1
> > > > +
> > > > +      assigned-clock-parents:
> > > > +        maxItems: 1
> > > > +
> > > > +      power-domains:
> > > > +        maxItems: 1
> > > > +
> > > > +    required:
> > > > +      - compatible
> > > > +      - reg
> > > > +      - iommus
> > > > +      - clocks
> > > > +      - clock-names
> > > > +      - assigned-clocks
> > > > +      - assigned-clock-parents
> > > > +      - power-domains
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > >   required:
> > > >     - compatible
> > > >     - reg
> > > > -- 
> > > > 2.25.1
> > > > 
> > > > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
