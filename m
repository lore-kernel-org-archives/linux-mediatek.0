Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A876C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQhLlxqmzjKr9NsrPdkmOXYQsiz9/Tdn5+aZavAWXnA=; b=Ceo1Nebi+IL9Rb0eGme4IRhopL
	LeMAnLaD1enUi19MMvg4Q7OP9tzu+DyJkBi09UGAMvuTbxnPbmZSUXbk4+h9Yk0JAGQIMlUkogJuF
	PMux83ss2SZHl+2KUgmdWty7kCgMzMXDrS/unp21SCAnrGqgTEgXvsE3VUeiSjZ48aiNkz2E04pM3
	dPa81z93KYCA0cFKy9HUiGqpM58tGwMrHz/DeiJ5k8GBDuJCtvTgdSczy0l7Zqy5lHOTXj5HetTJb
	LPg6DRKEPMLyx8ZQqVvwdikLZk/c5erQ/ZRDgvvhqWa9SHB9AFw3kMKMLXggofwVMsPSImgNNorWe
	Wyo40Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYAsS-00ErtN-Lp; Tue, 13 Sep 2022 18:43:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYAsD-00Erii-JN; Tue, 13 Sep 2022 18:43:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DIFLWZ027735;
	Tue, 13 Sep 2022 18:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vQhLlxqmzjKr9NsrPdkmOXYQsiz9/Tdn5+aZavAWXnA=;
 b=Jgp305mzyzJvJ0BeuKTDDJ3sWYkNQUc+IG5+Qbm0Lhn+VfREvy71ozQjAbCCISf5WYX3
 Jdjm2v29zaW1i+q/ml2mJd17Topem7OTL3cavf5oo7I85t8nN0G01JXd2m9K0tKvvuge
 Yg6LSLE2nr6lZJuWqgE5ccqRdcrfchGMOEQOeuLmDXhNiQnFYXpLWz99DrewgFdUFGCl
 jUxSbTJIcpjs+7tl8DlnHec8pVa9lbB6bsPoJE6vuV5TnZjFXE90nmfScNdXClz8RlT1
 zdyxh9IIR6kAJQ4fDtoeS9tNnVC/tfCLlwNognt9UacUg3JY3POyqWsO8hIes+Fx4yCk nA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjxyvg26b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 18:41:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28DIfen3023964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 18:41:40 GMT
Received: from [10.110.52.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 11:41:37 -0700
Message-ID: <cd92cfec-0a68-a42d-1fa4-a16e37e59d53@quicinc.com>
Date: Tue, 13 Sep 2022 11:41:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/5] iommu: Add return errno rules to ->attach_dev ops
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, <joro@8bytes.org>,
        <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
        <robin.murphy@arm.com>, <robdclark@gmail.com>, <dwmw2@infradead.org>,
        <baolu.lu@linux.intel.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <konrad.dybcio@somainline.org>,
        <matthias.bgg@gmail.com>, <heiko@sntech.de>, <orsonzhai@gmail.com>,
        <baolin.wang@linux.alibaba.com>, <zhang.lyra@gmail.com>,
        <thierry.reding@gmail.com>, <jean-philippe@linaro.org>,
        <jgg@nvidia.com>, <sricharan@codeaurora.org>
CC: <yong.wu@mediatek.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <shameerali.kolothum.thodi@huawei.com>,
        <thunder.leizhen@huawei.com>, <christophe.jaillet@wanadoo.fr>,
        <yangyingliang@huawei.com>, <jon@solid-run.com>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>
References: <20220913082448.31120-1-nicolinc@nvidia.com>
 <20220913082448.31120-4-nicolinc@nvidia.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220913082448.31120-4-nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: etmjmEmkeGNTWFk3eX68NHU9O18Ysroz
X-Proofpoint-ORIG-GUID: etmjmEmkeGNTWFk3eX68NHU9O18Ysroz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209130086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_114305_655199_47898ACF 
X-CRM114-Status: GOOD (  29.46  )
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

On 9/13/2022 1:24 AM, Nicolin Chen wrote:
> Cases like VFIO wish to attach a device to an existing domain that was
> not allocated specifically from the device. This raises a condition
> where the IOMMU driver can fail the domain attach because the domain and
> device are incompatible with each other.
> 
> This is a soft failure that can be resolved by using a different domain.
> 
> Provide a dedicated errno EINVAL from the IOMMU driver during attach that
> the reason attached failed is because of domain incompatability.
> 
> VFIO can use this to know attach is a soft failure and it should continue
> searching. Otherwise the attach will be a hard failure and VFIO will
> return the code to userspace.
> 
> Update kdocs first to add rules of return errno to ->attach_dev ops.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ea30f00dc145..c5d7ec0187c7 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -266,6 +266,17 @@ struct iommu_ops {
>   /**
>    * struct iommu_domain_ops - domain specific operations
>    * @attach_dev: attach an iommu domain to a device
> + *              Rules of its return errno:
> + *               EINVAL  - Exclusively, device and domain are incompatible. Must
> + *                         avoid kernel prints along with this errno. Any EINVAL
> + *                         returned from kAPIs must be converted to ENODEV if it
> + *                         is device-specific, or to some other reasonable errno
> + *                         being listed below
> + *               ENOMEM  - Out of memory
> + *               ENOSPC  - No space left on device
> + *               EBUSY   - Device is attached to a domain and cannot be changed
> + *               ENODEV  - Device specific errors, not able to be attached
> + *              <others> - Treated as ENODEV by the caller. Use is discouraged

It is my understanding that kernel-doc won't preserve your formatting 
without extra directives. See the "Note" after 
<https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values>


>    * @detach_dev: detach an iommu domain from a device
>    * @map: map a physically contiguous memory region to an iommu domain
>    * @map_pages: map a physically contiguous set of pages of the same size to


