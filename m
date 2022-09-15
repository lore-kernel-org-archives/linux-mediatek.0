Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04581C6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+5WD1TxU6px/KKmJWU5D2ILBEBGuaTkeYE2I5USLc4=; b=ZkJObpcsvRV5uBRIqoRYx/QEDJ
	FJ0w2Cs/Vbwer/UXqGLdP0jOMOdKzENgBIkGX65NUMcf5NQ/TT5Q2vgmy+XKyaA0u7KtTaRfn4/vB
	sdaE8moLGwYysz1qqbzpef2r+9bZPOUMD8WYbxY8TUtUL7RF/GevJ3juuUDYNQkmoJ+BseN/guGtT
	9C8shycePVqI9y4PCnbKH93zQu7m1hsaqAf01u6ZqODHZ8s/FBJpRcJtgsiZQ7uE1mmk5y0DlQjbL
	VrV+1gGrBF7VqXyrxiEKb5FgOzwxTI7km1pfbIR5d0+Mn/fAatAHzmTxS/lJPh9jjflKvy9WNDa09
	4T+oBhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpws-00B7UK-If; Thu, 15 Sep 2022 14:34:38 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpwp-00B7Ob-Gw
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 14:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z+5WD1TxU6px/KKmJWU5D2ILBEBGuaTkeYE2I5USLc4=; b=afZE1L8pAeCV26tTihTyuFOrXl
	ITlXl0HhWRToiEN0Or+m8p3f5f2DHDoSY1/iSJouSlKpvG7zGeL/gmrWNVcghS7RH9aqKubAaQlsZ
	kOiq17wPtf7h4GhJAvihE+43M/d5XVym2ySbwgBznbr9dYgZSy2/dfUa8LF48rRiUiqY=;
Received: from p200300daa7301d00b82a348903aff2a7.dip0.t-ipconnect.de ([2003:da:a730:1d00:b82a:3489:3af:f2a7] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oYpwb-005AgF-MQ; Thu, 15 Sep 2022 16:34:21 +0200
Message-ID: <b6dbe3f8-7dd0-cd41-ef9b-e5c5d86e54c2@nbd.name>
Date: Thu, 15 Sep 2022 16:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] wifi: mac80211: fix decapsulation offload flag for WDS
 interface
Content-Language: en-US
To: Howard Hsu <howard-yh.hsu@mediatek.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20220915081917.3409-1-howard-yh.hsu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220915081917.3409-1-howard-yh.hsu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_073435_678936_B51383A1 
X-CRM114-Status: GOOD (  13.59  )
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


On 15.09.22 10:19, Howard Hsu wrote:
> The WDS interface whose iftype is NL80211_IFTYPE_AP_VLAN can not be
> enabled rx decap offload because its offload_flags is not configured.
> The offload_flags of wds interface shall be configured by checking
> hardware information.
> 
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> ---
>   net/mac80211/iface.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
> index 41531478437c..ea35a7cabd1a 100644
> --- a/net/mac80211/iface.c
> +++ b/net/mac80211/iface.c
> @@ -865,6 +865,7 @@ static bool ieee80211_iftype_supports_hdr_offload(enum nl80211_iftype iftype)
>   	/* P2P GO and client are mapped to AP/STATION types */
>   	case NL80211_IFTYPE_AP:
>   	case NL80211_IFTYPE_STATION:
> +	case NL80211_IFTYPE_AP_VLAN:
>   		return true;
>   	default:
>   		return false;
> @@ -2120,6 +2121,7 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
>   
>   	/* setup type-dependent data */
>   	ieee80211_setup_sdata(sdata, type);
> +	ieee80211_set_sdata_offload_flags(sdata);
This approach does not look right to me. The flags are typically 
computed by calling ieee80211_set_sdata_offload_flags for a vif before a 
drv_add_interface or drv_update_vif_offload call, which allows the 
driver to set the offload flags to their final state.

I think the right approach for fixing this is to change 
ieee80211_check_fast_rx to make it check the vif offload flag for the 
bss sdata instead of the AP_VLAN vif.

- Felix

