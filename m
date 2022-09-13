Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF95C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTC8+roq761rPO1lbs0pNCCJS3R+FuNtWSS5Z+GCYq0=; b=poo4XJdeHxxdnDW49pf228Rnyi
	tKoUdFLeCE82uj2yKZqI/DMJgYNqO2k/SDEm/UmP9aK7xL7JeYlzRVTuNudHKT71N0vkpncS+z+v+
	DbO8JrcTA+4SSH0fna7eGGBkn+KIqbyqYI2MncW6Uk6zInvqLlDP63KWNxPbZcmEtkV3dvQD2cVdz
	G0PdnesaRlFDHaK9re6zYnxvK7LtRmfeWxIsZfe+qsSmCeD0visws3ThAo8m/6QYxw3z/EMy1q+AY
	/6YbolSHmlNwcbf3u+V6hk9WxbQRQAfLWxqEAiONGoYRzSX7pnis8O8aQ0zeBl4c/yOP/1j7M+oNl
	8SIL0hTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY51Y-009yn6-TM; Tue, 13 Sep 2022 12:28:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY50R-009xlc-2Q
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 12:27:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id az6so9381748wmb.4
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Sep 2022 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VTC8+roq761rPO1lbs0pNCCJS3R+FuNtWSS5Z+GCYq0=;
        b=miJorPWGXKjdCvQfUrlK5b1TBnftK3ihkKzT7xqaUavMG7CeLtoJKGsTDgIrHxw1I3
         2o8xQkGSzosqM7uGO5cLcDrsoGHQ8twTWgHZ2vDCp7Moq8rQyncPJPf9AH7M4U8xaxAM
         YggevJiZ/hK+JQccvTf9e0cZGg7o7aOJH35ps/x9/3ARbo/2W107ZSA8CUuSjnPY3N3y
         soct36MtuIzorK4dk2RWaf9fYqjmfgyJjBzvbG5Q6v2vAtcjNhQLt/2tXAKSrGGFkQfM
         wrSlwNuWKXmVGgcul7JnWyX4aFqYYq/VYsG9T/I1xdpyUdb4FKPcIL7ldqP87qC+7eEg
         /5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=VTC8+roq761rPO1lbs0pNCCJS3R+FuNtWSS5Z+GCYq0=;
        b=52TDDy5aWFXQeXIOLV4BckRH/VptzxPy+6IQHd2uP2/rOlnoMiN2SeYFOC4BwRUFSG
         MtvlgxOsNeQTD7wP6tmcUp2ytfmOoIVUqbQzSjBCsDa3+kVAYD1uu6YfMrjELO9t4Oyo
         0jZ0Am+GkkTUrKi9yJdcG5I+ST59L7Q+ELd1sb7NmdYWxpEPqYDSZ3YiSw2iRbovQF3m
         A2kHeBqZlcQm3wuoi/3Hwqpu4A54vHYbHxaPDiCaWVTF4O/dD0SNAEa3SI1u63hSC/m4
         1SUniO0BqUp7vGKxHBxXZ/FN+G6zrk5Hrbwwa7iPapzhhPleluDNAsokLEsiB04gVlQW
         Xryg==
X-Gm-Message-State: ACgBeo1gGOCM1CNxfVrOL+0+KRUnaPdSH1RG0OUp3WKD+EduJfhDY9Q2
	va0ZBVnGMWVNGM+VQWjeRBL0JQ==
X-Google-Smtp-Source: AA6agR6T+QLT8jB5Xi/vSWb9EBDtxlHd1ocjnlnMMf5JCbG+ys2vKBcb/2DyNzFGWO0wDCo6sPf6Iw==
X-Received: by 2002:a05:600c:6026:b0:3b4:94ff:c019 with SMTP id az38-20020a05600c602600b003b494ffc019mr2218246wmb.101.1663072028280;
        Tue, 13 Sep 2022 05:27:08 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003b47b913901sm2496769wmq.1.2022.09.13.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:27:07 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:27:03 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, will@kernel.org,
	robin.murphy@arm.com, robdclark@gmail.com, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, agross@kernel.org,
	bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
	matthias.bgg@gmail.com, heiko@sntech.de, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	thierry.reding@gmail.com, jgg@nvidia.com, sricharan@codeaurora.org,
	yong.wu@mediatek.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	tglx@linutronix.de, shameerali.kolothum.thodi@huawei.com,
	thunder.leizhen@huawei.com, christophe.jaillet@wanadoo.fr,
	yangyingliang@huawei.com, jon@solid-run.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 4/5] iommu: Regulate errno in ->attach_dev callback
 functions
