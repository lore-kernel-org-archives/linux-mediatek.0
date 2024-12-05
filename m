Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2556E77171
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=213mBrUk+y/1ibPAKpU6OsCBJaEAPIxeYJYRsyQLYbY=; b=rjpF/5nJDwfoWqnKCT3vhEba/n
	hsgw3e3Tue/QGf+SyWEx6yiDOxMg0/mMyymCGccCrR0cYJ9BJ9DozL4Bv4Z7HWTMjxNtAjVe2DfSn
	B0bq7dFUebtAnSayK0K/v3+3rBTCGzOBUKLYhc/h6/BbbicXsmqVWFyefwQclmxNVJEtIvxak0pUC
	yrK81ICNG/B1Vl8HFzNJrzoNxJwToShUhPIIBSAPq049YRgekLtTpjQ3ud1DidysTGjPWMoIWBzGl
	7RmymHyUfF7kLYPy5V6w/sb85ByiHuLJc2UYGcO3juB0LTOi/jj4jvl5se7FKuezWHhsMfF8X/wMz
	MxHnRYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7Md-0000000FCX1-3dG9;
	Thu, 05 Dec 2024 08:37:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7Mb-0000000FCWN-3gqu
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 08:37:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4LxkhO025995;
	Thu, 5 Dec 2024 08:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	213mBrUk+y/1ibPAKpU6OsCBJaEAPIxeYJYRsyQLYbY=; b=dK0lvjtG6ep82U6v
	O+DX8WlahlhTpWMVNB2lo+NaMThOr8266xF5D94B18Jjh3fUzFp7FpUnauq1R7qz
	LA2EdZRmGKTNNOjLBeUwG/L4a9Iw2AMF2060yI9R8I0EcrgfMjT5lftee8FnlNfR
	mKJGN13l8WqW83s5jJYKj/976i7VEnMaZiJ40tifxpS329tNJllJU4lrHllbarQZ
	WsLqA0+c8NEJm9HU7WG3rEgmlryRT+/I1N/+5xKTy8CHgdyfdZ2nUDzwKnuaC+rn
	3wdFKra2MGDmGsgg+FEITJ1AmKb9Wg0ZePiYrJxRQiJmtSmiqSLTsvCPYmyKD1UG
	EzXezQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9pbau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 08:37:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B58bGIs027939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 08:37:16 GMT
Received: from [10.253.36.87] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 00:37:10 -0800
Message-ID: <ac42e652-4128-44ea-976e-5234360d8183@quicinc.com>
Date: Thu, 5 Dec 2024 16:37:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Zijun Hu
	<zijun_hu@icloud.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        James Bottomley
	<James.Bottomley@hansenpartnership.com>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
	<thomas@t-8ch.de>,
        <linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>,
        <linux-sound@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <linux-block@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
        <linux1394-devel@lists.sourceforge.net>, <arm-scmi@vger.kernel.org>,
        <linux-efi@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <linux-hwmon@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <open-iscsi@googlegroups.com>, <linux-usb@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
 <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bJlz_v1qF-bCF6eUa5_F4ikzt3TVpUVI
X-Proofpoint-GUID: bJlz_v1qF-bCF6eUa5_F4ikzt3TVpUVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=575 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_003734_038778_8E2415F4 
X-CRM114-Status: GOOD (  11.23  )
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

On 12/5/2024 4:10 PM, Uwe Kleine-König wrote:
> On Thu, Dec 05, 2024 at 08:10:17AM +0800, Zijun Hu wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
>> Remvoe the unnecessary wrapper.
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>> ---
>>  drivers/gpio/gpio-sim.c | 7 +------
> 
> I think if you move this patch before patch #4 in your series, you only
> have to touch this file once.

the precondition of this change is patch #4, it will have building error
if moving it before #4.

actually, we can only do simplifications with benefits brought by #4.
> 
> Best regards
> Uwe


