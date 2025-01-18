Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0FFC02185
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jan 2025 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MH9lNp0oQ+SD1x8uy4xT266i8IVUKaK+lGIl07hhc88=; b=BpeRYnxEbt4R+vvVPGTW7Dtk4H
	AlN3gzzB45mjAe9qsEU6YfJqGJLENCiM8LVmFNY2ju5sLQ+RKP6hFAkMWsD4z9+K0I1N09m904lG2
	haQXVAeOBMvCrYXudWd8WwoAyJWlTAUiSQVElgZEkwaI0BafUKZeSRZOMTfZbToutUbDBlbgRM81K
	xZVGgNv/7Zn7X5K/I2bzrYoIzV8DUbOhQEYUpdEbMhpmaUZX61MODFESP17KAYJWdeT7hsFmBX+YB
	GHPMGXG582KVoO0afuji4z73P4evr4y5dtsN2Le87Aw9SwgOmqxM+CTb2J2y6HGYTfsuBW68QSy9J
	wY4GXLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5ao-000000028pV-0Sjs;
	Sat, 18 Jan 2025 09:58:14 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5al-000000028oR-2nDy
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jan 2025 09:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MH9lNp0oQ+SD1x8uy4xT266i8IVUKaK+lGIl07hhc88=; b=p0NZzYAhuUId1tQwVeBr3uBVAV
	PY+E5QGdEmJxAlrNXT8KBic8eM/f6wl7Ba3BNEiu6nmk1aKxJrTki/U8FM07Q1yyaehiAPvmcMA+8
	E1snZvLpuD7n1Z1xNGlB+FrOOn2ATHQHFqpUMXr7wn79QbiMf/u7upi4J2xbQLuHzJZA=;
Received: from p54ae9a10.dip0.t-ipconnect.de ([84.174.154.16] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1tZ5aV-008FlL-1Z;
	Sat, 18 Jan 2025 10:57:55 +0100
Message-ID: <a80fe450-ecd9-462b-af93-2a7ef9a0135e@nbd.name>
Date: Sat, 18 Jan 2025 10:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] wifi: mt76: mt7925: fix the wrong link_idx when
 has p2p_device
To: sean.wang@kernel.org, lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20250114020712.704254-1-sean.wang@kernel.org>
 <20250114020712.704254-2-sean.wang@kernel.org>
Content-Language: en-US
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
In-Reply-To: <20250114020712.704254-2-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_015811_790502_E67AE228 
X-CRM114-Status: GOOD (  14.57  )
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

On 14.01.25 03:07, sean.wang@kernel.org wrote:
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> 
> When the p2p device and MLO station concurrent, the p2p device
> will occupy the wrong link_idx when the MLO secondary link is added.
> 
> Fixes: e38a82d25b08 ("wifi: mt76: connac: Extend mt76_connac_mcu_uni_add_dev for MLO")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2: generate the patch based on the latest mt76 tree
> ---
>   drivers/net/wireless/mediatek/mt76/mt76.h          |  1 +
>   .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   |  4 ++--
>   drivers/net/wireless/mediatek/mt76/mt7925/main.c   | 14 ++++++++++----
>   3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> index 2082e3904d76..502b76a40ca8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -371,6 +376,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
>   	mconf->mt76.band_idx = 0xff;
>   	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
>   			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
> +	mconf->mt76.link_idx = hweight16(mvif->valid_links);
>   
>   	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
>   		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;

Why are you using hweight16 for the link idx? That doesn't make much 
sense to me. Shouldn't the actual link id be passed here, or is that 
index used in some other way?

- Felix

