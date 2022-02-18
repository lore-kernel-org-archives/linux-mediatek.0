Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B78C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 02:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVIJ0Wkn0vG+eZqBawp2pqfaanOKh/st69FPdJKTR/4=; b=a+EWOI7vm2wuTY
	+K/uboglMVHAEISCHbyPLp44bPDfxC/h7jdsWBocx0aENU0+ljPKX5G65oc6vv++dW9Y73wUCkvQT
	vtiSjMKHxYK413xeUKspS7v6nJ1SO0omlYiBgzxxHoKfWrJkJuLrmFfKpAo/L1LUssdkZLfqB29Bc
	/YbCHQUmU5VLM2vkVEKYjNkVYtES8GHov3HTdxyyk4MrMSWfGEEshOOoX2n4/t9fhx7+BiWvmqa0D
	FJl7KfsNlTu1hdCDu/sPV6IH9DiUaSl3UcMOo7TDSVIAdRbUVdOBWNrNa8G979VlmmtK0HMFQiTY7
	40U5P4pUmQ4pW9vGjlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKt5N-00CizD-CT; Fri, 18 Feb 2022 02:33:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKt5K-00CixS-Ba; Fri, 18 Feb 2022 02:33:28 +0000
X-UUID: 3b8dab79d11a4569905724b9beac034d-20220217
X-UUID: 3b8dab79d11a4569905724b9beac034d-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 286176046; Thu, 17 Feb 2022 19:33:17 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 18:23:15 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Feb 2022 10:23:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Feb 2022 10:23:07 +0800
Message-ID: <b1146e977bbbda7bd74d9f4096ed16dc371e1e67.camel@mediatek.com>
Subject: Re: [PATCH v11 0/3] Add basic SoC support for mediatek mt8195
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>, Sean Wang
 <Sean.Wang@mediatek.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "ryder.lee@kernel.org"
 <ryder.lee@kernel.org>, "wenst@chromium.org" <wenst@chromium.org>, "Chunfeng
 Yun =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?="
 <Chunfeng.Yun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "Bear
 Wang" <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>
Date: Fri, 18 Feb 2022 10:23:07 +0800
In-Reply-To: <e17592b2-5e02-44a6-5c21-ac599af5fce1@mediatek.com>
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <e17592b2-5e02-44a6-5c21-ac599af5fce1@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_183326_411077_F66231D6 
X-CRM114-Status: GOOD (  27.67  )
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

Hi Macpaul,

On Thu, 2022-02-17 at 14:24 +0800, Macpaul Lin wrote:
> On 2/16/22 7:31 PM, Tinghan Shen wrote:
> > This series adds basic SoC support for Mediatek's SoC MT8195.
> > 
> > ---
> > Changes in v11:
> >    - rebase on 5.17-rc4
> > Changes in v10:
> >    - clean CC list
> > Changes in v9:
> >    - remove duplicated cpus dt-bindings patch in v8
> > Changes in v8:
> >    - v7 mediatek,spi-mtk-nor.yaml patch is applied in branch for-5.17 at
> >      kernel/git/broonie/spi.git
> >    - v7 pinctrl-mt8195.yaml patch is applied in branch for-next at
> >      kernel/git/linusw/linux-pinctrl.git
> >    - add cortex-a78 compatible to cpus dt-bindings
> >    - add mediatek,drive-strength-adv property to pinctrl dt-bindings
> >    - fix evb dts
> >      - remove i2c nodes with disabled status from dts
> >      - fix pin properties not match pinctrl dt-bindings
> >      - remove unnecessary u3port*
> >    - fix dtsi
> >      - fix node format
> >      - reorder oscillator* nodes
> >      - fix node name of cpu idle nodes
> >      - remove clock-frequency property in the timer node
> >      - reorder clock and clock names in usb nodes
> > Changes in v7:
> >    - refine title of spi-nor dt-bindings patch
> >    - refine commit message of pinctrl dt-bindings patch
> >    - update pinctrl-mt8195.yaml
> >      - change property pattern from 'pins' to '^pins'
> >      - update examples with new property in descriptions
> >      - add new example
> >    - drop '_' from node names of pinctrl subnodes in mt8195-evb.dts
> > Changes in v6:
> >    - rebase on 5.16-rc1
> >    - add new clock name to spi-nor dt-bindings
> >    - add "pins" property in pinctrl dt-bindings
> >    - fix fails of dtbs_checks
> >      - remove "arm,armv8" not matched in yaml from cpu compatile
> >      - fix node name of xhci
> >      - remvoe xhci upstreaming wakeup properties
> >      - remove xhci unused properties address-cells and size-cells
> >      - fix node name of ufs-phy
> >      - fix node name of spi-nor
> >      - fix node name and sub-nodes of pinctrl
> >      - fix mmc compatible
> > Changes in v5:
> >    - enable basic nodes in mt8195-evb.dts
> >    - remove dedicated clock nodes
> >    - add mmc2 node
> >    - fix interrupt number of pinctrl node
> >    - update clock nodes to apply internal fixes
> >    - add dt-bindings for perficfg node
> > 
> > v4 thread:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20210922093303.23720-2-seiya.wang@mediatek.com/__;!!CTRNKA9wMg0ARbw!xv2H7ZXYIUG7YY1R5OuFgbvDxyfaE6dkkD5H_PciKAZAb5jk-uThgSgItGuvt2d6gCs$
> > v3 thread:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20210601075350.31515-2-seiya.wang@mediatek.com/__;!!CTRNKA9wMg0ARbw!xv2H7ZXYIUG7YY1R5OuFgbvDxyfaE6dkkD5H_PciKAZAb5jk-uThgSgItGuvgIQSNYo$
> > v2 thread:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20210319023427.16711-10-seiya.wang@mediatek.com/__;!!CTRNKA9wMg0ARbw!xv2H7ZXYIUG7YY1R5OuFgbvDxyfaE6dkkD5H_PciKAZAb5jk-uThgSgItGuvBx50AeU$
> > v1 thread:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20210316111443.3332-11-seiya.wang@mediatek.com/__;!!CTRNKA9wMg0ARbw!xv2H7ZXYIUG7YY1R5OuFgbvDxyfaE6dkkD5H_PciKAZAb5jk-uThgSgItGuvpH_NtEY$
> > ---
> > 
> > Tinghan Shen (3):
> >    dt-bindings: arm: mediatek: Add mt8195 pericfg compatible
> >    dt-bindings: pinctrl: mt8195: Add mediatek,drive-strength-adv property
> >    arm64: dts: Add mediatek SoC mt8195 and evaluation board
> > 
> >   .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
> >   .../bindings/pinctrl/pinctrl-mt8195.yaml      |   35 +
> >   arch/arm64/boot/dts/mediatek/Makefile         |    1 +
> >   arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  161 +++
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1049 +++++++++++++++++
> >   5 files changed, 1247 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > 
> 
> Just trying to clarify something.
> Dear Tinghan, is there any "lines of code" changed between v10 and v11  
> due to the rebase? Is that you just updated the parent commit hash for  
> rebasing this patchset to 5.17-rc4? I've just get confused if v10 and  
> v11 are duplicated then should we need to review the patch again in detail?
> 
> Thanks.
> Macpaul Lin

Thanks for your review.

There's no change introduced after rebase v10 to 5.17-rc4.

v11 and v10 are the same.


Best regards,
TingHan





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
