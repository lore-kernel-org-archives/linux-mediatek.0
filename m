Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E49C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpWXVHbuv62TkVJ0lR0h5kiuqfKlqxLJBIH6Ct5Igdw=; b=ia9RLXGVtK8maY/dSgSz+WfW9G
	xXBTpRTfCG6Wov68gKlY0lOcv0UMTlUjT4hPOFNuclb/ODBsh8QYd3z4K+ay1aKPoo9lI/G0Fx00B
	j5UX6zjESAek9BoPR7T5hkonIL0aQyPh/ZnqmFJ+485Bgw79tXezCjxu29w3rgIfyYfcd+Ll5L5jf
	FMgiLTdgYtydlrfDoN7dmjknj63gETq2o2/3srohaK/cNd53w/lZOarF1B9EpiGMOvJyum6ZWjYk3
	UDqOxsY7jPaKOZjeTAMULUlhSUtpUrhW6Q7LiKmI+d5hYaqd+KleoPe2Gh5Xdx0NUt3p3eP+aIj6j
	5Brk+YzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ock2T-003RKb-DI; Mon, 26 Sep 2022 09:04:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ock2P-003RGO-FS; Mon, 26 Sep 2022 09:04:30 +0000
X-UUID: 6e6d962cc3e949cdbfcd5c735094a968-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DpWXVHbuv62TkVJ0lR0h5kiuqfKlqxLJBIH6Ct5Igdw=;
	b=oxLk+cPL5EMsRZpv+++QOyUdoO4Mncv0BxvCZBnvhtrY0rXdk85aNBNw02Pu+RbipiZNkFWzDOoMIxtrFvIu9VF+jWeRTZSwoWMEnLhoR8mmqjdHUgCHIE9OwSTtGvgYH1YvTLwenCCbQCyyJyaYFbpH1TA1ux2WSgsP9bEyBaA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a9dc37fa-5a97-46f7-a9aa-9ea7d34ec0a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:781c15a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6e6d962cc3e949cdbfcd5c735094a968-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 695997948; Mon, 26 Sep 2022 02:04:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 17:03:54 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 17:03:54 +0800
Message-ID: <4f1bbcc84634017ee4bc04d684160fe7cad19cab.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: phy: Add compatible for Mediatek MT8188
From: xinlei.lee <xinlei.lee@mediatek.com>
To: <chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 26 Sep 2022 17:03:54 +0800
In-Reply-To: <1664180045-19095-1-git-send-email-xinlei.lee@mediatek.com>
References: <1664180045-19095-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_020429_568498_72B3DEE1 
X-CRM114-Status: GOOD (  12.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-09-26 at 16:14 +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-
> phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-
> phy.yaml
> index 9c2a734..beba633 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8365-mipi-tx
> +              - mediatek,mt8188-mipi-tx
>            - const: mediatek,mt8183-mipi-tx
>        - const: mediatek,mt2701-mipi-tx
>        - const: mediatek,mt8173-mipi-tx

Hi all:

Maybe the position of the mt8188 is not suitable, I will re-send it to
adjust it.

Best Regards!
Xinlei


