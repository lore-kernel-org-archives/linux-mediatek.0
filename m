Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32E1C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/vrTIATTETfVtNOd6Yf41Pg1P9s4Q+pGlLvTCYwlHw=; b=RnQoSsJ18XeJogGJ9OhkANdv5j
	a18mFi9AnyZj+CDMCDaQXiv+Dd8KVt8RV33SN1kZ695/5UeqzZAO+q16Vr9560XFNT/DtXsVTh2y2
	6aEO4wltRaTHy1vWrOViPpw1G2/OYN4W903YEnIrbBPHcK78JOYh+7+B6aWWIkO3qLqFbJnirbD5I
	1SuNTJqabQLhQcrWSv8nllnnG+E+FiYElHpAandZ1yspOmwT2bf/c9Gyg7E3nXF1JBxQpQ9F7vowI
	3ZXdu9V25NM2ucp0dZhYFZjIsEyl0lnXlJVVfXd85UNDqSHlnS5kvB5HyXLe+cuBUtdddH1S4wVSP
	bGIBVfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSI4M-00GspJ-2u;
	Tue, 23 Jan 2024 14:48:06 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSI4K-00Gsnd-0e
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 14:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p/vrTIATTETfVtNOd6Yf41Pg1P9s4Q+pGlLvTCYwlHw=; b=p8BRlP8DnzMienEyivUaE/3KEc
	F5ReVi9rovNbvXyy+eeSe27zhUNerHx1nxIIR1iLKebX/9YyQlAok8qiAEZUC9bGRWYInmbR05CLB
	1XStNffrOu6c38WuWcj1BpEr9W58D7NNemorwX5pozbOEYcWyCPM3na1abwQO6s93jPo=;
Received: from p54ae9e7b.dip0.t-ipconnect.de ([84.174.158.123] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1rSI46-006F8j-AE; Tue, 23 Jan 2024 15:47:50 +0100
Message-ID: <a4a9d2db-626d-4630-acfc-ded018b95561@nbd.name>
Date: Tue, 23 Jan 2024 15:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] wifi: mt76: mt7996: fix incorrect interpretation of
 EHT MCS caps
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
References: <20240119085708.23592-1-shayne.chen@mediatek.com>
 <20240119085708.23592-4-shayne.chen@mediatek.com> <87v87kcnb7.fsf@kernel.org>
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <87v87kcnb7.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_064804_314865_55307402 
X-CRM114-Status: GOOD (  10.92  )
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

On 23.01.24 12:16, Kalle Valo wrote:
> Shayne Chen <shayne.chen@mediatek.com> writes:
> 
>> From: Benjamin Lin <benjamin-jw.lin@mediatek.com>
>>
>> The EHT MCS map subfield of 20 MHz-Only is not present in the EHT
>> capability of AP, so STA does not need to parse the subfield.
>> Moreover, AP should parse the subfield only if STA is 20 MHz-Only, which
>> can be confirmed by checking supported channel width in HE capability.
>>
>> Fixes: 92aa2da9fa49 ("wifi: mt76: mt7996: enable EHT support in firmware")
>> Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
>> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
>> Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
>> index 3c729b563edc..02d858fdc9fe 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
>> @@ -1240,6 +1240,9 @@ mt7996_mcu_sta_he_6g_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
>>  static void
>>  mt7996_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
>>  {
>> +	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
>> +	struct ieee80211_vif *vif = container_of((void *)msta->vif,
>> +						 struct ieee80211_vif, drv_priv);
> 
> The void pointer cast looks to be unnecessary. This is nitpicking but I
> really hate casts.

It is not unnecessary - removing it results in a compile error.

- Felix


