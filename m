Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4D0EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJRWy4EBcDX+2fQ69zfLKOyX3UcEFlR6a3yY/ct/VgI=; b=f+Mheb5Tq5oYNH19EOo9IcPRAU
	ACcX8R5JMy3dVQY64MgcrzysSSqN2kIxfE1yjf8QvyC2dSU0NMbUnS61Q7UggyX6aFVjeh4XatMdn
	LnHrQ5I/zL6yPlS9FwxIn3UxsLSRJUe8n8PaaqqTkrQVqwr7sE6UdbRecUJlZFeObSTZgZv/zl7ol
	eaCjp7cvBpp5cXaOKnT/Z3eWTSiV20zfs2R2RlEeQ7rvygaLBto+chUrbM/Htnt0XYKKLNHexjHXp
	UQ0L6N4+ofUX4O4AegYnzFlLzeecHALLClQUsDbTmpA9W5YWJErBMeZ08xtsbasUSQviE0mnxpGKN
	HqSE8Atw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc1X-00HW4x-2s;
	Mon, 11 Sep 2023 08:11:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc1V-00HW4Y-2D;
	Mon, 11 Sep 2023 08:11:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B6Kt4L029455;
	Mon, 11 Sep 2023 08:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LJRWy4EBcDX+2fQ69zfLKOyX3UcEFlR6a3yY/ct/VgI=;
 b=pEeFkUVCpv2qEzwfidDZAx+0LELN0qLyQHGgwmeRAFInM5TB/wWAOMXpGagZMheugZgK
 UCeRyBzoD6XKujNK89yflIxo6jsR95vB2Lt7K5O/OzDpMhcDYTKlq4QvsHPHxziq5YhG
 2at0lcMkm+kOtTVMfoC5sGuHqnIoKgsHgiWRUKi5Pw+2MtoHyPUM7zgYB4pmRbzcOC9B
 QnzXOZbJ47glnhA/n9OPPjB/Bhfpq8jx+X2aelu0g0+uvuTCX0sVPTuQYOwgpj+on8dN
 +Tg14HPjA6Cy91uGc0WBSZyto2fhNRb9nla3uo7PS36K7XBhp+qXXIkOS7hmnueqQeTA mw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1whx87qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 08:11:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B8BPhO007718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 08:11:25 GMT
Received: from [10.201.2.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 01:11:13 -0700
Message-ID: <9ab47979-e06f-475d-b1ea-239e3238b2d6@quicinc.com>
Date: Mon, 11 Sep 2023 13:41:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/17] firmware: scm: Modify only the download bits in
 TCSR register
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, <corbet@lwn.net>,
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
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-16-git-send-email-quic_mojha@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <1694290578-17733-16-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F8oJO76h15tpNbGss0yrj5eRmlvtP48O
X-Proofpoint-ORIG-GUID: F8oJO76h15tpNbGss0yrj5eRmlvtP48O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_011157_734838_553A493D 
X-CRM114-Status: GOOD (  22.69  )
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


On 9/10/2023 1:46 AM, Mukesh Ojha wrote:
> Crashdump collection is based on the DLOAD bit of TCSR register.
> To retain other bits, we read the register and modify only the
> DLOAD bit as the other bits have their own significance.
>
> Co-developed-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---


This change doesn't cleanly apply on next-20230911. Please rebase it.

Validated this change on IPQ9574 and IPQ5332 and system is entering into 
the download mode.

Tested-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com> # IPQ9574 
and IPQ5332


>   drivers/firmware/qcom_scm.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 5ea8fc4fd4e8..eda92f713019 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -5,6 +5,8 @@
>   #include <linux/platform_device.h>
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>   #include <linux/completion.h>
>   #include <linux/cpumask.h>
>   #include <linux/export.h>
> @@ -30,6 +32,10 @@ module_param(download_mode, bool, 0);
>   #define SCM_HAS_IFACE_CLK	BIT(1)
>   #define SCM_HAS_BUS_CLK		BIT(2)
>   
> +#define QCOM_DLOAD_MASK		GENMASK(5, 4)
> +#define QCOM_DLOAD_FULLDUMP	0x1
> +#define QCOM_DLOAD_NODUMP	0x0
> +
>   struct qcom_scm {
>   	struct device *dev;
>   	struct clk *core_clk;
> @@ -444,6 +450,7 @@ static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
>   
>   static void qcom_scm_set_download_mode(bool enable)
>   {
> +	u32 val = enable ? QCOM_DLOAD_FULLDUMP : QCOM_DLOAD_NODUMP;
>   	bool avail;
>   	int ret = 0;
>   
> @@ -453,8 +460,9 @@ static void qcom_scm_set_download_mode(bool enable)
>   	if (avail) {
>   		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
>   	} else if (__scm->dload_mode_addr) {
> -		ret = qcom_scm_io_writel(__scm->dload_mode_addr,
> -				enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
> +		ret = qcom_scm_io_update_field(__scm->dload_mode_addr,
> +					       QCOM_DLOAD_MASK,
> +					       FIELD_PREP(QCOM_DLOAD_MASK, val));
>   	} else {
>   		dev_err(__scm->dev,
>   			"No available mechanism for setting download mode\n");

