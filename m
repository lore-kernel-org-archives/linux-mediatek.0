Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88498ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INFQFudAs4nKStIvoqPpyrmfJKCcgzNpJS8nKrPHAXI=; b=EO5P9gO/iWS2/hsGt322wE8NDw
	2f8LibntyZ5eRJh5OLW2uIC1vQI2StfheIiLJ6CijFaelax+GWKiaU4rHlLbPr+1W2A8at1+1xsfJ
	3NBsPDHZ0hFQASwjBeYC7zhHEL6F8ZXJMOdFVnxDtcToxsgMlJpWv2VqubdzJY2f7n7DMLJkV405M
	iiZ5LM6BUtaycyeI0xcobUA/DwFV0YMlWsStIVUO5FITVqCJUWatrWIqW+3Pan6RRW6oR+ZYyVPa/
	Ie6qgEfCjfmFXagSJZRqTPDE31GxaSjfnnzBNTjnKoJFEpC49mHAeNL1bK0RcruWvVfwtWpMVMBj2
	aQqFr+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDH7-00Eaih-Kq; Fri, 16 Sep 2022 15:29:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDH1-00Eaep-O4
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 15:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=INFQFudAs4nKStIvoqPpyrmfJKCcgzNpJS8nKrPHAXI=; b=UZauaVTUjQf7I8eEFR9+GgT93J
	v6RGQVKGc8bpasEHdRbTIrQx1Tb9ECJQxEtYz7PPkMfzmkPdoXpa26ojvEQwqjLZSFHddf1IkBv8u
	VszX4gORiTsagIGyCxPqBTpI5nC0rLmoX4y6hiNZu/1iD7GVaujGKYo/VBVZvpfZHSV4=;
Received: from p200300daa7301d00800d35b6f1da0728.dip0.t-ipconnect.de ([2003:da:a730:1d00:800d:35b6:f1da:728] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oZDGh-005M3C-Jb; Fri, 16 Sep 2022 17:28:39 +0200
Message-ID: <3c9bf984-806e-d670-eefe-1a9d21d5974e@nbd.name>
Date: Fri, 16 Sep 2022 17:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2] wifi: mac80211: fix decapsulation offload flag for WDS
 interface
Content-Language: en-US
To: Howard Hsu <howard-yh.hsu@mediatek.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20220916142707.28478-1-howard-yh.hsu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220916142707.28478-1-howard-yh.hsu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_082859_886215_25B1864C 
X-CRM114-Status: GOOD (  13.78  )
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


On 16.09.22 16:27, Howard Hsu wrote:
> Rx decapsulation offload cannot be enabled on WDS interface since its
> offload_flags is not configured. Its offload_flags shall be configured
> by checking hardware information.
> 
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> ---
> v2:
>     - Configure offload_flags in ieee80211_check_fast_rx
>     - Update commit message
> ---
>   net/mac80211/rx.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index a57811372027..0d8cfe34b088 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -4433,6 +4433,16 @@ void ieee80211_check_fast_rx(struct sta_info *sta)
>   	if (!test_sta_flag(sta, WLAN_STA_AUTHORIZED))
>   		goto clear;
>   
> +	if (ieee80211_hw_check(&local->hw, SUPPORTS_RX_DECAP_OFFLOAD)) {
> +		sdata->vif.offload_flags |= IEEE80211_OFFLOAD_DECAP_ENABLED;
> +
> +		if (local->monitors &&
> +		    !ieee80211_hw_check(&local->hw, SUPPORTS_CONC_MON_RX_DECAP))
> +			sdata->vif.offload_flags &= ~IEEE80211_OFFLOAD_DECAP_ENABLED;
> +	} else {
> +		sdata->vif.offload_flags &= ~IEEE80211_OFFLOAD_DECAP_ENABLED;
> +	}
I don't think you should be messing with decap flags here.
Further down there's a piece of code that does:

     offload = assign &&
           (sdata->vif.offload_flags & IEEE80211_OFFLOAD_DECAP_ENABLED);

Please change the code so that it gets the sdata from sdata->bss and 
check sdata_bss->vif.offload_flags.

- Felix

