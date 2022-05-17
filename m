Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5iIwAfvl2azEkaAMgNbaYwjsmDEW673utSXk77BZjc=; b=eYKOueLHbUyFpO
	WpXFm7c4+Am81hlD3CvLBm1DUPHmPFXRXZLqDR1ajVN91ZmEGzNRkJkaCmxNSaxAzbpuapVNueiLn
	o2zewHTXLsxZrNEMKUmgzzsiL/BtAvNF19gBqSyYTtCGBSF2yPMehLVNz0o/BOZ5UJfIPpWlq4mVh
	F/Yt/ST4bRX7MuKNaUmaPKtBVEtkMNjPLj+VXPk33G/GdxwPn5nxdMXBygpzEJS2yTtCMJbNvCpPB
	DrSBQlyOPo5Y6IWPWPKDp9ILim4Tiy+Vpo2rP2vi4BdQ9czZieBowc9IcuNPskwtJnAeOCWlrKtu4
	GiD4MuqjnwyBIR94+nkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtld-00CqlP-RB; Tue, 17 May 2022 09:45:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtl8-00CqT1-1C; Tue, 17 May 2022 09:44:56 +0000
X-UUID: aac93f753d684ad38bc96b86306f6a15-20220517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ma36yLP9p/j5AvIYHVoskDEZp6o7fQ6qHAbJ/vbGOck=; 
 b=YsTJwFcc+R7ycBEWpu1yV/vc7Z/Rm45WLVAJDx+qUe9jWs7X9wFis4XHqkxeaAMynPPmoIPusVlh/sD24cyUt8fXBJjrb443AlUxp2JGQdOy4rf15RKVZvQc4LXoTimSvYv97ArCcJKh+N6afk0SgBziVEhFp0Nma+optBGmCp0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:dc8d892e-9521-4ea8-b801-a1957f7863f8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:5aec8b79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: aac93f753d684ad38bc96b86306f6a15-20220517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 761702314; Tue, 17 May 2022 02:44:48 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 02:44:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 17:44:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 May 2022 17:44:07 +0800
Message-ID: <9f290b2bbdfd4b9d46b81d3ab02c2f50999e95e5.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] memory: mtk-smi: Add support for MT6795 Helio X10
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <konrad.dybcio@somainline.org>,
 <marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <paul.bouchara@somainline.org>, <kernel@collabora.com>,
 <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>,
 <wendy-st.lin@mediatek.com>
Date: Tue, 17 May 2022 17:44:07 +0800
In-Reply-To: <f222e1c5-4ce1-a42d-ceef-a292136d8b61@collabora.com>
References: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
 <20220513150633.387200-3-angelogioacchino.delregno@collabora.com>
 <cf2442b9c7124ebf1ce62ae5df597f003fa447d7.camel@mediatek.com>
 <f222e1c5-4ce1-a42d-ceef-a292136d8b61@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_024454_135230_755CA3D9 
X-CRM114-Status: GOOD (  37.65  )
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

