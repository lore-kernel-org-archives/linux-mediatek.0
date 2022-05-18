Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YEXPnJDGV3vJgU/PCMSvUuTUjH7IbGYtk1QZy22ygc=; b=ir4nS4svTtfGHp
	kn1Dmr67mUWBYhxn4cGqzkYGFBsZtYx3Fp5jhsnPJgKKyJN4th9IGmn2nbp0LAnYGM4IdH2dgdIUH
	NVXAQ1PAlLMgTvzJYDI3HwnGOoIMu6oJ6ozXT9fWGer9s7U9bdivzENX0d7+Bwgbb6GpiKl8tofOz
	mAQ/uSu+N6nbpewvk282g3+exXZXnoG+i0katgO8HehHGYQqldiefB3M/fcqFksJw1HRw6xElUBJr
	9hcyWxcsb4ZceOmBv9P1C8zOcaZrcOlA0DirCTPiA0gLYLtbX9eaCO5GwCSsvam9CzrPiZqE5UyZB
	koiLbmnzd4g97zGQsc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8Od-00GUtm-80; Wed, 18 May 2022 01:22:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8OP-00GUol-J3; Wed, 18 May 2022 01:22:28 +0000
X-UUID: e8a856df68ed44a68ae5b5355f225818-20220517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BF+iuQyLj7oVV1fmVyBHDg8bfWDUgncs49opiEi8cY4=; 
 b=Op/Nzo7jPXS14/R55jek25YcGmEXItyxVAWS7EB9PeOlcQL6VyF51hEsuAO5MWJ1oG3Y4H2OToeM5Sn1CvWqkedqC7s8A6aKHlnNICo740tAxh+RiX8BRRzQDyvukLac+N6NQ1OAOHVKcP9Y+DKWF3TLvKKcA+JSYia8/OWiuvY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:d802766a-9e3f-449e-ab7f-a39b812d10d6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:28f38ce2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: e8a856df68ed44a68ae5b5355f225818-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1957061119; Tue, 17 May 2022 18:22:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 18:13:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 18 May 2022 09:13:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 May 2022 09:13:20 +0800
Message-ID: <1614c81e4975c5cfd19c8090d523b16116907389.camel@mediatek.com>
Subject: Re: [PATCH 2/2] iommu: mtk_iommu: Add support for MT6795 Helio X10
 M4Us
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <konrad.dybcio@somainline.org>,
 <marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <paul.bouchara@somainline.org>, <yf.wang@mediatek.com>,
 <mingyuan.ma@mediatek.com>, <libo.kang@mediatek.com>,
 <youlin.pei@mediatek.com>
Date: Wed, 18 May 2022 09:13:20 +0800
In-Reply-To: <9a67d3e8-8840-03b1-aec8-5a218e810eae@collabora.com>
References: <20220513151411.395744-1-angelogioacchino.delregno@collabora.com>
 <20220513151411.395744-3-angelogioacchino.delregno@collabora.com>
 <38e38006662b52631a2145228444b9d70f9eb2c6.camel@mediatek.com>
 <9a67d3e8-8840-03b1-aec8-5a218e810eae@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_182225_681491_D7C2A686 
X-CRM114-Status: GOOD (  33.71  )
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

On Tue, 2022-05-17 at 11:26 +0200, AngeloGioacchino Del Regno wrote:
> Il 17/05/22 11:08, Yong Wu ha scritto:
> > On Fri, 2022-05-13 at 17:14 +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Add support for the M4Us found in the MT6795 Helio X10 SoC.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/iommu/mtk_iommu.c | 20 +++++++++++++++++++-
> > >   1 file changed, 19 insertions(+), 1 deletion(-)

[...]

> > > +static const struct mtk_iommu_plat_data mt6795_data = {
> > > +	.m4u_plat     = M4U_MT6795,
> > > +	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> > > +			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
> > > +	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> > > +	.banks_num    = 1,
> > > +	.banks_enable = {true},
> > > +	.iova_region  = single_domain,
> > > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> > > +	.larbid_remap = {{0}, {1}, {2}, {3}, {4}}, /* Linear mapping.
> > > */
> > > +};
> > 
> > This is nearly same with mt8173_data. mt8173 has one more larb than
> > mt6795, its larbid_remap is also ok for mt6795.
> > 
> 
> I think that we should be explicit about the larbid_remap property,
> since mt6795 has one less larb, we should explicitly say that like
> I did there... that's only for human readability I admit ... but,
> still, I wouldn't want to see people thinking that MT6795 has 6 LARBs
> because they've read that larbid_remap having 6 entries.

In the linear mapping case, It does help. Strictly larbid_remap is two-
dimensional array now, It doesn't indicate how many larbs this SoC
has. If someone would like to know this, he could read the mtxxx-larb-
port.h. We also could document the larb numbers in the binding
for readability.

Anyway, It is not a big problem. A new structure is ok for me. I just
complain there are too many structures, specially in the internal
branch which contains many non-upstream SoCs, and there may be several
IOMMU HWs in one SoC. thus I'd like to group it personally.

> 
> > thus it looks we could use mt8173 as the backward compatible.
> >      compatible = "mediatek,mt6795-m4u",
> >                   "mediatek,mt8173-m4u";
> > 
> > After this, the only thing is about "mediatek,mt6795-infracfg". we
> > have
> > to try again with mediatek,mt6795-infracfg after mediatek,mt8173-
> > infracfg fail. I think we should allow the backward case in 4GB
> > mode
> > judgment if we have.
> > 
> > What's your opinion? or some other suggestion?
> > Thanks.
> 
> I know, I may have a plan for that, but I wanted to have a good
> reason to
> propose such a thing, as if it's just about two SoCs needing that,
> there
> would be no good reason to get things done differently.
> 
> ...so, in order to provide a good cleanup, we have two possible roads
> to
> follow here: either we add a generic "mediatek,infracfg" compatible
> to the
> infra node (but I don't like that), or we can do it like it was
> previously
> done in mtk-pm-domains.c (I prefer that approach):
> 
> iommu: iommu@somewhere {
> 	... something ...
> 	mediatek,infracfg = <&infracfg>;

We like this too. But this was not suggested from Rob long before.

https://lore.kernel.org/linux-mediatek/20200715205120.GA778876@bogus/

> };
> 
> infracfg = syscon_regmap_lookup_by_compatible(node,
> "mediatek,infracfg");
> if (IS_ERR(infracfg)) {
> 	/* try with the older way */
> 	switch (...) {
> 	case .... p = "mediatek,mt2712-infracfg";
> 	... blah blah ...
> 	}
> 	/* legacy also failed, ouch! */
> 	if (IS_ERR(infracfg))
> 		return PTR_ERR(infracfg);
> }
> 
> ret = regmap_read ... etc etc etc
> 
> Cheers,
> Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
