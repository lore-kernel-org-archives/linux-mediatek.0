Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41ABC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyXmAuPB2QwCsFmA09TyMaE9r5Wsa42TS9CvhNr4Xxo=; b=mj34frJeOiVGw63Y71O4FH+Eea
	sAKnVR6FVCHgPiofWttO7VkAg6QywFwLjtAThNcYin+XxgO1jsMKJhNyGRce1ClyaUno3e4B3CNZn
	SH7ccJRgPfBnesLXSmzjFUPfHgurTyTB6j+k9mCaAQu0iv4bkF3YYQIwbe0FeZiIgIzKo5xjw1syE
	Sm56tTkMPQpW/VECqbYtnStlxj0/xV3nSwVKRq6KNs+pt6TzyGJANKk87faKA0+eWWsnC96JXeJDx
	Lww4uxqW33u1ygGhffyLDxfxwygobPtKlsjJWJhl8RH9nJt3Q0+Oj62p6jGbndxK87FeKc7oVkmmD
	7st5RsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pypHu-004gsY-2v;
	Tue, 16 May 2023 07:40:02 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pypHr-004gqm-3A;
	Tue, 16 May 2023 07:40:01 +0000
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34G7aShZ005037;
	Tue, 16 May 2023 07:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oyXmAuPB2QwCsFmA09TyMaE9r5Wsa42TS9CvhNr4Xxo=;
 b=jQyJnX2IE0Q9/uHuiK+tFFDM2ICZfdAS10yyEEvjakfFqK1quX2CS8p56sTYXWMVS9QP
 hlMhqOQ+mI2WQwYJsEhn/wIKZL3WkKjRMXk6BZ5K5F/WPJmxqsampKPSkDiJmsAwxLPd
 QY59SXf1QlQ2ey9cq+26TAma4O3D76d5TXhUj46eB6o4zAbnPGEbluM8Lr7Wt3ylPD0b
 TxIDWKMJtEgDfyXMimQ6TXr011dMhE4PtQ4wOjElsEyFil+mkDcEqxqAJcWoxs0Fmgce
 X8T8mgU2Vps3ESnTmGZo3FC5OP5dsorRnLIdraV+j9qiSgyKFAl3jwTnHpk6XFcyzama 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm4y8hh1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 07:39:32 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34G7amRA007488;
	Tue, 16 May 2023 07:39:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm4y8hgpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 07:39:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34G3qs8k006665;
	Tue, 16 May 2023 07:39:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qj264sfp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 07:39:23 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34G7dKNV41615626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 May 2023 07:39:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C0C320043;
	Tue, 16 May 2023 07:39:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7498920040;
	Tue, 16 May 2023 07:39:18 +0000 (GMT)
Received: from [9.152.222.242] (unknown [9.152.222.242])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 May 2023 07:39:18 +0000 (GMT)
Message-ID: <168d8026-207a-e7ee-21b3-4a02ed00f0ce@linux.ibm.com>
Date: Tue, 16 May 2023 09:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 1/6] s390/ism: Set DMA coherent mask
Content-Language: en-US
To: Niklas Schnelle <schnelle@linux.ibm.com>, Joerg Roedel <joro@8bytes.org>,
        Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Wenjia Zhang <wenjia@linux.ibm.com>,
        Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Gerd Bayer <gbayer@linux.ibm.com>, Julian Ruess <julianr@linux.ibm.com>,
        Alexandra Winter <wintera@linux.ibm.com>,
        Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy
 <vdumpa@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
References: <20230310-dma_iommu-v9-0-65bb8edd2beb@linux.ibm.com>
 <20230310-dma_iommu-v9-1-65bb8edd2beb@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20230310-dma_iommu-v9-1-65bb8edd2beb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J4ionigi6aUPze2O9mlNApMYAufA_hrk
X-Proofpoint-GUID: i4d6Dd2ZX11emMnTTTHfoZmJwBDtd8nN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_004000_022232_2BD578D5 
X-CRM114-Status: GOOD (  24.23  )
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


On 5/15/23 11:15, Niklas Schnelle wrote:
> A future change will convert the DMA API implementation from the
> architecture specific arch/s390/pci/pci_dma.c to using the common code
> drivers/iommu/dma-iommu.c which the utilizes the same IOMMU hardware
> through the s390-iommu driver. Unlike the s390 specific DMA API this
> requires devices to correctly call set the coherent mask to be allowed


s/call//


> to use IOVAs >2^32 in dma_alloc_coherent(). This was however not done
> for ISM devices. ISM requires such addresses since currently the DMA
> aperture for PCI devices starts at 2^32 and all calls to
> dma_alloc_coherent() would thus fail.
>
> Reviewed-by: Alexandra Winter <wintera@linux.ibm.com>
> Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>   drivers/s390/net/ism_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/s390/net/ism_drv.c b/drivers/s390/net/ism_drv.c
> index 8acb9eba691b..1399b5dc646c 100644
> --- a/drivers/s390/net/ism_drv.c
> +++ b/drivers/s390/net/ism_drv.c
> @@ -660,7 +660,7 @@ static int ism_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	if (ret)
>   		goto err_disable;
>   
> -	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>   	if (ret)
>   		goto err_resource;
>   
>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>


