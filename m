Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1BCC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiIjYCibcng5pWI5Vn82J5Qpk5rLTpSd4Rwvvgpmky0=; b=EnFaOkoe5um+SFP3yKIifXvOSH
	Qmk1vvE8UKYQiBzXOddIi5FvRl903ZbcWWYeG7oQZQcJL6EfaKqpHhRG7Euwom1asc8JQ19+xfhm4
	G4GAFHwxihkHWXue+KL/HvGm5tseY0yARBRUdC+9uN7nLbyiTsO9IAZUdeQEDiHHOvnHgOTUjG20J
	pyODTlm3/SPIBdZJBUnJV8FiovkmKhSD3r5UwpMK2NZ7H6tsJHF0RrmibYDEFNUWaFcqIAZ7Gie/1
	69VwYuJpj5DHCORu245Un4UxlQBgSZ86usu+W5+zDdXZfLeZQ5GgOk8wyXCz5dtIRwsYEAFIy3EMw
	3quTY+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8uc-00Fyb2-PO; Thu, 23 Feb 2023 10:33:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8uZ-00FyZm-JI; Thu, 23 Feb 2023 10:33:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N8bksZ018368;
	Thu, 23 Feb 2023 10:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FiIjYCibcng5pWI5Vn82J5Qpk5rLTpSd4Rwvvgpmky0=;
 b=GxDI/dFN9HDIIo7Uzp1dCAbChw1Q1KWDzyiXfVKB95DDDBTi4WCXEfk2gF4UKU7FzImS
 6Namq5MQL3kgoWnALZKsZEYTVQMFbpTIGpokSIuunQE+3upl14YsfK4OfLHNMvJWYj3z
 Gh7etsxTRlGrjZcnByiadczxXgyXF9HOkAPTh1V1KOaHiQe3xCFu7C0B890+7sxMHChr
 9zEZejYUEozvy/G8XnFcIBO/B+FciqUHdxikxUAXtDVgSSPwK2sMjB3vGtUGZcrKv6hm
 OL6D3ULN5m4XsGeRmn27+/BmjORYSQlXpmuX6TzJJxS6VD5QQR2cNaIGJGgDZQQqii1V Yg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwywd0x36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 10:32:56 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NAWsJl016690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 10:32:54 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 23 Feb
 2023 02:32:48 -0800
Message-ID: <58244768-33ad-21d6-d88d-93e7fdd0ba27@quicinc.com>
Date: Thu, 23 Feb 2023 18:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/7] scsi: ufs: core: Fix mcq nr_hw_queues
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
        Matthias Brugger <matthias.bgg@gmail.com>, <quic_ziqichen@quicinc.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
        <stanley.chu@mediatek.com>, <alice.chao@mediatek.com>,
        <naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>,
        <cc.chou@mediatek.com>, <eddie.huang@mediatek.com>,
        <mason.zhang@mediatek.com>, <chaotian.jing@mediatek.com>,
        <jiajie.hao@mediatek.com>, <quic_cang@quicinc.com>,
        <quic_asutoshd@quicinc.com>
References: <20230222030427.957-1-powen.kao@mediatek.com>
 <20230222030427.957-4-powen.kao@mediatek.com>
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20230222030427.957-4-powen.kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KkQ6qnJqZ8YOH38mukRGEjyuDaGido5k
X-Proofpoint-ORIG-GUID: KkQ6qnJqZ8YOH38mukRGEjyuDaGido5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_023315_776561_61DEE461 
X-CRM114-Status: GOOD (  17.24  )
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

Hi Po-Wen,

On 2/22/2023 11:04 AM, Po-Wen Kao wrote:
> Need to add one to MAXQ to obtain number of hardware queue.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> ---
>   drivers/ufs/core/ufs-mcq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index a39746b2a8be..5d5bc0bc6e88 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -150,7 +150,7 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>   	u32 hba_maxq, rem, tot_queues;
>   	struct Scsi_Host *host = hba->host;
>   
> -	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities);
> +	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities) + 1 ;
Can we add one line comment why need to  add one to hba_maxq  here or in 
commit message?
>   
>   	tot_queues = UFS_MCQ_NUM_DEV_CMD_QUEUES + read_queues + poll_queues +
>   			rw_queues;

Best Regards.

Ziqi


