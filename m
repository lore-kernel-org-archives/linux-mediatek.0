Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF28C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1k80DS2u+RZXm0Zb4CePjVJAcdtWhooDKCLd9DUfE5s=; b=kalXzdJeAR+hto
	SnoONXMgqCYnfcjlW2/cupouGQfC9qZpGFKTcgB04C5MuwQJTSaONZ445JD58vmRnD179OYrDEhkg
	VYly+3z4pTeN/WLmkEdL2R3f933zZjhuEj7Anz5UgRES/bnqZ+/KARNXmMbTJMGFs7e/rNjaKccjE
	dBzvPLl8MAeJkbWiDSGxlvR3YucGPNEIq7yZIaNgt6pGBP8LbEmBCVCtdT1vuPnJkJWuO3wdWQTLc
	BOBKA7kk9auoJoz1TUFq/4xFnK64O+DJ7eYSdVOMdS4PxjX2VRkmDlM0q8HtZ1Q0dQHh3qbDzRK20
	3Ih0r84GDDV7EmUd2foA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRjjW-006eUv-1e; Tue, 08 Mar 2022 23:59:14 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRjjQ-006eST-Jp
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 23:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646783949; x=1678319949;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IEoS/jK3zy7gICSRHWJHcM1+R5lqEcfGSNouRgrKCgk=;
 b=jIYKXoOX0D9HmmyuHMWmXPR3pnEdCuliF8dsrEVFbisvSTUhVb+/VTTO
 CDCJMvDLnjmc2Vwg2ASJSE2wwzI3/Km+Mz2elPkpKPeIF3IDfjHq4CRs/
 i+cC3EfubRkRxIlKG53QfQ3r+qL1eIF1iq6oED62jOqAPMIUWiater3Ua M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 08 Mar 2022 15:59:06 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 15:59:06 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 15:59:05 -0800
Received: from [10.111.182.121] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 8 Mar 2022
 15:59:04 -0800
Message-ID: <f1ee04ce-3ac4-f68d-193a-25b09bd6cf41@quicinc.com>
Date: Tue, 8 Mar 2022 15:59:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] mac80211: correct legacy rates check in
 ieee80211_calc_rx_airtime
Content-Language: en-US
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Johannes Berg
 <johannes@sipsolutions.net>
CC: Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
References: <20220308021645.16272-1-MeiChia.Chiu@mediatek.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220308021645.16272-1-MeiChia.Chiu@mediatek.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_155908_746598_64FE4766 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/7/2022 6:16 PM, MeiChia Chiu wrote:
> There are no legacy rates on 60GHz or sub-1Ghz band, so modify the check.

nit: s/Ghz/GHz/ here and in the code comment

> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> ---
>   net/mac80211/airtime.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
> index 26d2f8ba7029..c0e58eb7c7fb 100644
> --- a/net/mac80211/airtime.c
> +++ b/net/mac80211/airtime.c
> @@ -477,7 +477,9 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
>   		bool sp = status->enc_flags & RX_ENC_FLAG_SHORTPRE;
>   		bool cck;
>   
> -		if (WARN_ON_ONCE(status->band > NL80211_BAND_5GHZ))
> +		/* on 60GHz or sub-1Ghz band, there are no legacy rates */
> +		if (WARN_ON_ONCE(status->band == NL80211_BAND_60GHZ ||
> +				 status->band == NL80211_BAND_S1GHZ))
>   			return 0;
>   
>   		sband = hw->wiphy->bands[status->band];


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
