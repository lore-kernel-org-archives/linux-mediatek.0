Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9057DCA5FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3rilO8Ga7DTvA+Nv87c5I1cpSI7cgFoLmBkXO3Wgkw=; b=Munu2OEQPJZuz5ZX+zuNYx7WsH
	HivwgeSoQpPG0pFZnwmjkT6a27JFjwc6eFakU5ApMV7EU2Hnyk6QPD2eF0YDaYFnb9F+XDvy9rio0
	hmSELEm+wC3kkoIQAvc3njscekEzlFdlWDWxeKuShUz1IPPgWxuWaOD8qmRhxT6S/cDoVl69RCnFm
	YGtPvz2o/8CGMT0EzWKMDrLPh9d6RpqXXRvksLs4wDE+ujscsaWa85GKAnlZMxRKtWd3Zi85dUXl/
	uwjpt2SlFOIy66SnrdCbZAift6Xs1v0y4ekgTRl5fK5hsnMoX/k894GxX3eoNVwe9eAKzrxR/bul1
	wH9yES2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1R0-00000000NRI-12uw;
	Tue, 06 Oct 2026 09:26:06 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1Qw-00000000NQY-13VU
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 09:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F3rilO8Ga7DTvA+Nv87c5I1cpSI7cgFoLmBkXO3Wgkw=; b=cbFBOFwEiQsV0cgOIIuKoQ1PBP
	ZaQ/jBmflQ2/aG187W+a3RZX7M69ExPYG9xLm47Dy2yppAWogm6CLfn5bJ8GEkxSwnIvvonX08EEf
	xs55vV6JFEqPSi8+MqVImN8Do8/4UbwlaxCtnWoLilddUbZMwKpcKSerCEBZm9um/dJ4=;
Received: from p54a434bb.dip0.t-ipconnect.de ([84.164.52.187] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xE1Qq-00GqWr-11;
	Tue, 06 Oct 2026 11:25:56 +0200
Message-ID: <8dec78e7-1f4a-4d68-a592-15ad0f1fdac0@nbd.name>
Date: Tue, 6 Oct 2026 11:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/23] wifi: mt76: mt7925: add NMI/NDI MAC address setter
 helpers
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yu-ching.liu@mediatek.com, jenhao.yang@mediatek.com, posh.sun@mediatek.com,
 Chengwei Yu <chengwei.yu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
References: <20260927210306.737669-1-sean.wang@kernel.org>
 <20260927210306.737669-3-sean.wang@kernel.org>
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
In-Reply-To: <20260927210306.737669-3-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_022602_298921_DDE28D38 
X-CRM114-Status: GOOD (  15.07  )
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

On 27.09.26 23:02, Sean Wang wrote:
> From: Chengwei Yu <chengwei.yu@mediatek.com>
> 
> Add mt7925_nan_set_nmi_address() and mt7925_nan_set_ndi_address() for
> runtime MAC address changes: NMI goes through the MCU (firmware owns
> the hardware address), NDI updates vif->addr directly.
> 
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7925/nan.c   | 48 +++++++++++++++++++
>   .../net/wireless/mediatek/mt76/mt7925/nan.h   |  8 ++++
>   2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
> index 8a59f7b1aee2..abbd3f7b081c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
> @@ -697,6 +697,54 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
>   	}
>   }
>   
> +int mt7925_nan_set_nmi_address(struct ieee80211_vif *vif,
> +			       struct mt792x_dev *dev,
> +			       const u8 *mac_address)
> +{
> +	struct mt76_dev *mdev = &dev->mt76;
> +	struct {
> +		u8 rsv[4];
> +		struct mt7925_nan_nmi_addr_tlv nmi_addr_tlv;
> +	} nmi_cmd = {
> +		.nmi_addr_tlv = {
> +			.tag = cpu_to_le16(NAN_UNI_CMD_CHANGE_NMI_ADDRESS),
> +			.len = cpu_to_le16(sizeof(struct mt7925_nan_nmi_addr_tlv)),
> +		},
> +	};
> +
> +	if (!dev || !vif || !mac_address)
> +		return -EINVAL;
> +
> +	if (is_zero_ether_addr(mac_address) ||
> +	    is_multicast_ether_addr(mac_address))
> +		return -EINVAL;
> +
> +	memcpy(nmi_cmd.nmi_addr_tlv.nmi_addr, mac_address, ETH_ALEN);
> +
> +	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(NAN), &nmi_cmd,
> +				 sizeof(nmi_cmd), true);
> +}
> +
> +int mt7925_nan_set_ndi_address(struct ieee80211_vif *vif,
> +			       struct mt792x_dev *dev,
> +			       const u8 *mac_address)
> +{
> +	if (!dev || !vif || !mac_address)
> +		return -EINVAL;
> +
> +	if (is_zero_ether_addr(mac_address) ||
> +	    is_multicast_ether_addr(mac_address))
> +		return -EINVAL;
> +
> +	/*
> +	 * The NDI address is not managed by firmware; it is the vif's own
> +	 * hardware address, so updating it locally is sufficient.
> +	 */
> +	memcpy(vif->addr, mac_address, ETH_ALEN);
What about bss_conf->addr and the netdev addr. Do those need to be updated?

- Felix

