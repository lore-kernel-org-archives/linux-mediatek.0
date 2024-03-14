Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC8EC54E60
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xlRjrOG++m/gTd4bJdiZw0cFNOuDJJrYtP9qeXcXVA=; b=4U6SH0jp/EADNbG7ciO3A1AlMj
	DsIc3hXZSpn+GfBpYvBRAPHhCdXJM8uPIFg5wYc14jVC4iCFPuJfspU5/3bQ6F5yA2VimkqfZXKvA
	2x+ldhh3ww5qXjEtibC5M86F5HAaZvXaaw+86BcbRDm9g9MzRKSzyBNk5ABuE3ofE2G4femBaUL/A
	/im9OI+gincDQAnFlULBN++eVNlLQaCBj/NGONtyTgnvcDlvu3XsZzT+ME+V+GVWCQ3JblAAd/hsM
	5LPFkSzOX//WRGMLY6SX37gggeXlTIWKhssmh50qFOR/1fTxDIxT9CZIYq6FFAp6zaxxJwQtx9dYP
	CpgQbI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkrMo-0000000FZ8G-0bFM;
	Thu, 14 Mar 2024 20:07:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkrMk-0000000FZ7P-0KJ8;
	Thu, 14 Mar 2024 20:07:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E5xD6c024159;
	Thu, 14 Mar 2024 20:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=3xlRjrOG++m/gTd4bJdiZ
	w0cFNOuDJJrYtP9qeXcXVA=; b=pD9zK5/tAYzW+EnwG6WHwGKjPc6FPCpWQk//a
	DaGqTOiXFZWZX/lipNXxm8IXqHzsBKaEHJtQswImHiCBLGmRiouns/FE8iEi0cPX
	M7yqFADDdzgaVJYHVtCefMBFDT5nsh/LnAYxmUGB3e4ZGzpb0ZYjibDIqLp1WIUk
	d9JljTfz3LzqF/NfKSTdDN4G1ZTOfuV1gZ/EaKVgw9BEGPnrGDfS60rR6ezPQ8RS
	bSfrIz83Vg9+Isfh1RjTCGlF+xOJXAceSK+7gxilWQ8uGxIPQ/7+C+8RKhWjUmCR
	n/1+yUbXbC5PcwdgL06svlPMLE1BzsOp63x2EfnowIN/YrZNA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuujssuyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 20:07:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EK7imb028294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 20:07:44 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Mar 2024 13:07:41 -0700
Date: Thu, 14 Mar 2024 13:07:40 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>, <peter.griffin@linaro.org>,
        <linux-riscv@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>, Simon Glass <sjg@chromium.org>
Subject: Re: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for
 multiple DT
Message-ID: <20240314113908471-0700.eberman@hu-eberman-lv.qualcomm.com>
Mail-Followup-To: Caleb Connolly <caleb.connolly@linaro.org>, 
	Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6lGfARaeuwH6HOGWh8oo9c6RWsGScCpQ
X-Proofpoint-GUID: 6lGfARaeuwH6HOGWh8oo9c6RWsGScCpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 mlxlogscore=635 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_130750_251981_43F960BC 
X-CRM114-Status: GOOD (  23.53  )
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

On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> Hi Amrit,
> 
> On 14/03/2024 12:11, Amrit Anand wrote:
...
> >  
> > +examples:
> > +  - |
> > +    #include <dt-bindings/arm/qcom,ids.h>
> > +    / {
> > +         model = "Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform";
> > +         compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
> > +
> > +         #board-id-cells = <2>;
> > +         board-id = <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(1)>,
> > +                    <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(2)>,
> > +                    <QCOM_BOARD_ID(IDP, 1, 0) QCOM_BOARD_SUBTYPE(UFS, ANY, 1)>;
> > +         board-id-types = "qcom,soc-id",
> > +                          "qcom,soc-id",
> > +                          "qcom,board-id";
> Forgive me if this is a particularly cynical view, but this seems
> incredibly blatant, the "qcom,board-id" property is deprecated for
> various good reasons, just using a key/value map where "qcom,board-id"
> is a key doesn't change that. There are two main issues I have with the
> proposal here:
> 
> 1. This breaks backwards compatibility, millions of production devices
> with bootloaders that will never receive another update might be
> compatible with the downstream "qcom,board-id" property, but they won't
> work with this.
> 2. A top level board-id property that isn't namespaced implies that it
> isn't vendor specific, but the proposed implementation doesn't even
> pretend to be vendor agnostic.
> 

I agree with the concerns you listed.

One point I wanted to bring is that if you provide a boot image that has
only one DTB, all production Qualcomm bootloaders I'm aware of will use
that DTB so long as "qcom,board-id" isn't a mismatch. I believe this is
what most everyone is doing if using the DTBs from kernel.org. We'd like
to use an open standard for DTB selection and that would very likely be
incompatible with existing bootloaders that don't have whatever that
standard is.

> U-Boot also has some ideas around this issue, there you can pass in
> multiple DTBs and provide some board specific "best match" function.
> I think there's definitely some value in exposing this information, but
> there's no good reason to define the same data as `qcom,board-id` while
> breaking production bootloaders.

One concern we have with U-Boot's approach is that it's based on
metadata external to the DTB and, in our experience, makes it hard to
track which board goes to which DTB. This approach also isn't
necessarily portable to other image types/boot flows.

Thanks,
Elliot


