Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4438FC32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 00:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyP+UC+nz0mfWD//PcLXFkLh7sU/Z2M1jPcJubN4g1g=; b=uQDE3g4H+M2c3+uK55lgNTVsCN
	tew6aSn6KfwcsLrKYPfmn7OjxvmYtQK229IikaGiWDjFktSAz0RcoBdO0vse3zMboVHIJ8/RLwPmO
	c/Zu5sVXvsQOdIQeWTmBEvhZjHep7f6c8p6BxZelHyJ3Guo5ATfjWD6kSpSBbYgxEkIbDKY7AQn1/
	3MB5MwdBxQ+QF0Iy3cUzzamY1KwJJ/PecSoQGBnbrYmYmNQuaXe4Tr/sOwoRdhycX4Wh1E8L5vrfg
	cfpcmPzsdlV6oUxBv3IM/Me2ZmObQvPqsCYbVSwRA80rkXQLKc3mOdEzaCU1CFrplCxREnsAA4NVN
	B+yn8QTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYze0-004Elq-Ek; Fri, 16 Sep 2022 00:55:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYzdn-004EUC-JZ; Fri, 16 Sep 2022 00:55:37 +0000
X-UUID: a9784152a16e4af680fe605ddc0e0235-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=SyP+UC+nz0mfWD//PcLXFkLh7sU/Z2M1jPcJubN4g1g=;
	b=qsTQyn8fjrX0MNCVO8dcJ0oQQA6TvRY/0oPIkkZ51IzNFBNs37y/+TceN0DgoRoevkrHFSRS5QRlyF77Tcc+CzwQe3tgYAVwNE0KctqBLH6wCHAZGBcT1srD7uKiHRcpac5gYslkoXj364LuVVniHP2sYfQaOO/JK09WpQnWwtM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:99f7a461-82d6-4d31-8106-ba1f6f5cc13a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:a7d3cc7b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a9784152a16e4af680fe605ddc0e0235-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 155376828; Thu, 15 Sep 2022 17:55:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 08:54:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 08:54:31 +0800
Message-ID: <90201cd6f3385350a980f5fb98cb5f26c8aa5757.camel@mediatek.com>
Subject: Re: [PATCH 4/5] arm64: dts: change compatible of vdosys0 and
 vdosys1 for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 16 Sep 2022 08:54:31 +0800
In-Reply-To: <1fd48fa0-66eb-5af9-6168-d1df602216a5@gmail.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
	 <20220914182331.20515-5-jason-jh.lin@mediatek.com>
	 <1fd48fa0-66eb-5af9-6168-d1df602216a5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_175535_654804_6BE2C2DE 
X-CRM114-Status: GOOD (  26.62  )
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

Hi Matthias,

Thanks for the review.

On Thu, 2022-09-15 at 18:15 +0200, Matthias Brugger wrote:
> 
> On 14/09/2022 20:23, Jason-JH.Lin wrote:
> > For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> > pipelines binding to 1 mmsys with the same power domain, the same
> > clock driver and the same mediatek-drm driver.
> > 
> > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
> > to
> > 2 different power domains, different clock drivers and different
> > mediatek-drm drivers.
> > 
> > Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> > CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
> > Quality)
> > and they makes VDOSYS0 supports PQ function while they are not
> > including in VDOSYS1.
> > 
> > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> > component). It makes VDOSYS1 supports the HDR function while it's
> > not
> > including in VDOSYS0.
> > 
> > To summarize0:
> > Only VDOSYS0 can support PQ adjustment.
> > Only VDOSYS1 can support HDR adjustment.
> > 
> > Therefore, we need to separate these two different mmsys hardwares
> > to
> > 2 different compatibles for MT8195.
> > 
> > Fixes: b852ee68fd72 ("arm64: dts: mt8195: Add display node for
> > vdosys0")
> 
> No fixes tag needed, there is no runtime bug.
> 
> Regards,
> Matthias
> 
OK, I'll remove this.

But I think this dts change should be sent after the vdosys1 series are
accepted.
So I'll drop this dts patch at the next version.

Regards,
Jason-JH.Lin

> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 905d1a90b406..6ec6d59a16ec 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1966,7 +1966,7 @@
> >   		};
> >   
> >   		vdosys0: syscon@1c01a000 {
> > -			compatible = "mediatek,mt8195-mmsys", "syscon";
> > +			compatible = "mediatek,mt8195-vdosys0",
> > "syscon";
> >   			reg = <0 0x1c01a000 0 0x1000>;
> >   			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
> >   			#clock-cells = <1>;
> > @@ -2101,7 +2101,7 @@
> >   		};
> >   
> >   		vdosys1: syscon@1c100000 {
> > -			compatible = "mediatek,mt8195-mmsys", "syscon";
> > +			compatible = "mediatek,mt8195-vdosys1",
> > "syscon";
> >   			reg = <0 0x1c100000 0 0x1000>;
> >   			#clock-cells = <1>;
> >   		};
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


