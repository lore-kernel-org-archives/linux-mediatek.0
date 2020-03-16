Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5808CC0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D54B20663
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PjSl5Qwf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEq8/ZMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D54B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJYltHKsqWxLS4XP8C1zAuf+VG9LBvhsJ+1tDscGnWc=; b=PjSl5Qwfa1f+4q
	uHlrKFYDJitt9HFrJzmtaJVOMwP0d8YB3o7LHmMxQlucUnlOK+nSKuO5bWv6KCubjjL6e0RGHdc4c
	X5fRKNAvJVpJNlHmkp2QwUlI+xlYAekuLLk/d/dMWS1FXJJM+ENVJAi/d9a7chTs1fpdAPr5gAvnP
	roQwFq4Suz5RuRK622WlsClu5v9egpUT2NCvOUyZBuXTz35TCXa2pFGBFBJONU+WWVyEBRqrgPuvL
	ONdHintOU++0W4gU5FzocYcTontVyzlv5Ez+zbmYEC99iDv2XsCGZOS2xXlPDjFY8bIAI86l4Cbin
	a1BaAvHchc/ZHqnVKW/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDrtW-0008W4-HH; Mon, 16 Mar 2020 15:43:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDrtU-0008Vj-K5
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:43:09 +0000
Received: by mail-wr1-x441.google.com with SMTP id z15so21810384wrl.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
 b=gEq8/ZMBwfLkBD9tGRHGjZfTd20HP1xHo/lJCYGOxGAYI7JgVG9jMowKPQSyqmQoJH
 Q9ZbaY7SOKJp8K4eyLHZOG5BXM7bIz0LDg0iLZ0C7XwnSZgO4Q7ql/grJgyu+f0XKKiZ
 8hj2Hl5fh1i6wP+q7uq/YnEi3K13FYNSMiMBiMDb9rTjtVKuKwTX2bq22JmdTliOTXP2
 K+5zCU0/1lWFBSvTXbDx9fEkSA/zS7i5vKY3n2XrAijwrJW7uI1+D+Ab8wO+LOpxCjFg
 cLiZ+CoMaM/7tmWRw/RxFAOt/xBIBCD8p1Ekq22vHH0ospnbZ5362hTq6dFil73T5VxH
 cAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DdvuxQV8MUJ3DF0txatG/PoeJXobhfl8uAplHUnRQXw=;
 b=bAx3gwu/hXZQzubL3rGmG/Fq+EmarNNVXoWwXL/FoVilW+XhHrv4D2NSCldAfDbry8
 VsCnTVlRyx6WNWaeY+zaS/12em6/X1ZYTLdD7C5Q7ej6auizQy546WnLoBSKRaGg69+g
 f5huK5zqZMwZSSvt5axfZJKebi5FS0qImwa49zxW+XwelPAz+lYF1PXRmo/tynUq6bDa
 yS8HObu41iFa5hYpImtXNN5ACaqpy/2P3bU7q0qxTMswuh6V/JGdysVokMEfMubYMouv
 kCnT3xLfy4OlwnZoKhStO8EUULBb09CZSqZAMFmS9yKqXhCrn1WlHphRaHwR3dVvnYOF
 K+7w==
X-Gm-Message-State: ANhLgQ1seHHLsbdZvn8gwQ0aNKqaibN2QJnPE8oGsFd6UmmcSIc9FLzj
 75ZwqPc0wsHfauxYguj/SAL09Q==
X-Google-Smtp-Source: ADFU+vukGMBSU+PIquYB6P7V4T5BWKneai54XgateQmlyq1EDcQ3i3rP1F+AK6w2nNtuc0TA4HUjIw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr35844297wrr.125.1584373387505; 
 Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id h13sm433117wrv.39.2020.03.16.08.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:43:07 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:42:59 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 04/15] iommu/tegra-gart: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154259.GE304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-5-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-5-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_084308_661898_09701759 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, Mar 10, 2020 at 10:12:18AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/tegra-gart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index 3fb7ba72507d..db6559e8336f 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -247,7 +247,7 @@ static int gart_iommu_add_device(struct device *dev)
>  {
>  	struct iommu_group *group;
>  
> -	if (!dev->iommu_fwspec)
> +	if (!dev_iommu_fwspec_get(dev))
>  		return -ENODEV;
>  
>  	group = iommu_group_get_for_dev(dev);
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
