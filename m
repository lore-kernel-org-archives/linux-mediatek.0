Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sELhNQExEzgVKWCVw7P78F9JpJAwNm7t5T4yWF19O1Q=; b=cQqk4Z7N1xxvV2
	A22akN3S2xI0jN+HF+MLG5u9ujio3RQD+wTCUzp6WCNFVTIw6xi3VIrxS2fRveACotct/RCN2MF/G
	fRY9RGWVH+UZnTxDu385esgUBm1u3pNOs+1O0kV5I0lHK7a65+vdb7Kf24ZxIyJmSWyx/9WX0YmEs
	LRLGKIR+deSAG03J3OKYef+2VWJKp6anNWwNePlf015IMCU8UmZnuxModkRF2nqJmfkZZIZ3k7Nq1
	1WKeXcp2QdAnaHhqX5dP7OVr4SZE+aaHHLQcz6EzxeQqGL8mpIWhA+hMSOSwRMbzbMlVR/kQpvbfH
	tpLmziEWPmJXK+Zqm2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Muo-00GqYv-RG; Thu, 06 Jan 2022 07:10:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Muc-00GqXK-JB; Thu, 06 Jan 2022 07:10:16 +0000
X-UUID: 785a127c2c254b49b77aa46f05c4fb37-20220106
X-UUID: 785a127c2c254b49b77aa46f05c4fb37-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1150860684; Thu, 06 Jan 2022 00:10:11 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 23:10:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 15:10:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 15:10:08 +0800
Message-ID: <3e00db1d4fe71938b0274331cd49b96bdddccea4.camel@mediatek.com>
Subject: Re: [PATCH v3] dt-bindings: dsp: mediatek: add mt8195 dsp document
From: YC Hung <yc.hung@mediatek.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, Devicetree List
 <devicetree@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 <trevor.wu@mediatek.com>, <allen-kh.cheng@mediatek.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>
Date: Thu, 6 Jan 2022 15:10:08 +0800
In-Reply-To: <CAEnQRZBH4uwMmyBLY2bCtY9QZooBiK5PqF3T+4K8WAtQV1QN-Q@mail.gmail.com>
References: <20220103043202.6524-1-yc.hung@mediatek.com>
 <CAEnQRZBH4uwMmyBLY2bCtY9QZooBiK5PqF3T+4K8WAtQV1QN-Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_231014_683924_5D0F68D9 
X-CRM114-Status: GOOD (  25.57  )
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

Hi Daniel,

My mistake. Thanks for review and comments. I have updated v4 to fix
it. Thanks
On Wed, 2022-01-05 at 17:53 +0200, Daniel Baluta wrote:
> On Mon, Jan 3, 2022 at 1:00 PM YC Hung <yc.hung@mediatek.com> wrote:
> > 
> > From: "YC Hung" <yc.hung@mediatek.com>
> > 
> > This patch adds mt8195 dsp document. The dsp is used for Sound Open
> > Firmware driver node. It includes registers,  clocks, memory
> > regions,
> > and mailbox for dsp.
> > 
> > Signed-off-by: yc.hung <yc.hung@mediatek.com>
> 
> The code patch should be created against original source code from
> Rob's tree. Here it seems the patch is against v2.
> 
> This isn't going to work! Because when Rob will try to apply the
> patch
> it will fail since he doesn't have (and doesnt need to have)
> your previous versions.
> 
> So, please keep the changes history (that's a good thing!) but always
> rebase your patch on maintainer's tree.
> 
> 
> > ---
> > Changes since v2:
> >   Remove useless watchdog interrupt.
> >   Add commit message more detail description.
> > 
> > Changes since v1:
> >   Rename yaml file name as mediatek,mt8195-dsp.yaml
> >   Refine descriptions for mailbox, memory-region and drop unused
> > labels
> >   in examples.
> > ---
> > ---
> >  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml | 12 --------
> > ----
> >  1 file changed, 12 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml
> > index bde763191d86..779daa786739 100644
> > --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml
> > +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml
> > @@ -27,14 +27,6 @@ properties:
> >        - const: cfg
> >        - const: sram
> > 
> > -  interrupts:
> > -    items:
> > -      - description: watchdog interrupt
> > -
> > -  interrupt-names:
> > -    items:
> > -      - const: wdt
> > -
> >    clocks:
> >      items:
> >        - description: mux for audio dsp clock
> > @@ -75,8 +67,6 @@ required:
> >    - compatible
> >    - reg
> >    - reg-names
> > -  - interrupts
> > -  - interrupt-names
> >    - clocks
> >    - clock-names
> >    - memory-region
> > @@ -95,8 +85,6 @@ examples:
> >         reg = <0x10803000  0x1000>,
> >               <0x10840000  0x40000>;
> >         reg-names = "cfg", "sram";
> > -       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
> > -       interrupt-names = "wdt";
> >         clocks = <&topckgen 10>, //CLK_TOP_ADSP
> >                  <&clk26m>,
> >                  <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
