Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6B2C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 10:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F12FD2070A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 10:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hIGflTn3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3e46LJj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F12FD2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTXNsWIS/Gof6OwE/B+RXK1EF9XKYU9gbgMK3+WiWN0=; b=hIGflTn3nC6U13
	hjYprr/++YwFGiZfbIbqaTjXOvHcaY/Z0SOlpyFCFY/15+0QcPJkSGYd7BvvQqsk/tHOlRg0yRWrl
	31sss4XRbYtaHQDfA0T+A9OgSCmpfAZKqg1UHWfGuXLpllsHBMeksOhRLlAJQ6YIFnjf4UeJgxpxy
	Slfy4Qn/FI2PwmJtvRYOx3yCBxiDxoDBV3I8cM1J7OGxALJvFTuVW3Mfa5EyPWPRUDw84YdrhV1hZ
	pfOwnsB0MFWO13PxHO3lOfRoTSBKkZpFPuW839Fh2yC17MAv5GToGGrRFD6E1fN+iLPGcsPhtzGcF
	fmtWQsxFhzJG1OGyrncA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA9vj-0004UJ-Jd; Fri, 06 Mar 2020 10:10:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA9vg-00047D-5t
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 10:10:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id m3so1731505wmi.0
 for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2020 02:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=og3sMPJN+Nb579KWuJJ61AJ7TUDj6TNf09RkDt7hsI8=;
 b=W3e46LJj5LqwGN7bmYVtalGehYEZNj3nHr/KAjP31KhaaXN+m0uWmMkf3acHKomptm
 89d0LyK/fwtGemR8XoQyJ0Ys/LcWeWGdlwW4CeVEEcaicTe2FKFajLwdJ5fOYlueg0Sl
 TK9CYNYdO7MxSrz07jDyQcWVpS506xMCbX+/TC3r/e8J6B1ZMT5UKVvra0iQbFiIzTGv
 115moqqHKTtOhYVG2HvcfiNX1TYPoAk1uZbA5LrtS1I/ItmZcZ3+3JYMcA9v6viTj0Yz
 eEAPwp4x5R0wWQQAwxCEk2yzvnV5bNaOC/JH7GsT7wADh0zmXAuNdX6IGcE4tUIHjkXg
 jtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=og3sMPJN+Nb579KWuJJ61AJ7TUDj6TNf09RkDt7hsI8=;
 b=O8jrk0i04huQvm4XBaS8of9SEaaEiIl/Iz/DMJCIstqLDR3NvMAaCn+4+QVI8ZpTVb
 GUyD/6omhpz4H8lNw9siYwu4VXZ96nyFvrSnKMPEzXLeGTDBlp3FMe00XdodcI9CjLEZ
 6ERedy4R4+CyKolLH/EFmoHjVX4dOLgw/JzULHrVLlB0hJuHdEVFzn7B9DzwD8ZnOWtI
 ttWSEWXrS+55qgZeTpVM3jhpBXhI2joAXsYgpjBeZa2f4v7/2Qdr4h3t9LhdjamD38wG
 KPlS2s/opQhELjE18MMU0P2B9OGgwYLGF++h8v0CqqaLV1kVl/VNETUul67No81Zxha1
 61Jg==
X-Gm-Message-State: ANhLgQ1yY+2J1b4iK9SuNhzdV+nVNEe5wxBbsjfU5OCiVrGeNXI2asUS
 HqypPDddL65OItolMCsoaqhwDA==
X-Google-Smtp-Source: ADFU+vuYWMHCslvUNwXUcaXSJwmBGmrU+STTteHzbOUtCKoxHdMrNV0++OcL5lLFlieALAAa/Z3NFg==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr3204485wma.5.1583489402366; 
 Fri, 06 Mar 2020 02:10:02 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id f6sm12992707wmc.9.2020.03.06.02.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:10:01 -0800 (PST)
Date: Fri, 6 Mar 2020 11:09:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200306100955.GB50020@myrica>
References: <20200228150820.15340-1-joro@8bytes.org>
 <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_021004_253671_3904EE59 
X-CRM114-Status: GOOD (  19.65  )
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
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Linuxarm <linuxarm@huawei.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 06, 2020 at 04:39:37PM +0800, Hanjun Guo wrote:
> Hi Joerg,
> 
> On 2020/2/28 23:08, Joerg Roedel wrote:
> > Hi,
> > 
> > here is a patch-set to rename iommu_param to dev_iommu and
> > establish it as a struct for generic per-device iommu-data.
> > Also move the iommu_fwspec pointer from struct device into
> > dev_iommu to have less iommu-related pointers in struct
> > device.
> > 
> > The bigger part of this patch-set moves the iommu_priv
> > pointer from struct iommu_fwspec to dev_iommu, making is
> > usable for iommu-drivers which do not use fwspecs.
> > 
> > The changes for that were mostly straightforward, except for
> > the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
> > Unfortunatly I don't have the hardware for those, so any
> > testing of these drivers is greatly appreciated.
> 
> I tested this patch set on Kunpeng 920 ARM64 server which
> using smmu-v3 with ACPI booting, but triggered a NULL
> pointer dereference and panic at boot:

I think that's because patch 01/14 move the fwspec access too early. In 

                err = pci_for_each_dma_alias(to_pci_dev(dev),
                                             iort_pci_iommu_init, &info);

                if (!err && iort_pci_rc_supports_ats(node))
                        dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;

the iommu_fwspec is only valid if iort_pci_iommu_init() initialized it
successfully, if err == 0. The following might fix it:

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 0e981d7f3c7d..7d04424189df 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1015,7 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		return ops;

 	if (dev_is_pci(dev)) {
-		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+		struct iommu_fwspec *fwspec;
 		struct pci_bus *bus = to_pci_dev(dev)->bus;
 		struct iort_pci_alias_info info = { .dev = dev };

@@ -1028,7 +1028,8 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     iort_pci_iommu_init, &info);

-		if (!err && iort_pci_rc_supports_ats(node))
+		fwspec = dev_iommu_fwspec_get(dev);
+		if (fwspec && iort_pci_rc_supports_ats(node))
 			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
 	} else {
 		int i = 0;


Note that this use of iommu_fwspec will be removed by the ATS cleanup
series [1], but this change should work as a temporary fix.

Thanks,
Jean

[1] https://lore.kernel.org/linux-iommu/20200213165049.508908-10-jean-philippe@linaro.org/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
