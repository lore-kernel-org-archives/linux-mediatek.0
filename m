Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D1ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 16:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqi4EV6qPnp3p1tyr1Elb5opL0fitFGRnaLyZHpX6BE=; b=X3nciPpiR5ShIO3eQ+0T+I3FKj
	njbCIPOYOVwnjmYuCFDPeVTgtQ6QtXjKJNBYeTFBcbpG0HzFn0jwLL9uu1gCDd6XjffSZvaTZO9qv
	9QZjrZlXSeVGWf2jBUxRRmDjNFtaaRrhGv2y/apklbYep7iv4CYORb6Oe2q9kSUU4h1vBFoUr7ELj
	R4c+YHwssVCTZURpGZyr+CyKlL+zLVRnnvpaPEFqA8nACmGHBi/wJQnFR9VanLoZPNZ+zxgEaKwTs
	VvCTC0jm1kSbku4Ho2qy5xPIlG2c6H6QPXiyw9aJ0er2He/KBqbZHLI2eEC0SdcpNtyM+HjKYkoLk
	mNvCjzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZEUT-00F8DK-9H; Fri, 16 Sep 2022 16:46:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZEUO-00F87w-LV
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 16:46:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GG31m7021724;
	Fri, 16 Sep 2022 16:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zqi4EV6qPnp3p1tyr1Elb5opL0fitFGRnaLyZHpX6BE=;
 b=DXiasinW6rOpdqMq8IsLWaUEeJa6fsSOv4jwU2EDtFKRFB2vUVsykcXAqq93j4tb/A86
 s06uMPsuIP31zcv12JuuakR6/54MRfTudEsiRLMJOwWXYKi6HRYVrYEmVQEAHaq22CK4
 mwG6n4EtogHqv2YiKgJaxCTZOgrfAv6Ysu/CGVutwrc2GfaB3V8M6qucJW7uh2RulqzZ
 bvlvSI51gg2203FuG/FszxObirdAo30HP0b/qLcjpt9N/Xpre+GjIcWAU2EsbSjw6Vz7
 rov/Euml0A4qcA70AUicxV1EnDN9jFdp5/Na+vTwWZcYybsbKU4gFsTL4J4qq53zP3it Dg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jm9m1bqwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 16:46:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28GGPtdd017565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 16:25:55 GMT
Received: from [10.110.7.80] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 16 Sep
 2022 09:25:54 -0700
Message-ID: <29fe28db-622d-7784-128f-8ec6b4d5a0a3@quicinc.com>
Date: Fri, 16 Sep 2022 09:25:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] wifi: mac80211: Align with Draft P802.11be_D1.5
Content-Language: en-US
To: Howard Hsu <howard-yh.hsu@mediatek.com>,
        Johannes Berg
	<johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>,
        Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee
	<ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Evelyn Tsai
	<evelyn.tsai@mediatek.com>,
        linux-mediatek
	<linux-mediatek@lists.infradead.org>
References: <20220916141700.28378-1-howard-yh.hsu@mediatek.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220916141700.28378-1-howard-yh.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z8WkJoe3Q_HbCQjLdR0s1q1VDCN9qXGy
X-Proofpoint-GUID: Z8WkJoe3Q_HbCQjLdR0s1q1VDCN9qXGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_10,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_094652_794411_999409DD 
X-CRM114-Status: GOOD (  17.26  )
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

On 9/16/2022 7:17 AM, Howard Hsu wrote:
> Fix ieee80211_prep_channel to aligh with Draft P80211.be_D1.5. It shall

s/aligh/align/

why refer to D1.5? Current code is using D2.0 definitions.

further note it seems at some point we should move all definitions to 
D2.1 (in which case EHT operation information is now at offset 8 of the 
EHT operation element)



> shift 4 byte to fetch EHT Operation information.
> 
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> ---
>   net/mac80211/mlme.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
> index ff449e0c2e62..9bb085eab12a 100644
> --- a/net/mac80211/mlme.c
> +++ b/net/mac80211/mlme.c
> @@ -4735,7 +4735,7 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
>   						   cbss_ies->data, cbss_ies->len);
>   		if (eht_oper_ie && eht_oper_ie[1] >=
>   		    1 + sizeof(struct ieee80211_eht_operation))
> -			eht_oper = (void *)(eht_oper_ie + 3);
> +			eht_oper = (void *)(eht_oper_ie + 4);
>   		else
>   			eht_oper = NULL;
>   	}


