Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D695AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYY/ZOEIBq26mtUpYdTDYzTzdgRM3ZiW/BImSgYniTg=; b=vitMP/42pIaPoD
	OEFviHjvxpvzoU7z+qDrO/+XwJtetFVIVm6TbKYQ+qN/AL4vRsb9vRcA6uQxc16UX2YSci4iVrwwJ
	zWfwlFMBeZgFUc9VriN9QcaZRP7mL12KrUZjgmJ8nFfyDLWEagv4IazdQ6eNKPWS/iNJrv0ma0og1
	LyBhfeEjoRsv30UGyqTzSmYNJJ3XQHI/6dZgAx7Vy29Q9Z6OryoOnLMDbaLabwAbnhUaF5RLsurNZ
	4nQGIIKnUroojRH2tT4ZNUBkhz6zPatgGKyTxqzDqpOrF4dyz/FEQostyacqhWq86CKuuMULnUARz
	OegBxX1AM1pqFUzN7o9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM954-0061oO-An; Mon, 21 Feb 2022 13:50:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8Wh-005qC1-BF; Mon, 21 Feb 2022 13:14:53 +0000
X-UUID: b592b8f3e00d42889ca19ee518c6d0d4-20220221
X-UUID: b592b8f3e00d42889ca19ee518c6d0d4-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 768080413; Mon, 21 Feb 2022 06:14:47 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:05:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Feb 2022 21:05:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:05:39 +0800
Message-ID: <8a3a6167450bdd51bdff2e9b12a15522a18dd38e.camel@mediatek.com>
Subject: Re: [PATCH v2 09/23] arm64: dts: mt8192: Add infracfg_rst node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Mon, 21 Feb 2022 21:05:38 +0800
In-Reply-To: <c84ec638-3134-fc1c-4761-7f1ec8381a39@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-10-allen-kh.cheng@mediatek.com>
 <c84ec638-3134-fc1c-4761-7f1ec8381a39@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_051451_504973_AE8B002A 
X-CRM114-Status: GOOD (  19.58  )
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

On Fri, 2022-02-18 at 13:55 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> > add infracfg_rst node for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> For v3, please mention that you're adding simple-mfd to allow probing
> the
> ti,syscon-reset node.
> 
> After the commit description fix:
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hi Angelo,

Thanks for reminding, I will update commit message.

Do I need to also change the commit title ?

Best regards,
Allen

> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 18 ++++++++++++++++--
> >   1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index f93fe3779161..a935a22babbb 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -12,6 +12,7 @@
> >   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> >   #include <dt-bindings/phy/phy.h>
> >   #include <dt-bindings/power/mt8192-power.h>
> > +#include <dt-bindings/reset/ti-syscon.h>
> >   
> >   / {
> >   	compatible = "mediatek,mt8192";
> > @@ -267,10 +268,23 @@
> >   			#clock-cells = <1>;
> >   		};
> >   
> > -		infracfg: syscon@10001000 {
> > -			compatible = "mediatek,mt8192-infracfg",
> > "syscon";
> > +		infracfg: infracfg@10001000 {
> > +			compatible = "mediatek,mt8192-infracfg",
> > "syscon", "simple-mfd";
> >   			reg = <0 0x10001000 0 0x1000>;
> >   			#clock-cells = <1>;
> > +
> > +			infracfg_rst: reset-controller {
> > +				compatible = "ti,syscon-reset";
> > +				#reset-cells = <1>;
> > +
> > +				ti,reset-bits = <
> > +					0x120 0 0x124 0 0 0	(ASSERT_SET
> > | DEASSERT_SET | STATUS_NONE) /* 0: lvts_ap */
> > +					0x730 12 0x734 12 0 0	(AS
> > SERT_SET | DEASSERT_SET | STATUS_NONE) /* 1: lvts_mcu */
> > +					0x140 15 0x144 15 0 0	(AS
> > SERT_SET | DEASSERT_SET | STATUS_NONE) /* 2: pcie phy */
> > +					0x730 1 0x734 1 0 0	(ASSERT_SET
> > | DEASSERT_SET | STATUS_NONE) /* 3: pcie top */
> > +					0x150 5 0x154 5 0 0	(ASSERT_SET
> > | DEASSERT_SET | STATUS_NONE) /* 4: svs */
> > +				>;
> > +			};
> >   		};
> >   
> >   		pericfg: syscon@10003000 {
> 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
