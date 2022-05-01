Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF04C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 02:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLGlhDEUjiHAvqnix1WcTEgi+EYrRcdSupxXQ+3MRSY=; b=nPXgZe6mDkzecc
	yN9Ol4mqZ86dy9GyIFwFy16c/ZAIB4kaXGFDVI8xbxtDhfK1ucKON5nue/ZSS7b1O4AvBAKUOLz1Q
	pw1zlvH8ONY+R5yaHLchGqkStg+F+TUv7KcLbrfRBZjuStA1otRp66+cT7ly2sPWXsDsDBUMYySCu
	fRGWam1rfXVglluTeTaynJO0TJbxtRoPP69NXvDVm9FicsVMmwn38iT2ZhsXdmR5WU1iRyPc9si3D
	L8L6Cc7Fd0Il4wJgqBLdZftaJariMzJR9CFSiXoxLowlYheILayszsBB8y5STm5dX3LXcYjdbSUtO
	nlWe8AwCV8+4sLCZAfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkzYp-00FTSn-AA; Sun, 01 May 2022 02:43:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkzYm-00FTSB-As; Sun, 01 May 2022 02:43:46 +0000
X-UUID: 97d8fb88ccbf49a0916250ac2906c031-20220430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hhGuQomVYDUi1VdYrSPtN2QPxGvaOYtGiDmJ5bUN20Y=; 
 b=sH1cdMyN6h08WgKQ3mPKIXqQil300VjeJut3DtY6v1bU33FQswL2Yr3/VF0+z9x7CSK65ru/6E55WnD4qh7qtRqPCo9oM1VoGtniG4Ku6jvDETq6SYqEm4W+4LGOuJDQAXT5jk56LBgFyB34bxk6k/tEhY2q/PyX5wAHlekRIgM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:788a1205-c420-498d-8b5a-2a6d8b4c600e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:1bf84c2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 97d8fb88ccbf49a0916250ac2906c031-20220430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 667797403; Sat, 30 Apr 2022 19:43:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Apr 2022 19:33:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 1 May 2022 10:33:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 1 May 2022 10:33:30 +0800
Message-ID: <7a1dd83d191a843b0e4276bcf1790b697d2deebd.camel@mediatek.com>
Subject: Re: [PATCH v6 31/34] iommu/mediatek: Get the proper bankid for
 multi banks
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>,
 <yen-chang.chen@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
 <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>
Date: Sun, 1 May 2022 10:33:30 +0800
In-Reply-To: <cc7cc7a8-c7a2-56a1-47bf-6c553c200b33@gmail.com>
References: <20220407075726.17771-1-yong.wu@mediatek.com>
 <20220407075726.17771-32-yong.wu@mediatek.com>
 <cc7cc7a8-c7a2-56a1-47bf-6c553c200b33@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_194344_430210_2148C838 
X-CRM114-Status: GOOD (  30.18  )
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

Hi Matthias,

Thanks very much for reviewing.

On Thu, 2022-04-28 at 16:14 +0200, Matthias Brugger wrote:
> 
> On 07/04/2022 09:57, Yong Wu wrote:
> > We preassign some ports in a special bank via the new defined
> > banks_portmsk. Put it in the plat_data means it is not expected to
> > be
> > adjusted dynamically.
> > 
> > If the iommu id in the iommu consumer's dtsi node is inside this
> > banks_portmsk, then we switch it to this special iommu bank, and
> > initialise the IOMMU bank HW.
> > 
> > Each a bank has the independent pgtable(4GB iova range). Each a
> > bank
> > is a independent iommu domain/group. Currently we don't separate
> > different
> > iova ranges inside a bank.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 39
> > ++++++++++++++++++++++++++++++++++++---
> >   1 file changed, 36 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 0828cff97625..d42b3d35a36e 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c

[snip]

> > @@ -802,6 +828,7 @@ static struct iommu_group
> > *mtk_iommu_device_group(struct device *dev)
> >   	struct mtk_iommu_data *c_data = dev_iommu_priv_get(dev), *data;
> >   	struct list_head *hw_list = c_data->hw_list;
> >   	struct iommu_group *group;
> > +	unsigned int bankid, groupid;
> >   	int regionid;
> >   
> >   	data = mtk_iommu_get_frst_data(hw_list);
> > @@ -812,12 +839,18 @@ static struct iommu_group
> > *mtk_iommu_device_group(struct device *dev)
> >   	if (regionid < 0)
> >   		return ERR_PTR(regionid);
> >   
> > +	bankid = mtk_iommu_get_bank_id(dev, data->plat_data);
> 
> I think code readability would be improved if we add a new function
> like 
> mtk_iommu_get_id which call mtk_iommu_get_bankid and if necessary 
> mtk_iommu_get_regionid.

OK, I will define a new function, like mtk_iommu_get_group_id for the
readability.

> 
> >   	mutex_lock(&data->mutex);
> > -	group = data->m4u_group[regionid];
> > +	/*
> > +	 * If the bank function is enabled, each a bank is a iommu
> > group/domain.
> > +	 * otherwise, each a iova region is a iommu group/domain.
> 
> While at it:
> "If the bank function is enabled, each bank is a iommu group/domain.
> Otherwise, 
> each iova region is a iommu group/domain."

And move this comment into the new funtion.

Also of course, I will fix the other two comments and send v7.

Thanks.

> 
> Regards,
> Matthias
> 
> > +	 */
> > +	groupid = bankid ? bankid : regionid;
> > +	group = data->m4u_group[groupid];
> >   	if (!group) {
> >   		group = iommu_group_alloc();
> >   		if (!IS_ERR(group))
> > -			data->m4u_group[regionid] = group;
> > +			data->m4u_group[groupid] = group;
> >   	} else {
> >   		iommu_group_ref_get(group);
> >   	}
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
