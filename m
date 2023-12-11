Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA50CC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrbNGKc9c8Hdepur86brTCu3qTE1i5488eCvql/PcFM=; b=31Fh9zdx4yxyqLpJ0ecVgQ54Qw
	+t+oZlDqArMKky50Nn5i5ATlHrKkUwVWd99QTUcXVwcVGtR75dVt8OnJCHxATRhc7loIJCMgdyh8L
	t3LaAQGaO+bw128sVkKXP/wSwpjrlODSBYNHwPtze4TW3jPeffYZqVibuo+XJMUxDfTc78p4e+rFj
	puMUN2wwU5Cc9jBHWE42U9NG17hhys40rH2PcMr44o7JMgy1/lQU99s3G9D28Vw2YXY/nItBG2g+I
	SWrOrm3t75HKWaZWVjZbj7bl/tqw48VylLexbiA8I23DmZ9szUYLo99TASpZU0Qb0eBf4jqqUM4Ct
	Pl0LAXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCd5W-004XnZ-0o;
	Mon, 11 Dec 2023 10:00:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCd5M-004Xka-2G;
	Mon, 11 Dec 2023 10:00:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB9HGKE006096;
	Mon, 11 Dec 2023 10:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	qcppdkim1; bh=HrbNGKc9c8Hdepur86brTCu3qTE1i5488eCvql/PcFM=; b=T9
	SQqgKTLxQOv/Ord+RYhfESXfSqgbkZwMQk2sThgpMBtdTs1apqJfqLcIf36eMDYS
	dx+HWjcCSq7WZsYS263zPPOu37en99xe0nghWoTAi9VUmi6LkrZ6qWaAu7GG4SBP
	jPVHsyVK287t9qR5fg/kM1ZCFUZRMvXeeGMLd26zygrgI6ledDRmonh5ExdzIUXX
	tbWURVa1lHTtxSG/CmPaIotJ7XtXPC6kyr+fN/7NaaaS9gsWZkQLFmPrVEVhAETR
	eGkw5kUsb8AhFVvt8Gc+5cOtbnQhQd/YGaYgPGiMR9f22jFBSCIrwwQVfZ3QjJvr
	Ldc2ydFzFFTM8BNxEE4g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnnstvfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:00:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBA0BbB026343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:00:11 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 02:00:04 -0800
Date: Mon, 11 Dec 2023 15:30:02 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Nitin Rawat <quic_nitirawa@quicinc.com>,
        Bart Van Assche
	<bvanassche@acm.org>,
        Naresh Maramaina <quic_mnaresh@quicinc.com>,
        "James
 E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Peter Wang <peter.wang@mediatek.com>,
        "Andy
 Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        <chu.stanley@gmail.com>, Alim
 Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Message-ID: <eb0b15c5-a7e0-4144-b5f8-a8e1818b1d9f@quicinc.com>
References: <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
 <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
 <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
 <20231206153242.GI12802@thinkpad>
 <effb603e-ca7a-4f24-9783-4d62790165ae@acm.org>
 <20231207094357.GI2932@thinkpad>
 <286b6f8a-c634-19ed-cf53-276cfe05d03f@quicinc.com>
 <20231207112101.GK2932@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207112101.GK2932@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RQ-aGuO_TVH_PzmVmaVzxjtGAjG6-LM_
X-Proofpoint-GUID: RQ-aGuO_TVH_PzmVmaVzxjtGAjG6-LM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_020024_874292_0A30009D 
X-CRM114-Status: GOOD (  34.93  )
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

On Thu, Dec 07, 2023 at 04:51:01PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Dec 07, 2023 at 03:56:43PM +0530, Nitin Rawat wrote:
> > 
> > 
> > On 12/7/2023 3:13 PM, Manivannan Sadhasivam wrote:
> > > On Wed, Dec 06, 2023 at 03:02:04PM -1000, Bart Van Assche wrote:
> > > > On 12/6/23 05:32, Manivannan Sadhasivam wrote:
> > > > > On Wed, Dec 06, 2023 at 07:32:54PM +0530, Naresh Maramaina wrote:
> > > > > > On 12/5/2023 10:41 PM, Bart Van Assche wrote:
> > > > > > > On 12/4/23 21:58, Naresh Maramaina wrote:
> > > > > > > > On 12/5/2023 12:30 AM, Bart Van Assche wrote:
> > > > > > > > > On 12/4/23 06:30, Maramaina Naresh wrote:
> > > > > > > > > > +    /* This capability allows the host controller driver to
> > > > > > > > > > use the PM QoS
> > > > > > > > > > +     * feature.
> > > > > > > > > > +     */
> > > > > > > > > > +    UFSHCD_CAP_PM_QOS                = 1 << 13,
> > > > > > > > > >     };
> > > > > > > > > 
> > > > > > > > > Why does it depend on the host driver whether or not PM QoS is
> > > > > > > > > enabled? Why isn't it enabled unconditionally?
> > > > > > > > 
> > > > > > > > For some platform vendors power KPI might be more important than
> > > > > > > > random io KPI. Hence this flag is disabled by default and can be
> > > > > > > > enabled based on platform requirement.
> > > > > > > 
> > > > > > > How about leaving this flag out unless if a host vendor asks explicitly
> > > > > > > for this flag?
> > > > > > 
> > > > > > IMHO, instead of completely removing this flag, how about having
> > > > > > flag like "UFSHCD_CAP_DISABLE_PM_QOS" which will make PMQOS enable
> > > > > > by default and if some host vendor wants to disable it explicitly,
> > > > > > they can enable that flag.
> > > > > > Please let me know your opinion.
> > > > 
> > > > That would result in a flag that is tested but that is never set by
> > > > upstream code. I'm not sure that's acceptable.
> > > > 
> > > 
> > > Agree. The flag shouldn't be introduced if there are no users.
> > > 
> > > > > If a vendor wants to disable this feature, then the driver has to be modified.
> > > > > That won't be very convenient. So either this has to be configured through sysfs
> > > > > or Kconfig if flexibility matters.
> > > > 
> > > > Kconfig sounds worse to me because changing any Kconfig flag requires a
> > > > modification of the Android GKI kernel.
> > > > 
> > > 
> > > Hmm, ok. Then I think we can have a sysfs hook to toggle the enable switch.
> > 
> > Hi Bart, Mani
> > 
> > How about keeping this feature enabled by default and having a module
> > parameter to disable pmqos feature if required ?
> > 
> 
> Module params not encouraged these days unless there are no other feasible
> options available.

Yeah, one of the problem with module param is that we can't have
different settings for two two UFS controllers. Anyways, this setting
need not be a module param, there is nothing special about this setting
that is tied to module loading (driver probe) time, AFAICT.

Thanks,
Pavan

