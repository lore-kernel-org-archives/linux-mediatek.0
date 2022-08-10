Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4260DC19F2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 01:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z48Z/6BJ44USMBjWFHetu114Y1YDE9zrqDWzGJN6TIE=; b=23+YK7jiwHA+GglJ9Y3Ui00gJb
	IFK30fWt+t1Gc1Dlky1A5fPe4i/ozyPc69O3vHKm7NAGG5fXgvAat7v9+w2T+/uY0pLvfDbQ2TTn3
	7Eh75DvYC5yJFqTuU1QMpNlHOB1+Ux5xbQqNpO44Uk8Ljt7L0zrLTUj7Fh3FCDpINmbu1trT/+JKH
	nwZlgkoYGbXW8wdPIsgv0GWHeqheoXIgtsGYnFTeORCe/gn453+heTsnU5515JS5c5Vr4H9olj3AF
	iEdIull8URNQ6eZ4ULY0J3iOM9qaVShd1rLd2rX+1G+gcdHwVvmiOmStmR7rtV5J77ZXDaOcMKRbK
	PrX6Y+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLauV-008EUe-B2; Wed, 10 Aug 2022 01:53:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLauF-008ENp-IZ; Wed, 10 Aug 2022 01:53:14 +0000
X-UUID: c7f47c51fc24475b939ceb0f46d1d4dc-20220809
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:a73703c7-bb1b-4411-8eb8-3b846f546b3d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:d24e389c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c7f47c51fc24475b939ceb0f46d1d4dc-20220809
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 280170358; Tue, 09 Aug 2022 18:53:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 10 Aug 2022 09:51:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 10 Aug 2022 09:51:32 +0800
Message-ID: <1238beb0a140a0987b8fdda6e7bbadfbb2415ed4.camel@mediatek.com>
Subject: Re: [PATCH v5 02/20] dt-bindings: memory: mediatek: Update
 condition for mt8195 smi node
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 10 Aug 2022 09:51:32 +0800
In-Reply-To: <20220809135312.hadcs7ti2cgyyuez@notapiano>
References: <20220804021553.14867-1-tinghan.shen@mediatek.com>
	 <20220804021553.14867-3-tinghan.shen@mediatek.com>
	 <96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org>
	 <6a1977971317059fcfad685869b6ccf233edcb68.camel@mediatek.com>
	 <20220809135312.hadcs7ti2cgyyuez@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_185311_626270_7FA58FBD 
X-CRM114-Status: GOOD (  18.63  )
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

On Tue, 2022-08-09 at 09:53 -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Aug 09, 2022 at 07:01:10PM +0800, Tinghan Shen wrote:
> > Hi Krzysztof,
> > 
> > On Thu, 2022-08-04 at 17:12 +0200, Krzysztof Kozlowski wrote:
> > > On 04/08/2022 04:15, Tinghan Shen wrote:
> > > > 
> > > > It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
> > > > matches the 'else' conditions for gen2 HW without gals.
> > > > 
> > > > Rewrite the 'else' condition to specifically identify the compatibles
> > > > that utilizing gen2 HW without gals.
> > > > 
> > > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > > Reviewed-by: AngeloGioacchino Del Regno
> > > >  <angelogioacchino.delregno@collabora.com>
> > > 
> > > Unfortunately, your patches got corrupted.
> > > 
> > > 
> > > Best regards,
> > > Krzysztof
> > 
> > Do you mean rebase to the latest linux-next?
> > I'll rebase in the next version, thanks!
> 
> Hi TingHan,
> 
> the issue is that some line wrapping happened on your patches, which broke tags
> and also the diffs themselves (it's very obvious on patch 3). So you need to
> sort out your setup so that no longer happens, and resend the patch.
> 
> Thanks,
> Nícolas

I see. I'll send the next version after fix the weired wrapping...
Thank you.


Best regards,
TingHan



