Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78857ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkcihY9ABi04XqXVV22kyb/oL68WO+uzwQnvKJrjdU8=; b=4dNcmY48hElIWzeu3dGvsXlTnN
	iF5QmQxQY6hFqgbbKruog48LQt2kNyDHVCCMd3PQlxt34glGJaSm1fJrLTtoe6STjduB1u0t0Jdfm
	y6jX0jRmg3FzftIqxEJ3YAS1cXMWdjQFW9MJJujdrhkIGdQ+qYFDAGZUqEz4RuH7UOKbMcWJ71Nuj
	ZJUCwUkPdAdgO6cUrgvsTrjpGrFr48sBAFF5+zvWqGoeK9F97geI4JzOv2X+E4HpETJq1wS6kf1dE
	v0xy+hkOyv/60gCGffXSEmFE5nLkzY1M5KeLT3vk5w2lKE7R/wPce+E3jxumfo2hO85GwEfxc31js
	VSKd7xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVlbQ-001xGX-PJ; Wed, 07 Sep 2022 03:19:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVlb7-001x82-13; Wed, 07 Sep 2022 03:19:30 +0000
X-UUID: c566a0e39325401e821eefd611e6ae38-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VkcihY9ABi04XqXVV22kyb/oL68WO+uzwQnvKJrjdU8=;
	b=ibO1SJX8+yDFWg5f9V+JoYcmF8wLZyzTrHDL/tJHxJXvjF9QfxS/vTB1u6CPWB+IjaiHHu8/FzNg401qIYlhYHvk31ilPYKWX75kpCmm33oQZCzVua9bpsvgOHvnSxk17EWbvSJpItVTl/qC7w8xFN0otgL2Kk2GADiGGlCGAJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:38ea4518-817f-41af-b306-10fafb256656,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:0a03e656-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c566a0e39325401e821eefd611e6ae38-20220906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 859803432; Tue, 06 Sep 2022 20:08:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Sep 2022 11:08:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 7 Sep 2022 11:08:06 +0800
Message-ID: <c5eca9b0154adf5a201ab89f3a9fa120b4519d25.camel@mediatek.com>
Subject: Re: [PATCH v4 3/6] iommu/mediatek: Add error path for loop of
 mm_dts_parse
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, <iommu@lists.linux.dev>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>,
	<chengci.xu@mediatek.com>, <youlin.pei@mediatek.com>,
	<anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>, Guenter Roeck
	<groeck@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 7 Sep 2022 11:08:05 +0800
In-Reply-To: <f0cc5ea8-9fd8-dc77-e595-33973e315d28@collabora.com>
References: <20220824064306.21495-1-yong.wu@mediatek.com>
	 <20220824064306.21495-4-yong.wu@mediatek.com>
	 <f0cc5ea8-9fd8-dc77-e595-33973e315d28@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_201929_101140_C8DBB304 
X-CRM114-Status: GOOD (  27.50  )
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

On Tue, 2022-08-30 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
> Il 24/08/22 08:43, Yong Wu ha scritto:
> > The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the
> > i+1
> > larb is parsed fail, we should put_device for the 0..i larbs.
> > 
> > There are two places need to comment:
> > 1) The larbid may be not linear mapping, we should loop whole
> >     the array in the error path.
> > 2) I move this line position: "data->larb_imu[id].dev = &plarbdev-
> > >dev;"
> >     That means set data->larb_imu[id].dev before the error path.
> >     then we don't need "platform_device_put(plarbdev)" again while
> >     probe_defer case. All depend on "put_device" in the error path
> > in error
> >     cases.
> > 
> > Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with
> > the MM TYPE")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 42 ++++++++++++++++++++++++++++----
> > -------
> >   1 file changed, 30 insertions(+), 12 deletions(-)

[...]

> > +
> > +err_larbdev_put:
> > +	/* id may be not linear mapping, loop whole the array */
> > +	for (i = 0; i < MTK_LARB_NR_MAX; i++) {
> 
> Since there may be a case in which the mapping is linear and we're
> doing teardown,
> I think it would be sensible to loop the other way around instead,
> from
> MTK_LARB_NR_MAX to 0.

Thanks very much. I will change from MTK_LARB_NR_MAX to 0.

> 
> Everything else looks good to me.
> 
> Cheers,
> Angelo
> 
> > +		if (!data->larb_imu[i].dev)
> > +			continue;
> > +		put_device(data->larb_imu[i].dev);
> > +	}
> > +	return ret;
> >   }
> >   
> >   static int mtk_iommu_probe(struct platform_device *pdev)
> 
> 


