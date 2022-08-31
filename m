Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE2ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 02:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dKkz2EYJLGm1dUqQIb/V7Tm9tOnkhQDkTzS4AJbox4=; b=UXfcZ6H6rk9lvA700YuoKWzWRz
	qtB1tjWtdc8Uys0nRe5zyBqr/Gg1yD+5mmN7EbGau6f13fOpC+0rap+qo5S+Ztk+Wz92o9yGJzjSa
	gFZoCOvQaEVJxHYw/ErQ+1n85758Dk3LUh42AVbi7qMZoJNCBcHQGKiDRY8MgraPfhsp+SUXEEipl
	7xJlwEKO0ZeINC4PPmJnNiLnIEAYdgvu2WLbOG7Y555o8pAAA8ASJUZ16iyvB9waMhvDUH1mA3pEw
	lvvNAAMtVU0avNPKOsNnMzws1tIQ9JQ5uaZWbTqUe6dWTxrzC7UXklU82naR855/ki/sxGYZdwT3h
	TYmdT7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTDR6-003F91-BJ; Wed, 31 Aug 2022 02:26:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTDQt-003F49-RQ; Wed, 31 Aug 2022 02:26:27 +0000
X-UUID: bdbdd9c4b0df4ae7b8b4b22e8bada951-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3dKkz2EYJLGm1dUqQIb/V7Tm9tOnkhQDkTzS4AJbox4=;
	b=aV7h4hg/l92+xffzFFLpFQWDCy4jMjdb5wDgEcCfkyq9EFeWsofd6wlZYgtVZy+qQ9Hn9ZRUXCqA9JlDJAW/6eq8H9mpDKsmYXBUg2dn++UKDfAstZpij7A5tK6+M/VipWTPFQ2xPg/9bmufVFX0VN03B1FUp2yCjdO7QeO2e4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:2cebad8a-f689-4b58-a51f-6aa08afab019,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:27009e20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bdbdd9c4b0df4ae7b8b4b22e8bada951-20220830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 943755105; Tue, 30 Aug 2022 19:26:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 31 Aug 2022 10:25:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 10:25:36 +0800
Message-ID: <dc2123839b4cae3f67d4aa9194160976a21b06c9.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 31 Aug 2022 10:25:36 +0800
In-Reply-To: <e668a86b-f47b-bc42-440a-a74591827ccb@linaro.org>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
	 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
	 <e668a86b-f47b-bc42-440a-a74591827ccb@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_192623_898026_0590C8F3 
X-CRM114-Status: GOOD (  20.77  )
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

On Tue, 2022-08-30 at 12:13 +0300, Krzysztof Kozlowski wrote:
> > 
> On 30/08/2022 09:39, zheng-yan.chen wrote:
> > Modify gamma compatible for mt8195.
> 
> Commit should explain why. "What" we all can easily see.
> > Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
> > vdosys0")
> 
Hello Krzysztof,
Thanks for the review, 

I will edit commit message below:

Modify gamma compatible for mt8195.

    This modification is because of that
    mt8183 gamma driver data is not compatible with mt8195 gamma.

    Thus, need to delete mt8183 gamma compatible from mt8195 gamma.

> Your patchset is not bisectable and might cause ABI break. I doubt
> that
> it matches the criteria of backports, especially that you did not
> describe here bug being fixed.
> 
> Drop the tag and explain reasons for ABI break.
> 

I will drop the tag and add based-on messages below. 
Base on [1]:
    [1] arm64: dts: mt8195: Add display node for vdosys0
    - 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220811025813.21492-21-tinghan.shen@mediatek.com/

Best Regards,
Zheng-Yan Chen.
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index a50ebb5d145f..d4110f6fac62 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -2022,7 +2022,7 @@
> >  		};
> >  
> >  		gamma0: gamma@1c006000 {
> > -			compatible = "mediatek,mt8195-disp-gamma",
> > "mediatek,mt8183-disp-gamma";
> > +			compatible = "mediatek,mt8195-disp-gamma";
> >  			reg = <0 0x1c006000 0 0x1000>;
> >  			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> >  			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDOSYS0>;
> 
> 
> Best regards,
> Krzysztof


