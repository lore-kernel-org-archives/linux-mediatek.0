Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 01:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5jtoJRola2JpS8PogCLR6TIq29dtwov6JCVumKpGlw=; b=ugVdTmECqhhS3b
	hkjzfRbef1dU48HWwxRxunU/flHUv4MsJuC5GnbjJyhX/5phLTwMbGdEzVDtfpycSHkTIF09K2BTe
	eMgImgEefhD+3tAUips3rzcIx+a9KdHpL4GcTG/+5irxehnozjl4TL8Cwh7Hi0lZkOzd3+UAbnToN
	FkKP8jAlzlx0+ceQiofAPh3kL3WWPYSKQ87+IpITLdU2zfCQvCFz0/0TprHy6KVam0yD7IcLjIdfs
	Vc874s59hgG5AXf5teKz0h0sZEKEjftzvOazoXjUMMCGwPK0/6lkJNGeXuHFHHsIOvNze4L9BU7iA
	KTv1gxJOJMt1sEbsdqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9zkG-003QZV-4S; Wed, 19 Jan 2022 01:26:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9zkB-003QYZ-MO; Wed, 19 Jan 2022 01:26:38 +0000
X-UUID: 045a566917e442ecbd872f788452a4a8-20220118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ode2egKLaXm17euy7v1oC1SDQ+r6PEv55Kep5fXIe6o=; 
 b=RUQ2atBx0ihc1xYJYUwZ+YSUooJNojp4chOsccw5kunLTi3CToR88VEO1jgo2nVOU4KMrh5XP7+mm4btCignpCqNz3wpxfNfNWux+2cdK4xWn4kPmn0Isw385yprwFDlhcVwlX5A2PG1W2FNcBcnO+reRL5iNQm4EbSl4fWr/kk=;
X-UUID: 045a566917e442ecbd872f788452a4a8-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 754539417; Tue, 18 Jan 2022 18:26:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 17:21:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Jan 2022 09:21:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 09:21:16 +0800
Message-ID: <c6f990fdf047eb90acaeb29f9f9b2941d6b7bf30.camel@mediatek.com>
Subject: Re: [PATCH net-next v12 7/7] net: dt-bindings: dwmac: add support
 for mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <angelogioacchino.delregno@collabora.com>, <macpaul.lin@mediatek.com>,
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Giuseppe
 Cavallaro" <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <dkirjanov@suse.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Date: Wed, 19 Jan 2022 09:21:15 +0800
In-Reply-To: <1642433742.934070.3923086.nullmailer@robh.at.kernel.org>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-8-biao.huang@mediatek.com>
 <1642433742.934070.3923086.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_172637_150148_D5AED762 
X-CRM114-Status: GOOD (  18.83  )
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

Dear Rob,
	Thanks for your comments.

	If patch "[PATCH net-next v12 4/7] arm64: dts: mt2712: update
ethernet device node" is applied with dt-binding patches, "make
dtbs_check" will not report 
such warnings.
	Please review it kindly, thanks.

On Mon, 2022-01-17 at 09:35 -0600, Rob Herring wrote:
> On Mon, 17 Jan 2022 15:07:06 +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 28
> > ++++++++++++++++---
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://patchwork.ozlabs.org/patch/1580608
> 
> 
> ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref']
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]]
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not
> contain items matching the given schema
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: 'oneOf' conditional failed, one must
> be fixed:
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: Unevaluated properties are not allowed
> ('compatible', 'reg', 'interrupts', 'interrupt-names', 'mac-address', 
> 'clock-names', 'clocks', 'power-domains', 'snps,axi-config',
> 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,txpbl',
> 'snps,rxpbl', 'clk_csr', 'phy-mode', 'phy-handle', 'snps,reset-gpio', 
> 'mdio' were unexpected)
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
