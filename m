Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AD8CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3ziXwQnsWu63lTCY+rxXmBhjn/j4cxz31lGji6ElRk=; b=H+5d7WmdmQAGLOEJYCNOtHr1Dl
	rHxjoVtfW4MgQF0cvhTf9R7NhhkwfWikalgiGSlL2E/xRyrW5kzP9/AFDpzlTDHrBDthjFTr9f8tt
	yZbw98+MVKZ+iRplTYqIQgqvImYDfFZy9S0QRCXRXcLlu3bmISHDYac4U/lgqyAVeXG/qffxUrrn7
	HKVMTVhEfL9s0OVAG8PmjUSr0t99xb6qpvsD0qGh5GbTZ2fOowPNb2xeGOGdciAy9jj4ljj3z1rBg
	fhtYOuTOCB9fpMfl9a9q0BDr0I+u7D6+QH7ailktENdYRQsnuzJPqsNertg491rUVp6G/SGSw1B4i
	imKSXIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzPm-002gE0-2P;
	Tue, 12 Sep 2023 09:10:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzPj-002gCC-2q;
	Tue, 12 Sep 2023 09:10:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C91QlS005312;
	Tue, 12 Sep 2023 09:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=M3ziXwQnsWu63lTCY+rxXmBhjn/j4cxz31lGji6ElRk=;
 b=bP+ahzVfaI9vM1U5xUIV+fFCDB6oZcY3d4WdvA3O7OJA1h9YLELG62NqiPud8w0HL9du
 tE2XEtqYYZOBBdwhygKBUOUv4O2q8O7uHg0G19jCeb9ZlJDMvVgFSNuQ47v54cS7SLjC
 w6508zArjv7dJNdPcTgVUfNyH8xSvJ73RD9CorsbCfo+9RP3eu3PAxCdI+YhXsqHJVyw
 vzLHw8sKqSoRpQItloULC2S6iFblGYh43Uus0BHxR074wBcLQaxSE1RJjjt5McvOsXoS
 5bTM/uJ/YRVLglH3XAxu0AhGV/LievQmPQ3dVBPr2O5d7AjmQ2vHhErfqBYIli2FSfaU JQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t268fhwhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 09:09:50 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38C99nkj006026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 09:09:49 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 02:09:37 -0700
Message-ID: <88a80eca-62c0-8398-323e-d1c1cd7adc8f@quicinc.com>
Date: Tue, 12 Sep 2023 14:39:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [REBASE PATCH v5 15/17] firmware: scm: Modify only the download
 bits in TCSR register
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>, <corbet@lwn.net>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <quic_tsoni@quicinc.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        "Poovendhan
 Selvaraj" <quic_poovendh@quicinc.com>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-16-git-send-email-quic_mojha@quicinc.com>
 <9da888dc-401a-4cbb-b616-b4654fa79e35@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <9da888dc-401a-4cbb-b616-b4654fa79e35@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TxONeWbezp3uJ16nJp3vXiiAcAvKJMpZ
X-Proofpoint-ORIG-GUID: TxONeWbezp3uJ16nJp3vXiiAcAvKJMpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309120077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_021031_922549_934FFF49 
X-CRM114-Status: GOOD (  20.23  )
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



On 9/11/2023 8:37 PM, Kathiravan Thirumoorthy wrote:
> 
> On 9/11/2023 4:23 PM, Mukesh Ojha wrote:
>> Crashdump collection is based on the DLOAD bit of TCSR register.
>> To retain other bits, we read the register and modify only the
>> DLOAD bit as the other bits have their own significance.
>>
>> Co-developed-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> Tested-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com> # 
>> IPQ9574 and IPQ5332
>> ---
>>   drivers/firmware/qcom_scm.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index 321133f0950d..5cacae63ee2a 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -5,6 +5,8 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/init.h>
>>   #include <linux/interrupt.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>>   #include <linux/completion.h>
>>   #include <linux/cpumask.h>
>>   #include <linux/export.h>
>> @@ -26,6 +28,14 @@
>>   static bool download_mode = 
>> IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
>>   module_param(download_mode, bool, 0);
>> +#define SCM_HAS_CORE_CLK    BIT(0)
>> +#define SCM_HAS_IFACE_CLK    BIT(1)
>> +#define SCM_HAS_BUS_CLK        BIT(2)
> 
> 
> Is this intentional to add these macros back again?

This is a mistake, thanks for letting me know.

-Mukesh
> 
> 
>> +
>> +#define QCOM_DLOAD_MASK        GENMASK(5, 4)
>> +#define QCOM_DLOAD_FULLDUMP    0x1
>> +#define QCOM_DLOAD_NODUMP    0x0
>> +
>>   struct qcom_scm {
>>       struct device *dev;
>>       struct clk *core_clk;
>> @@ -440,6 +450,7 @@ static int __qcom_scm_set_dload_mode(struct device 
>> *dev, bool enable)
>>   static void qcom_scm_set_download_mode(bool enable)
>>   {
>> +    u32 val = enable ? QCOM_DLOAD_FULLDUMP : QCOM_DLOAD_NODUMP;
>>       bool avail;
>>       int ret = 0;
>> @@ -449,8 +460,9 @@ static void qcom_scm_set_download_mode(bool enable)
>>       if (avail) {
>>           ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
>>       } else if (__scm->dload_mode_addr) {
>> -        ret = qcom_scm_io_writel(__scm->dload_mode_addr,
>> -                enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
>> +        ret = qcom_scm_io_update_field(__scm->dload_mode_addr,
>> +                           QCOM_DLOAD_MASK,
>> +                           FIELD_PREP(QCOM_DLOAD_MASK, val));
>>       } else {
>>           dev_err(__scm->dev,
>>               "No available mechanism for setting download mode\n");

