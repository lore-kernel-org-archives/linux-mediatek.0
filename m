Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D384FC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJXJQMuOdiarbyL2e/unM5fhQaATDSOvWOg7yDBrtzY=; b=BMlqNlO2XRfkPKqeJT/ikD9tYe
	A6Dj1Y0LHA4L4VntN64KI2GLgPGOZE/e/K6lJzSRZIrOpSs3uqrsKEUdz4+TX/xJ8DaUTmaKtMNls
	7WAIv60/JQ0x3OqbNNTu+XrL6FTAuCYmquHjQMCmPf5yUzaBu0EFUGB7h7q79qrDeTCHMinJwrO+Q
	sWtqV3Wz/FkpSLf0CsghWT4dbgL39m5q+LqeFsTUikM91VdbyAMESH9sZ3WvHwAEtwPsAB5zS3HBp
	g/Mat6dnA7X+YPQtPJ3k2TkA56A0b1R9sD9hyUxFjRO35CFknHgaG/j5JrJtK7Mkm7s6LYtt7SDBd
	JxZzPCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZYd-0000000DKfv-3lde;
	Thu, 02 May 2024 16:45:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZYa-0000000DKf8-0hVq
	for linux-mediatek@lists.infradead.org;
	Thu, 02 May 2024 16:45:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 442Fsr57022735;
	Thu, 2 May 2024 16:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pJXJQMuOdiarbyL2e/unM5fhQaATDSOvWOg7yDBrtzY=; b=cn
	UMJNR6uQUXcDg+5WCS16TQn0WMmz2/j/+lTP/mIM/LhODuMOb2JOo5zegoDxfkzy
	V4GNB4KRRlOaIo3RFZo85WEpdUdGhQwqjdyxt2OY61AEihodACvCyDjlCZbSAakX
	hUG15oY78yvIshCooqIPwItEdsHqCJB8sr6bPMGPHNIVlbrMCtzIK6805WcLUAJQ
	RfjhcV7SmsMjS7KFrr5JV8FSXHXQxKsh9BJ0SA0+VHnrzQHlqTcn2j09NsmZ1fRX
	k59peE9eMozgIoFvYnC+VgSCAUbC8C7Cuu1UxUle7knMT8vvbhVQhTBIoGRBFraM
	2Z7h1z1mGbd+3yAYUZgw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xv7pxh0kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 16:45:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 442Gj6Wv025134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 May 2024 16:45:06 GMT
Received: from [10.227.89.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 May 2024
 09:45:05 -0700
Message-ID: <a840697a-3f58-1c0f-2ca3-66b04686c529@quicinc.com>
Date: Thu, 2 May 2024 09:45:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: mac80211: Update bssid indicator with real BSS
 numbers
To: Johannes Berg <johannes@sipsolutions.net>,
        =?UTF-8?B?QWxsZW4gWWUgKOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: "lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>,
        "nbd@nbd.name" <nbd@nbd.name>,
        =?UTF-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>,
        =?UTF-8?B?TW9uZXkgV2FuZyAo546L5L+h5a6JKQ==?=
	<Money.Wang@mediatek.com>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
References: <20231208063820.25983-1-allen.ye@mediatek.com>
 <65d21336e8f7e180352403a3e894aeaf27a22cab.camel@sipsolutions.net>
 <c23373d71eff81ea043783edff0345502bb2e299.camel@mediatek.com>
 <757f417d63a750e84ab883b500becc2773e9ff17.camel@sipsolutions.net>
 <e9c1c8fb20c39ed158f11a6152dc594de6073726.camel@sipsolutions.net>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <e9c1c8fb20c39ed158f11a6152dc594de6073726.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cc96HrOslscHqjv_rey_h5jYv-z9wX2c
X-Proofpoint-ORIG-GUID: Cc96HrOslscHqjv_rey_h5jYv-z9wX2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-02_08,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 mlxlogscore=715 phishscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405020110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_094516_319254_9D12F34F 
X-CRM114-Status: GOOD (  15.39  )
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

On 4/23/2024 4:28 AM, Johannes Berg wrote:
> On Tue, 2024-04-23 at 13:21 +0200, Johannes Berg wrote:
>>
>> Anyway, I think I agree, but can you please add some validation of this
>> to cfg80211 as a first patch
> 
> I guess I should say what kind of validation? I think it'd make sense to
> ensure that the elements even exist/are long enough (currently there's
> no validation in nl80211_parse_mbssid_elems at all!!), perhaps call
> validate_ie_attr() there as well.
> 
> Feels like something should also ensure that not only is
> 
> 	config->index < wiphy->mbssid_max_interfaces
> 
> but also actually < 2^max_bssid_indicator?
> 
> johannes
> 

I agree with the validation concerns.
But the actual logic in this patch is valid, although considering we 
have had this code for so many years now, feels like no driver/target 
actually needs this field yet even though it is used :-)

