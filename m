Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 03:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iT3hzBIsAH+eVzsWrF0dnUeQxoidLqG8EWlZ0JEYMwE=; b=RngI2gbv3b8tEB
	xpD2ObWR9LMMvfb/JkQ4Qx7KiN2yF2UrtwKdfsuF75bq4+MmzzgGMkMmpvojYQauS9C6F1gNWiKTd
	vm6p+0I6RoACTquuCcqynuPvAmZRTCtrNwiGLzGDobfSLq5MLy8pHrj07cA4pRfdtchGhx2ieeMAS
	amAqJEwzEMlnfDrHuSDikul5LS9yd93JDMqFyu24QTL2AS4rsP+svkh78d1Pb7jJk+ljHs5hMs07S
	NtV0r2pGsurH7MbVL4sOrGNpamBlZgoGYgA1NtUtvLLN6fEO96QEnYFNhjrdTwD1rpZxnEpX3D4cz
	8AOSptt8MkCy1+D2xFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUKY8-00BKDA-Bn; Wed, 16 Mar 2022 03:42:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUKY4-00BKCi-Nj; Wed, 16 Mar 2022 03:42:10 +0000
X-UUID: 79c872c8433b4b0e944118c59cc093db-20220315
X-UUID: 79c872c8433b4b0e944118c59cc093db-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 165471484; Tue, 15 Mar 2022 20:42:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 20:36:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 11:36:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 11:36:04 +0800
Message-ID: <7c93cb5e09153007589b8f90ad22af6a03f8a726.camel@mediatek.com>
Subject: Re: [PATCH v13 3/6] dt-bindings: soc: mediatek: move out common
 module from display folder
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 16 Mar 2022 11:36:04 +0800
In-Reply-To: <20220315061031.21642-4-moudy.ho@mediatek.com>
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-4-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_204208_793624_CBB3ADAE 
X-CRM114-Status: GOOD (  19.57  )
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

Hi, Moudy:

On Tue, 2022-03-15 at 14:10 +0800, Moudy Ho wrote:
> In order to share the same hardware information with MDP3,
> change the MUTEX dt-binding to the path "soc/mediatek".
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../{display => soc}/mediatek/mediatek,mutex.yaml      | 10 +++-----
> --
>  1 file changed, 3 insertions(+), 7 deletions(-)
>  rename Documentation/devicetree/bindings/{display =>
> soc}/mediatek/mediatek,mutex.yaml (84%)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> similarity index 84%
> rename from
> Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yam
> l
> rename to
> Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 6eca525eced0..4adc67cafd29 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> +++
> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: 
> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml*__;Iw!!CTRNKA9wMg0ARbw!wGUhdDCs1gqW3Mb5paZPaF-qpdK0BBiR6-zMnprFhfu_YiYLf4vEbi1fE1ktpA$
>  
> +$id: 
> https://urldefense.com/v3/__http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml*__;Iw!!CTRNKA9wMg0ARbw!wGUhdDCs1gqW3Mb5paZPaF-qpdK0BBiR6-zMnprFhfu_YiYLf4vEbi0c8j0j1A$
>  
>  $schema: 
> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wGUhdDCs1gqW3Mb5paZPaF-qpdK0BBiR6-zMnprFhfu_YiYLf4vEbi2jwnYkJA$
>  
>  
>  title: Mediatek mutex
> @@ -9,17 +9,13 @@ title: Mediatek mutex
>  maintainers:
>    - Chun-Kuang Hu <chunkuang.hu@kernel.org>
>    - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
>  
>  description: |
>    Mediatek mutex, namely MUTEX, is used to send the triggers signals
> called
> -  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on
> the display
> -  data path or MDP data path.
> +  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the
> data path.

If this is not related to 'move out', separate this to another patch.

>    In some SoC, such as mt2701, MUTEX could be a hardware mutex which
> protects
>    the shadow register.
> -  MUTEX device node must be siblings to the central MMSYS_CONFIG
> node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> -  for details.

If this is not related to 'move out', separate this to another patch.

Regards,
CK

>  
>  properties:
>    compatible:


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
