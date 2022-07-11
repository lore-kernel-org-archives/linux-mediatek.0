Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80561C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNRBn1SKnfSZwjxKGlbmYduLKdpaUeVMjjNsyTFjmzc=; b=3NPpnpL9dzUzxW+qQAEqxvVgTv
	+hzpN+bcog6ZP+S9fdgNUzW2ybmWxHxDdlh0UhxkSseAzUFv56OoJKrbAYQRfGvofYMBOGKwwRLqT
	YQ5VgbDADiGl76z0aXn9dpK0lOCjluyCdbSeDoUV8GbP7kL/17VN23NxXkB8hY5yFkQRBA4jVzoTx
	RzCAN3B6F+jNsq6Fw+iyYko9VS3Zjlkt8KDa4yeLckhxsqLS8PH1vSrmrOgOlwImIiuQsGxOtGCMn
	JY/BfAnHR6x423Y79tFhIVh+t8uJbxdz/Tb6b2KOmG3rwm9Xnw6iu49wO682LRsop6gFs12ltotXe
	M7pHXVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oArl3-0016h2-5Q; Mon, 11 Jul 2022 11:39:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oArkz-0016eq-FG; Mon, 11 Jul 2022 11:39:19 +0000
X-UUID: bc1298b004af4114848545d52cc85996-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ddb803b7-dee8-4e6f-b932-dec77ecf206e,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:95391a87-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bc1298b004af4114848545d52cc85996-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 907747859; Mon, 11 Jul 2022 04:39:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 19:28:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 11 Jul 2022 19:28:34 +0800
Message-ID: <f2bd61f3bd3d413543826a76d81c802c57f851f6.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Xiandong Wang
 =?UTF-8?Q?=28=E7=8E=8B=E5=85=88=E5=86=AC=29?= <Xiandong.Wang@mediatek.com>
Date: Mon, 11 Jul 2022 19:28:33 +0800
In-Reply-To: <26adc983-5dbf-b53f-82a5-96ecc3cd41f2@collabora.com>
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
	 <20220705122627.2273-2-allen-kh.cheng@mediatek.com>
	 <5916c91b-41a1-c97a-84b4-7d48739a0639@collabora.com>
	 <640c1a9b-f8b5-aa89-19af-7d6f5c55eb12@gmail.com>
	 <243b30ca-a552-3cb7-8a4e-6e54a56ff60a@collabora.com>
	 <55fafa62684e077f75c3b8b192a59df62ad01692.camel@mediatek.com>
	 <2f2f8bfe-4c7f-d81c-30bf-bcd60b42e245@gmail.com>
	 <2b25912b-85d7-8804-b973-6239545d19ff@collabora.com>
	 <5a5524eb450b5fa60abbe7b915e8305831bd0a8e.camel@mediatek.com>
	 <26adc983-5dbf-b53f-82a5-96ecc3cd41f2@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_043917_554552_A2696DFC 
X-CRM114-Status: GOOD (  54.30  )
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

Hi Angelo,

