Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9496BCE7B11
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 20:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yEoVE9ezRV0k1GaCT9ts1NI1+qQ8GsKIXa5rBQHMqQ=; b=RWjnVwHS93ryo6Se3El9sf/EsW
	erEqfY8Knv099Kd6+Dyz3TnT9q5ZmoEfJcYoULfygd93K/nvNPabJcWkauKZyq6RcRew4R6bJ5gFA
	f/ok0YEVnJ7I39KXT3rh4p5G9uQ7N8aby6AC5F5jhPjbCbUjAscOIc6xQ0Lvv3XlUONl1JR6+tMQN
	DR6KU9br/3KMzUfXzdCsWUw49suo2nVwpa9OG3T2vU8+SGYpknSTRpDQF/KuYACH0pvZlXFPzR/wN
	agfxHDF0SyjOw2jv7MUhpE0zie4J9X8fbVnRzwHleiDp7c33RqzKhe2ilS19LrWNmm0WKNgTjkPZ/
	RzRNJmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smfk2-0000000DZrv-21qj;
	Fri, 06 Sep 2024 20:39:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smfjz-0000000DZqo-0Y7I
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Sep 2024 20:39:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868cfTe009882;
	Fri, 6 Sep 2024 20:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yEoVE9ezRV0k1GaCT9ts1NI1+qQ8GsKIXa5rBQHMqQ=; b=S7rHxfJI+5bK9ckN
	M7P7xlZOtzanGqUXY+IhJBUwwdbxSbK17ZAylpnMCawJxKQcnpUOo6MwsdJPNRsT
	iY9X5/dCx4rtj/FfhYHz29OT65oOFjJe6qhR44HMtbQsihtCZBXsW487+JsW/wDI
	Eh/9amAT48WkdkQ3c7yTw2XnAAX4vbqcX6bK0DAg6Nipx472NyQzhqeRf1u6qLgA
	TvSgPpKAjBWrlU58FcGCfsxwIoEfmV7T06kgf/juv+tIv10dFmV8axj8VqWmVEnX
	c77PKa0oGA7TR5BUjh8qzhTa+mlmEnFdfD72ijQu+cG9BjDb9pZq9kSFR9qhyv+l
	XA0oJg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwruc6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 20:39:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486KdJ5E000469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 20:39:19 GMT
Received: from [192.168.143.77] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 13:39:18 -0700
Message-ID: <4d28f099-137f-b9b8-463f-40ec2a745694@quicinc.com>
Date: Fri, 6 Sep 2024 13:39:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] ufs: core: fix the issue of ICU failure
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
References: <20240902021805.1125-1-peter.wang@mediatek.com>
 <20240902021805.1125-2-peter.wang@mediatek.com>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <20240902021805.1125-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0FqclmJWzZByE9vdHfYZGWJeAXKgRavN
X-Proofpoint-GUID: 0FqclmJWzZByE9vdHfYZGWJeAXKgRavN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=936 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_133935_213520_9F8998DF 
X-CRM114-Status: UNSURE (   6.32  )
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

On 9/1/2024 7:18 PM, peter.wang@mediatek.com wrote:

>   	/* SQRTCy.ICU = 1 */
> -	writel(SQ_ICU, opr_sqd_base + REG_SQRTC);
> +	writel(readl(opr_sqd_base + REG_SQRTC) | SQ_ICU,
> +		opr_sqd_base + REG_SQRTC);
Hi Peter,
Instead of readl() here, how about write (SQ_STOP | SQ_ICU) to SQRTC?

Thanks, Bao

