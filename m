Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E88C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:16:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DE8613B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DE8613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aylAHRQd1An9QrmJIA+TGSsQhJ7YZ5IFHLAtmbrkIV4=; b=ECPIPXvfTheI3h
	onrLWPTain7l4G2BsmtUAl0SGFe/BjL+xn8XNdSMRDFXwiYvhVUDX9wXd5txWt9gptfzJhy5ebctQ
	4N5LNrAVDIgVVBq6gS1JuXYJf3w1SDC290bO/e0vlWGHlmWuHlwqX6bmsmF18aSYgUmYgK5CS2kT9
	vFjQI6Gn7Gr8fulv7JjkmUw0gazOeJC/r4KzjEFQ3s3T5zitv4OpRD1s/HKY8LdG6Nh00fDS1cy3c
	paZmWiDINukjj5kWRdxuO2UdgeY+Qwj/YzJtq5ZnvWYANODN3PSiyZU0ANLCwdydLeeUTDo5aGgmI
	Oc0xsi2/81zvtghQappw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3csh-00DJ6c-7h; Wed, 14 Jul 2021 11:16:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3csT-00DJ4w-5k; Wed, 14 Jul 2021 11:16:35 +0000
X-UUID: c2ba5f4048d542fb9a0bd63a22481066-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=I1AIYOviiCLaz5bYm8DUlQalApcOd6QrzCO//5CMBTY=; 
 b=UUMwI2Hva5KkyXmeriU15MNBrIen2YFbKTGgkaBSuSwND0V78KIHWcEZ4lAF7QxG7LZpiTK6RPsP/t4SjCujN6FePpkRSKSfmI3cpcYxxOAsih/fYHDXu6RZBY6lsYF3L3ai9LGYpJxIIOWJB1wPDj1yf83PFEnwybxLNBcq8Do=;
X-UUID: c2ba5f4048d542fb9a0bd63a22481066-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 427707463; Wed, 14 Jul 2021 04:16:31 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:16:29 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 19:16:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:16:24 +0800
Message-ID: <1626261384.14352.13.camel@mhfsdcap03>
Subject: Re: [PATCH v6 03/11] iommu/mediatek: Add device_link between the
 consumer and the larb devices
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Evan Green <evgreen@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>, "Will
 Deacon" <will.deacon@arm.com>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Eizan
 Miyamoto" <eizan@chromium.org>, <anthony.huang@mediatek.com>
Date: Wed, 14 Jul 2021 19:16:24 +0800
In-Reply-To: <f7b2c5e5-f540-b885-f063-9611031035bc@collabora.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-4-yong.wu@mediatek.com>
 <f7b2c5e5-f540-b885-f063-9611031035bc@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0F41A4D2E10A0920DEDC22C00094324303009B46911208F4D64AC685FD3491552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_041633_271698_640240F2 
X-CRM114-Status: GOOD (  36.50  )
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

