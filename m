Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A666C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 07:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3536B61132
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 07:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3536B61132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LScA2HdRjJrdnvD39SxoyMPufM5RXspqd9+G4i97Rik=; b=Xlh2w6O/xTg9ZO
	T/LZ/NXRzFB76BV8mx0P99gULfzPtk5Iq4/HqaPFpeHC+SYnaBXH4hAKPWCVoup/5cDgUy/6/0at3
	57y6mSQsyYd4f+ZpU+qSZZO8i+DjDCqsm3pEHY1ghZ4uvFNNIJRjcZW1rWuwI3GxXZG+peVCJsf4y
	btLoU5JKhExMVY5evkFIdcz4liG1SM8ZX/5va9L1idhAV3qDkO48vIPtdz+Gz1hk1fkuglObQFMz3
	c9Uwta3kRvSyz3z4XuToYzndBHhLD/gXPU5AONOpgPLlMLXUYOnmI1O2PHdhMm9HVoOQJHxWQzftl
	xnf8TLUhXkMnkGwDW0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNsPV-0060gu-A6; Wed, 08 Sep 2021 07:54:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNs3H-005u83-Js; Wed, 08 Sep 2021 07:31:26 +0000
X-UUID: b5731d5e4b0d407ba0a41d65fa7c670d-20210908
X-UUID: b5731d5e4b0d407ba0a41d65fa7c670d-20210908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2110057571; Wed, 08 Sep 2021 00:31:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 00:24:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Sep 2021 15:24:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Sep 2021 15:24:36 +0800
Message-ID: <adf8bebaccba94a3d84f6c3400628ea8adaebed1.camel@mediatek.com>
Subject: Re: [PATCH v10 07/17] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Wed, 8 Sep 2021 15:24:36 +0800
In-Reply-To: <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-8-jason-jh.lin@mediatek.com>
 <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_003123_738669_490FB78D 
X-CRM114-Status: GOOD (  26.59  )
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

Hi Philipp,

Thanks for the reviews.

On Wed, 2021-09-08 at 08:39 +0200, Philipp Zabel wrote:
> Hi Jason,
> 
> On Wed, 2021-09-08 at 14:03 +0800, jason-jh.lin wrote:
> > add MERGE additional properties description for mt8195:
> > 1. async clock
> > 2. fifo setting enable
> > 3. reset controller
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,merge.yaml      | 30
> > +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > index 75beeb207ceb..0fe204d9ad2c 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > @@ -38,6 +38,19 @@ properties:
> >    clocks:
> >      items:
> >        - description: MERGE Clock
> > +      - description: MERGE Async Clock
> > +          Controlling the synchronous process between MERGE and
> > other display
> > +          function blocks cross clock domain.
> > +
> > +  mediatek,merge-fifo-en:
> > +    description:
> > +      The setting of merge fifo is mainly provided for the display
> > latency
> > +      buffer to ensure that the back-end panel display data will
> > not be
> > +      underrun, a little more data is needed in the fifo.
> > +      According to the merge fifo settings, when the water level
> > is detected
> > +      to be insufficient, it will trigger RDMA sending ultra and
> > preulra
> > +      command to SMI to speed up the data rate.
> > +    type: boolean
> >  
> >    mediatek,gce-client-reg:
> >      description:
> > @@ -50,6 +63,10 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      maxItems: 1
> >  
> > +  resets:
> > +    description: reset controller
> > +      See Documentation/devicetree/bindings/reset/reset.txt for
> > details.
> 
> From the example this looks like it could have a maxItems: 1.

OK, I think it could have a maxItems: 1 in mt8195 because
merge1~megre5 only have one async clock.

> 
> > +
> >  required:
> >    - compatible
> >    - reg
> 
> Should the resets property be required for "mediatek,mt8195-disp-
> merge"?

I think the resets property is not the required propoerty.
The reset controller is for async clock of MERGE module on vdosys1.
MERGE module on vdosys0 doesn't have async clock, so it doesn't need to
add the resets property.

Regards,
Jason-JH.Lin
> 
> > @@ -67,3 +84,16 @@ examples:
> >          power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> >          clocks = <&mmsys CLK_MM_DISP_MERGE>;
> >      };
> > +
> > +    merge5: disp_vpp_merge5@1c110000 {
> > +        compatible = "mediatek,mt8195-disp-merge";
> > +        reg = <0 0x1c110000 0 0x1000>;
> > +        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> > +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> > +        clock-names = "merge","merge_async";
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000
> > 0x1000>;
> > +        mediatek,merge-fifo-en = <1>;
> > +        resets = <&vdosys1
> > MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> > +    };
> 
> regards
> Philipp
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
