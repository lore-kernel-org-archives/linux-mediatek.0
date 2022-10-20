Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B5EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UnHp2k2ghaZjkzv46YbDogoalXYu7CQABpaiFjEGJo=; b=kK9VOtV0D3Bxv7r6EPVZPOFpCN
	uhXGP6YFSoF7AocUB+JTv56z8wxmNON8SakcwMP58r1olLaYfnDHVL+k2aLIsO/UMa/2UGWkbQsZu
	bdpwt0wwVK0/hIajXuqPWiUl+DuYP/Hf4HyCS72xCFmswBbjQVfSBpFQ69/cnDcm/acqMOr68yC6k
	wbPSHA6YubqWnzKTv48FaZ+3cSkbmutlCs2oxBzukORYiSNcj36ahMEW0B4Lo35MnhHfXWzHBtWWG
	BUVXGxY9ixhe/oG/0XiYW+sxgv91dTxDVI9uDUPVjOi1ksDGWhvg7/+NTkuRi3dHkEGjiGjcqFABC
	+hsTgCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRzp-00D3zo-IY; Thu, 20 Oct 2022 09:37:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRsA-00CyQN-PF; Thu, 20 Oct 2022 09:29:59 +0000
X-UUID: baea1aadb11245ffac6cf2c92ef44f23-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6UnHp2k2ghaZjkzv46YbDogoalXYu7CQABpaiFjEGJo=;
	b=XkBlh9/eFNlxUIteYYySCnk9ahJfHMVTwweiSjUiaTW3L9/s7CqdQUkANlx264wxaPDqys6dofr/wn6EyAImZ4uCJ0+Bvt9Pu9T/FJEzGHAmJ+6Ihr+SKKgDwKQ7kpkkvjt7pYb60zQTcnaSCLlNR3xETORcyDMxu/7AQQj8yGM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:c9b9a80f-85f7-46b9-9664-4d9954e1506d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:e33169a3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: baea1aadb11245ffac6cf2c92ef44f23-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 491445245; Thu, 20 Oct 2022 02:29:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 16:49:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 20 Oct 2022 16:49:13 +0800
Message-ID: <5e80cef1df473b2b401b803c5ad6fc1dddba17fc.camel@mediatek.com>
Subject: Re: [PATCH v3] arm64: dts: mt8195: Add Ethernet controller
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<macpaul.lin@mediatek.com>
Date: Thu, 20 Oct 2022 16:49:13 +0800
In-Reply-To: <0fb91a39-e356-4785-3ab1-11cbc3e78877@collabora.com>
References: <20221020024155.24520-1-biao.huang@mediatek.com>
	 <20221020024155.24520-2-biao.huang@mediatek.com>
	 <0fb91a39-e356-4785-3ab1-11cbc3e78877@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_022954_920963_2744B625 
X-CRM114-Status: GOOD (  16.88  )
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

Dear Angelo,
	Thanks for your comments~

On Thu, 2022-10-20 at 10:09 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/10/22 04:41, Biao Huang ha scritto:
> > Add Ethernet controller node for mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88
> > ++++++++++++++++++++
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 88
> > ++++++++++++++++++++
> >   2 files changed, 176 insertions(+)
> > 
> 
> ..snip..
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 905d1a90b406..7efaf92c5ff3 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1042,6 +1042,94 @@ spis1: spi@1101e000 {
> >   			status = "disabled";
> >   		};
> >   
> > +		eth: ethernet@11021000 {
> > +			compatible = "mediatek,mt8195-gmac",
> > "snps,dwmac-5.10a";
> 
> ..snip..
> 
> > +			#address-cells = <0>;
> > +			#size-cells = <0>;
> 
> I'm truly sorry for a partial bad suggestion, you don't need to
> specify address nor
> size cells = <0>; in the ethernet node, or you get a warning:
> 
> arch/arm64/boot/dts/mediatek/mt8195.dtsi:1174.26-1260.5: Warning 
> (avoid_unnecessary_addr_size): /soc/ethernet@11021000: unnecessary 
> #address-cells/#size-cells without "ranges" or child "reg" property
> 
> So please remove these two.
OK, will remove in next send.
> 
> After which...
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
OK, will add in next send.
> 
> 
Best Regards!
Biao


