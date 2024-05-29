Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248D2C25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 21:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PARYYHhg70pqBiJMUjkGT2vdJbafk+BvlarseNYu7HE=; b=d9+EGoh9k8LldjfVb3JgzDHhk/
	wyBKEzSE3OQQmpdotwLN2vdmD2HxW9Xl37kG4eqI86BM0KdWQvl5zhQtyW7sDPk9jjWeRxWoea4so
	/PW+yXByk11cQrQ/w/NUxm2P2SbXZIUB+LlDr9kI8Z9s7XWNDzi5Rv9n8QFHMdXjME1kzbCqvgIL0
	i7Ew4VEk2Eg3Gnv/Kq/lHi0SZoaahoJnUzpZ9zhU1qnPMzm0cHKfgEAs5VCoOFw5t/qHIJd+8SUgm
	8RbDbuGXQMWaBFAfKRKHCkKtK+hyxgXRn3WJPQqqKMIhvtPXg5UIdO5VKhgq3HCrqcVMN9gFfRfHA
	+SlJqKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQol-00000005YSr-2mXa;
	Wed, 29 May 2024 21:26:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQoR-00000005YQb-1IKs;
	Wed, 29 May 2024 21:26:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44THVp7X015693;
	Wed, 29 May 2024 21:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PARYYHhg70pqBiJMUjkGT2vdJbafk+BvlarseNYu7HE=; b=a4/OIZHirY5G3qHR
	VC7zdzqg4MzpwVkmFjGHO5vvpMXTkQzuNDvv6PjVaS1F+hFoRHEAgSV4NldZBFEt
	ubJVZ0t1CVQgpzZR1U0/D3X039r1pnj1MdyyIYj282bUAU75rUkZLyL5a3QocW2s
	MRu+8UYV7do7icZhOvk7fYNMzvI4kqG1MHfKuP9CcsUnQSmfwXUAiEql5WGSwL3x
	L7+z+b02g9hyN1WIEAwLND/LFK7Gl8Pn8/Fq91KdkRJ31CaIVS3kLyCGPhlaUthc
	EBQjntjhX2W3Xmj21Vz9sslc0lEctcTzEyhj+b3BWH+Kt/XAgPx2HEBHC6dIGxMQ
	dTsBQQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws223d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 21:26:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TLQ7wb019964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 21:26:07 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 14:26:06 -0700
Message-ID: <f3696d6f-3e08-4ee9-8d6f-b2618d4818ee@quicinc.com>
Date: Wed, 29 May 2024 14:26:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/ci: add farm variable
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
        <dri-devel@lists.freedesktop.org>
CC: <daniels@collabora.com>, <helen.koike@collabora.com>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <robdclark@gmail.com>,
        <david.heidelberg@collabora.com>, <guilherme.gallo@collabora.com>,
        <sergi.blanch.torne@collabora.com>, <dmitry.baryshkov@linaro.org>,
        <mcanal@igalia.com>, <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
        <virtualization@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-3-vignesh.raman@collabora.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240529024049.356327-3-vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T53rmvm3f_jT7JuQL7xn10jo2GFV4OFn
X-Proofpoint-GUID: T53rmvm3f_jT7JuQL7xn10jo2GFV4OFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_142627_109166_0453312F 
X-CRM114-Status: GOOD (  14.91  )
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



On 5/28/2024 7:40 PM, Vignesh Raman wrote:
> Mesa uses structured logs for logging and debug purpose,
> https://mesa.pages.freedesktop.org/-/mesa/-/jobs/59165650/artifacts/results/job_detail.json
> 
> Since drm-ci uses the mesa scripts, add the farm variable
> and update the device type for missing jobs.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
> 
> v3:
>    - New commit to add farm variable and update device type variable.
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 8bc63912fddb..2615f67f6aa3 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -24,6 +24,7 @@
>     variables:
>       HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
>       DEBIAN_ARCH: "armhf"
> +    FARM: collabora
>     dependencies:
>       - testing:arm32
>     needs:
> @@ -39,6 +40,7 @@
>     variables:
>       HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
>       DEBIAN_ARCH: "arm64"
> +    FARM: collabora
>     dependencies:
>       - testing:arm64
>     needs:
> @@ -54,6 +56,7 @@
>     variables:
>       HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
>       DEBIAN_ARCH: "amd64"
> +    FARM: collabora
>     dependencies:
>       - testing:x86_64
>     needs:
> @@ -74,6 +77,7 @@
>       S3_ARTIFACT_NAME: "arm64/kernel-files"
>       BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
>       BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
> +    FARM: google
>     needs:
>       - debian/arm64_test
>       - job: testing:arm64
> @@ -116,8 +120,9 @@ msm:apq8016:
>       - .baremetal-igt-arm64
>     stage: msm
>     variables:
> +    DEVICE_TYPE: apq8016-sbc-usb-host
>       DRIVER_NAME: msm
> -    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
> +    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
>       GPU_VERSION: apq8016
>       # disabling unused clocks congests with the MDSS runtime PM trying to
>       # disable those clocks and causes boot to fail.
> @@ -132,9 +137,10 @@ msm:apq8096:
>       - .baremetal-igt-arm64
>     stage: msm
>     variables:
> +    DEVICE_TYPE: apq8096-db820c
>       DRIVER_NAME: msm
>       BM_KERNEL_EXTRA_ARGS: maxcpus=2
> -    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8096-db820c.dtb
> +    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
>       GPU_VERSION: apq8096
>       RUNNER_TAG: google-freedreno-db820c
>     script:
> @@ -146,6 +152,7 @@ msm:sdm845:
>     stage: msm
>     parallel: 6
>     variables:
> +    DEVICE_TYPE: sdm845-cheza-r3
>       DRIVER_NAME: msm
>       BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
>       GPU_VERSION: sdm845
> -- 
> 2.40.1
> 