On Wed, 2021-07-14 at 10:26 +0200, Dafna Hirschfeld wrote:
> 
> On 14.07.21 04:56, Yong Wu wrote:
> > MediaTek IOMMU-SMI diagram is like below. all the consumer connect with
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
> > When the consumer works, it should enable the smi-larb's power which
> > also need enable the smi-common's power firstly.
> > 
> > Thus, First of all, use the device link connect the consumer and the
> > smi-larbs. then add device link between the smi-larb and smi-common.
> > 
> > This patch adds device_link between the consumer and the larbs.
> > 
> > When device_link_add, I add the flag DL_FLAG_STATELESS to avoid calling
> > pm_runtime_xx to keep the original status of clocks. It can avoid two
> > issues:
> > 1) Display HW show fastlogo abnormally reported in [1]. At the beggining,
> > all the clocks are enabled before entering kernel, but the clocks for
> > display HW(always in larb0) will be gated after clk_enable and clk_disable
> > called from device_link_add(->pm_runtime_resume) and rpm_idle. The clock
> > operation happened before display driver probe. At that time, the display
> > HW will be abnormal.
> > 
> > 2) A deadlock issue reported in [2]. Use DL_FLAG_STATELESS to skip
> > pm_runtime_xx to avoid the deadlock.
> > 
> > Corresponding, DL_FLAG_AUTOREMOVE_CONSUMER can't be added, then
> > device_link_removed should be added explicitly.
> > 
> > [1] https://lore.kernel.org/linux-mediatek/1564213888.22908.4.camel@mhfsdcap03/
> > [2] https://lore.kernel.org/patchwork/patch/1086569/
> > 
> > Suggested-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c    | 22 ++++++++++++++++++++++
> >   drivers/iommu/mtk_iommu_v1.c | 20 +++++++++++++++++++-
> >   2 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index a02dde094788..ee742900cf4b 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -571,22 +571,44 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
> >   {
> >   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >   	struct mtk_iommu_data *data;
> > +	struct device_link *link;
> > +	struct device *larbdev;
> > +	unsigned int larbid;
> >   
> >   	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
> >   		return ERR_PTR(-ENODEV); /* Not a iommu client device */
> >   
> >   	data = dev_iommu_priv_get(dev);
> >   
> > +	/*
> > +	 * Link the consumer device with the smi-larb device(supplier)
> > +	 * The device in each a larb is a independent HW. thus only link
> > +	 * one larb here.
> > +	 */
> > +	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
> > +	larbdev = data->larb_imu[larbid].dev;
> > +	link = device_link_add(dev, larbdev,
> > +			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> > +	if (!link)
> > +		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
> shoudn't ERR_PTR be returned in case of failure?

In the previous design, this is not a fatal error. the consumer device
could probe continuously even though it fail here..Returning here may
let the issue be caught earlier, I will add this in next version.

 if (!link) {
      ...
      return ERR_PTR(EINVAL);
  }

> 
> Thanks,
> Dafna
> 
> >   	return &data->iommu;
> >   }
> >   
> >   static void mtk_iommu_release_device(struct device *dev)
> >   {
> >   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > +	struct mtk_iommu_data *data;
> > +	struct device *larbdev;
> > +	unsigned int larbid;
> >   
> >   	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
> >   		return;
> >   
> > +	data = dev_iommu_priv_get(dev);
> > +	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
> > +	larbdev = data->larb_imu[larbid].dev;
> > +	device_link_remove(dev, larbdev);
> > +
> >   	iommu_fwspec_free(dev);
> >   }
> >   
> > diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> > index d9365a3d8dc9..d2a7c66b8239 100644
> > --- a/drivers/iommu/mtk_iommu_v1.c
> > +++ b/drivers/iommu/mtk_iommu_v1.c
> > @@ -424,7 +424,9 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
> >   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >   	struct of_phandle_args iommu_spec;
> >   	struct mtk_iommu_data *data;
> > -	int err, idx = 0;
> > +	int err, idx = 0, larbid;
> > +	struct device_link *link;
> > +	struct device *larbdev;
> >   
> >   	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
> >   					   "#iommu-cells",
> > @@ -445,6 +447,14 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
> >   
> >   	data = dev_iommu_priv_get(dev);
> >   
> > +	/* Link the consumer device with the smi-larb device(supplier) */
> > +	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
> > +	larbdev = data->larb_imu[larbid].dev;
> > +	link = device_link_add(dev, larbdev,
> > +			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> > +	if (!link)
> > +		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
> > +
> >   	return &data->iommu;
> >   }
> >   
> > @@ -465,10 +475,18 @@ static void mtk_iommu_probe_finalize(struct device *dev)
> >   static void mtk_iommu_release_device(struct device *dev)
> >   {
> >   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > +	struct mtk_iommu_data *data;
> > +	struct device *larbdev;
> > +	unsigned int larbid;
> >   
> >   	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
> >   		return;
> >   
> > +	data = dev_iommu_priv_get(dev);
> > +	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
> > +	larbdev = data->larb_imu[larbid].dev;
> > +	device_link_remove(dev, larbdev);
> > +
> >   	iommu_fwspec_free(dev);
> >   }
> >   
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
