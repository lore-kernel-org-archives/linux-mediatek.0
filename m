Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DE7C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 07:57:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F546206B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 07:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NNh6SaeA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gV7r4GX5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F546206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDvAoU6YkU2QkvJXAVyQJRlyVtm89DHQc1mHFksYg5w=; b=NNh6SaeAaEop/9
	sFk96ApAMyyYLPdnofGYOV0SL4DAuqB/oPJqwbdYXoe6uyQQgLDR1rVaAVTITJS/Eq6Rk/Z8mGBPk
	BODl/y+aUQ7wKBqV8Zf6YwXPMyX6Y8idSqh3snHKDBDQx71dnRNn+ZK7vmaFm7gxX4tlIYrY4paIB
	qxsZ7AxC6EHycGE9hB9zTWhC53d32x3wl6/Z2XuRSFHEot6uKwJxDddICJMZUUr6JV28pPsRbgLv1
	S2tAB8J2s8BKOd8kThqTnMcfdKFhy92HMY6Ka8LosywgFFyPwOZIq5MiVIfR6FkBRgPT6JCripjMZ
	ucPAgsUyBvEIBchB1bdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZVDa-0008PN-OO; Fri, 15 May 2020 07:57:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZVDV-0008On-KJ
 for linux-mediatek@lists.infradead.org; Fri, 15 May 2020 07:57:17 +0000
X-UUID: c08fbdc520cc47cca20b95bd15a64a77-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2U0lk+3AOLEFSBOQ1vgqYzwMDxMh7x/MPGzDHrIVnCI=; 
 b=gV7r4GX5db/Kby+wDws5V6XcdN5AwVbFjn8Q39lVn/E2p3hWYh0Ep8kYWnYgJ54LErwzbUc20+MVv91XRHMQjkRIVIZiUi8PtVzGs94nav9SCQKzUqKZkjGUeghTkhFPLPw+oNZeMCqeAT7NxGq3gwa8vKGOKY0Psy8PnEj77I4=;
X-UUID: c08fbdc520cc47cca20b95bd15a64a77-20200514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 392373302; Thu, 14 May 2020 23:57:17 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 00:46:39 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 May 2020 15:46:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 May 2020 15:46:18 +0800
Message-ID: <1589528699.26119.9.camel@mhfsdcap03>
Subject: Re: [PATCH v2 23/33] iommu/mediatek-v1 Convert to
 probe/release_device() call-backs
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Fri, 15 May 2020 15:44:59 +0800
In-Reply-To: <20200414131542.25608-24-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200414131542.25608-24-joro@8bytes.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC9F0778244307DCB8C3501248E21D926B064F0B379D3F613D6C01BFC66E127F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_005713_674463_AA2036D0 
X-CRM114-Status: GOOD (  18.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-14 at 15:15 +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Convert the Mediatek-v1 IOMMU driver to use the probe_device() and
> release_device() call-backs of iommu_ops, so that the iommu core code
> does the group and sysfs setup.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/mtk_iommu_v1.c | 50 +++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index a31be05601c9..7bdd74c7cb9f 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -416,14 +416,12 @@ static int mtk_iommu_create_mapping(struct device *dev,
>  	return 0;
>  }
>  
> -static int mtk_iommu_add_device(struct device *dev)
> +static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>  {
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct dma_iommu_mapping *mtk_mapping;
>  	struct of_phandle_args iommu_spec;
>  	struct of_phandle_iterator it;
>  	struct mtk_iommu_data *data;
> -	struct iommu_group *group;
>  	int err;
>  
>  	of_for_each_phandle(&it, err, dev->of_node, "iommus",
> @@ -442,35 +440,28 @@ static int mtk_iommu_add_device(struct device *dev)
>  	}
>  
>  	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
> -		return -ENODEV; /* Not a iommu client device */
> +		return ERR_PTR(-ENODEV); /* Not a iommu client device */
>  
> -	/*
> -	 * This is a short-term bodge because the ARM DMA code doesn't
> -	 * understand multi-device groups, but we have to call into it
> -	 * successfully (and not just rely on a normal IOMMU API attach
> -	 * here) in order to set the correct DMA API ops on @dev.
> -	 */
> -	group = iommu_group_alloc();
> -	if (IS_ERR(group))
> -		return PTR_ERR(group);
> +	data = dev_iommu_priv_get(dev);
>  
> -	err = iommu_group_add_device(group, dev);
> -	iommu_group_put(group);
> -	if (err)
> -		return err;
> +	return &data->iommu;
> +}
>  
> -	data = dev_iommu_priv_get(dev);
> +static void mtk_iommu_probe_finalize(struct device *dev)
> +{
> +	struct dma_iommu_mapping *mtk_mapping;
> +	struct mtk_iommu_data *data;
> +	int err;
> +
> +	data        = dev_iommu_priv_get(dev);
>  	mtk_mapping = data->dev->archdata.iommu;
> -	err = arm_iommu_attach_device(dev, mtk_mapping);
> -	if (err) {
> -		iommu_group_remove_device(dev);
> -		return err;
> -	}
>  
> -	return iommu_device_link(&data->iommu, dev);
> +	err = arm_iommu_attach_device(dev, mtk_mapping);
> +	if (err)
> +		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");


Hi Joerg,

     Thanks very much for this patch.

     This arm_iommu_attach_device is called just as we expected.

     But it will fail in this callstack as the group->mutex was tried to
be re-locked...

[<c0938e8c>] (iommu_attach_device) from [<c0317590>]
(__arm_iommu_attach_device+0x34/0x90)
[<c0317590>] (__arm_iommu_attach_device) from [<c03175f8>]
(arm_iommu_attach_device+0xc/0x20)
[<c03175f8>] (arm_iommu_attach_device) from [<c09432cc>]
(mtk_iommu_probe_finalize+0x34/0x50)
[<c09432cc>] (mtk_iommu_probe_finalize) from [<c093a8ac>]
(bus_iommu_probe+0x2a8/0x2c4)
[<c093a8ac>] (bus_iommu_probe) from [<c093a950>] (bus_set_iommu
+0x88/0xd4)
[<c093a950>] (bus_set_iommu) from [<c0943c74>] (mtk_iommu_probe
+0x2f8/0x364)


>  }
>  
> -static void mtk_iommu_remove_device(struct device *dev)
> +static void mtk_iommu_release_device(struct device *dev)
>  {
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct mtk_iommu_data *data;
> @@ -479,9 +470,6 @@ static void mtk_iommu_remove_device(struct device *dev)
>  		return;
>  
>  	data = dev_iommu_priv_get(dev);
> -	iommu_device_unlink(&data->iommu, dev);
> -
> -	iommu_group_remove_device(dev);
>  	iommu_fwspec_free(dev);
>  }
>  
> @@ -534,8 +522,10 @@ static const struct iommu_ops mtk_iommu_ops = {
>  	.map		= mtk_iommu_map,
>  	.unmap		= mtk_iommu_unmap,
>  	.iova_to_phys	= mtk_iommu_iova_to_phys,
> -	.add_device	= mtk_iommu_add_device,
> -	.remove_device	= mtk_iommu_remove_device,
> +	.probe_device	= mtk_iommu_probe_device,
> +	.probe_finalize = mtk_iommu_probe_finalize,
> +	.release_device	= mtk_iommu_release_device,
> +	.device_group	= generic_device_group,
>  	.pgsize_bitmap	= ~0UL << MT2701_IOMMU_PAGE_SHIFT,
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
