Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E83C0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:40:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23FA720663
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ePhTgsk8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w84O1QQJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23FA720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFiR0LMSbaIwWaCeJMY8fWy+KdXnXjtg1dacg5wlbDA=; b=ePhTgsk813TmsY
	y8nSDB+RuCcBfPD/5hyAHv58MkLUfbp6M4lXsoan2xcZ5CgJX0j3eboRCOhRmCTrQGW2HMNo+2vqU
	1jZ7V3wWAFAb22tclAulS3CPG9B6Acaz5yYXU88qa+2IFr1c7LvdL3N3YGdf95SnI3sp7jLlThEYM
	5XtW5lOQWiOnJ4pAhz5sPQcy6Lwt7+M+MsC02a5UPZueF9hLnbx4Y11p61MQ6lPXPe9DZi6/8BS3u
	z3p8+gCJApKEcQ090ki7s8ewrxkG5ms+C+qxrd6Q3neR+ZiWBDzfIhYlnv4gxQBxIdKMY/e9bxUzZ
	pmOFXTw2UTpruuIv/EeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDrql-0007rt-Ow; Mon, 16 Mar 2020 15:40:19 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDrqj-0007r6-7b
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:40:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id h6so1489193wrs.6
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vJQ7s9x85ia8HxlMYprwaZJGn4L6RP+BR7+jWVKPLTo=;
 b=w84O1QQJwU6wMTGEhyd3tdZmzyokkNQNgtvlgCbk7JrgRg0w2R3EtdUzes5TKo/XyE
 0GN9BzerCd+PBe2gdX+VVWalWV0GvUaZ1Hvpn02xC7Z6cQbZ9zUYoVR8SlrMkeTHa5pO
 ZNV7G4zwVtMQAtwNFVsP7G9rAugODJUvegfg+Joz2/pLSwTVFLeBdLC69Mm9fmsFaT0H
 4lQ985eQTWmn73BDP/WhhWDXVBZBfC45ZHQLQxe35G5uOfpUGYH7dFLUTw7I6qKsVqm6
 VCf79+8VBzgdX46YQ4mkH13lYwMdQrGC6Ai/EhOinV88dF/tVd63mOiTbTus//PTo1AD
 eHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vJQ7s9x85ia8HxlMYprwaZJGn4L6RP+BR7+jWVKPLTo=;
 b=gwy2nu28hESB8xPYSkr75Q53pvrrW508Sz/pBLjXMFbd0/NQqbaSilIfnsOsEfPPyx
 4Fxt5fZhod/jMIIZvHCKt796je0mxIrQHSon5h6ICQGvesKo3dwk49TDsWGLed9o6BC9
 urv5r1YEpR4oVSR49srLDrdioNn+sA2pQiXwYUHomi1EjjJR/4nfXj1XMEv+wvJeJU9Z
 R+Xgsxy6Au+T4h8JdbNeI0zZoyf6pLAWox1Z3962WHARO2nmbqE+wt+p/T1o+buz5a6O
 bljXQ2GZburPyBVBoNlt94mewuygz3I/NJahKVtgYc7ATARg6UTgueVC38zYYWJ1RBG8
 1APw==
X-Gm-Message-State: ANhLgQ3N6WT3cKkQeqnTnRR63Alj06xtsr4efLYqlEAM+n9qz1Hhj1d9
 Qp0W/YinXR5+WvgfVHLApW2Auw==
X-Google-Smtp-Source: ADFU+vu5RlEmmjxd74oFX3RvJEdQFPOMmKqi/N4OkXyJVDSx1NxqeLTrLEHwet7QRQD2B1qytUrz8w==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr29213545wrs.119.1584373212032; 
 Mon, 16 Mar 2020 08:40:12 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u17sm393519wrm.43.2020.03.16.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:40:11 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:40:03 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 02/15] ACPI/IORT: Remove direct access of dev->iommu_fwspec
Message-ID: <20200316154003.GC304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-3-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-3-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_084017_272890_6743B4FC 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Hanjun Guo <guohanjun@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 10:12:16AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Tested-by: Hanjun Guo <guohanjun@huawei.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/acpi/arm64/iort.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index ed3d2d1a7ae9..7d04424189df 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1015,6 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		return ops;
>  
>  	if (dev_is_pci(dev)) {
> +		struct iommu_fwspec *fwspec;
>  		struct pci_bus *bus = to_pci_dev(dev)->bus;
>  		struct iort_pci_alias_info info = { .dev = dev };
>  
> @@ -1027,8 +1028,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		err = pci_for_each_dma_alias(to_pci_dev(dev),
>  					     iort_pci_iommu_init, &info);
>  
> -		if (!err && iort_pci_rc_supports_ats(node))
> -			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> +		fwspec = dev_iommu_fwspec_get(dev);
> +		if (fwspec && iort_pci_rc_supports_ats(node))
> +			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
>  	} else {
>  		int i = 0;
>  
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
