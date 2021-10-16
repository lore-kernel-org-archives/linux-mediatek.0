Return-Path: <SRS0=DtK5=PE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9396EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Oct 2021 02:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F7D611F0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Oct 2021 02:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50F7D611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt+3RjuI1JLnElz4+tILXzTvCF7JLaOEk5vTxEtpIUw=; b=kSuP9NErCFoO8M
	w1s7CgNqrswJA+ZeJEWhLzitVmBK2OeeFFQql22Az4xqYZ8xpdj7hFq00+bc+3410xLjQdPWxSoho
	15LkUFJN/yi1eD7CF2aQjR5+zWOFNnMwttvBIYrrexB2NRcHu84kpVseO2JpviV9MR+7qvEyc/3Tx
	/2KVqWn+uPW+I/Nc8Ag74ZEkD6/3pBsJJTIpwdpK6mUpkYFN+xQ8LiLZZwfRbWocVbRx9nCDDmeD4
	q5O5fhuq1pTn5FT13yUcPDD72fyqExj4rAfc/EoSm7F4of0kW0qI/8fRQtHaOz4eH/K8pHWD5KqAt
	NsHEtNqPh3hQGjCPIi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbZMc-009Xl2-G9; Sat, 16 Oct 2021 02:23:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbZME-009XdP-IA; Sat, 16 Oct 2021 02:23:36 +0000
X-UUID: 29fd93dd8af24c5ca81c28bdac2399d0-20211015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gpCAjs3PTP2pnFObJBoM1HpsrUqmuM8h33+4tQMr9Fg=; 
 b=f37Cri4kRTZnAg8vcCnQg3UJTmJ+wXWad9EI/peDZuGOd14fWPr96VujvlDDfYrxfTimhpVivvoVgZGg2Hm1ayFXlM14XZxF60gMtJ9zjcUJyv65OJSoGlgQfjzWuj6YrXmn7mM4vWYaXllHZNMnTYzutgaOOAtBG6Ttorzxbsw=;
X-UUID: 29fd93dd8af24c5ca81c28bdac2399d0-20211015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 656445652; Fri, 15 Oct 2021 19:23:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Oct 2021 19:23:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 16 Oct 2021 10:23:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Oct 2021 10:23:27 +0800
Message-ID: <e4c98036dd73b91b8352a162f80240171e2b3f0f.camel@mediatek.com>
Subject: Re: [PATCH v8 04/12] iommu/mediatek: Add device_link between the
 consumer and the larb devices
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>, <acourbot@chromium.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>
Date: Sat, 16 Oct 2021 10:23:27 +0800
In-Reply-To: <e00b92db-0562-27ca-2f96-1f03ff824988@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-5-yong.wu@mediatek.com>
 <e00b92db-0562-27ca-2f96-1f03ff824988@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_192334_642352_766F81FD 
X-CRM114-Status: GOOD (  36.07  )
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

On Mon, 2021-10-11 at 14:36 +0200, Dafna Hirschfeld wrote:
> 
> On 29.09.21 03:37, Yong Wu wrote:
> > MediaTek IOMMU-SMI diagram is like below. all the consumer connect
> > with
> > smi-larb, then connect with smi-common.
> > 
> >          M4U
> >           |
> >      smi-common
> >           |
> >    -------------
> >    |         |    ...
> >    |         |
> > larb1     larb2
> >    |         |
> > vdec       venc
> > 
> > When the consumer works, it should enable the smi-larb's power
> > which
> > also need enable the smi-common's power firstly.
> > 
> > Thus, First of all, use the device link connect the consumer and
> > the
> > smi-larbs. then add device link between the smi-larb and smi-
> > common.
> > 
> > This patch adds device_link between the consumer and the larbs.
> > 
> > When device_link_add, I add the flag DL_FLAG_STATELESS to avoid
> > calling
> > pm_runtime_xx to keep the original status of clocks. It can avoid
> > two
> > issues:
> > 1) Display HW show fastlogo abnormally reported in [1]. At the
> > beggining,
> > all the clocks are enabled before entering kernel, but the clocks
> > for
> > display HW(always in larb0) will be gated after clk_enable and
> > clk_disable
> > called from device_link_add(->pm_runtime_resume) and rpm_idle. The
> > clock
> > operation happened before display driver probe. At that time, the
> > display
> > HW will be abnormal.
> > 
> > 2) A deadlock issue reported in [2]. Use DL_FLAG_STATELESS to skip
> > pm_runtime_xx to avoid the deadlock.
> > 
> > Corresponding, DL_FLAG_AUTOREMOVE_CONSUMER can't be added, then
> > device_link_removed should be added explicitly.
> > 
> > [1] 
> > https://lore.kernel.org/linux-mediatek/1564213888.22908.4.camel@mhfsdcap03/
> > [2] https://lore.kernel.org/patchwork/patch/1086569/
> > 
> > Suggested-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-
> > R2/MT7623
> > ---
> >   drivers/iommu/mtk_iommu.c    | 22 ++++++++++++++++++++++
> >   drivers/iommu/mtk_iommu_v1.c | 20 +++++++++++++++++++-
> >   2 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index d5848f78a677..a2fa55899434 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -560,22 +560,44 @@ static struct iommu_device
> > *mtk_iommu_probe_device(struct device *dev)
> >   {
> >   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >   	struct mtk_iommu_data *data;
> > +	struct device_link *link;
> > +	struct device *larbdev;
> > +	unsigned int larbid;
> >   
> >   	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
> >   		return ERR_PTR(-ENODEV); /* Not a iommu client device
> > */
> >   
> >   	data = dev_iommu_priv_get(dev);
> >   
> > +	/*
> > +	 * Link the consumer device with the smi-larb device(supplier)
> > +	 * The device in each a larb is a independent HW. thus only
> > link
> > +	 * one larb here.
> > +	 */
> > +	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
> 
> so larbid is always the same for all the ids of a device? 

Yes. For me, each a dtsi node should represent a HW unit which can only
connect one larb.

> If so maybe it worth testing it and return error if this is not the
> case.

Thanks for the suggestion. This is very helpful. I did see someone put
the different larbs in one node. I will check this, and add return
EINVAL for this case.

> 
> Thanks,
> Dafna
 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
