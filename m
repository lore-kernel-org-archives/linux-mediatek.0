Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E5BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 01:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c9H0CEkJF1e+Pq5M1oIVVNJiztrvRboz8nACrNsVyc=; b=DuuYuGsSn5eFlM5H7dpYs8kgpq
	l1Jel6tJcgUv4cavpsbW6rAuoOK26ayMAt5BWcwoa/EcPIfDUuqq0kYjopBUe2jPwxS1KAS/aumiK
	8gBfTVxEuckX4t6oBczXez4JzP8p1ExdH7CWEcVuvsuVh6Um/XO9P4omGXvziz6gfMxOqobsxGoSf
	sRluSgF5hkfVzGGRTzgv2tnAe/MT7FlKrcyTUcPPj64xdooBYU+WSCLIGjkhpG2a1Kv34P3iC6MBo
	76fgJw8Xj7/O3Tg1StwuSzOIy5Pl15/nz8IDyk4DyQA+zzi8wajVWtYZm5doiofNWUukZhB9+kB1S
	94WyjoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaS4U-00H0I4-AF; Tue, 20 Sep 2022 01:29:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaS4H-00H0GG-Ot; Tue, 20 Sep 2022 01:29:01 +0000
X-UUID: 950dd3fb6f8140f5a359c9c18412eab2-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4c9H0CEkJF1e+Pq5M1oIVVNJiztrvRboz8nACrNsVyc=;
	b=XFBwqprXU45p260aSZmL+TvlQRcl5rCwSqwUKpNm1stsI0ubn5Z2xjtsXu0lPUxCpo9sb9yFNBsrAEnHey9SLxb68CfebJvBSKJ6C+D3M0Y3qnCJ0WoPBF1e+9uUNN0YiYKqOHFjzH5EmJa6JT/CR4EpmDAooy34zhV1iaJCoSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e0ff660c-97d8-429f-be49-14745304c88e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:000c335e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 950dd3fb6f8140f5a359c9c18412eab2-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1410230860; Mon, 19 Sep 2022 18:28:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 09:28:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 09:28:38 +0800
Message-ID: <2111faa6541ad339d6b7ec07f63444a1fc512288.camel@mediatek.com>
Subject: Re: [PATCH v5 3/6] iommu/mediatek: Add error path for loop of
 mm_dts_parse
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Robin Murphy <robin.murphy@arm.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>, Joerg Roedel <joro@8bytes.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Date: Tue, 20 Sep 2022 09:28:38 +0800
In-Reply-To: <276a4a37-a98d-c59b-a967-db9f5b220077@collabora.com>
References: <20220919092405.8256-1-yong.wu@mediatek.com>
	 <20220919092405.8256-4-yong.wu@mediatek.com>
	 <276a4a37-a98d-c59b-a967-db9f5b220077@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_182858_717564_928A10BD 
X-CRM114-Status: GOOD (  18.70  )
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

On Mon, 2022-09-19 at 16:20 +0200, AngeloGioacchino Del Regno wrote:
> Il 19/09/22 11:24, Yong Wu ha scritto:
> > The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the
> > i+1
> > larb is parsed fail, we should put_device for the 0..i larbs.
> 
> If any v6 will be required... you forgot to update the commit
> description with
> "we should put_device for the i..0 larbs".

oh. Thanks for reviewing so carefully. I will send a quick v6 to fix
this.

> 
> > 
> > There are two places need to comment:
> > 1) The larbid may be not linear mapping, we should loop whole
> >     the array in the error path.
> > 2) I move this line position: "data->larb_imu[id].dev = &plarbdev-
> > >dev;"
> >     before "if (!plarbdev->dev.driver)", That means set
> >     data->larb_imu[id].dev before the error path. then we don't
> > need
> >     "platform_device_put(plarbdev)" again in probe_defer case. All
> > depend
> >     on "put_device" of the error path in error cases.
> > 
> > Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with
> > the MM TYPE")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> In any case....
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Thanks very much:)

> 
> 
> 


