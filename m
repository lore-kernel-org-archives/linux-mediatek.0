Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4219C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL1hAWS6xJ3NbmVRV44GynpQxUyfXz5WetABQa7IObw=; b=DRKgCuTrkyAkY8GVKwv0FsxVom
	wRJDJNydBUDgcVJNDHzLt2SHdP0yWGCWGxOWOlWAxp2RrOzuWMuAobexsBa1eQeoiMjbyMpu659Pf
	AmDgejOK2ni4D2fpW0EV4SSykGhuFkNlpgFLC3ICOq2ptVxhgm93gf8iQ0ix9N7hLyZPmOb8QA896
	3JpyGGxTn7btpVDUiu4tcRw8/wp6pPXRfUFisId8Du5lo6eeLTR49FA96QjSWdcng/oDDZbO8FJI7
	X+XlMI8gXrlKaFxab0xRmVN/aGnDKyTwmcVy/NI1xWbLBWzj9XUMU8liAN0Q+ULJmD0TSxnwGCrhU
	t42cRWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7jL-00EQOO-Mn; Mon, 21 Nov 2022 14:25:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7iA-00EPGm-TR; Mon, 21 Nov 2022 14:23:52 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C56C66029A5;
	Mon, 21 Nov 2022 14:23:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669040627;
	bh=qAqjbzpbzCYGde1jIuieXfGh7bGscq+1ycAIsLP/zNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nK9ZpmCXTjn3GTesP6VNlKCUdzpDPq2OVuLGTuvoGh9Rz0e1lUAoU5/fSW2nDIcSr
	 iHuFvw5dFgctCnrJ+t69CmCYlkXcevxE571PCb/dn0Ig944ebNZrXCko9kH2HeeDZ2
	 2Eit+koI7BosESKUHAfyzS8dpPbTiW+RDT0g4mIu4/dsTte8WX4RAXw4VppzBEcPFY
	 +SA7GiqmyhqGtK8iZNgrulWqybgpNBbWtf8bwMDcL9tZpo6PtB62BkI2ehT2ieegxX
	 UlufwjLgmVeQCRh5jOjMR/4MMHVEoe09sitpvhOhyEn9P6+4rCGTV/rONU01M8tMaS
	 yN+1j0lMOeq0Q==
Date: Mon, 21 Nov 2022 09:23:40 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: mt8192: Add vcodec lat and core nodes
Message-ID: <20221121142340.kpdak6lkicag6qtz@notapiano>
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-3-allen-kh.cheng@mediatek.com>
 <20221118141039.y2ap7dzdp26ih2la@notapiano>
 <5bb52e10002be4ea00ccb97d08235ebb97161756.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bb52e10002be4ea00ccb97d08235ebb97161756.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_062351_148388_248B2ECE 
X-CRM114-Status: GOOD (  26.53  )
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

On Mon, Nov 21, 2022 at 12:30:37PM +0000, Allen-KH Cheng (程冠勳) wrote:
> Hi Nícolas,
> 
> On Fri, 2022-11-18 at 09:10 -0500, Nícolas F. R. A. Prado wrote:
> > On Fri, Sep 30, 2022 at 07:22:37PM +0800, Allen-KH Cheng wrote:
> > > Add vcodec lat and core nodes for mt8192 SoC.
> > > 
> > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60
> > > ++++++++++++++++++++++++
> > >  1 file changed, 60 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > index 6b20376191a7..92a20f87468b 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > @@ -1449,6 +1449,66 @@
> > >  			power-domains = <&spm
> > > MT8192_POWER_DOMAIN_ISP2>;
> > >  		};
> > >  
> > > +		vcodec_dec: video-codec@16000000 {
> > > +			compatible = "mediatek,mt8192-vcodec-dec";
> > > +			reg = <0 0x16000000 0 0x1000>;
> > > +			mediatek,scp = <&scp>;
> > > +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > > +			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0
> > > 0xfff00000>;
> > 
> > Hi,
> > 
> > since commit 951d48855d86 ("of: Make of_dma_get_range() work on bus
> > nodes") [1]
> > was merged this no longer works as is. Running the fluster codec
> > tests results
> > in IOMMU faults:
> > 
> > 	[  386.233976] mtk-iommu 1401d000.m4u: fault type=0x280
> > iova=0x1fcdc0000 pa=0x0 master=0x500041c(larb=4 port=7) layer=0 read
> > 	[  386.250666] mtk_vdec_worker(),241:
> > [MTK_V4L2][ERROR]  <===[138], src_buf[0] sz=0x298 pts=0
> > vdec_if_decode() ret=1 res_chg=0===>
> > 
> > The issue is that the DMA configuration supplied by dma-ranges is now
> > looked for
> > in the parent node, so the vcodec_dec node no longer gets the
> > configuration it
> > expected.
> > 
> > That said, given that the node already uses the IOMMU for the address
> > translations (iommus property), there shouldn't even be a dma-ranges
> > property.
> > Indeed simply removing the dma-ranges property from this node fixes
> > the issue
> > and gets the decoder working again.
> > 
> > Thanks,
> > Nícolas
> > 
> > [1] 
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f1ad5338a4d57fe1fe6475003acb8c70bf9d1bdf__;!!CTRNKA9wMg0ARbw!xdhhnvXMY5-BjI2BXPHQI-Hw8zgtZ1lvFyFFv7KtNuCDxW17VC7RqAaW9B_uXsQucT1sLk_DUl-c99ijF9dF8QXbJQ$
> >  
> 
> Noted!
> 
> The paret node should be
> 
> vcodec_dec: video-codec@16000000 {
> 	compatible = "mediatek,mt8192-vcodec-dec";
> 	reg = <0 0x16000000 0 0x1000>;
> 	mediatek,scp = <&scp>;
> 	iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> 	#address-cells = <2>;
> 	#size-cells = <2>;
> 	ranges = <0 0 0 0x16000000 0 0x26000>;
> 	
> 	video-codec-lat@10000 {
> ...
> 
> }
> 
> Am I right?

Yes, that's right.

Thanks,
Nícolas

