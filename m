Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB789C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 May 2025 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPafVRB97mEXudr2mY19uShaV1I8VrfBBuok7vkFHyc=; b=4glJOJlO6P/35uSa/ImxBF/mAT
	mD0nyQBIaRya4KiAmInEn2pYvwlh3EC2HNr9wldHSheaVVNI5K4PMQnvIZ/J3NG39tld8bl8v372p
	Ag7lqTbvMZWxvKx8stt1Lghb7vaewyAwYJ52bgZTjU4ZjrnNE4Zp9U1QViui+y/Gnme9+mepfqyxt
	XOfnATw5gdW55VrfHax0fWCQ/YA+FRZLbQQBte0UqxLJqOvQc5wT3Zj2zOzxQE5aaB7FVYXmTfcsH
	Isg9Sa8q7lLZE5GJk+PyCs2Yr6IPYipgsqoDBsIhhbPUopjXsQFhBhgtKEYSQkcjVV5Rt+1TWDpqU
	yMZI+Icg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL63-00000003IQ6-2eLJ;
	Fri, 09 May 2025 10:36:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKDj-000000038Sk-0kva
	for linux-mediatek@lists.infradead.org;
	Fri, 09 May 2025 09:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2072436A8;
	Fri,  9 May 2025 09:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03E9C4CEE9;
	Fri,  9 May 2025 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746783642;
	bh=zOi3E5QjZZzh6FbcXdbt+4r97uniOxVsMHgA5rk3t1g=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=EUUM6z2V+hU8XPPcWpu+Hgqk62TvIzPueE/vNsDfR++yS60wS3gLqvyF6b1ynhihi
	 M7Eo/WMpAZeDB2bucEQReUvEir/D8vpv73h7v8ukhZUloBZrCNJt5PLeSQmAsivm1Z
	 FaAafYJSr28UJxocLvAMy9ak7x4OdNrY5HZPaY8KoToqJls+03SaLt59+uBqhvoB3y
	 mDvCM+ajrjvbqCS2Fhx3pTspdk/gT4Pbv1tmdziu8+ijspkDp+UgVD7162NgPo5Vbs
	 k1H9+FhhZ9SVPe9TTN/ls1zS85thExo6i5t45XqqEx8GubCtbWEAEmUfxXS57PZ0bZ
	 3x9QW63rTs2wA==
Message-ID: <534b9a609564c8bb6d90805dca7fb1d3a45a3abf.camel@kernel.org>
Subject: Re: [PATCH v3] wifi: mt76: mt7925: fix missing hdr_trans_tlv
 command for broadcast wtbl
From: Niklas Schnelle <niks@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, nbd@nbd.name, 
	lorenzo@kernel.org
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Leon.Yen@mediatek.com, 
	Michael.Lo@mediatek.com, allan.wang@mediatek.com,
 Eric-SY.Chang@mediatek.com, 	km.lin@mediatek.com, Quan.Zhou@mediatek.com,
 Ryder.Lee@mediatek.com, 	Shayne.Chen@mediatek.com,
 linux-wireless@vger.kernel.org, 	linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, Benjamin Xiao	 <fossben@pm.me>
Date: Fri, 09 May 2025 11:40:36 +0200
In-Reply-To: <20250509010421.403022-1-mingyen.hsieh@mediatek.com>
References: <20250509010421.403022-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024043_242040_EB78AA98 
X-CRM114-Status: GOOD (  13.13  )
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
Reply-To: niks@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2025-05-09 at 09:04 +0800, Mingyen Hsieh wrote:
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>=20
> Ensure that the hdr_trans_tlv command is included in the broadcast wtbl t=
o
> prevent the IPv6 and multicast packet from being dropped by the chip.
>=20
> Cc: stable@vger.kernel.org
> Fixes: cb1353ef3473 ("wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta=
_cmd")
> Reported-by: Benjamin Xiao <fossben@pm.me>
> Tested-by: Niklas Schnelle <niks@kernel.org>
> Link: https://lore.kernel.org/lkml/EmWnO5b-acRH1TXbGnkx41eJw654vmCR-8_xMB=
aPMwexCnfkvKCdlU5u19CGbaapJ3KRu-l3B-tSUhf8CCQwL0odjo6Cd5YG5lvNeB-vfdg=3D@pm=
.me/
> ---
> v2:
>     add tested-by tag
> v3:
>     add more info in commit
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index a42b584634ab..fd756f0d18f8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -2183,14 +2183,14 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
>  			mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
>  			mt7925_mcu_sta_eht_mld_tlv(skb, info->vif, info->link_sta->sta);
>  		}
> -
> -		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
>  	}
> =20
>  	if (!info->enable) {
>  		mt7925_mcu_sta_remove_tlv(skb);
>  		mt76_connac_mcu_add_tlv(skb, STA_REC_MLD_OFF,
>  					sizeof(struct tlv));
> +	} else {
> +		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
>  	}
> =20
>  	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);

Thank you for picking up my suggestions so quickly! This looks much
better now.

