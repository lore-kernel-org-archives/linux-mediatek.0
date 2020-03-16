Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EC2C0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81172051A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ba4oq6oj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wqEM+8T/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81172051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2jlJ7lBQNsq4gjvxOiDy8GNMB9AwFBqN+ZzBuXYpuU=; b=Ba4oq6ojMGag0V
	1hdFJjZKXG7HizIphopLYNaZuaYfoTetJgbfnGyCjt8hrwxa/YFt+J3No54jB2OxL4EWGgRe0Lhne
	u2G/0K31MZL/V/ZAaVJ+fb83o6oMUrBH5nZIR6fkH4L61Q4sWgtQATJ5+I6onmEcj6tXfx6/aCLjD
	Hhn0n+FSivGUg9ulKyG6ojJPNJJTHe5sfNWliw4z+iAsAivaoodo+DFtIKjSy37Z86601aOWK5vUU
	gjGIcWz9wobfmkDCgNS8lZNQ7BSAOWnDvWY1J883TEFwQk/SE2dYNcLZcABTm59nq+gRImw4uq1zS
	w32iAygqaUbt5u9SZyVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDryE-0002u3-CN; Mon, 16 Mar 2020 15:48:02 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDryB-0002tI-6x
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:48:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id y2so6370557wrn.11
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J+yCX5u1YDN6eK0N92vhv3vwdN0qX/QOnRznwSw/NEU=;
 b=wqEM+8T/4h/xHj/JCPK+rRTCXxcVR4eDf7FRmVy6tL77x3zHH/AiX26KSVcpaAUPYM
 H2E3TxgVcsUZps0ZwbKrOGHGA1w+q7Tk9JZyHOG4r0miXlsNK9DAr6ASz77gWGMYoThi
 aqIcdck8zrW9cmOsVNIVfmvriv2jyBKV2gCHKWxDzNBhDSaeuNibLyNo1rN/KPESbvGx
 bYFXAMI7K3kXwTe2xy6IA/A4hJbQRhpt2ZZKRbDn2/H/Lo/rmmzCexG9w/kcno6ZiI77
 ppej5XGet0RlmPFvfqjzVDbUXtrDAc80RMkysk6JhzvWsm3/Qn/rhmBAkBM9JFQCl/h+
 nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J+yCX5u1YDN6eK0N92vhv3vwdN0qX/QOnRznwSw/NEU=;
 b=FcrT+QT471uNS+soh7aMiem5N70yOEdwZ/eFTzb8GvnN8Lxt3hHeLCjZ0HxoSrALjz
 X6TIhzozfzFhLcGI/22gUn3A36FCh9iuPEL/3ReLbb9ElkxVBEXPVbSVhkG7REsxPd3D
 MZLrjo1KXtTs8RBCzEQu/UpmtxtEGHKvwYN6KWWsSrlm+6u9pmf9cA+DL4a2EXErRemc
 0FmuKDuqr16cU4tLmaW3NsNLn4ZR+yCQWTiOAugQfESXriKGFsWcmLIRcL3ER+CtiCe0
 9vPK61bRUB5MTp6ROeElkf1AO0iMzpje4IMw4lSlc+ipqOvQM6Ga5kvUxiwdIrgOXV+I
 gT6g==
X-Gm-Message-State: ANhLgQ2Jm88W17Eo4TnhqAPFmNH/BKuNc3NW8QP4bGAtI2plxOen8Nea
 UKuoHpU7f9KbgJa45371XdE6kg==
X-Google-Smtp-Source: ADFU+vu7BwV9+IRhzha1mvLv+qxjTZOswhDVu8mc2cK8kbLXKQAY/jWE86j0EqeFBPhJwYU3dCMzFg==
X-Received: by 2002:adf:f510:: with SMTP id q16mr6841064wro.43.1584373677809; 
 Mon, 16 Mar 2020 08:47:57 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id l7sm488506wrw.33.2020.03.16.08.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:47:57 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:47:49 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 08/15] iommu: Introduce accessors for iommu private data
Message-ID: <20200316154749.GI304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-9-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-9-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_084759_256943_49E8E02B 
X-CRM114-Status: GOOD (  14.27  )
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

On Tue, Mar 10, 2020 at 10:12:22AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Add dev_iommu_priv_get/set() functions to access per-device iommu
> private data. This makes it easier to move the pointer to a different
> location.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  include/linux/iommu.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index f5edc21a644d..056900e75758 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -627,6 +627,16 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
>  	dev->iommu->fwspec = fwspec;
>  }
>  
> +static inline void *dev_iommu_priv_get(struct device *dev)
> +{
> +	return dev->iommu->fwspec->iommu_priv;
> +}
> +
> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
> +{
> +	dev->iommu->fwspec->iommu_priv = priv;
> +}
> +
>  int iommu_probe_device(struct device *dev);
>  void iommu_release_device(struct device *dev);
>  
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
