Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ACCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCae9YLZVXNd16vgGBMtxhCtm8iIN6j6+KypFcqAdgs=; b=Ubc3682IM1vdHI
	L2BK5mPs7L4te+sleiBoH1pAKbwyiRVxqzcfs97agKM4YEG7vfCq0tTY+p6B+Etz9NGO4t58MjbIY
	MujMJFiNGuuPaQDBKlzu5DDjARGIZyBNk+6q0BTylwQJubQ+N9afHe739Ek/fpUUL7XlsP9O/IkvF
	MUkD7AalcifBMiq3mmITY0KV/yTEGR3mF/umINY2us9WS0pHPvvdypIXMUVKLuXP4WDjUH4IVtY1L
	0A1Kcbaku0FQ67c3N0j73jR4Xdx9NDPSqSFhKkOPFtNcR4NOzaTfwYaYcBMEeBq34J7wC1OpwhjJi
	S0ScqwWVekDpi8/4lBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuTo-0027jX-Rx; Tue, 15 Feb 2022 09:50:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuTS-0027be-5X; Tue, 15 Feb 2022 09:50:20 +0000
X-UUID: 77aa1f25e4044c35b79fdf2307c434e6-20220215
X-UUID: 77aa1f25e4044c35b79fdf2307c434e6-20220215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1258442694; Tue, 15 Feb 2022 02:50:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 01:50:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Feb 2022 17:50:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 17:50:12 +0800
Message-ID: <d958cc9ab31e387d06bc50a6c7a953e716d53899.camel@mediatek.com>
Subject: Re: [v2 2/3] dt-bindings: ARM: Mediatek: Remove vppsys in MT8195
 clock document
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 15 Feb 2022 17:50:11 +0800
In-Reply-To: <YetDNPs8Xo/Alndj@robh.at.kernel.org>
References: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
 <20220110005902.27148-3-chun-jie.chen@mediatek.com>
 <YetDNPs8Xo/Alndj@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_015018_264056_7A426EDD 
X-CRM114-Status: GOOD (  17.39  )
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

On Fri, 2022-01-21 at 17:35 -0600, Rob Herring wrote:
> On Mon, Jan 10, 2022 at 08:59:01AM +0800, Chun-Jie Chen wrote:
> > vppsys0 and vppsys1 sub-system are both integrated with mmsys
> > driver,
> > should be describe in mediatek,mmsys.yaml
> 
> Driver partitioning is not a reason to change the DT. This needs a 
> better description answering why you are doing this and what are the 
> implications (is this breaking the ABI?).


Due to the change in [1], vppsys0/vppsys1 are not only clock providers
and support mm system control. It's better to be described in
"mediatek,mmsys.yaml" [2] because they are not pure clock providers.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220117055254.9777-4-roy-cw.yeh@mediatek.com/
[2] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220117055254.9777-15-roy-cw.yeh@mediatek.com/

Thanks!
Best Regards,
Chun-Jie
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,mt8195-clock.yaml      | 16 ------------
> > ----
> >  1 file changed, 16 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-
> > clock.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-
> > clock.yaml
> > index 17fcbb45d121..d62d60181147 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-
> > clock.yaml
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-
> > clock.yaml
> > @@ -28,11 +28,9 @@ properties:
> >            - mediatek,mt8195-imp_iic_wrap_s
> >            - mediatek,mt8195-imp_iic_wrap_w
> >            - mediatek,mt8195-mfgcfg
> > -          - mediatek,mt8195-vppsys0
> >            - mediatek,mt8195-wpesys
> >            - mediatek,mt8195-wpesys_vpp0
> >            - mediatek,mt8195-wpesys_vpp1
> > -          - mediatek,mt8195-vppsys1
> >            - mediatek,mt8195-imgsys
> >            - mediatek,mt8195-imgsys1_dip_top
> >            - mediatek,mt8195-imgsys1_dip_nr
> > @@ -92,13 +90,6 @@ examples:
> >          #clock-cells = <1>;
> >      };
> >  
> > -  - |
> > -    vppsys0: clock-controller@14000000 {
> > -        compatible = "mediatek,mt8195-vppsys0";
> > -        reg = <0x14000000 0x1000>;
> > -        #clock-cells = <1>;
> > -    };
> > -
> >    - |
> >      wpesys: clock-controller@14e00000 {
> >          compatible = "mediatek,mt8195-wpesys";
> > @@ -120,13 +111,6 @@ examples:
> >          #clock-cells = <1>;
> >      };
> >  
> > -  - |
> > -    vppsys1: clock-controller@14f00000 {
> > -        compatible = "mediatek,mt8195-vppsys1";
> > -        reg = <0x14f00000 0x1000>;
> > -        #clock-cells = <1>;
> > -    };
> > -
> >    - |
> >      imgsys: clock-controller@15000000 {
> >          compatible = "mediatek,mt8195-imgsys";
> > -- 
> > 2.18.0
> > 
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
