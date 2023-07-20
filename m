Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB2EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FYnhndaHLlAGmLEwmFnlF+PlGmmJDrC7zOccjmvv0Ig=; b=A0h5c9m4+QWvSNpcDHEYDKPpew
	L8hzFLbSEVVNLtnTHIBA5ybKcNWOsEpqKc8dvrNnp29a4frhjrLwt2IwI7jxYeWpCfQcH+mW7by8x
	9sCXPbzFOdWWAPQREMsjOn0wDtuZ6Hq4ZYo6OhehLIepfFwQF8M33Xxnm6EvwiTAO4DPUv3nsLexF
	NBeob4YtliRdVuC6RaUO6G5tI5Bygn9q53hNroA0DzhBCsx6RmPa+t7RX6CjBfXdMyTBdI16ga1C5
	2ojSH2GNkz8JGcCNx78DgIJ1jTHPL8xh8HCvQedwEUAjkGwlYdBfI3g/XWI1sjO0wxF9836L58CeG
	2j2zKXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVAx-00BTKJ-0S;
	Thu, 20 Jul 2023 15:02:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVAt-00BTJA-1n
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:02:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36KDvC0c015644;
	Thu, 20 Jul 2023 15:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=FYnhndaHLlAGmLEwmFnlF+PlGmmJDrC7zOccjmvv0Ig=;
 b=bNJZCV8km0MA3TGnvB7XAF0q4+WBwSqzYX+OxOHh1hHroP/y70LKurGGuB6/s9N7b/pr
 NeSGxgMxOqD9WCxFKisALmobilS8zbscpjlYLyjGEs0+ClXL5qUuuvGb5gLHs89xIlpC
 pP1c2651viN0x9iYYfBR7HVz21KdvVbNKxcoiYqZbeigvJzoznw+eWPlz+YplEOxNsXt
 t1N8DwVphtkBAy7I1DF/YXjfahhbRE6wwaAUiHPirwDHb6pUbIdlgh6OQHLZRCBVu01y
 5P0UD1j3bIz/v7VoJBo9BV4BYuel5cZz1WkfUfgn2HUFo7GB/K0KX5uFQw2IIHKk4w6+ hg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxup4he6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 15:02:31 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36KF2UZK013352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 15:02:30 GMT
Received: from [10.216.27.20] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 08:02:28 -0700
Message-ID: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
Date: Thu, 20 Jul 2023 20:32:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: <linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>
From: Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Feedback on Qualcomm's minidump (debug) solution for end user device
 crash
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AxElWK3GY2mplQQdNjQr_H9fI-OmIpbb
X-Proofpoint-ORIG-GUID: AxElWK3GY2mplQQdNjQr_H9fI-OmIpbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_08,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 mlxlogscore=553 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_080239_739809_3CFAED83 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi Samsung/MTK/Any other SOC vendors,

This is to bring to your notice that, we (Qualcomm) are working on 
upstreaming our minidump solution which is to address the problem of
debugging on field device crashes where collecting entire ddr dump
would not be feasible and collecting minimal data from the ddr would
help in debug direction or even help in root causing issue.

We have recently posted v4 version here [1]

Based on comments[2], community is more worried about, if each SOC
vendor come up with their own dumping method today or in future and
whether it can have a common solution to a similar problem faced by
other SOC vendor.

We wanted to take your feedback if you also encounter a similar problem
or maintain something similar solution in downstream which can be 
upstreamed. This will help us in a way to have a common solution in
upstream.

[1]
https://lore.kernel.org/lkml/10dd2ead-758a-89f0-cda4-70ae927269eb@quicinc.com/

[2]
https://lore.kernel.org/lkml/CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com/

-Mukesh






