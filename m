Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07806C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhE0N2GTjzloNk8jSE6bL1E7cB8XApNZKK5EefZJ4P4=; b=TjZUyPQEMo++lxfiku1/iAiH/R
	A97/orRVgedPrGJXZmyrOYwvep8zOGFHyfLJs8ljgiBwzwEXEJ6mk8GGd6I4QKyliodQDEd7pMMPx
	5ATNrjaEgzTMUJJEz0bDBc4PQwZLz8kJguMgHt2Iq54Dp6GqGo2qppKIE+rAFXj/HsitgyZFJwA+K
	6BDp88itJVbcqQrXRFJD44f91c79QTlM7b6rowWzDrotYF7DCaDl9si8Cb3BOGbwYGxwLXw38Bc8x
	jN7mZ6P8AHGJWFsG7YUMBI8keTKg/vI7jO0NTJVyiqln+drv0YGWWe/vhu5tLa1wcS9AIYzWJZwpN
	WoFg0BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMeb-00000008Yq2-0vC6;
	Mon, 15 Apr 2024 13:45:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMeN-00000008Yjs-1EjP;
	Mon, 15 Apr 2024 13:45:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FDi9sY023070;
	Mon, 15 Apr 2024 13:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=yhE0N2GTjzloNk8jSE6bL
	1E7cB8XApNZKK5EefZJ4P4=; b=Dy752KncX+0qPUtwl62xGFwJu/DOlByTMSyRV
	RwDnVwOE2JbPaOKtAnnuZ4KDvEtt96WpkJdEuSqG3Z81yMGtE1tR/JZg0/65ba+L
	uxKdfeWJY5EYSG7hct3G3MU/VXT0J5qwUObOKD72jcfdItNgQITAWAaQiyLD3wtU
	qTZa0QlwsrBItBOEfCjUkZos6vP8ZSmi37nZEqU/sC5G1kLjpyRWmFF4oeoVU9+u
	tZ6b38LS+iFCIGmf+tCxaaDJD/Hsiyzo7vaanv75QPxJjYuzAcmgMxIKlKlnH+e3
	zVS2p75tmrlqh/enbvxgsTGVThcfHpx2me1Ug9jnaB1kKNFJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xgwdph65s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 13:45:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43FDj3v4031752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 13:45:03 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Apr 2024 06:45:03 -0700
Date: Mon, 15 Apr 2024 06:45:02 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: <soc@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart
	<atenart@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Liviu
 Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo
 Pieralisi <lpieralisi@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Robert Richter <rric@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>,
        Li Yang <leoyang.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Paul J. Murphy"
	<paul.j.murphy@intel.com>,
        Daniele Alessandrelli
	<daniele.alessandrelli@intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory
 Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Thierry
 Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?=
	<afaerber@suse.de>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai
	<orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan
 Zhang <zhang.lyra@gmail.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>, <linux-fsd@tesla.com>,
        Michal Simek
	<michal.simek@amd.com>, <devicetree@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
Message-ID: <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
References: <20240412222857.3873079-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240412222857.3873079-1-robh@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JnW3rpgElRZ7l7_IYzSAkLFTQ0q_Cpaq
X-Proofpoint-GUID: JnW3rpgElRZ7l7_IYzSAkLFTQ0q_Cpaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_11,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 mlxlogscore=803 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_064535_483401_F92A13B1 
X-CRM114-Status: UNSURE (   8.60  )
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

On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
[..]
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
>  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

