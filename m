Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59F0C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSP+qmgsxXr2sGqfpiPkDCc3EDwwHf/hj8AkhCmtSKQ=; b=G1m5+QPndcLXLroGUZqr7VKSKY
	8/+qSQocVpF16abakOjFcqdEwqh/JJczydjgATJjHiRXzVHCnu1sA0zZb24OXbXSQ/s5KhSe7XS3h
	QWdgdBxvbiMzSvR2aL49i4PHwr+gX3wW4mGGDQua9L6ZZWpMlRk6oho24Vi8ls3zexRiRE+4tiYAA
	eomHH725EZPvU7hW48OXSg2wY3YgdCakx7Lc00HGl9kkyicW0D+CFl6J2SpYFi4BlgALeG3PMIE9N
	Gp5KaRGmmwyroPcVJbzWMP269wHlixEBycyvDzPFFftn6vd/7/IGKMvn/XwiqloV0ptoY6GyeZHmx
	cD6uNrZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8k4-00FuiJ-Qb; Thu, 23 Feb 2023 10:22:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8k2-00Fugx-EQ; Thu, 23 Feb 2023 10:22:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N2R16e005929;
	Thu, 23 Feb 2023 10:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sSP+qmgsxXr2sGqfpiPkDCc3EDwwHf/hj8AkhCmtSKQ=;
 b=SFWSOibVLV6wWLUIJ6TG1mVDDj5kvMz1HfG/qGPTOA3m+Mu44s4nwAU3Sr9uVvD2akQn
 QyU0ulfkfLkd+Br9IzQddZPWoDzMZfYUur1Sq0LRHzdoA+e4LZ/dm/Bxb5DldZLXKFyo
 fhZfUh9IYIMtWkM79C1OUYZyBpszQgcVpr3ugx3VAvRunBu2vTtgSu2gVKNo6F/AyYJu
 1Mzf5BjTYRZxBVc27FN//4uKHyZmCyIOW/PA9dvwkxutz45VB3+NFaF0bcrekORYFHFy
 VBke489vJNG6iJaS2xfWOtk1fJ0+5rtz718hSO0kDyS0ud6AYMZ8WjH3rTvq5O50th75 BA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwybm0yud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 10:22:16 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NAMFlL008110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 10:22:15 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 23 Feb
 2023 02:22:10 -0800
Message-ID: <bb96b0c4-d1ef-c198-3e07-d83621010a7e@quicinc.com>
Date: Thu, 23 Feb 2023 18:22:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/7] scsi: ufs: core: Fix mcq tag calcualtion
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, <quic_cang@quicinc.com>,
        <quic_asutoshd@quicinc.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
        <stanley.chu@mediatek.com>, <alice.chao@mediatek.com>,
        <naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>,
        <cc.chou@mediatek.com>, <eddie.huang@mediatek.com>,
        <mason.zhang@mediatek.com>, <chaotian.jing@mediatek.com>,
        <jiajie.hao@mediatek.com>
References: <20230222030427.957-1-powen.kao@mediatek.com>
 <20230222030427.957-2-powen.kao@mediatek.com>
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20230222030427.957-2-powen.kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4gYogiX9VRbIXWwhX1NoQAqpeTHa_-uI
X-Proofpoint-GUID: 4gYogiX9VRbIXWwhX1NoQAqpeTHa_-uI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_022222_619716_20779C94 
X-CRM114-Status: GOOD (  17.50  )
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


On 2/22/2023 11:04 AM, Po-Wen Kao wrote:
> Transfer command descriptor is allocated in ufshcd_memory_alloc()
> and referenced by transfer request descriptor with stride size
> sizeof_utp_transfer_cmd_desc()
> instead of
> sizeof(struct utp_transfer_cmd_desc).
>
> Consequently, computing tag by address offset should also refer to the
> same stride.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
reviewed-by:  Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>   drivers/ufs/core/ufs-mcq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 31df052fbc41..3a27fa4b0024 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -265,7 +265,7 @@ static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
>   	addr = (le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA) -
>   		hba->ucdl_dma_addr;
>   
> -	return div_u64(addr, sizeof(struct utp_transfer_cmd_desc));
> +	return div_u64(addr, sizeof_utp_transfer_cmd_desc(hba));
>   }
>   
>   static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,

