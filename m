Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFECCC07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 04:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tL38CEkQsWSbb1OBD439suq7S3Zhcw+JKG6JpjFgMBs=; b=QR99rqnANYiMzzpC0tzGJKpnda
	Dri2tvLFzrqdLpjt7cR2BCGw7Cjs6tFxNq7kzD51b7/jWs55IL7OlB4qEPp+XSbc6DbyiLt6N0kWM
	n0IRernIpDP9Pun+qU16eUiS4cea8Mko50cuqenRO5K5REwbLICcNC7G4gfpw7TrgTFfg/LgtGoRq
	n/W/2KKso+FnWM4hsbbHxTaHqOf0z66sixvUZa7/JmnpfqmzXQ48TXurNSOupQSgsK847UDLvLpsv
	n0bgGJqMMegiXaJIYej50ue5b+FgEYmcXMYZ+4DFf2ab/S/OPKERkD+lOrOk84yIK8oOfXMHsSXYa
	2SZD77pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od26W-008EcM-QQ; Tue, 27 Sep 2022 04:21:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od26T-008Eb9-1x; Tue, 27 Sep 2022 04:21:54 +0000
X-UUID: 0095eaafa8c3427e96541c160b3ca40f-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tL38CEkQsWSbb1OBD439suq7S3Zhcw+JKG6JpjFgMBs=;
	b=jU5qGSnATcub2WyCyncoKEylVpoShvtcDM39hJh2y/l2mORjjujbYQXwOMUjxquIww4XRBR/WGhJfmgj1pkDytvO1E/8tu6GoX1FCRpBqmPvJ6te4MJRBzWcSdbYX9kRpg9kBVxct6h9s7Y6CkELMkLQU9us41XtD2z+THddv5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a0d3e0f1-3287-43db-af83-289e7dae3bfb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:9a842007-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0095eaafa8c3427e96541c160b3ca40f-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 48238617; Mon, 26 Sep 2022 21:21:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 12:21:25 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Sep 2022 12:21:24 +0800
Message-ID: <d27d3b249abb5c4b35506e4f5afaf4ccc2357995.camel@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: phy: Add compatible for Mediatek MT8188
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 27 Sep 2022 12:21:25 +0800
In-Reply-To: <0a6d3d14-33f0-92d2-b42f-e4d336c8cd91@linaro.org>
References: <1664183509-29473-1-git-send-email-xinlei.lee@mediatek.com>
	 <c5ee2888-dabf-e3a6-acca-517ede984002@linaro.org>
	 <0a6d3d14-33f0-92d2-b42f-e4d336c8cd91@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_212153_151529_26D43C57 
X-CRM114-Status: GOOD (  17.30  )
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

On Mon, 2022-09-26 at 14:55 +0200, Krzysztof Kozlowski wrote:
> On 26/09/2022 11:23, Krzysztof Kozlowski wrote:
> > On 26/09/2022 11:11, xinlei.lee@mediatek.com wrote:
> > > From: xinlei lee <xinlei.lee@mediatek.com>
> > > 
> > > Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.
> > > 
> > > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > Please add Acked-by/Reviewed-by tags when posting new versions.
> > However,
> > there's no need to repost patches *only* to add the tags. The
> > upstream
> > maintainer will do that for acks received on the version they
> > apply.
> > 
> > 
https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst*L540__;Iw!!CTRNKA9wMg0ARbw!w9FOgUcssBRstcHm65UMMbvSlgAOjT8c0c_GP_CgTrR1-5iA7mcb64YFfdNkY227eQ$
> >  
> > 
> > If a tag was not added on purpose, please state why and what
> > changed.
> > 
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> As pointed out in other discussion - these bindings might not be
> correct. Please post DTS, so we can validate them.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof:

Thanks for your review.

In the previous patch,I changed the addition position, so I re-send it.
I don't know if you have any suggestions,so I didn't add the acked tag.

I will wait until the mt8188.dts file exits before sending this patch.

Best Regards!
xinlei


