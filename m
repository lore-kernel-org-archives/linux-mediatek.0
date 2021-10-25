Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 06:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E2A06023D
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 06:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E2A06023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77rPKFy7WcfCRVMLsODvgiVSScXgBQlpxwT+k8ezL6s=; b=RvgN++oA1FUAe5
	3/3l300xCu4Q4VwRS40E+einl73Wr4+P7TblllH3y7wupWD/XHNCppTih2uMCSS+SO+I9IFfNFsXZ
	ZP0to8hO0e2VBCisOp0vEVrO+4PBji9viqzKei1NK/etHLVnpZEoxcI179/Ux4mU/foGBqiz4DPhV
	aF58cZnDJitGGiCd8kCgDEceNSzfjVa7LbFwgq6To1adsjtq+8txiTlR95Z5X1uuAmOeLdVdTyF99
	VnjCMKupjfNF/12GNwLJqEZeVB6jTztdb0CKmtC+o8iIchYgc6NOMubjZ0qnPeWl4JBc7Nox7vQ+3
	LZz6IxCCy0EGZdJ5/mRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1metAZ-00FMl9-UG; Mon, 25 Oct 2021 06:09:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1metAW-00FMjz-W1
 for linux-mediatek@lists.infradead.org; Mon, 25 Oct 2021 06:09:14 +0000
X-UUID: 14d510f8c8f04e078107e81db3b69240-20211024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wtn1HyN9ykMO2gL1yqE85JuEFWs87aBJ68lMUlhTtXA=; 
 b=rI88uzLfYZ+as6eVoCXQz5TkxXl3UzsJIDChAVKoqor2fktEOHlJhqCqNoGCmLE28Q6h+nYFONAe2FtwDSvBUbLkuQ1MNeALAlY5QaRDQ7I4zkUZJ44xsf+kDjFA89GhoZt9sZ6SsJBeuNmltOtQGljobCBAEpRk9GcVZ4YBML0=;
X-UUID: 14d510f8c8f04e078107e81db3b69240-20211024
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 945204242; Sun, 24 Oct 2021 23:09:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Oct 2021 23:09:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Oct 2021 14:09:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 14:09:05 +0800
Message-ID: <2f5e3d3275dc1914cd789abfd2da68f92e0e4117.camel@mediatek.com>
Subject: Re: [PATCH v8 2/5] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
From: Kewei Xu <kewei.xu@mediatek.com>
To: Boris Lysov <arzamas-16@mail.ee>
CC: <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <qii.wang@mediatek.com>
Date: Mon, 25 Oct 2021 14:09:05 +0800
In-Reply-To: <20211011183814.488ed866@pc>
References: <20211011183814.488ed866@pc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_230913_062857_D91C2941 
X-CRM114-Status: GOOD (  18.89  )
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

On Mon, 2021-10-11 at 18:38 +0300, Boris Lysov wrote:
> On Sun, 10 Oct 2021 15:05:13 +0800
> Kewei Xu <kewei.xu@mediatek.com> wrote:
> 
> > When a timeout error occurs in i2c transter, it is usually related
> > to the i2c/dma IP hardware configuration. Therefore, the purpose of
> > this patch is to dump the key register values of i2c/dma when a
> > timeout occurs in i2c for debugging.
> > 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > Reviewed-by: Qii Wang <qii.wang@mediatek.com>
> 
> I would like to test this patchset on one of supported platforms, an
> mt6577-powered device. This driver requires a DMA base...
> > 	i2c->pdmabase = devm_ioremap_resource(&pdev->dev, res);
> > 	if (IS_ERR(i2c->pdmabase))
> > 		return PTR_ERR(i2c->pdmabase);
> 
> ... however I am not sure what address should I specify in the .dts
> file. While
> other i2c busses supported by this driver such as mt6589 [1][2] and
> mt6797 [3]
> have designated DMA for I2C, mt6577 seems to lack dedicated DMA
> engine for I2C
> [4][5].
> 
> Do I need to specify the Generic DMA base address [4] instead?
> 
> Worth mentioning I brought up this issue in the past [5][6].
> 
> [1] ALPS.KK1.MP5.V1.3_EASTAEON89_WET_KK source code (downstream)
> [2] MT6589 HSPA+ Smartphone Application Processor Datasheet v1.0,
> page 869
> [3] MT6797 LTE-A Smartphone Application Processor Register Table
> (Part 1) v1.1,
> page 1796
> [4] MT6577 HSPA Smartphone Application Processor Datasheet v0.94,
> page 547
> [5] ALPS.JB.MP.V1.19_MBK77_TB_JB source code (downstream)
> [6] https://marc.info/?l=devicetree&m=159949247901831&w=2
> [7] https://marc.info/?l=linux-i2c&m=159939730714187&w=2
Hi, This patch only applies to APDMA(application processor DMA) and
does not use GDMA(Generic DMA).In addition, the file i2c-mt65xx.c only
supports APDMA mode by default. If APDMA address is not configured in
dts, i2c transmission will be fail.thx~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
