Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515C6C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C8C66109D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C8C66109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xm+quVn5WMYctH0EtoFY9oXbepW3r3zuS13wbFrDAQg=; b=WnDtY2kf2hElgyBTZxB+GMo38l
	9CFhzelBpaKVixE7VGGcOTemwq5BY5CTNB1y/AlCfap8Ct6LApgDicaHlps5wchHJwwf9ArQVrLi1
	Ex9DM9pJF1/2zJ2uDnV9a34IIFXNqDWwJc+Ur/pnql7TB1E4qspEfVrzFCMLYQx1MOWhK4Fc+9uq0
	5hMQ4FkG8sP2/2dd50HE5RwZi27U4X7QYEjphgFu1auNvmDQ+Zs9M9ovkmollniDaOfM8r7z8Pd49
	ItyZqMIcVxNWNs+IzExmnJ8/2h/f7WriNgEk0GHJJ9MxvmsuH+6JEunX3b+oWGIAOr2FXJH6chXNx
	T3ijfvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEUKd-00CQq7-Ht; Fri, 13 Aug 2021 10:22:31 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEUKY-00CQp6-7L
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 10:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTyDeI6MWVlDAIwDb4K6hQ3vAcN5deIrYwf+28913Ao=; b=laobjqe4cc3nvthBn3QqWnBNP1
 vlD+szSGKW1QWGM1Ss/m8qFfnpwmIiie7a7TPDkoR4d/OVtg/m4OSnCQ6+KOgc+tayW7Pv2ge4WpR
 mV5Mh0kUJPHj0pfOWPtvmVWCIbJ96sFic0xRvRVQE7uC4CeuyM7ZntcbGYZ1w0JAC9GU=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mEUKT-0006bm-4x; Fri, 13 Aug 2021 12:22:21 +0200
Subject: Re: [PATCH 1/2] mt76: connac: fix GTK rekey offload failure on WPA
 mixed mode
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, jemele@google.com,
 yenlinlai@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <1627426757-14811-1-git-send-email-sean.wang@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <8de0c710-0c61-2369-7730-b2f07a86e626@nbd.name>
Date: Fri, 13 Aug 2021 12:22:20 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1627426757-14811-1-git-send-email-sean.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_032226_490519_E60FEA0B 
X-CRM114-Status: GOOD (  21.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-07-28 00:59, sean.wang@mediatek.com wrote:
> From: Leon Yen <Leon.Yen@mediatek.com>
> 
> Update the proper firmware programming sequence to fix GTK rekey
> offload failure on WPA mixed mode.
> 
> In the mt76_connac_mcu_key_iter,
> gtk_tlv->proto should be only set up on pairwise key
> and gtk_tlk->group_cipher should be only set up on the group key.
> 
> Otherwise, those parameters required by firmware would be set
> incorrectly to cause GTK rekey offload failure on WPA mixed mode
> and then disconnection follows.
> 
> Fixes: b47e21e75c80 ("mt76: mt7615: add gtk rekey offload support")
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt76_connac_mcu.c  | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index a2555dc0f003..d71393b1c5e6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -1957,19 +1957,22 @@ mt76_connac_mcu_key_iter(struct ieee80211_hw *hw,
>  	    key->cipher != WLAN_CIPHER_SUITE_TKIP)
>  		return;
>  
> -	if (key->cipher == WLAN_CIPHER_SUITE_TKIP) {
> -		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_1);
> +	if (key->cipher == WLAN_CIPHER_SUITE_TKIP)
>  		cipher = BIT(3);
> -	} else {
> -		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_2);
> +	else
>  		cipher = BIT(4);
> -	}
>  
>  	/* we are assuming here to have a single pairwise key */
>  	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
> +		if (key->cipher == WLAN_CIPHER_SUITE_TKIP)
> +			gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_1);
> +		else
> +			gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_2);
Why is gtk_tlv->proto set to WPA version values based on the cipher
suite? That doesn't make much sense to me, since TKIP is supported by
WPA2 as well. I will apply this patch anyway, since this check is there
already, but this does look suspicious to me and should probably be
revisited.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
