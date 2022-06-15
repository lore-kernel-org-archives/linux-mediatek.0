Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D82C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 06:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J24NOOj7dJvO27g2bUaRl4KSTbUkZBUrzXZXfBxfS4c=; b=V2Q0wLuhpdixVr
	pSaa5xLtKpPejrKW6LzzGJ5CrX3FSYJAV2T4ZyZugyTnHT4opa9rCNwMCeVLT5FKtAy25pT3txOyY
	M5IIUQEYxBbMdumSJ1np1C7RAyPNWmcZ49UQ8cuYFCgMgr+A6CxJplSEegEuu2ao5mMoTLY3H1vjk
	zu8cmr3a0uVHXJzNgJcbPi9rrTW394OH1IXXradTVMeXBIA8Iflw0N/t0W/2Y3HzrTEFF43Cn3UID
	2TZVeuOekD8sesf/SarnBzbTk0WiYkR9/bvm14i7tBVYX1bL8HWSSunX7WJLDFiZ6B5iNq14Dir3/
	LJ7kkTyUKfz/PSzYb5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1MaI-00Cs3l-Lw; Wed, 15 Jun 2022 06:32:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Ma7-00Cs0Y-Km; Wed, 15 Jun 2022 06:32:49 +0000
X-UUID: 225350854a7c42b8bf22ede4bca0aea2-20220614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NnSTFoRGkGMzUMuSQ8SqE6JHb3rOK9jfdHOINoAFix8=;
	b=JPL0XSNAO1ldlaidYQKemtZu5SuTWoYdT44zF2vPlkC7LoWE42RP9CLf+e7mAn4Aft4Wm4+Mx5hPp2ZTWpgvdB4q5jRHdwvuwLLkX0lKHOXTnOgTqV9sN4w0uFVLo/jCLzfyFccm9O7dBzSLI+2Q0FbkWt3jCMacQ7I1g8vKfOs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:41e67f26-97aa-4153-a064-fa25b827c3b0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:424a8c48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 225350854a7c42b8bf22ede4bca0aea2-20220614
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1795248791; Tue, 14 Jun 2022 23:32:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 23:32:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 15 Jun 2022 14:32:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Jun 2022 14:32:31 +0800
Message-ID: <9ef61bb49dec1526b807f6dc7a36297a2cebab88.camel@mediatek.com>
Subject: Re: [PATCH v8 1/3] iommu/io-pgtable-arm-v7s: Add a quirk to allow
 pgtable PA up to 35bit
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>, <yf.wang@mediatek.com>
CC: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, "Isaac J. Manjarres"
	<isaacm@codeaurora.org>, Georgi Djakov <quic_c_gdjako@quicinc.com>, "Sven
 Peter" <sven@svenpeter.dev>, "moderated list:ARM SMMU DRIVERS"
	<linux-arm-kernel@lists.infradead.org>, "open list:IOMMU DRIVERS"
	<iommu@lists.linux-foundation.org>, open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Libo Kang
	<Libo.Kang@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ning Li
	<ning.li@mediatek.com>
Date: Wed, 15 Jun 2022 14:32:31 +0800
In-Reply-To: <20220614125630.GA8159@willie-the-truck>
References: <20220611102656.10954-1-yf.wang@mediatek.com>
	 <20220611102656.10954-2-yf.wang@mediatek.com>
	 <20220614125630.GA8159@willie-the-truck>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_233247_730752_357AED18 
X-CRM114-Status: GOOD (  21.03  )
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

On Tue, 2022-06-14 at 13:56 +0100, Will Deacon wrote:
> > @@ -74,17 +74,22 @@ struct io_pgtable_cfg {
> >  	 *	to support up to 35 bits PA where the bit32, bit33 and
> > bit34 are
> >  	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
> >  	 *
> > +	 * IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT: (ARM v7s format) MediaTek
> > IOMMUs
> > +	 *	extend the translation table base support up to 35 bits PA,
> > the
> > +	 *	encoding format is same with IO_PGTABLE_QUIRK_ARM_MTK_EXT.
> > +	 *
> 
> One thing I don't get is how the existing driver handles this. It
> seems
> as though if the HAS_4GB_MODE flag is not set, then we set oas to 35
> but
> without any pgtable changes. How does this work?

Regarding the pgtable, we already use the quirk
IO_PGTABLE_QUIRK_ARM_MTK_EXT to support 35bits oas.

HAS_4GB_MODE is the flag for the previous SoC that only supports 33bits
oas, it also is covered by IO_PGTABLE_QUIRK_ARM_MTK_EXT. and in 4GB
mode we add PA32 manually in mtk_iommu_map.

> 
> If it turns out that the existing devices can't handle 35-bit PAs,
> then
> could we use an oas of 35 to indicate that this new format is in use
> instead of introducing another quirk?

The existed devices can handle 35bits oas. The problem is that if
the pgtable PA could support up to 35bits. The previous SoC like mt8173
can't support while the lastest SoC can. This is the purpose of this
new quick. therefore we need GFP_DMA/DMA32 for pgtable allocating in
mt8173 and GFP_DMA/DMA32 is not needed in the new quirk.

> 
> Will
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
