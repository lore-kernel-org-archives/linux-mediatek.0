Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90904C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFbscUoTLPTh2zghRtXbcfCdowKcIMeaerjKrkM79Cs=; b=mjkkpObKRT2/Ob9xi8lVU1gBKT
	lzrRxkAtVJVJOKUElFzeaJCBuG0fLCgPXvRbuDJNVHAnvuqZX6eufjpcqi5ahR7iuZbmgrnO7/FGu
	RyeHQvxCqmGdWPPG8QuPqCFYvtk7lj7LQcPomXrzuaIygkvPE2zVc8Bt6TMuGayHexkN/lA1H9ftD
	G/S0+wSV0XAJxH2QhDyPc5zqlcodpmGnYXqQlSutDW7QB/EJzrfvarYSulUc4Ap3zFsF+S/LMI6cu
	nOENDBxklAVm5Iotm0axK9iiHhM0kphAVebIkfETFaEIyLmLjM7pl3eCBIV0+PlmUYbW6Re6Qdo2z
	iWc/nsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o79gu-0035Lk-Qm; Fri, 01 Jul 2022 05:59:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o79gs-0035L0-3n; Fri, 01 Jul 2022 05:59:43 +0000
X-UUID: bad84683c7b440e1bdb7c3cbaaf09484-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:696288e0-6da4-4975-bce4-6dfdea8fbfad,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:b74a54d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bad84683c7b440e1bdb7c3cbaaf09484-20220630
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1729282595; Thu, 30 Jun 2022 22:59:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 13:59:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 1 Jul 2022 13:59:00 +0800
Message-ID: <6c6bdbca0e44bc57aa008e561d3ab4b9c6ae50b0.camel@mediatek.com>
Subject: Re: [PATCH 3/5] arm64: dts: mt8192: Add display nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, "=?ISO-8859-1?Q?N=EDcolas?= F. R.	A.
 Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 1 Jul 2022 13:59:00 +0800
In-Reply-To: <CAGXv+5EKK_eicvD6-nFG0CkirYA2sFUJp59m6RK7y534HvYwbg@mail.gmail.com>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
	 <20220629121358.19458-4-allen-kh.cheng@mediatek.com>
	 <20220629232429.c5oysjgy6gflqhct@notapiano>
	 <99342f13190cb4ea103c4227e6672eb5cad63b82.camel@mediatek.com>
	 <20220630134210.7j665amh6tbeaecv@notapiano>
	 <CAGXv+5EKK_eicvD6-nFG0CkirYA2sFUJp59m6RK7y534HvYwbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_225942_194644_9DA0A34C 
X-CRM114-Status: GOOD (  32.91  )
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

Hi Chen-Yu,

On Fri, 2022-07-01 at 13:25 +0800, Chen-Yu Tsai wrote:
> On Thu, Jun 30, 2022 at 9:42 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> > 
> > On Thu, Jun 30, 2022 at 05:41:31PM +0800, allen-kh.cheng wrote:
> > > Hi Nícolas,
> > > 
> > > On Wed, 2022-06-29 at 19:24 -0400, Nícolas F. R. A. Prado wrote:
> > > > On Wed, Jun 29, 2022 at 08:13:56PM +0800, Allen-KH Cheng wrote:
> > > > > Add display nodes and gce info for mt8192 SoC.
> > > > > 
> > > > > GCE (Global Command Engine) properties to the display nodes
> > > > > in
> > > > > order to
> > > > > enable the usage of the CMDQ (Command Queue), which is
> > > > > required for
> > > > > operating the display.
> > > > > 
> > > > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > > angelogioacchino.delregno@collabora.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 136
> > > > > +++++++++++++++++++++++
> > > > >  1 file changed, 136 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > > index a07edc82d403..26d01544b4ea 100644
> > > > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > 
> > [..]
> > > > > +         rdma0: rdma@14007000 {
> > > > > +                 compatible = "mediatek,mt8192-disp-rdma";
> > > > 
> > > > dtbs_check is complaining that there isn't a "mediatek,mt8183-
> > > > disp-
> > > > rdma"
> > > > fallback compatible here. But given that the rdma driver
> > > > matches
> > > > directly to the
> > > > mt8192 compatible, I think the node here is fine, and the
> > > > binding is
> > > > the one
> > > > that should be updated.
> > > > 
> > > 
> > > I have checked the binding and driver again.
> > > 
> > > I prefer use "mediatek,mt8186-disp-rdma" as fallback and remove
> > > mt8192
> > > compatible and data in mtk_disp_rdma.c because they are the same
> > > with
> > > mt8183.
> > > 
> > > Do you think it is okay?
> > 
> > Sure, that sounds good to me as well.
> 
> That's backwards. MT8192 was released well before MT8186. The latter
> hasn't
> even hit the market yet.
> 
> Please use "mediatek,mt8183-disp-rdma" as fallback. And you need to
> keep
> "mediatek,mt8192-disp-rdma" as the most specific compatible string,
> because
> we want SoC specific compatible strings.
> 
> For the driver, there isn't any difference between mt8183 and mt8192
> for
> the rdma part, so we might as well just remove the mt8192 compatible
> from
> the driver.
> 
> 
> Regards
> ChenYu

Yes, I agree with you. it appears that for some reasons I made a typo
in my repy.

I will use "mediatek,mt8183-disp-rdma" as fallback in next version.

Thanks,
Allen