On Tue, 2022-05-17 at 10:27 +0200, AngeloGioacchino Del Regno wrote:
> Il 17/05/22 08:37, Yong Wu ha scritto:
> > On Fri, 2022-05-13 at 17:06 +0200, AngeloGioacchino Del Regno
> > wrote:
> > > The MediaTek Helio X10 (MT6795) SoC has 5 LARBs and one common
> > > SMI
> > > instance without any sub-common and without GALS.
> > > 
> > > While the smi-common configuration is specific to this SoC, on
> > > the
> > > LARB side, this is similar to MT8173, in the sense that it
> > > doesn't
> > > need the port in LARB, and the register layout is also compatible
> > > with that one, which makes us able to fully reuse the smi-larb
> > > platform data struct that was introduced for MT8173.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/memory/mtk-smi.c | 17 +++++++++++++++++
> > >   1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > > index 86a3d34f418e..7e7c3ede19e4 100644
> > > --- a/drivers/memory/mtk-smi.c
> > > +++ b/drivers/memory/mtk-smi.c
> > > @@ -21,11 +21,13 @@
> > >   /* SMI COMMON */
> > >   #define SMI_L1LEN			0x100
> > >   
> > > +#define SMI_L1_ARB			0x200
> > >   #define SMI_BUS_SEL			0x220
> > >   #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
> > >   /* All are MMU0 defaultly. Only specialize mmu1 here. */
> > >   #define F_MMU1_LARB(larbid)		(0x1 <<
> > > SMI_BUS_LARB_SHIFT(larbid))
> > >   
> > > +#define SMI_FIFO_TH0			0x230
> > 
> > Does the name come from the coda you got?
> > It is called SMI_READ_FIFO_TH in my coda.
> > 
> 
> Documentation for this SoC is not public and I have no access to it,
> so
> everything that you see here comes from reading downstream kernel
> code :-(
> 
> I'll change the name to SMI_READ_FIFO_TH as suggested, thanks!
> 
> > >   #define SMI_M4U_TH			0x234
> > >   #define SMI_FIFO_TH1			0x238
> > >   #define SMI_FIFO_TH2			0x23c
> > > @@ -360,6 +362,7 @@ static const struct of_device_id
> > > mtk_smi_larb_of_ids[] = {
> > >   	{.compatible = "mediatek,mt2701-smi-larb", .data =
> > > &mtk_smi_larb_mt2701},
> > >   	{.compatible = "mediatek,mt2712-smi-larb", .data =
> > > &mtk_smi_larb_mt2712},
> > >   	{.compatible = "mediatek,mt6779-smi-larb", .data =
> > > &mtk_smi_larb_mt6779},
> > > +	{.compatible = "mediatek,mt6795-smi-larb", .data =
> > > &mtk_smi_larb_mt8173},
> > >   	{.compatible = "mediatek,mt8167-smi-larb", .data =
> > > &mtk_smi_larb_mt8167},
> > >   	{.compatible = "mediatek,mt8173-smi-larb", .data =
> > > &mtk_smi_larb_mt8173},
> > >   	{.compatible = "mediatek,mt8183-smi-larb", .data =
> > > &mtk_smi_larb_mt8183},
> > > @@ -541,6 +544,13 @@ static struct platform_driver
> > > mtk_smi_larb_driver = {
> > >   	}
> > >   };
> > >   
> > > +static const struct mtk_smi_reg_pair
> > > mtk_smi_common_mt6795_init[SMI_COMMON_INIT_REGS_NR] = {
> > > +	{SMI_L1_ARB, 0x1b},
> > > +	{SMI_M4U_TH, 0xce810c85},
> > > +	{SMI_FIFO_TH1, 0x43214c8},
> > > +	{SMI_FIFO_TH0, 0x191f},
> > > +};
> > > +
> > >   static const struct mtk_smi_reg_pair
> > > mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
> > >   	{SMI_L1LEN, 0xb},
> > >   	{SMI_M4U_TH, 0xe100e10},
> > > @@ -565,6 +575,12 @@ static const struct mtk_smi_common_plat
> > > mtk_smi_common_mt6779 = {
> > >   		    F_MMU1_LARB(5) | F_MMU1_LARB(6) |
> > > F_MMU1_LARB(7),
> > >   };
> > >   
> > > +static const struct mtk_smi_common_plat mtk_smi_common_mt6795 =
> > > {
> > > +	.type	  = MTK_SMI_GEN2,
> > > +	.bus_sel  = BIT(0),
> > 
> > Like the other larbs, use F_MMU1_LARB(0) here?
> > 
> 
> I agree that F_MMU1_LARB(0) == (1 << (0 << 1)) == BIT(0), but that
> would
> not be correct and induce other people to mistake, I think?

F_MMU1_LARB(x) means larbx enter MMU1. this is correct for me.

OK. Maybe the macro name is not good. About the macro background,
please see:
567e58cf96dd (memory: mtk-smi: Add bus_sel for mt8183)

If you have better name for this, please tell me:)

> Downstream doesn't do MMU1 bits, but MMU0 in this case... but if you
> can
> check on internal documentation and confirm that the downstream
> kernel's
> logic is wrong on that - and that you've verified that this should 

I don't know the detailed downstream code, But I find a internal branch
about this SoC. I see the bus_sel did set to 0x1 as you did here. thus
I don't think the downstream kernel is wrong. 0x1 means larb0 enter
MMU1 while the others still enter MMU0. we could use F_MMU1_LARB(0)
here.

> indeed
> be F_MMU1_LARB(x), you'll get a big(bigger) thank you from me :-)
> 
> Meanwhile...
> 
> Thanks!
> Angelo
> 
> > 
> > After the two changes,
> > 
> > Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> > 
> > Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
