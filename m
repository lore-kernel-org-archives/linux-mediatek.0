Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78169C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e760Z98fooWYXgKv2mStQBuvOT9dfR5fB4EuC4xMjkE=; b=eXry4nFBtxVD1ZgoS63a06WZTa
	hGSijDftBoU2Q7oxdKmAbZIEKXMr3tMUskFLsEiPh/ynvYiPTqBISSwHzM6Mf2sQl5++ff8V4YKS9
	zhT9vgXAO3iJvQ1GtM8CiD8jRHa/wGKwDmibec9v+G6jN+Y9r5GFH7fJnDtUnXzxdAifX7NJIvRO7
	WiSn5IZV+3zdWwvqjo859OP0K00P8vzGNBzNEqxlc9HP+lbfGxB9lj6VlWlB67Ct6h6pOfooCxcmD
	b4zQkvRfTTfXr+8eRZmNsmVXo+ZFz6pfzjtsvlpN02XNOhm8U4dxep9Bjvigpx2yS1vISjN66eDic
	6n8Rbnsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEi6-004G9B-Ej; Tue, 11 Oct 2022 12:50:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEi2-004G8P-NN; Tue, 11 Oct 2022 12:50:13 +0000
X-UUID: 39895827a2074e5c8745e57277070829-20221011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=e760Z98fooWYXgKv2mStQBuvOT9dfR5fB4EuC4xMjkE=;
	b=Z0Vfh4PBdMzM+s9qYvpuEjgEGX20ikHUm63cCpxlSUxHdbBVEqdrRpHi4UL9JMrx4LLB0ZkGfz2NzlxJ/0PYxfGpAZe6VocoOrqTjwDofcmyqk908FAyv4sNBiHQhB0lphrGf605/6XlV8hU0iDp1Cn7Zae56gMHMewTwknQiC4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9f4f99ae-7421-4ae4-97d0-79343db72115,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:476ee9fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 39895827a2074e5c8745e57277070829-20221011
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 152669731; Tue, 11 Oct 2022 05:50:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 11 Oct 2022 20:49:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 11 Oct 2022 20:49:26 +0800
Message-ID: <ff0d6c368d15c36aed1c09e8f0010a0847116fc8.camel@mediatek.com>
Subject: Re: [PATCH v2 3/7] dts: arm64: mt8195: add MMSYS and MUTEX
 configuration for VPPSYS
From: moudy ho <moudy.ho@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Date: Tue, 11 Oct 2022 20:49:26 +0800
In-Reply-To: <1d2613aa-3225-a2b6-521a-b2df70a30ed5@linaro.org>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
	 <20221011070356.682-4-moudy.ho@mediatek.com>
	 <1d2613aa-3225-a2b6-521a-b2df70a30ed5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_055010_802603_6233FC97 
X-CRM114-Status: GOOD (  21.79  )
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

On Tue, 2022-10-11 at 08:23 -0400, Krzysztof Kozlowski wrote:
> On 11/10/2022 03:03, Moudy Ho wrote:
> > From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> > 
> > Compatible names, node names, and GCE client registers for
> > VPPSYS0 and VPPSYS1 should be renamed or added to match
> > the binding file requirements.
> > Also, add two nodes for MT8195 VPPSYS MUTEX.
> > 
> > Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
> Use subject prefixes matching the subsystem (git log --oneline --
> ...).
> 

Hi Krzysztof,

Thanks for the correction to the prefix order, it will be fix in the
next version.
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 30
> > ++++++++++++++++++++----
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 905d1a90b406..3e73bd58e54d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1476,12 +1476,23 @@
> >  			#clock-cells = <1>;
> >  		};
> >  
> > -		vppsys0: clock-controller@14000000 {
> > -			compatible = "mediatek,mt8195-vppsys0";
> > +		vppsys0: syscon@14000000 {
> > +			compatible = "mediatek,mt8195-vppsys0",
> > +				     "mediatek,mt8195-mmsys", "syscon";
> 
> No. You change multiple pieces in one patch, some of them have much
> bigger impact, like adding compatibles.
> 
> Split and describe *why* you are changing it.
> 
> >  			reg = <0 0x14000000 0 0x1000>;
> > +			mediatek,gce-client-reg = <&gce1
> > SUBSYS_1400XXXX 0 0x1000>;
> >  			#clock-cells = <1>;
> >  		};
> >  
> > +		mutex@1400f000 {
> > +			compatible = "mediatek,mt8195-vpp-mutex";
> 
> And you add some new nodes in a cleanup patch...
> 
> Best regards,
> Krzysztof
> 

Sorry for the mix-up, I'll split this into two patches.

Thanks,
Moudy


