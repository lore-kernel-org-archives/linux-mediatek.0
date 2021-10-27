Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5792FC43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 02:34:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F383760F92
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 02:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F383760F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CasosUSs4QW+O6dornhDDU3YOhIYgRDmr8Fo4Dqb7Xo=; b=xHghOrrdGLvuIj
	IxTw4d892kQr8qVolrkOGJC7YCzEtlNOIkxtHAg4bdEwAsBdOW/sXXSr0w9/GjjfVGWUAxJ13AplN
	5kHfdL1gXU3m3hAR0ADpmCJ83NGpdE3tbr/Jamj6IhrbVw4XEKhT5921eTnElwTMFBWl6yqABQ9ey
	cmipF4+UZrY4rW7Ensf5g1oktyL9k1s4PP9dPCY2f8MiA4A/rvlfwEhu1zrmmXiOBu0gpOGxUW//L
	Y7HOohikkdMtBdpyJ0+4HsUiaQLZ8lF8QjsEdUaikXk3RTfm7d4cwM5iW6wndLr0eBMZb5BS+SJBR
	cGBd6rPUF6smFQCidaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfYld-003e15-RO; Wed, 27 Oct 2021 02:34:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfYlZ-003dy3-22; Wed, 27 Oct 2021 02:34:16 +0000
X-UUID: 41f1f71b90cc43c88ae2961c424664bd-20211026
X-UUID: 41f1f71b90cc43c88ae2961c424664bd-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 484029442; Tue, 26 Oct 2021 19:34:07 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 19:27:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 10:27:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 10:27:45 +0800
Message-ID: <9e36d2353aadb293ee277329eed84c4015bc0277.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mfd: change naming of mediatek rpmsg property
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Benson Leung <bleung@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Lee Jones <lee.jones@linaro.org>, Enric
 Balletbo i Serra <enric.balletbo@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Guenter
 Roeck" <groeck@chromium.org>, <devicetree@vger.kernel.org>
Date: Wed, 27 Oct 2021 10:27:45 +0800
In-Reply-To: <1634578358.531021.2612842.nullmailer@robh.at.kernel.org>
References: <20211018115111.14096-1-tinghan.shen@mediatek.com>
 <1634578358.531021.2612842.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_193413_188723_C5E91083 
X-CRM114-Status: GOOD (  22.14  )
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

On Mon, 2021-10-18 at 12:32 -0500, Rob Herring wrote:
> On Mon, 18 Oct 2021 19:51:11 +0800, Tinghan Shen wrote:
> > Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with
> > the
> > vendor name defined in vendor-prefixes.yaml.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/1542563__;!!CTRNKA9wMg0ARbw!yQGrJgf_q0cFKm4GiKGqWF4eFuMbBE3w_p4r9ipndPFZMOYDBfs0oAwGpZa6mKdIggI$
>  
> 
> 
> cros_ec: 'mtk,rpmsg-name' does not match any of the regexes:
> '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$',
> 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> burnet.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> fennel14.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> sku6.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> sku1.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
> 

Hi Rob,

Thanks for your reviewing. I'm sorry that forget to mention the
dependency of this patch.

This patch is introduced because of this change,

https://lore.kernel.org/all/20210924033935.2127-7-tinghan.shen@mediatek.com/

I will resend this patch to mention the dependency.

Best regards,
TingHan



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