Message-ID: <YyB3F/o3RfymqiFW@myrica>
References: <20220913082448.31120-1-nicolinc@nvidia.com>
 <20220913082448.31120-5-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913082448.31120-5-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_052711_275434_8A8C964B 
X-CRM114-Status: GOOD (  25.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolin,

On Tue, Sep 13, 2022 at 01:24:47AM -0700, Nicolin Chen wrote:
> Following the new rules in include/linux/iommu.h kdocs, update all drivers
> ->attach_dev callback functions to return ENODEV error code for all device
> specific errors. It particularly excludes EINVAL from being used for such
> error cases. For the same purpose, also replace one EINVAL with ENOMEM in
> mtk_iommu driver.
> 
> Note that the virtio-iommu does a viommu_domain_map_identity() call, which
> returns either 0 or ENOMEM at this moment. Change to "return ret" directly
> to allow it to pass an EINVAL in the future.
[...]
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 80151176ba12..874c01634d2b 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -696,7 +696,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>  		if (ret) {
>  			ida_free(&viommu->domain_ids, vdomain->id);
>  			vdomain->viommu = NULL;
> -			return -EOPNOTSUPP;
> +			return ret;

I think in the future it will be too easy to forget about the constrained
return value of attach() while modifying some other part of the driver,
and let an external helper return EINVAL. So I'd rather not propagate ret
from outside of viommu_domain_attach() and finalise().

For the same reason I do prefer this solution over EMEDIUMTYPE, because
it's too tempting to use exotic errno when they seem appropriate instead
of boring ENODEV and EINVAL. The alternative would be adding a special
purpose code to linux/errno.h, similarly to EPROBE_DEFER, but that might
be excessive.

Since we can't guarantee that APIs like virtio or ida won't ever return
EINVAL, we should set all return values:

--- 8< ---
From 7b16796cb78d11971236f98fd2d3cd73ca769827 Mon Sep 17 00:00:00 2001
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Tue, 13 Sep 2022 12:53:02 +0100
Subject: [PATCH] iommu/virtio: Constrain return value of viommu_attach_dev()

Ensure viommu_attach_dev() only return errno values expected from the
attach_dev() op. In particular, only return EINVAL when we're sure that
the device is incompatible with the domain.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 08eeafc9529f..582ff5a33b52 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -669,13 +669,13 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
 		dev_err(vdev->dev,
 			"granule 0x%lx larger than system page size 0x%lx\n",
 			viommu_page_size, PAGE_SIZE);
-		return -EINVAL;
+		return -ENODEV;
 	}
 
 	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
 			      viommu->last_domain, GFP_KERNEL);
 	if (ret < 0)
-		return ret;
+		return -ENOMEM;
 
 	vdomain->id		= (unsigned int)ret;
 
@@ -696,7 +696,7 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
 		if (ret) {
 			ida_free(&viommu->domain_ids, vdomain->id);
 			vdomain->viommu = NULL;
-			return -EOPNOTSUPP;
+			return -ENODEV;
 		}
 	}
 
@@ -734,7 +734,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		ret = viommu_domain_finalise(vdev, domain);
 	} else if (vdomain->viommu != vdev->viommu) {
 		dev_err(dev, "cannot attach to foreign vIOMMU\n");
-		ret = -EXDEV;
+		ret = -EINVAL;
 	}
 	mutex_unlock(&vdomain->mutex);
 
@@ -769,7 +769,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 
 		ret = viommu_send_req_sync(vdomain->viommu, &req, sizeof(req));
 		if (ret)
-			return ret;
+			return -ENODEV;
 	}
 
 	if (!vdomain->nr_endpoints) {
@@ -779,7 +779,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		 */
 		ret = viommu_replay_mappings(vdomain);
 		if (ret)
-			return ret;
+			return -ENODEV;
 	}
 
 	vdomain->nr_endpoints++;
-- 
2.37.3