On Fri, 2022-07-08 at 07:37 -0800, AngeloGioacchino Del Regno wrote:
> Il 08/07/22 13:58, allen-kh.cheng ha scritto:
> > Hi Angelo,
> > 
> > On Fri, 2022-07-08 at 10:28 +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Il 08/07/22 10:19, Matthias Brugger ha scritto:
> > > > 
> > > > 
> > > > On 08/07/2022 10:14, allen-kh.cheng wrote:
> > > > > Hi Angelo,
> > > > > 
> > > > > On Thu, 2022-07-07 at 12:59 +0200, AngeloGioacchino Del Regno
> > > > > wrote:
> > > > > > Il 07/07/22 12:41, Matthias Brugger ha scritto:
> > > > > > > 
> > > > > > > 
> > > > > > > On 07/07/2022 10:52, AngeloGioacchino Del Regno wrote:
> > > > > > > > Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
> > > > > > > > > Add mdp3 mutex compatible for mt8186 SoC.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Allen-KH Cheng <
> > > > > > > > > allen-kh.cheng@mediatek.com>
> > > > > > > > > Signed-off-by: Xiandong Wang <
> > > > > > > > > xiandong.wang@mediatek.com>
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Please drop this commit. Adding a mdp3-mutex compatible
> > > > > > > > is
> > > > > > > > not
> > > > > > > > needed here.
> > > > > > > > 
> > > > > > > 
> > > > > > > Thanks for checking. We probably would need a fallback
> > > > > > > compatible.
> > > > > > > We can only know
> > > > > > > from the HW engineers that can confirm if the IP block is
> > > > > > > the
> > > > > > > same
> > > > > > > as the disp
> > > > > > > mutex or a different one.
> > > > > > > 
> > > > > > > I'll drop both patches for now until things got clear.
> > > > > > > 
> > > > > > 
> > > > > > They're located in a different iospace from each other, but
> > > > > > either
> > > > > > the platform
> > > > > > data needs to *not be* joined together, or if they're
> > > > > > together,
> > > > > > I
> > > > > > would not like
> > > > > > having two different compatible strings for essentially the
> > > > > > same
> > > > > > thing.
> > > > > > 
> > > > > > I would at this point prefer dropping '-disp' from
> > > > > > 'mediatek,mt8186-
> > > > > > disp-mutex'
> > > > > > so that we would be able to declare two 'mediatek,mt8186-
> > > > > > mutex'
> > > > > > in
> > > > > > devicetree...
> > > > > > ...or simply have two mediatek,mt8186-disp-mutex (although
> > > > > > logically
> > > > > > incorrect?).
> > > > > > 
> > > > > > Cheers,
> > > > > > Angelo
> > > > > > 
> > > > > 
> > > > > Thanks for your opinion.
> > > > > 
> > > > > They are two different hardwares for different address
> > > > > spaces.
> > > > > 
> > > > > I think we drop '-disp' from 'mediatek,mt8186-disp-mutex'
> > > > > will be
> > > > > excessive because we also need to modify mutex node in all
> > > > > exited
> > > > > dts
> > > > > files.
> > > > > 
> > > > > I prefer havingg two mediatek,mt8186-disp-mutex.
> > > > > 
> > > > > ex:
> > > > > mutex: mutex@14001000 {
> > > > >      compatible = "mediatek,mt8186-disp-mutex";
> > > > >      ..
> > > > > }
> > > > > 
> > > > > mdp3_mutex0: mutex@1b001000 {
> > > > >      compatible = "mediatek,mt8186-disp-mutex";
> > > > >      ...
> > > > > }
> > > > > 
> > > > > What do you think?
> > > > 
> > > > I think that's an acceptable solution.
> > > > 
> > > 
> > > I'm a bit undecided instead, now... because from what I
> > > understand
> > > now,
> > > the platform data fields
> > > 
> > > 	.mutex_mod  and  .mutex_sof
> > > 
> > > are *not valid* for mutex at 0x1b001000 but only for the instance
> > > at
> > > 0x14001000.
> > > 
> > > If we go this way, at this point, we would be free (and allowed
> > > by
> > > the driver)
> > > to try to set these for 0x1b001000, and to try to set MDP3 table
> > > paths on
> > > 0x14001000, which is something that shouldn't be logically
> > > allowed,
> > > as the
> > > hardware does *not* support that.
> > > 
> > > Unless I got that wrong, and these fields for MUTEX_MOD_DISP_xxxx
> > > do
> > > exist in
> > > the mutex instance at 0xb001000, in which case, I fully agree
> > > with
> > > Matthias.
> > > 
> > > But otherwise, I have my doubts.
> > > 
> > > Cheers,
> > > Angelo
> > > 
> > 
> > I got your point.
> > 
> > The disp and mdp3 drivers work with the same data field beacase
> > 14001000 (disp mutex) would not use .mutex_table_mod and 1b001000
> > (mdp3
> > mutex) would not use .mutex_mod/.mutex_sof.
> > 
> > 
> > How about ...
> > 
> > static const struct mtk_mutex_data mt8186_mutex_driver_data = {
> > 	.mutex_mod = mt8186_mutex_mod,
> > 	.mutex_sof = mt8186_mutex_sof,
> > 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> > 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> > };
> > 
> > static const struct mtk_mutex_data mt8186_mutex_mdp_driver_data = {
> > 	.mutex_table_mod = mt8186_mutex_table_mod,
> > };
> > 
> > { .compatible = "mediatek,mt8186-disp-mutex",
> > .data = &mt8186_mutex_driver_data},
> > { .compatible = "mediatek,mt8186-mdp3-mutex",
> > .data = &mt8186_mutex_mdp_driver_data},
> > 
> > 
> >   mutex: mutex@14001000 {
> >      compatible = "mediatek,mt8186-disp-mutex";
> >      ..
> >   }
> >   mdp3_mutex0: mutex@1b001000 {
> >      compatible = "mediatek,mt8186-mdp3-mutex";
> >      ...
> >   }
> > 
> > Do you think that is feasible?
> > 
> 
> This makes a lot more sense to me.
> 
> Though, you have to also add the mod and sof regs, because the mutex
> instance
> for MDP_MUTEX does have these registers, even though they are used
> for different
> mods/sofs.
> 
> static const struct mtk_mutex_data mt8186_mutex_driver_data = {
> 	.mutex_mod = mt8186_mutex_mod,
> 	.mutex_sof = mt8186_mutex_sof,
> 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> };
> 
> static const struct mtk_mutex_data mt8186_mdp_mutex_driver_data = {
>   	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
>   	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> 	.mutex_table_mod = mt8186_mdp_mutex_table_mod,
> };
> 
> P.S.: Notice that mt8186_mdp_mutex_driver_data instead of
>        mt8186_mutex_mdp_driver_data was chosen on purpose:
>        like that, we're referencing to real block names.
> 
> Regards,
> Angelo
> 

