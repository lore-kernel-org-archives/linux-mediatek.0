Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A6CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 00:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA9360F93
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 00:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAA9360F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1GxSQpQlnO6zmrtd/PVzOLgPMUUg4jyFMWRwvUaTOU=; b=MGsNvvVv6aGK9B
	SW1K9d4KRJmm6I/WF5UDa9Y5eJnb8cbkH2xsIqYwt74cpoFkyQ7b/MjBfwC3KxfdG/BguNPes2IW8
	E74q2shWli8NQsvQqJKMAL5pBo+OuOO2xFdnklebWLWRJDowNRdSwBYJ2hJJOp1cTJXiqhJwh5bdt
	qnd/J7EXJzuO8ghjZjEtn0JYXTsks1TRC2AuA+kE6bEuN5IdZP/8nxUyFsCcREKmI2nyD/E3tQDdi
	+sNsjzKJ2hZXYtXVac1WuuxLg6NY32gt9LHtXaQSeG1pWsq4RysKOt+02YeUo6FD1XE3IrlRoEG0C
	BnQzP6xXVM83vtPVAD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8BAw-00CiYl-M8; Tue, 27 Jul 2021 00:42:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8BAs-00CiXz-IZ
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 00:42:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 482C260E78;
 Tue, 27 Jul 2021 00:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627346541;
 bh=cxD7AhXGeOJ7ri9fEz9eGsgs5QhavYnZIAf+Z1BZr8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PK84Ni42i7bDoUYlU6dCicC/pXIDAUfFt5C+OXIZZlQdEczxzmTJuVNyNDar7Wo2c
 EiedDfFRj77hNo5A6ugBnvsgQ+XCgwmszr/iHyTTgIU07xz1Iz9WEPX9ZndDSIBVjg
 oDokxBjNTbE7XOugq7p4T/QXmzaGifJdxJr+z9D8+K2tMnOtpEsNDzhXEgttheoOZP
 JjJrHy1oYnvGnTy75U/BXROU1Bh5gPzkilc2ZKCdmfxhMJzkFpslkYQAEnxIlErFQG
 ncRcoshwdHK5FvWL4ixLGuRIbtgWY7AUPPbSF5k3qx2GYqkI/ijlRi7Rc27DEh3+QV
 PT+vNqfcdi+PQ==
Date: Mon, 26 Jul 2021 17:42:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] mt76: fix build error implicit enumeration conversion
Message-ID: <YP9Warx1zcUofVhJ@Ryzen-9-3900X.localdomain>
References: <9b704807383f3048898944d2b9cb74e6b4e8d83d.1624174954.git.objelf@gmail.com>
 <62c5ed786f81ddea6d3587647520e9e4254c8612.1624174954.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62c5ed786f81ddea6d3587647520e9e4254c8612.1624174954.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_174222_696444_AA1F0333 
X-CRM114-Status: GOOD (  17.67  )
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

On Sun, Jun 20, 2021 at 03:48:07PM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:114:10: error: implicit
> conversion from enumeration type 'enum mt76_cipher_type' to different
> enumeration type 'enum mcu_cipher_type' [-Werror,-Wenum-conversion]
>                 return MT_CIPHER_NONE;
>                 ~~~~~~ ^~~~~~~~~~~~~~
> 
> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:114:10: error: implicit
> conversion from enumeration type 'enum mt76_cipher_type' to different
> enumeration type 'enum mcu_cipher_type' [-Werror,-Wenum-conversion]
>                 return MT_CIPHER_NONE;
>                 ~~~~~~ ^~~~~~~~~~~~~~
> 
> Fixes: c368362c36d3 ("mt76: fix iv and CCMP header insertion")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

It would be nice if this could be added to 5.14-rc at some point in the
cycle as this shows up in clang builds for allmodconfig for various
architectures and I still do not see it in -next.

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++--
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 3 ++-
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 4 ++--
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.h | 3 ++-
>  4 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index 863aa18b3024..c2e537a9c1dc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -111,7 +111,7 @@ mt7915_mcu_get_cipher(int cipher)
>  	case WLAN_CIPHER_SUITE_SMS4:
>  		return MCU_CIPHER_WAPI;
>  	default:
> -		return MT_CIPHER_NONE;
> +		return MCU_CIPHER_NONE;
>  	}
>  }
>  
> @@ -1201,7 +1201,7 @@ mt7915_mcu_sta_key_tlv(struct mt7915_sta *msta, struct sk_buff *skb,
>  		u8 cipher;
>  
>  		cipher = mt7915_mcu_get_cipher(key->cipher);
> -		if (cipher == MT_CIPHER_NONE)
> +		if (cipher == MCU_CIPHER_NONE)
>  			return -EOPNOTSUPP;
>  
>  		sec_key = &sec->key[0];
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
> index edd3ba3a0c2d..5b9b425bd836 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
> @@ -1073,7 +1073,8 @@ enum {
>  };
>  
>  enum mcu_cipher_type {
> -	MCU_CIPHER_WEP40 = 1,
> +	MCU_CIPHER_NONE,
> +	MCU_CIPHER_WEP40,
>  	MCU_CIPHER_WEP104,
>  	MCU_CIPHER_WEP128,
>  	MCU_CIPHER_TKIP,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> index c2c4dc196802..81633be09e90 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -111,7 +111,7 @@ mt7921_mcu_get_cipher(int cipher)
>  	case WLAN_CIPHER_SUITE_SMS4:
>  		return MCU_CIPHER_WAPI;
>  	default:
> -		return MT_CIPHER_NONE;
> +		return MCU_CIPHER_NONE;
>  	}
>  }
>  
> @@ -619,7 +619,7 @@ mt7921_mcu_sta_key_tlv(struct mt7921_sta *msta, struct sk_buff *skb,
>  		u8 cipher;
>  
>  		cipher = mt7921_mcu_get_cipher(key->cipher);
> -		if (cipher == MT_CIPHER_NONE)
> +		if (cipher == MCU_CIPHER_NONE)
>  			return -EOPNOTSUPP;
>  
>  		sec_key = &sec->key[0];
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> index d76cf8f8dfdf..3334afd8aea9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> @@ -199,7 +199,8 @@ struct sta_rec_sec {
>  } __packed;
>  
>  enum mcu_cipher_type {
> -	MCU_CIPHER_WEP40 = 1,
> +	MCU_CIPHER_NONE,
> +	MCU_CIPHER_WEP40,
>  	MCU_CIPHER_WEP104,
>  	MCU_CIPHER_WEP128,
>  	MCU_CIPHER_TKIP,
> -- 
> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
