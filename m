Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B234C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 03:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2EA06120D
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 03:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2EA06120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xw0WKzqpW0BhXDi0uuKa1XbndKVsV8U7eCWfCNWNwZc=; b=pTGRy/+XzCJgqv
	NZKOb50TM5MM/GnI7A3EwBOF0dZV2brWzkxOZbaylG9U7pXQ+aM7dFdYYM2/wTULCWb/pQA5eR2Vx
	KSh08fhqs4pjUIV3z0ihYb+ZGqC+62PkxQm/5uBqvfk8qhHfEd6AZvM+qnunMp11M1+b38KJOknfl
	jNqFB+rrdD9yBmK15xd3VxBqlK+8pXF3BmKacFshidrbwhsVShChDaPgpKB09Qk4GS+PxjFcoEzUP
	pTltDj0vZn1EZ0kbF0STX0V85q3aKkYb9R39DIelwdSN/VYR91/iz1LanfK9+qluxD7H57tMz6npW
	WqqFLial/TKiPFMO9oag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYJnc-00G3HL-4y; Thu, 07 Oct 2021 03:10:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYJnZ-00G3Gp-2I; Thu, 07 Oct 2021 03:10:22 +0000
X-UUID: a293ecc73fd247ad85885aacfe0c747c-20211006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JFzGo/WxNZB+Ws19Df4O4JzpkbbM9zmDRpzU+60snW8=; 
 b=P1WfJPTiCRORPrzv8PKqLG5Bb7JH3+uSwGUZed8BBYmRP8W93XyN9WGWHmPo5PaFC5CphRlOsVxCBMOKwQS4fBuXLdwhumhYPeDUT2rBwI/ypfmGzZP77pAi6yEAgtMCeNhkQ3UfgAP2/BkzOY0OGhKo1w8rENFZwBKCXSJx3mc=;
X-UUID: a293ecc73fd247ad85885aacfe0c747c-20211006
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 113419706; Wed, 06 Oct 2021 20:10:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Oct 2021 20:00:18 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 7 Oct 2021 11:00:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Oct 2021 11:00:15 +0800
Message-ID: <111c6f3905f4349e6e30cde60bdc70672ee036b3.camel@mediatek.com>
Subject: Re: [PATCH v2 11/29] iommu/mediatek: Always pm_runtime_get while
 tlb flush
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Joerg Roedel
 <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>
Date: Thu, 7 Oct 2021 11:00:19 +0800
In-Reply-To: <11fe281d-4873-245b-f506-452900f33d3b@collabora.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
 <20210813065324.29220-12-yong.wu@mediatek.com>
 <11fe281d-4873-245b-f506-452900f33d3b@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_201021_165632_54515964 
X-CRM114-Status: GOOD (  31.16  )
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

On Thu, 2021-09-30 at 13:26 +0200, Dafna Hirschfeld wrote:
> 
> On 13.08.21 08:53, Yong Wu wrote:
> > Prepare for 2 HWs that sharing pgtable in different power-domains.
> > 
> > The previous SoC don't have PM. Only mt8192 has power-domain,
> > and it is display's power-domain which nearly always is enabled.
> 
> hi, I see that in mt1873.dtsi, many devices that uses the iommu have
> the
> 'power-domains' property.

Sorry, I didn't clarify this clear. I mean the iommu device don't have
this property rather than the other device.

> 
> > 
> > When there are 2 M4U HWs, it may has problem.
> > In this function, we get the pm_status via the m4u dev, but it
> > don't
> > reflect the real power-domain status of the HW since there may be
> > other
> > HW also use that power-domain.
> > 
> > Currently we could not get the real power-domain status, thus
> > always
> > pm_runtime_get here.
> > 
> > Prepare for mt8195, thus, no need fix tags here.
> > 
> > This patch may drop the performance, we expect the user could
> > pm_runtime_get_sync before dma_alloc_attrs which need tlb ops.
> > 
> 
> Could you explain this sentence a bit? should the user call
> pm_runtime_get_sync
> before calling dma_alloc_attrs?

In v3, I have removed this patch. Use [1] instead.

[1] 
https://lore.kernel.org/linux-mediatek/20210923115840.17813-13-yong.wu@mediatek.com/

Thanks.

> 
> Thanks,
> Dafna
> 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index add23a36a5e2..abc721a1da21 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -238,8 +238,11 @@ static void
> > mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> >   
> >   	for_each_m4u(data, head) {
> >   		if (has_pm) {
> > -			if (pm_runtime_get_if_in_use(data->dev) <= 0)
> > +			ret = pm_runtime_resume_and_get(data->dev);
> > +			if (ret < 0) {
> > +				dev_err(data->dev, "tlb flush: pm get
> > fail %d.\n", ret);
> >   				continue;
> > +			}
> >   		}
> >   
> >   		spin_lock_irqsave(&data->tlb_lock, flags);
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
