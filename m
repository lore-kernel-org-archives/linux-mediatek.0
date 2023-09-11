Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B02EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 06:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR5dflBIS+AjZvT9GMXk42NHZjPTycEkvcZES8b7aR8=; b=dU3Tjqe4ycpFFiW/aumolNsxNU
	RWWNGbGPUJwmFjEc9Id3uDN4rEWQ6aukrqN1y/TWXOgh1yTng7wHeHhLWFRZP9W9IwDPVwLRq1Atw
	szo0RtzzvA8wvFj8AKmDIywks7k/5PQqgn1ZDv79blgkcxUfcEWmRCXJfvFC9juFQi8oz6b4crigx
	B/xbyGXAbWUpPf1C9OLl1GaKS9pcwDAyXrMpOUmI7zk7MU7Y/uJTUja7fhn1Yyw6dEXXHO3d8B6yo
	C+zd5YWo+0cO7XJAolvuWgubJOq/GZvJoTrxgBiK5TOTyHTleBti8xaA8LxcUKtLgBGhDXiT+YQBx
	tAY0UlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfZzk-00HIKQ-18;
	Mon, 11 Sep 2023 06:02:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfZzh-00HIJm-1X;
	Mon, 11 Sep 2023 06:01:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B5e8Yt002248;
	Mon, 11 Sep 2023 06:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=RR5dflBIS+AjZvT9GMXk42NHZjPTycEkvcZES8b7aR8=;
 b=N+NsLtqFvZRHWyRg/h2XVaRehmpL94AQJXG/AjhjOHjvMn9a6Bc+s9nQ6NiD1lnz4hKo
 fQ8Vv/yTiSC54oq8pWcTrZ0FwVAniOCIjV9dhIYcwCY9xkPgtxFbJMJ5MDmAntSgoB5u
 X7ENsQDEry+P0F8K2jDmJPwq0Xy7WJlhN4/LrTDuuwQ1BN4TZvcdqwCecdW9ozy7ramT
 meSXsO3MCItDNHRfx41CnS19fFAQgMdLFyAX5UCOv+18yhHW3GeBlbJPYisuZsQuyn3r
 jvfudDKO126JFYBnDGWr5P8X7lLimOcH0T1eUrn3svDd5uTpOrajghuRormce2DHmXGY aA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0j0fjrv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 06:01:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B61URt024641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 06:01:30 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 23:01:18 -0700
Date: Mon, 11 Sep 2023 11:31:15 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <quic_tsoni@quicinc.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [PATCH v5 11/17] qcom_minidump: Register ramoops region with
 minidump
Message-ID: <3119f3f6-92a5-4db1-85cf-bd16e31ae5a0@quicinc.com>
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-12-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1694290578-17733-12-git-send-email-quic_mojha@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xBrk-Pn9mM0MxC_5RsdRbWjljej3GIpW
X-Proofpoint-GUID: xBrk-Pn9mM0MxC_5RsdRbWjljej3GIpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 mlxlogscore=618 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309110054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_230157_523629_F404AD39 
X-CRM114-Status: GOOD (  22.49  )
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

On Sun, Sep 10, 2023 at 01:46:12AM +0530, Mukesh Ojha wrote:
> Register all the pstore frontend with minidump, so that they can
> be dumped as default Linux minidump region to be collected on
> SoC where minidump is enabled.
> 
> Helper functions is written in separate file and built along with
> the minidump driver, since it is client of minidump and also call
> it at appropriate place from minidump probe so that they always
> get registered.
> 
> While at it also rename the out minidump module object name during
> build as qcom_apss_minidump which basically depicts as Qualcomm
> Application processor subsystem minidump.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/soc/qcom/Kconfig                 |  1 +
>  drivers/soc/qcom/Makefile                |  3 +-
>  drivers/soc/qcom/qcom_minidump.c         |  4 ++
>  drivers/soc/qcom/qcom_ramoops_minidump.c | 88 ++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/qcom_ramoops_minidump.h | 10 ++++
>  5 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.c
>  create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.h
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 4b36d46807bc..b3977f1687d8 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -305,6 +305,7 @@ config QCOM_MINIDUMP
>  	tristate "QCOM APSS Minidump driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on QCOM_SMEM
> +	depends on PSTORE

Can't we make QC minidump available without PSTORE? PSTORE is another
cllient for minidump, so other clients can still use minidump right?
Where is this hard dependency coming from?

Thanks,
Pavan

