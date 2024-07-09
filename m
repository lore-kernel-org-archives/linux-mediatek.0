Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8B4C2BD09
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPJerng+kDc1LY3H2mGFxN66rUQLOcC9lpeQo7I31lA=; b=AjUJMItUvuqMKl/tnBSqrvT+UX
	OMB7EdI2Jw8OwjOyCRtsQBafkmkRHBWSVlOsN4A5xvKqbP+xaGC7RqotNy8nWJargvMTMH0lmIKFP
	XRBA7pSAsMwg2J3vCHbJqzzFdzY2S8MvsmBf/1KaUKBpGqyV5Hss9ryJImq9cZG768U2qT652j5Fi
	TJKLXPcwuRREWjLuDugHymk++kL5IUi8EZySrc/5LdLTL0ySIBAlulA0lb6CHdYUUtlMKagYAgAeS
	9iCKpB9ADkuXWZBZddbtDIfAmgn5OipSvWRIqn+IgTmPUO91Nxdu7aC6CVDFZMQ0YVpboWORPiTu/
	s7OGn5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHIn-00000008UrI-003g;
	Tue, 09 Jul 2024 20:19:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHIV-00000008UoA-2NdX;
	Tue, 09 Jul 2024 20:18:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469A8iq4031371;
	Tue, 9 Jul 2024 20:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPJerng+kDc1LY3H2mGFxN66rUQLOcC9lpeQo7I31lA=; b=X6hG75XZt0lNdTyR
	HTtcHtbIJISUPFB5zjrb5wiR1v3sR6WX2q+4NlL02UlBwySsrVlkHPAy42GrAEws
	uZFXd5j3jmUAE/Ooy7PCKuzzGmvB9emtcmEb7tfLSNoZxom37owginGlPNq5wc71
	J7OX3EAcHHws+SBItvj/MFPFmNbN3fTzW4uOkju97EwJFXpFnIr8zFjiv6FcoNtT
	L8L3OeUtt6ejrIFO4vt9fodQfgKsUn1gQb/D1lNLJYR+We8a5k4hIX2xKjbOMzVb
	zv/s0M3FC4lTiXuq9Lfe22uWSzpqNip26XghUOuhZXISCTBxROg+RyjFODUt9lgg
	XoY13g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa67de7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 20:18:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469KIgCa013897
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 20:18:42 GMT
Received: from [10.48.245.228] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 13:18:42 -0700
Message-ID: <45b5d489-1fd1-47d7-bdb0-2096b8badbfd@quicinc.com>
Date: Tue, 9 Jul 2024 13:18:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: add missing MODULE_DESCRIPTION()
 macro
Content-Language: en-US
To: Jassi Brar <jassisinghbrar@gmail.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240624-md-drivers-mailbox-v2-1-e5a428d52224@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240624-md-drivers-mailbox-v2-1-e5a428d52224@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rpvEh_hARBkQhTUwaySMhroGvqAnW6ia
X-Proofpoint-ORIG-GUID: rpvEh_hARBkQhTUwaySMhroGvqAnW6ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_09,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_131847_781662_A703104C 
X-CRM114-Status: GOOD (  16.12  )
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

On 6/24/2024 9:09 AM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Changes in v2:
> - Updated description per AngeloGioacchino Del Regno and propaged the
>   Reviewed-by tag
> - Link to v1: https://lore.kernel.org/r/20240608-md-drivers-mailbox-v1-1-6ce5d6f924ad@quicinc.com
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4aa394e91109..71eb78c3d6ce 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -790,4 +790,5 @@ static void __exit cmdq_drv_exit(void)
>  subsys_initcall(cmdq_drv_init);
>  module_exit(cmdq_drv_exit);
>  
> +MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
>  MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240608-md-drivers-mailbox-3cd31fdfc4b6

I don't see this in linux-next yet so following up to see if anything else is
needed to get this merged.


