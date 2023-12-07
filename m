Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BDDC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 00:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8EY+hxPqYDNDst8AkzCtvWV0zDIKM4EMIlqkhupICE=; b=wIlyiFhRXo3nD1dNo0Ev8rbqkc
	vJOP9NDWev5/nRu0o31b+wWzkPYKcDJEfup7BIdEyJyYGWx6EvKwazy+eoGsjiA49p0W5N6++EVw2
	Qur+jgrDBYMeB21EZs95wi/lemdJ8V26DSs6gRJSOu/KI7RdV0j810OqJovFWgJM+PwmynzjMinpp
	NBKpr646JCUREzTq4eEUDy+vfgIb/PqrsNp0jUPw+8OgQSv2pqE0DFvH+Z6pVnKiKagyb5AI5RPzX
	qn2X2o2rDOKFNt4fiB8J+E6dg8pXAMswIo8hoYejEMv5HWKQ7yFtuqpL+LJvnGzJuX3GHvOsrZ0qn
	yeTEDMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB1vE-00BX9U-1O;
	Thu, 07 Dec 2023 00:07:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB1vA-00BX82-1N
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 00:07:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B6MTlOL004790;
	Thu, 7 Dec 2023 00:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=m8EY+hxPqYDNDst8AkzCtvWV0zDIKM4EMIlqkhupICE=;
 b=h73upDiylFawEdjAnLWNULa1txWewGBOyFfXOXf1U1xK7ThK2RuyA2YjlQh7yzOaaV1F
 CGxKHE/MPuzPL+GhplMfw30CuGrzEVdAAubRSz4upjqmJI8cFysI8P2XeOSKUiE6y5Rb
 dz4piUN8n4PL8gzVi3qydAaIshLasgMfI5cgIQiEC2BygMJ9d97g6o0U68DBk6jgPf6Q
 gYDrd6kjnBC/u15CsdScg1rVFibPWcti26Ws/zSxXqY/Z+bKAr3314yYDwn9lUdFfFmj
 ey3rgfwAEIkrN5NT0feIcLyZXk9/GEybrkWBiQBQFquS1N6d82BOspm7PfIzJjg/gGjS Tg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utdebbceh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 00:07:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B70751w010530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 00:07:05 GMT
Received: from [10.110.111.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 16:07:04 -0800
Message-ID: <50a6f31a-ef28-496c-acf4-0521034e43a1@quicinc.com>
Date: Wed, 6 Dec 2023 16:07:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mac80211: Fix SMPS action frame ht cap check
Content-Language: en-US
To: Allen Ye <allen.ye@mediatek.com>, <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        Evelyn Tsai
	<evelyn.tsai@mediatek.com>,
        "Money . Wang" <money.wang@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        Thomas Wu <quic_wthomas@quicinc.com>
References: <20231206024708.24831-1-allen.ye@mediatek.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231206024708.24831-1-allen.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DqS6-M-qghFIKBsIm7_1WVBiDv5qIWx1
X-Proofpoint-GUID: DqS6-M-qghFIKBsIm7_1WVBiDv5qIWx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_21,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312060178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_160716_505316_EE7F3DC8 
X-CRM114-Status: GOOD (  22.43  )
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

On 12/5/2023 6:47 PM, Allen Ye wrote:
> From: "Allen.Ye" <allen.ye@mediatek.com>
> 
> Since there is no HT BSS in 6GHz, the HT Cap check would stop 6G HE/EHT
> BSS from processing the HT action frame for SM Power Save which can be
> also used in an HE BSS. Therefore, we remove the HT Cap check in 6GHz and
> add the HE check accordingly.
> 
> Signed-off-by: Money.Wang <money.wang@mediatek.com>
> Signed-off-by: Allen.Ye <allen.ye@mediatek.com>
> ---
>  net/mac80211/rx.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index 64352e4e6d00..f8cd14dc58ec 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -3482,7 +3482,8 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
>  	switch (mgmt->u.action.category) {
>  	case WLAN_CATEGORY_HT:
>  		/* reject HT action frames from stations not supporting HT */
> -		if (!rx->link_sta->pub->ht_cap.ht_supported)
> +		if (status->band != NL80211_BAND_6GHZ &&
> +		    !rx->link_sta->pub->ht_cap.ht_supported)

we had found the same issue and were preparing a patch that changed this to:
+		if (!rx->link_sta->pub->ht_cap.ht_supported &&
+		    !rx->link_sta->pub->he_cap.has_he)

I see you added the has_he check below, but curious if it is better to
do it here to short circuit the tests that follow

>  			goto invalid;
>  
>  		if (sdata->vif.type != NL80211_IFTYPE_STATION &&
> @@ -3502,6 +3503,12 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
>  			enum ieee80211_smps_mode smps_mode;
>  			struct sta_opmode_info sta_opmode = {};
>  
> +			if (status->band == NL80211_BAND_6GHZ &&
> +			    rx->link_sta->pub->he_cap.has_he &&
> +			    !(rx->link_sta->pub->he_cap.he_cap_elem.mac_cap_info[5] &
> +			    IEEE80211_HE_MAC_CAP5_HE_DYNAMIC_SM_PS))
> +				goto invalid;
> +
>  			if (sdata->vif.type != NL80211_IFTYPE_AP &&
>  			    sdata->vif.type != NL80211_IFTYPE_AP_VLAN)
>  				goto handled;


