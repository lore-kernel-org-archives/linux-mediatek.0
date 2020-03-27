Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39183C2D0E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 08:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E48A20714
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 08:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FaVpBi8k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LA9Fq6az"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E48A20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty5umsRUjevLDQqXhgXx4akHyZH7MkVxNLfde8p714o=; b=FaVpBi8k3mqj95
	KYF0BGWSPl1HRKOkFDBPK8HxS+nU0/zo9PSxsifF2y5JBWCtLIOg8UV2dJYNJ3AQlQ+xXn28bwlbN
	NWKGp4oG1C3KNT2sg4aRfR6O+IWl4LmNMGJ/i7COUf7uqaoGLoA1B3+B+omXmuSr6cWDt9kTlJILH
	lSxqcLS35t55LZUkYsQxY+BSuLJmoGdRLY7tuIuv2O9PrfJAYzJYKcTcMs7lsZs3DtiR6rW+or43S
	GqWUPtISdfh1Kg+2byLY5tNTXmax2upOvqHX/Ysp0LxDITg8Wo6SYSq3zPBsqYEkLb1zJaE9KvGx/
	HLzN2+/eH2anYDDJWhgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHkcq-00051i-Ps; Fri, 27 Mar 2020 08:46:00 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHkcn-000513-NM
 for linux-mediatek@lists.infradead.org; Fri, 27 Mar 2020 08:45:59 +0000
Received: by mail-wm1-x344.google.com with SMTP id d1so11384567wmb.2
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2020 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TNtHMrBw1/kFRLyWRQzpEzTGkiODbvLoqCcIATUetSQ=;
 b=LA9Fq6azF2+zSralszTxVY7JqxhxxsiaZb2AoDbfkRN0R3N0rkQgFTS6aGvtGchHSq
 rGvKFw+0Zf8fHrmkahk4/6T3g1thDq3mnNR/aO4WyAvZYh3EhZOwiAs8p3je9NR8FqeH
 eugcdMHplFlkKr3XiGbHLTK0T3hIfOEt+M/NTlQcdTGw8Rk0VoMHKlmiiWpqbHbPcwXo
 /ZOo3it+BOseqw84us4p+ubVuYX1XIJtpj38y1kZV/AK6AlqlYX+UUjX4wUuMn0B1uTO
 jAxY7u+cIYL8ahbK3hSj8z04XrUqEAxtSPl8sMDrkuj2AVpubAi9PzGk62rHm7z/KdgE
 QErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TNtHMrBw1/kFRLyWRQzpEzTGkiODbvLoqCcIATUetSQ=;
 b=Ymo8rXHI20e7C2KIFiQ6QX48wHsNV6eR134o0wXj+qPFv2V8SNyYoyGM0Dm0uP0UAA
 fYF//jsYavjRI8WI19enqH+5B+FVkPcvexvgxlbY2Dyq4x3v+EuSnGSm5iNRgTj4FKOO
 R5bn7wlwD8KGI5e9sHdNa1t0vfrK9l3dGtFQscOZG2z/JJdgvv9NDS+UjJLvCkD+Rdrr
 crXlq+0QtQBn7Bz1QyMUFuwk0Gjdw6Adqolu0AqZjc/YmJDlB1heuPIu/i6abH/NLj44
 eD3qd6jZDhf69d0kjXvGthPXIgpTxhwpmgLi5sM4ta9r8BxH/dOHNnXwFAgLvlUdh6Yy
 kXtQ==
X-Gm-Message-State: ANhLgQ2vafqJHqchf2hz3kHy95umjOyG9Wq2w5ghp5sRmjY2aP3fhbGh
 PAoWX+WwN79CZha7ignpglxK6Q==
X-Google-Smtp-Source: ADFU+vsEaMqgmcJTryYU53r8BbWXb0EA3wBlWHalOBre6t/JUxmyfZ0AnP1+VitjwwucuGEimHxOZQ==
X-Received: by 2002:a1c:4987:: with SMTP id w129mr4498312wma.168.1585298755090; 
 Fri, 27 Mar 2020 01:45:55 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y187sm7437237wmd.0.2020.03.27.01.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 01:45:54 -0700 (PDT)
Date: Fri, 27 Mar 2020 09:45:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH v4 02/16] ACPI/IORT: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200327084546.GA4083132@myrica>
References: <20200326150841.10083-1-joro@8bytes.org>
 <20200326150841.10083-3-joro@8bytes.org>
 <82dea1be-4a2e-e914-c607-8aeb924eb36f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82dea1be-4a2e-e914-c607-8aeb924eb36f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_014557_783848_93292261 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Rob Clark <robdclark@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 27, 2020 at 11:30:53AM +0800, Hanjun Guo wrote:
> On 2020/3/26 23:08, Joerg Roedel wrote:
> > From: Joerg Roedel <jroedel@suse.de>
> > 
> > Use the accessor functions instead of directly dereferencing
> > dev->iommu_fwspec.
> > 
> > Tested-by: Hanjun Guo <guohanjun@huawei.com>
> > Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Joerg Roedel <jroedel@suse.de>
> > ---
> >  drivers/acpi/arm64/iort.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index ed3d2d1a7ae9..7d04424189df 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> > @@ -1015,6 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
> >  		return ops;
> >  
> >  	if (dev_is_pci(dev)) {
> > +		struct iommu_fwspec *fwspec;
> >  		struct pci_bus *bus = to_pci_dev(dev)->bus;
> >  		struct iort_pci_alias_info info = { .dev = dev };
> >  
> > @@ -1027,8 +1028,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
> >  		err = pci_for_each_dma_alias(to_pci_dev(dev),
> >  					     iort_pci_iommu_init, &info);
> 
> ...
> 
> >  
> > -		if (!err && iort_pci_rc_supports_ats(node))
> > -			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> > +		fwspec = dev_iommu_fwspec_get(dev);
> > +		if (fwspec && iort_pci_rc_supports_ats(node))
> 
> Should we check !err as well?

No need, the check should have been on fwspec from the beginning. Checking
err was just a lazy shortcut on my part, as we're really just making sure
that we can dereference fwspec->flags here.

Thanks,
Jean

> 
> Thanks
> Hanjun
> 
> > +			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> >  	} else {
> >  		int i = 0;
> >  
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
