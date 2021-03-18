Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6D8C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 02:45:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA00064F20
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 02:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA00064F20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eBX73kjEl9/HJpEAnCgxUG7PA6054cdK5qJavA9Yfuo=; b=Zt3P5azHYR55RIcLBQ6RbozI6
	Vw9N2/N+W2DEpzFO4JaDfcLFK5OfZgVWdQHX/qvIiIc/0zWljucGwMoYMebPYZVELorPD9v4GBZkt
	JY8SR9buaR/ZPIfGaBT2k9S08HxNDjJmIfHmL7kMK8LyVZvgJlIu7b6+fHdWV2iSwb2zyd/nkaDFu
	CC6UwuYUNH4egIkJEocfJWKU6+d3BIXLnYOYlIYBO0SLzq0A8Q7YmE7KqDvL1+j4ZrqUfgCO3DTtV
	vf2T2KS5BB+24zjEwmVgCqScxyRqLe49i+Sr7QcShMsrZYTP2osVf/VrrIzrUAkeTJwGATRMCtEKN
	Rpp4x6WpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMieR-004JGq-I4; Thu, 18 Mar 2021 02:44:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMid6-004JCf-8e; Thu, 18 Mar 2021 02:44:19 +0000
X-UUID: 6618be27ea704d39ad41c36f4b0075e1-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fQv6Dgwb3ZUIHKCcqqmaWUSPNkvouPy+QtwObI48/bE=; 
 b=UV5+P3PHZPuPxUnxdD4aERMjnEYLanODjoEBKaoeXt6MHVdhdYJ2PvLQCeKRfz7ziFJGToeXW5GDE25UPxKL2ga424pOhtqgVa1sTVHRRjkO+RRkTqWr+7fkoH67ECEBmg6cXgQwb2cvtrWE4CWbqm5jUOXZEe/m8tRmu6hcJkc=;
X-UUID: 6618be27ea704d39ad41c36f4b0075e1-20210317
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1172517734; Wed, 17 Mar 2021 18:43:08 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 19:43:06 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 18 Mar 2021 10:43:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Mar 2021 10:43:03 +0800
Message-ID: <1616035383.25733.20.camel@mhfsdcap03>
Subject: Re: [PATCH v5 02/13] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu
 <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Cawa Cheng
 <cawa.cheng@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
Date: Thu, 18 Mar 2021 10:43:03 +0800
In-Reply-To: <20210316092232.9806-2-chunfeng.yun@mediatek.com>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-2-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_024416_350170_2B86AB2C 
X-CRM114-Status: GOOD (  15.92  )
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

Hi Vinod,

  Could you please help to apply patches [02/13] [03/13] [04/13] of the
series?

   Thanks a lot

On Tue, 2021-03-16 at 17:22 +0800, Chunfeng Yun wrote:
> mt7623-mipi-tx is compatible to mt2701-mipi-tx, and use
> "mediatek,mt2701-mipi-tx" instead on MT7623, so modify
> the compatible items to make dependence clear.
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: no changes
> v4: add acked-by CK, and reviewed-by Rob
> v3: modify commit message suggested by CK
> v2: separate two patches suggested by CK
> ---
>  .../devicetree/bindings/phy/mediatek,dsi-phy.yaml   | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index 71d4acea1f66..6e4d795f9b02 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -19,11 +19,14 @@ properties:
>      pattern: "^dsi-phy@[0-9a-f]+$"
>  
>    compatible:
> -    enum:
> -      - mediatek,mt2701-mipi-tx
> -      - mediatek,mt7623-mipi-tx
> -      - mediatek,mt8173-mipi-tx
> -      - mediatek,mt8183-mipi-tx
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-mipi-tx
> +          - const: mediatek,mt2701-mipi-tx
> +      - const: mediatek,mt2701-mipi-tx
> +      - const: mediatek,mt8173-mipi-tx
> +      - const: mediatek,mt8183-mipi-tx
>  
>    reg:
>      maxItems: 1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
