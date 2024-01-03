Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29549C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu8lunzViOUpOfegZsY+Z05a/poHdYSCSroiiueke/4=; b=bm1LND+YVENrb88tdr4CnDm2nS
	NwXwO11yUuofAvwEjaWuTM6xZtl4bNi0W76Ng/lqmMmFr13FtsBOUlkF8myeAReYt33LeviOsSM43
	vszcf+8Ww50Hjh4z/7TNbJYowinyPPw7txKbVRiC2lNXiMIORt4nxfbDn8J60skoevBE0hCtxQRip
	NfWH75V/3HWT4bluD+6EKj99nJKMEK8dU0QOutxSGhS3J22LjvKyIXB33hsuEjTQO3xGiFyU/hX1Q
	asvFTqqrd4OrA+82y8E2QgckWNBOpzrEChBGOg9Wt5g8L/Fsi2fz+ZP8+VumndnbqZVDHNRmaPNSx
	2wZtEbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3AQ-00BFyY-0e;
	Wed, 03 Jan 2024 15:28:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3AN-00BFxl-1N;
	Wed, 03 Jan 2024 15:28:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 403DlAVu001467;
	Wed, 3 Jan 2024 15:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Nu8lunzViOUpOfegZsY+Z05a/poHdYSCSroiiueke/4=; b=BB
	z2ctHSJD5dquHTYRfOF1AtFzzDiAGhOtvEXPnoGkGSSys0dg3J2a1lkPCqOVLCQ2
	cpXHWWf9EJEcP7zO7SNQGvCXsFgWJF1xSYmjfV0xhUogTTxrM9VyeyZeC2LSJdwd
	ZPR/8gnpoDdbEFb03FMC602ms+bbciRyAMd71Tk3NhNEHTvjFIZhoovyx48GL8Ho
	mnMSZsJ2ieM+nP54aTQMzoCzkkjoq89m9b2gdA0oM9phOslVmEScO0sn3fREyUGo
	kcYlpiqA4pVUne7jfLzmCm7WaOg6TXhgWe6muJDeaItueS9pNeFlWn9GCTbzhsnP
	SXlf9BvoRZnzQGxyNDgA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd8dpr8pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 15:27:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 403FRiTq029569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 15:27:44 GMT
Received: from [10.216.8.10] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 3 Jan
 2024 07:27:33 -0800
Message-ID: <520e377d-e990-c185-4a20-07806873e506@quicinc.com>
Date: Wed, 3 Jan 2024 20:57:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RESEND: Re: [Patch v6 03/12] docs: qcom: Add qualcomm minidump
 guide
Content-Language: en-US
To: Ruipeng Qi <ruipengqi7@gmail.com>
CC: <agross@kernel.org>, <alim.akhtar@samsung.com>, <andersson@kernel.org>,
        <bmasney@redhat.com>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <gpiccoli@igalia.com>, <keescook@chromium.org>, <kernel@quicinc.com>,
        <kgene@kernel.org>, <konrad.dybcio@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <matthias.bgg@gmail.com>, <nm@ti.com>, <robh+dt@kernel.org>,
        <tony.luck@intel.com>, <vigneshr@ti.com>, <qiruipeng@lixiang.com>
References: <1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
 <20231225135542.1789-1-ruipengqi7@gmail.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20231225135542.1789-1-ruipengqi7@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Eq10y8K3OI3Kx2Zzds3mwvzzBPYT1-u_
X-Proofpoint-ORIG-GUID: Eq10y8K3OI3Kx2Zzds3mwvzzBPYT1-u_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=826 adultscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_072823_512301_8DB9CB03 
X-CRM114-Status: GOOD (  21.98  )
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



On 12/25/2023 7:25 PM, Ruipeng Qi wrote:
> <+How a kernel client driver can register region with minidump
> <+------------------------------------------------------------
> <+
> <+Client driver can use ``qcom_minidump_region_register`` API's to register
> <+and ``qcom_minidump_region_unregister`` to unregister their region from
> <+minidump driver.
> <+
> <+Client needs to fill their region by filling ``qcom_minidump_region``
> <+structure object which consists of the region name, region's virtual
> <+and physical address and its size.
> 
> Hi, Mukesh, wish you a good holiday :)

Hope you had the same..:-)

> 
> I have the following idea, please help me to assess whether this can be
> implemented or not. As we all know, most of the kernel objects are
> allocated by the slab sub-system.I wonder if we can dump all memory
> keeped by the slab sub-system? If so,  we got most of the kernel objects
> which will be helpful to fix problems when we run with system issues.
> 
> How can we do this? From the description above, I think we should
> register one region for each slab,  for each slab will have some pages,
> and the memory between each slab is non-continuous. As we all
> know, there are millions of slabs in the system, so if we dump slabs
> in this way, it will introduce a heavy overhead.
> 
> I am not very familiar with qualcomm minidump, maybe my thought
> is wrong. Looking forward to your reply!

In the current state and in simple terms, Qualcomm Minidump can not do
this, Minidump is more of a consumer driver so, what ever gets
registered with it, it can dump. Qualcomm Minidump serves bigger purpose
to dump content in any kind of crash whether it is kernel or non-kernel
like NOC errors/XPUs etc and both kernel/non-kernel entity can register 
to it, so we gets dump in any kind of system crash.

One more thing, kernel part of minidump, we are calling it APSS Minidump
has limitation of no of entries so it will be difficult to dump 
non-continuous regions after a certain number of registration ~200. However,
we do have a solution in downstream kernel for it like to create a big 
CMA buffer and register this buffer with Minidump so that whatever gets 
dumped in that buffer gets captured during crash and fill up this buffer 
and create elf during panic. I think, similar thing you are also doing 
with your OS-minidump.

I have just glanced into your implementation of OS-minidump, it
more of relying on basic concept of RAM content preserved
across boot and later reading it through procfs but this basic
stuff is common to pstore(ram) as well and pstore has file system 
support why don't you make your driver as one of pstore record and that 
way Qualcomm minidump also gets benefited where entire OS-minidump 
record gets registered with Qualcomm minidump and we get this on panic 
and you get this via pstorefs.

-Mukesh

> 
> Best Regards
> Ruipeng

