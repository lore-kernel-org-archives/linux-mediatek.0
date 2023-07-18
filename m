Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C34EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4aFhIjxVMxGJfHdqhVOitR6a0is1pZJhwNJv3QtgGU=; b=M5p2tpDoLy3BeW1jj8Zwk2du51
	R50YXXxCAQq1IRjBbf9JihV/vcibYNbCBWdwl1f9qXYCU+8DxKeVKXcY17PDpge4h3kHRk6U8Iro0
	oNheiJQit/+qVvrfFHiWBVeSYnm+aS9dav7Z5SiBDXx54e3yinCJnACTvCT9MVmeax7WfNmmxe+l6
	ETrtaSxkFF8x7AJTX8IsIni2LnoBzBG4FpdP1m1ML7zdxjDBCT5d0IhsE6eTZdP8EKJAqsPc9kYij
	73n2kscdHWiFnewtmj4qsLtmlTk4medHblQ+Ja2bK/L1mV8h5TsDkUZWpBojX6l1FpPt9MrmCvOS4
	+pj6vyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzqF-005LRc-0w;
	Wed, 19 Jul 2023 05:35:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzqD-005LQX-0f;
	Wed, 19 Jul 2023 05:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z4aFhIjxVMxGJfHdqhVOitR6a0is1pZJhwNJv3QtgGU=; b=Mv+XCRmK3hFN75Ar5KcsmygOvY
	/lNM+ktxV8SSprH6Nek+uheb2djZZar/tH8arT9N2Wspp1F5nr/XcOK1n2e+h1NvfApU0vtxXs5Ha
	UUKxSgSkEmNqMI0Kz14lMY9LnAKt/Rpk7wjJGPl3H9VouuFslqcwmFvAEqUVlAVM6kpSxx4kXErH5
	OY10kypc48ab7kW6VS/wSJ8e/vKXnO2gNP8U4kREx307LcJxmdtB6dd1VjkOYs04t3h+fRuExFScr
	JLSWqazrd+dUv0JPb3uAyNuRGmljvkU3FnRhSL9ocMYv2E1WImhI9+gq6T12sBTh3RdvvYAKoHNbZ
	dtRJrQPQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLlC8-00BblN-1E;
	Tue, 18 Jul 2023 13:56:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36IDU7Wf001135;
	Tue, 18 Jul 2023 13:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z4aFhIjxVMxGJfHdqhVOitR6a0is1pZJhwNJv3QtgGU=;
 b=UcSPCSoHE8vGoi6AqYWoryWfW8P65MHmY0i5KgIAqSfLCpajarOVNrGGT4xq5ydQk74R
 RsnkfJt4nUxbKaDw+7d92mUjEOVxt/0adm3Utz8t3+FZmUkRwmgfK+0sUUHlJfCThVDq
 VZEoEeKMndcztNC4W+bQIVV8JJOWgoBusWLBjSLpCEpej2C8ceuPZVjk8Jhn5ZUVLjuh
 cH0x9SaH6c8dHe6QXiAHuU5+9bdk7OCNQnYA+3++LcUj6DEBIwaWjyjq79Q5aUD1mTnb
 f88KRGqnuqmA+ASVymPWlWK14+4mGQ79gC4bv2TtwXCsy+L4teZSO5ddYSauyChowu7X dw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwn90922f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 13:55:30 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36IDtSvU008977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 13:55:28 GMT
Received: from [10.216.47.173] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 06:55:19 -0700
Message-ID: <c8064592-bfac-67b4-1d7e-e173355c43f8@quicinc.com>
Date: Tue, 18 Jul 2023 19:25:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related
 support
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <andy.shevchenko@gmail.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Linus
 Walleij" <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <2023062814-chance-flounder-f002@gregkh>
 <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
 <CACRpkda3CJ7G4-wDPkWmzg6nyCoEfG+u2cQH6KXWNjbftd90ow@mail.gmail.com>
 <355de4c7-180d-4edd-b6fd-9c8e29e40e42@quicinc.com>
 <52650970-de78-764f-28e2-ee0115b7d5c6@quicinc.com>
 <e4784d1c-73da-9cda-6aef-d02625e8efd2@quicinc.com>
 <2023071833-clamshell-drinking-188c@gregkh>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <2023071833-clamshell-drinking-188c@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aFsIH2wYgPAvprvaqDn3SRli11RB6z-q
X-Proofpoint-ORIG-GUID: aFsIH2wYgPAvprvaqDn3SRli11RB6z-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_10,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=973
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145657_933401_AD66E50C 
X-CRM114-Status: GOOD (  12.18  )
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



On 7/18/2023 7:05 PM, Greg KH wrote:
> On Tue, Jul 18, 2023 at 11:17:12AM +0530, Mukesh Ojha wrote:
>> + linux-samsung-soc@vger.kernel.org
>> + linux-mediatek@lists.infradead.org
> 
> What does that do?

This is to seek their feedback, if they have something similar 
requirement to debug end user device crashes.

-Mukesh
> 
> confused,
> 
> greg k-h

