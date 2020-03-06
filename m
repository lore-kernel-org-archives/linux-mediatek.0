Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FB6C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 02:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268E8206D7
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 02:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nLNjs1Bg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t+WEOMVN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268E8206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gL72MSjA1qAsLVO+JiiIATIf+XDFD/UWA5n75cCjl34=; b=nLNjs1BgGzOnPa
	XjQDiYa3FE42lToXXVrS4a7E4ugQ5egOmZsvOBObarwLL2xbR+C/+vQbtACh5cyr3OoSIseRg5dfV
	OY+DVaLrtn+h6dcBa+nIAPm4Ukbk1TAftFRxPUtPsu5MwUsY0sPOFfrFPSFg0ZKPhhLlvgYDO8ERH
	tkokobNp8Ph6sVcds1uRZVcMsMzODZ9VxM/2YSdwUCONiMGb5qSyviTdODdQWnlzKOgGSCMnf6xvq
	cTLCTVcDM4Zf4hLZI8mRVpz4ZDf4Yuy37i1fqcbftLBAlxSJMZCwup6Q/6SRNHI9qWynRt219EOgw
	PkcQu8m9yfie4NFdSCpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA2or-0004V0-A9; Fri, 06 Mar 2020 02:34:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA2oj-0004O5-DQ; Fri, 06 Mar 2020 02:34:27 +0000
X-UUID: 3b37ddd7469c412185d0e0e173e61948-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lw7Z2hh6lxCttqw2IBWx1RQ1VaA6UHtHaJjaKiScxsU=; 
 b=t+WEOMVNd7ZhhmTf2qEIHa8Y/IyHKOYig5O5oZb4Fk30Hb7d0QsXIXTRG+ZWyM32G1vE8JjGlnWwJ6uaGCjKTeqwRik5tDn4aavoimZgLLizcCDFWRWz9loSPpm02J4aomj3IapNoQ+cPaeLH6fRbGgxR9cTWWPg0SzGj0iXgns=;
X-UUID: 3b37ddd7469c412185d0e0e173e61948-20200305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 648841798; Thu, 05 Mar 2020 18:34:18 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 18:34:16 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Mar 2020 10:33:05 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Mar 2020 10:34:16 +0800
Message-ID: <1583462055.4947.6.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
From: Nick Fan <nick.fan@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 6 Mar 2020 10:34:15 +0800
In-Reply-To: <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org>
 <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_183425_460222_6FB7FADF 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Tomeu
 Vizoso <tomeu.vizoso@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>, David
 Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry for my late reply.
I have checked internally.
The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
domain.

If the naming too confusing, we can change this name to
MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.

Thanks

Nick Fan

On Wed, 2020-02-26 at 08:55 +0800, Nicolas Boichat wrote:

> +Nick Fan +Sj Huang @ MTK
> 
> On Wed, Feb 26, 2020 at 1:16 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> > > Define a compatible string for the Mali Bifrost GPU found in
> > > Mediatek's MT8183 SoCs.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > ---
> > >
> > > v4:
> > >  - Add power-domain-names description
> > >    (kept Alyssa's reviewed-by as the change is minor)
> > > v3:
> > >  - No change
> > >
> > >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > index 4ea6a8789699709..0d93b3981445977 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > @@ -17,6 +17,7 @@ properties:
> > >      items:
> > >        - enum:
> > >            - amlogic,meson-g12a-mali
> > > +          - mediatek,mt8183-mali
> > >            - realtek,rtd1619-mali
> > >            - rockchip,px30-mali
> > >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > > @@ -62,6 +63,30 @@ allOf:
> > >            minItems: 2
> > >        required:
> > >          - resets
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: mediatek,mt8183-mali
> > > +    then:
> > > +      properties:
> > > +        sram-supply: true
> > > +        power-domains:
> > > +          description:
> > > +            List of phandle and PM domain specifier as documented in
> > > +            Documentation/devicetree/bindings/power/power_domain.txt
> > > +          minItems: 3
> > > +          maxItems: 3
> > > +        power-domain-names:
> > > +          items:
> > > +            - const: core0
> > > +            - const: core1
> > > +            - const: 2d
> >
> > AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each
> > core group is correct though.
> 
> Good question... Hopefully Nick/SJ@MTK can comment, the non-upstream DTS has:
> gpu: mali@13040000 {
> compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
> power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>;
> ...
> }
> 
> gpu_core1: mali_gpu_core1 {
> compatible = "mediatek,gpu_core1";
> power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>;
> };
> 
> gpu_core2: mali_gpu_core2 {
> compatible = "mediatek,gpu_core2";
> power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
> };
> 
> So I picked core0/core1/2d as names, but looking at this, it's likely
> core2 is more appropriate (and MT8183_POWER_DOMAIN_MFG_2D might just
> be a internal/legacy name, if there is no real 2d domain).
> 
> Thanks.
> 
> > Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
