Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB05C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 19:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3v8Fkd4+FNP10PBahzQd1I40VWFHFO9GBoCNZvPzvOI=; b=am7tz4SclxIn/z2I/irqmhUU+s
	zp4EMl7Xv7w5YZVaNo+/pIDhjY0+n7l3zkBPatUi5nI5WDnQ1DQTJGhRR9KJv2mHzHndfQKOuTJnh
	75nIHOC4yyK79N48BfqUrN7/vdhDD0H2pLLIH+jAtcA4/M9hFlyP1333Cm3icAEig8EY2EVNDYYS+
	tF1FflofbUEaIgZLGi5cWo89Sm7ibu8xD73LSTO+/IwMn5E4FzpbVITsw1Vt4T8iJ/Y+saGR0BF06
	LdxRg2BCABiOR7iAt6uJ/JYwkO+Bnx7QmAsZzTuIi/h2I6qbwUhph9kXEpvFZ/PiynvDIMhTz/8ea
	8nlLGC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLZM-00000001Eyq-2V6Q;
	Tue, 23 Apr 2024 19:12:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLZJ-00000001Ewp-3Pf9
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 19:12:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N5eqB5027978;
	Tue, 23 Apr 2024 19:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3v8Fkd4+FNP10PBahzQd1I40VWFHFO9GBoCNZvPzvOI=; b=Mf
	SPOj59ZUILU8VFfRyL8b79Lr2DzJcfK4003t1zMLxJH6azxonjCXbXE1L81EfQbH
	VCiJRDeKMPdIDDflMuxR0UUQcS6fpOCWxx2Zgn0Tn9ubY0QGEAmxTfvQDMcA/Fqz
	dlvLFRCj73WpNcvLdJ+DPndGk4ZXA3Fyd6RJxRU/9v8w3P+0v6vRqVmOnHfRjWos
	Z0cZTaqrhJZstSE66njZfp8VloKmJtyAzJ2TaL2q2174PCL42+Oj8a9Q4XoqbOmj
	qjcK8uJhUnsTBeL1XORFe9j+OtYdw+APkuBcXSGqMzZx0nZZbHQzezGdOMyG99sh
	T7L3lv288P32DsotLUgQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnvtnbcwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 19:12:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43NJCYNI017115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 19:12:34 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 12:12:33 -0700
Message-ID: <7587ecfc-e580-488f-b74e-20e2c115df93@quicinc.com>
Date: Tue, 23 Apr 2024 12:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: mac80211: Update bssid indicator with real BSS
 numbers
Content-Language: en-US
To: Allen Ye <allen.ye@mediatek.com>, <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        Evelyn Tsai
	<evelyn.tsai@mediatek.com>,
        Money Wang <money.wang@mediatek.com>,
        <linux-mediatek@lists.infradead.org>
References: <20231208063820.25983-1-allen.ye@mediatek.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231208063820.25983-1-allen.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bLOI3Jz49yo95IjSGPRxuKPJloMHG6rJ
X-Proofpoint-ORIG-GUID: bLOI3Jz49yo95IjSGPRxuKPJloMHG6rJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_16,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=663 phishscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_121242_005976_F9A28300 
X-CRM114-Status: UNSURE (   7.23  )
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

On 12/7/2023 10:38 PM, Allen Ye wrote:
> The cnt member in mbssid is the count of total number of MBSSID elements
> instead of BSSID. Therefore, we fix this by reading the MaxBSSID Indicator
> field directly.

Commit text is much more readable if you somewhat follow the guidance:
Describe what the current code does.
Describe the problem with the current code.
Describe how to modify the code to fix the problem.

And write this at a high enough level that a manager can understand :)


