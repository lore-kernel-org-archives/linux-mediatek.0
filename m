Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0066C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBET9G2bCaKagPynknSarM0Xj1wEnoFY3gIdPhKqZ3M=; b=vluDK4jFUuVVkT/qmyY0CTOzyf
	WOmOEBtMRkJw0WUgJZ1smZQf5e/aMJExnZFOjRyJC+P5nUxWSsjSUgMblGFBVMsjLdIIAXry9eIBc
	YOF/Dt0zqTVT7PGkTRIIbf73SNt96HDydaDwfgGYMvkYLX0Wj7nBsdBOyuWrw2NFQ+AzhrWXG0bEA
	WO2hxfIYRx8CofXDdy+LTEWZ7YhxVfvAJ15LAgzezHtcwusXf10JlVZHgkkAR6Orpkoly99vzlk8f
	yYlq5c1P+orU7VlO+wodfnyve5HTctTeiOiYBAxdBEGYBN7aqCfbZA3W4S0WUFxHKFIyy/tMkixLL
	d9AQB84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80ZC-005lgf-2J;
	Tue, 28 Nov 2023 16:04:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80Z9-005ldS-1M;
	Tue, 28 Nov 2023 16:04:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASDdhdK023933;
	Tue, 28 Nov 2023 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=eBET9G2bCaKagPynknSarM0Xj1wEnoFY3gIdPhKqZ3M=;
 b=YrbHLVG3bniSciK9Ii8KPcKTKqc0TCJ6wP8aKMdeUmKI9S0KVckUZ8D1LArJ/DOc4H/i
 clP9zcoXGMESuuKV7w4+LqH9+b+wbREWtz/nkumoBYMYs78EM0Qw2MXlZcpv5hmBJ9Qr
 46UW36oUgM8F7r5YvXkiHharr/45HLHqC75Xt4dc90RkYHfmLwEcq9NhpeoZnQT9Dhwt
 2vr9yS2l4HrMw4Ls0dLP2ppafcd+dxm8v+HGSm6gglp9btcZdtkFDlCObrLWfrSF67c8
 Y8/evBXuwNb2mFYc5jVUdfclPfVk3YMTqtVkCDb9yTS+knHc+Q9WJ9lyoSJFFnNKOwr4 1A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3undc5976m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 16:03:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASG3ikU009014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 16:03:44 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 08:03:33 -0800
Date: Tue, 28 Nov 2023 21:33:30 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: Pavan Kondeti <quic_pkondeti@quicinc.com>, <corbet@lwn.net>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [Patch v6 10/12] pstore/ram: Add dynamic ramoops region support
 through commandline
Message-ID: <9d8911dd-408a-4d78-b3d1-c5ee23dbf3fc@quicinc.com>
References: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
 <1700864395-1479-11-git-send-email-quic_mojha@quicinc.com>
 <ad38fb23-e2a2-448e-bdea-fa0985f82b50@quicinc.com>
 <d5fa95e7-ad2a-0dc7-5c79-6a9a789dad5f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5fa95e7-ad2a-0dc7-5c79-6a9a789dad5f@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NJx0-Qc6aJzPGSPq5GgnwW0hoiOg-yyA
X-Proofpoint-ORIG-GUID: NJx0-Qc6aJzPGSPq5GgnwW0hoiOg-yyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_18,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=914 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_080403_463687_8E33EDD9 
X-CRM114-Status: GOOD (  23.61  )
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

On Tue, Nov 28, 2023 at 04:02:33PM +0530, Mukesh Ojha wrote:
> > >   static int ramoops_pstore_open(struct pstore_info *psi)
> > >   {
> > > @@ -915,14 +965,18 @@ static void __init ramoops_register_dummy(void)
> > >   	/*
> > >   	 * Prepare a dummy platform data structure to carry the module
> > > -	 * parameters. If mem_size isn't set, then there are no module
> > > -	 * parameters, and we can skip this.
> > > +	 * parameters. If mem_size isn't set, check for dynamic ramoops
> > > +	 * size and use if it is set.
> > >   	 */
> > > -	if (!mem_size)
> > > +	if (!mem_size && !dyn_ramoops_size)
> > >   		return;
> > 
> > If mem_size and dyn_ramoops_size are set, you are taking
> > dyn_ramoops_size precedence here. The comment is a bit confusing, pls
> > review it once.
> 
> Ideally, both should not be set and there will always be
> confusion.
> 
> Do you think, if we use mem_size a single variable both for earlier
> and dynamic ramoops where based on dyn_ramoops_size=true/on a boolean
> it will take dynamic ramoops path and if not mentioned it will take older
> path.
> 

Sounds like a good idea to me. You would need a callback for mem_size 
module param handling. Because dyn_ramoops can be passed before mem_size
parameter. Also, we can't make pstore ram as module i.e decoupling
dynamic ramoops from pstore ram module.

Thanks,
Pavan