Thanks for your suggestion.

According to our discussion, I will update in next version.

Best Regards,
Allen


> > Best Regards,
> > Allen
> > 
> > > > Regards,
> > > > Matthias
> > > > 
> > > > > 
> > > > > Best regards,
> > > > > Allen
> > > > > 
> > > > > > > Regards,
> > > > > > > Matthias
> > > > > > > 
> > > > > > > > > ---
> > > > > > > > > .../devicetree/bindings/soc/mediatek/mediatek,mutex.y
> > > > > > > > > aml
> > > > > > > > >     | 1 +
> > > > > > > > >     1 file changed, 1 insertion(+)
> > > > > > > > > 
> > > > > > > > > diff --git
> > > > > > > > > a/Documentation/devicetree/bindings/soc/mediatek/medi
> > > > > > > > > atek
> > > > > > > > > ,mutex
> > > > > > > > > .yaml
> > > > > > > > > b/Documentation/devicetree/bindings/soc/mediatek/medi
> > > > > > > > > atek
> > > > > > > > > ,mutex
> > > > > > > > > .yaml
> > > > > > > > > index 627dcc3e8b32..234fa5dc07c2 100644
> > > > > > > > > ---
> > > > > > > > > a/Documentation/devicetree/bindings/soc/mediatek/medi
> > > > > > > > > atek
> > > > > > > > > ,mutex
> > > > > > > > > .yaml
> > > > > > > > > +++
> > > > > > > > > b/Documentation/devicetree/bindings/soc/mediatek/medi
> > > > > > > > > atek
> > > > > > > > > ,mutex
> > > > > > > > > .yaml
> > > > > > > > > @@ -30,6 +30,7 @@ properties:
> > > > > > > > >           - mediatek,mt8173-disp-mutex
> > > > > > > > >           - mediatek,mt8183-disp-mutex
> > > > > > > > >           - mediatek,mt8186-disp-mutex
> > > > > > > > > +      - mediatek,mt8186-mdp3-mutex
> > > > > > > > >           - mediatek,mt8192-disp-mutex
> > > > > > > > >           - mediatek,mt8195-disp-mutex
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > 
> > > > > > 
> 
> 
> 


