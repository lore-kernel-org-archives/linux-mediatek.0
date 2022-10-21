Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEAAC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 06:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQQ5dcOP01lW+CR5DSVRsuTLttECvIhe0xnkTBZzjFU=; b=Xd/ovYtps7ewklEII2xxPaL6BO
	qKmy10LIJ63uq7+/TKLGsw0Y1QgLuTmyOW7HJMaRx/fca8duc5zB6p9Bd7B7i98eMPigsxlL2YgRH
	7Gp3fSLBsVIziKagiDl69n/POFOJMG6DpfsYuLf/MLdPXZqzC/rASOYJf+TqfOdBMzAjPcz1wkUKk
	krR4MR4gfy1/kSdO4FMIDjP9lbTC+DLHIT84/c7MyEs5FvSoj5uiTZd37xnajB2RpVqr5eN7pf88z
	GaadyXcqp3MKU/RnmsL5XyYwmn/Zz365QyB0Csqa+Fkm+Ml1YQdUJU//lwG6oayR8s+5xL1C5Vy2q
	JX8SgVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollUJ-005fJV-B8; Fri, 21 Oct 2022 06:26:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollUG-005fI8-7K; Fri, 21 Oct 2022 06:26:33 +0000
X-UUID: 22773f9be3604d84b78d2ca2e9193067-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=yQQ5dcOP01lW+CR5DSVRsuTLttECvIhe0xnkTBZzjFU=;
	b=uiVsS1pNLueO2/Ac6m7oB1RK8Zyv/zh/W1CI6TIxi0fipsSoWQBhGEf5LXLB4syOtfQC/OJscKaxYUl4H9gKpPJK2bXO/VZG3Sz5o6DtoaDCyNKkEF89oW/t9a3DXZeXu/Cr+WGW3ODfTizVSrHtQ86KAczxom62PdOLRKhHugg=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:8994548b-2a39-4f3f-bc35-32537cc8f6e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:54
X-CID-INFO: VERSION:1.1.12,REQID:8994548b-2a39-4f3f-bc35-32537cc8f6e9,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_HamU,ACTION:
	release,TS:54
X-CID-META: VersionHash:62cd327,CLOUDID:1fff3ae4-e572-4957-be22-d8f73f3158f9,B
	ulkID:221021142557YZQZOZPR,BulkQuantity:3,Recheck:0,SF:38|28|16|19|48|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 22773f9be3604d84b78d2ca2e9193067-20221020
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 277377768; Thu, 20 Oct 2022 23:26:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 14:25:53 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 21 Oct 2022 14:25:52 +0800
Message-ID: <616a128698656e71a4e28d59bbced17443c5cebc.camel@mediatek.com>
Subject: Re: [PATCH 6/8] arm64: dts: mt2712-evb: Fix usb vbus regulators
 unit names
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<sam.shih@mediatek.com>, <hanks.chen@mediatek.com>, <weiyi.lu@mediatek.com>,
	<zhiyong.tao@mediatek.com>, <andrew-sh.cheng@mediatek.com>,
	<viresh.kumar@linaro.org>, <fparent@baylibre.com>, <mars.cheng@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 21 Oct 2022 14:25:52 +0800
In-Reply-To: <96ab6836-4650-ee53-a0c9-54b8328b8667@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
	 <20221013152212.416661-7-angelogioacchino.delregno@collabora.com>
	 <3b7fc7414f282ca044c24dae280f9bc9533a5b7b.camel@mediatek.com>
	 <96ab6836-4650-ee53-a0c9-54b8328b8667@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_232632_298563_99529F73 
X-CRM114-Status: GOOD (  20.62  )
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

On Fri, 2022-10-14 at 09:35 +0200, AngeloGioacchino Del Regno wrote:
> Il 14/10/22 04:43, Chunfeng Yun ha scritto:
> > On Thu, 2022-10-13 at 17:22 +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Update the names to regulator-usb-p{0-3}-vbus to fix
> > > unit_address_vs_reg
> > > warnings for those.
> > > 
> > > Fixes: 1724f4cc5133 ("arm64: dts: Add USB3 related nodes for
> > > MT2712")
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > > b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > > index 638908773706..d31a194124c9 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > > +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> > > @@ -50,7 +50,7 @@ extcon_usb1: extcon_iddig1 {
> > >   		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
> > >   	};
> > >   
> > > -	usb_p0_vbus: regulator@2 {
> > > +	usb_p0_vbus: regulator-usb-p0-vbus {
> > 
> > Can we modify dt-binding of fixed regulator instead of changing the
> > node name,
> > since all nodes using fixed regulator may need be changed.
> > 
> 
> These regulators have no MMIO, nor need any index, so it would be
> simply
> wrong to change the binding and leave them as they are here in the
> devicetree.
You are right, then many files need be modified?

Thanks

> 
> Regards,
> Angelo


