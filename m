Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E92ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOjcXjUbwSgzNSp733a017RyzNlbU++LiGHcquc+GRM=; b=EQED4KSgCVLErI5vNF0eCTcBhA
	ghF2Mi+IDxk1aHC47y8tozCc8Y/G+AGqbxPJ3NIggPibmpiISV3ZAaQGBrxUytgjeaB2hpEMM4TIE
	ZaenxpLWyGs1CdLRvc7DOU42YvuYdQqJTARMF0NvWx9DqQXXzdMtqbswIEl1MdcXKGQMBEcPhsr3C
	xeMiS4/lXfriUpNaHWeBtiDVVQm2Po94r5VnsiUDzOQFF1So6+WIA/gan5+CHComGr5K1LWOJTy4R
	ZZio1tC1/7TLc7ymVAgB85DTpC1gK0J2GSpNpULSyysjdUBd5oGS8Yy9H1+RoxMn03r7m/DT1fryh
	eOPQ/tPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfkC-00000002MOu-4B7h;
	Mon, 09 Sep 2024 14:51:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfkA-00000002MOQ-05Om
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 14:51:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DRRU1018266;
	Mon, 9 Sep 2024 14:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOjcXjUbwSgzNSp733a017RyzNlbU++LiGHcquc+GRM=; b=OuobNaCRXJPSD37/
	h6GFvdKWgDwZ9E+aaDB0rDm8XV/Kxf71t+5iRBp+8a7P8wx5rEb+esby1oxOTcR9
	eBXKjbWHa3sT6pvWcLOlGNj1Aq2FH46w/DviifBzn4RoeeYMiYUbR4BnjpoC6Ie/
	ykhT2XwpGWEggk3nFb76qHOzr+ovF+sumy45M031XEDF4DMEgwllqYwvdu5V4HUS
	O1O53chC9mWmp3ttzqTtg+Ea1A+blx6UWaYCTbLkL/nSDpgKspBm+RwPBKfV5uCu
	g3Qn5VBh1OgCU6bY3zdreNRzY+a6nJZhrzXLJAYKxEqTvNjiSJ1U+l3gRBe4+Pxj
	EJPhYA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy7fk3xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 14:51:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489Epaw6007195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 14:51:36 GMT
Received: from [192.168.143.77] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 07:51:35 -0700
Message-ID: <f133990e-548e-1d57-ccfd-b130a642fc58@quicinc.com>
Date: Mon, 9 Sep 2024 07:51:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] ufs: core: fix the issue of ICU failure
Content-Language: en-US
To: <peter.wang@mediatek.com>, <linux-scsi@vger.kernel.org>,
        <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
        <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
        <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
        <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
        <jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
        <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
        <tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
        <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
        <stable@vger.kernel.org>
References: <20240909082100.24019-1-peter.wang@mediatek.com>
 <20240909082100.24019-2-peter.wang@mediatek.com>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <20240909082100.24019-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OERjaQ1dmJ05ckrU32UtKX53KSI__z5R
X-Proofpoint-GUID: OERjaQ1dmJ05ckrU32UtKX53KSI__z5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_075154_103144_2D04A5E3 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

On 9/9/2024 1:20 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When setting the ICU bit without using read-modify-write,
> SQRTCy will restart SQ again and receive an RTC return
> error code 2 (Failure - SQ not stopped).
> 
> Additionally, the error log has been modified so that
> this type of error can be observed.
> 
> Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---

Reviewed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>

