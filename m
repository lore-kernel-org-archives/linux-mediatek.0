Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4CDC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 18:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEAEB208D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 18:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FHeeqXbN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.b="AynvihS3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEAEB208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ci2vYjndl0qfEIOKeHEXWZQWjGX4uRkxT2u9fWR2pSw=; b=FHeeqXbNMq5Tpm
	pW9K37Db6u4HmuBFX+zUuGlFkJFnSdl3IzKwWL0nv3MrGUXBSNEsXgm45iRE4YwCRKHLnmZwcaB5T
	w6mqBLtDIWjs+EzEEnoOyQozENZom5Uq0gnGlmL6nqu4IaNpIkkD2pNBSOWM1K8w9V5iLOuoGa5R8
	Qim/Xs7bZpw/vc30O0dGAmey3z+L0PcLtzWRKhqPLP4F9UhSf6S0K65p3nr874HxAh095nkUbFMwe
	mEZsCfQ/d+KYA5cIZ2XjJZ/cQOW6cDSR8FtrZIMRmH3MxY5LmdaWjogBGuc9bCfZpiyMbLgCSzOOr
	I9VvDvLzq4AxKV1+KwRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlGJz-0003xd-Tl; Tue, 16 Jun 2020 18:28:31 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlGJw-0003wj-Rp
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 18:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C6fAYcaiQIpVTe71DHEgip3+//5em+XqQgl4agyLyjQ=; b=AynvihS3HJxYHnu0j3ja0KMhTl
 +L42BQrgxgWFbfpe/Hdchu8OxpXBtNoUS+IfBrSr9oOtQ8oSMKedeF20kFxkA5oaRyemCOkOZvYhJ
 MhvBZRfrarykXxylW0a0FDvWIdBpqVhG5Bm7vjDGyyH5PfyisPgDaRSuHzadom3IEa6U=;
Received: from p54ae948c.dip0.t-ipconnect.de ([84.174.148.140] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1jlGJr-00054q-Pw; Tue, 16 Jun 2020 20:28:23 +0200
Subject: Re: [PATCH 3/4] mt76: mt7915: add support for DT rate power limits
To: Shayne Chen <shayne.chen@mediatek.com>
References: <9ae2b6233284b60206e3513f7bf2eb03d2fbd724.1592276165.git.ryder.lee@mediatek.com>
 <279b29408c742c4b043e7af11217dcd5eeb7b8c2.1592276165.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; prefer-encrypt=mutual; keydata=
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
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCfTKx80VvCR/PvsUlrvdOLsIgeRGAAn1ee
 RjMaxwtSdaCKMw3j33ZbsWS4
Message-ID: <779faac5-5922-80e6-299d-769e795ea419@nbd.name>
Date: Tue, 16 Jun 2020 20:28:23 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <279b29408c742c4b043e7af11217dcd5eeb7b8c2.1592276165.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_112829_092614_E93E3D66 
X-CRM114-Status: GOOD (  14.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-06-16 14:46, Shayne Chen wrote:
> Add support to limit per-rate max txpower from DT.
> 
> Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7915/eeprom.h    |  2 +-
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 38 +++++++++++++++++--
>  2 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
> index 4e31d6ab4fa6..284de8b4e0a4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
> @@ -120,6 +120,6 @@ mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
>  		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF_TSSI0_2G;
>  }
>  
> -extern const struct sku_group mt7915_sku_groups[];
> +extern const struct sku_group mt7915_sku_groups[MAX_SKU_RATE_GROUP_NUM];
>  
>  #endif
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index 349163d0b7f2..c5e9893cbd87 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -3171,15 +3171,45 @@ int mt7915_mcu_set_sku(struct mt7915_phy *phy)
>  		.format_id = 4,
>  		.dbdc_idx = phy != &dev->phy,
>  	};
> -	int i;
> -	s8 *delta;
> +	struct mt76_power_limits limits_array;
> +	s8 *delta, *la = (s8 *)&limits_array;
> +	int i, idx;
>  
>  	delta = dev->rate_power[mphy->chandef.chan->band];
>  	mphy->txpower_cur = hw->conf.power_level * 2 +
>  			    delta[MT7915_SKU_MAX_DELTA_IDX];
I think the delta needs to be subtracted instead of added here.

> -	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
> -		req.val[i] = hw->conf.power_level * 2 + delta[i];
> +	mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
> +				   &limits_array, mphy->txpower_cur);
This should set mphy->txpower_cur to the return code of
mt76_get_rate_power_limits. The nss delta is added in the core mt76 code
before reporting to user space.

- Felix


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
