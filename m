Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A33EC64ED8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RtgpJu54slfX0JMTbbQkMovmg0D++50tTf8IWA0C08=; b=cDIGFKU9u19UA70Mghhp6ZdqRy
	JAatfdIpti49epsHLX07DoSRCuymzUPXmCaemfofu4qS0rgrE1BdFk1kM4NHdrcBOTEubG2SSudsH
	AIPCRjNsLPUQj2BcS7Cj6ApmhSjLImztgpmH8ul0Lo5dzLW/BbF3cXqAsktpGwIRgZBobg1GdgQei
	/ozdqiH5ixjzQcuverNDp/luXXR1Onbmvb9KKCSp8/lYUcFwh1q8/dwS1zVIYgp4OLc0fqUpsxYd+
	7XA9PWg7ETV7LPa1rMEJ5Jp+8RSOuFK4Bh3ApZXx0WdqpL+RFTjWUA53zp+tKXtSA0zCbTA74XUkY
	alyuHhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9D8-00G2HH-78; Thu, 23 Feb 2023 10:52:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9D6-00G2Fw-80; Thu, 23 Feb 2023 10:52:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NA129N011643;
	Thu, 23 Feb 2023 10:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9RtgpJu54slfX0JMTbbQkMovmg0D++50tTf8IWA0C08=;
 b=LwRRgaN8B3sh7qymZkrsX+ItdZFDNAhy4qrR07c3ANwOYOzwqL7YKo5W0W6x+bUc+Dex
 siYi0XieoVojDtpI/Zv9XD2PNCit61B2bVVT1Ar92Lruf/o2gYrHSrXricPelIssrfg1
 2OUSo8hk4LnrKhp2srWv2RxquudoiEdHIBLbijEErHSCmiCJaYqPuBA1+FcTQXSlWIC4
 pFJX3GvVCYIK/XQoD/I76pBOzUAHxazt3eyG586q8dpiY9UvK47ixrU4BHp7FTC9Jwvz
 fOobsUvwW6GPt/HCxhl+HnWUgXIaWFtRKUd6986BkrQ8yepN056CK3NcnwUZaLI8x8al hQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwy8m11hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 10:52:18 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NAqIMr017618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 10:52:18 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 23 Feb
 2023 02:52:12 -0800
Message-ID: <27d2a4c4-2a4c-7fc6-4afb-cf5792e91d85@quicinc.com>
Date: Thu, 23 Feb 2023 18:52:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 5/7] scsi: ufs: core: Remove redundant check
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
 <20230222030427.957-6-powen.kao@mediatek.com>
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20230222030427.957-6-powen.kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kJ6tIHn7zTNWGPlxe8BKBPgyRbxF6M0C
X-Proofpoint-ORIG-GUID: kJ6tIHn7zTNWGPlxe8BKBPgyRbxF6M0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_025224_320595_F7BAB405 
X-CRM114-Status: GOOD (  16.02  )
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
> is_mcq_supported() already check on use_mcq_mode.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
reviewed-by:  Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>   drivers/ufs/core/ufshcd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index a15a5a78160c..21e3bf5d8f08 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -8548,7 +8548,7 @@ static int ufshcd_device_init(struct ufs_hba *hba, bool init_dev_params)
>   			hba->scsi_host_added = true;
>   		}
>   		/* MCQ may be disabled if ufshcd_alloc_mcq() fails */
> -		if (is_mcq_supported(hba) && use_mcq_mode)
> +		if (is_mcq_supported(hba))
>   			ufshcd_config_mcq(hba);
>   	}
>   

