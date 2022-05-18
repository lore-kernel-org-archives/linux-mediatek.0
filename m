Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2123CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 04:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcZ7eypH9llS5csoTVvPf6F7u5isDmBe4tHZjDvfSjs=; b=x1+Rj0gol2k2eC
	2LfPVNoRcgBxJz2IMBSR4VaV1weGMJ9mm8XHwUCT9DyI2IWlsFlIRjJ1G9lmRMwa6UmZaplwz0x8v
	Z98lafo6wO6mpjzsn1Rj1MIUmWd1ObAEytV6KghgAfsWyWTtzA+7SrXkJpLsPtTLitXln6XqdDnAb
	1fBua26ymhPpIlihg+RoyQEnyam21WZXeqzAq6egoxjaliklz7halSqC7E/vdYEMW+l5a1xddv76z
	gkJTyu+rumcFoHZKrNetx+ghWXe0cPi4Nn9rZ2E2JauccQd18ZsbAkmfZdhGUmkJsxaDoVRdf/nqV
	o4teqyIZrTaCcy8DiSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrBRZ-00H9Dy-Vw; Wed, 18 May 2022 04:37:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrBRP-00H9DE-JN; Wed, 18 May 2022 04:37:45 +0000
X-UUID: eb97aa2c2a584d54b6dffc2878a7666a-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f1c540e4-3544-4d09-9e89-87e78963eb2a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:2a19b09, CLOUDID:9ecf95e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: eb97aa2c2a584d54b6dffc2878a7666a-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 617946617; Tue, 17 May 2022 21:37:36 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 21:27:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 12:27:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 May 2022 12:27:32 +0800
Message-ID: <b85893ee561b5678e25447d1ad50636912ea91a7.camel@mediatek.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: display: mediatek: dsi: Add
 compatible for MediaTek MT8186
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <airlied@linux.ie>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 May 2022 12:27:32 +0800
In-Reply-To: <20220504091923.2219-3-rex-bc.chen@mediatek.com>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-3-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_213743_674482_12D0EA6C 
X-CRM114-Status: GOOD (  11.90  )
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

Hi, Rex:

On Wed, 2022-05-04 at 17:19 +0800, Rex-BC Chen wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8186 SoC.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1
> +
>  1 file changed, 1 insertion(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> index fa5bdf28668a..b18d6a57c6e1 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> @@ -28,6 +28,7 @@ properties:
>        - mediatek,mt8167-dsi
>        - mediatek,mt8173-dsi
>        - mediatek,mt8183-dsi
> +      - mediatek,mt8186-dsi
>  
>    reg:
>      maxItems: 1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
