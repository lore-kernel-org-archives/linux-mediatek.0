Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1120C3ABBE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 May 2025 22:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHi8P7pgdSS3IF9nrw7/5IwinNCV664/YxmEOEm+Rjw=; b=iT0ewSqQyk2nvZhCq+dtsDM/l9
	v6tFh1h5j9vbZgEv6o9e1Qs1T84fwUrufMu97ziDtCeZMv8IHZU3GvC2ae6LjJG/N3ItMRrz98egk
	8j6keeCKXI18FEti3tfBsdlLXPRWI3RRDr3zGrXPsArvAy7PryEaVGgBbhFC5D5XmKJNeFgyWl5FN
	xWX0Hh7C3eJ2cvKrL2Z2r89Av72++soJV4SB4qaTKwSe8lg9Tpn0RJYRdYQ+A+z1zKjOwhRuE+1Bf
	PNQtgIzKlVL9YXdazGhVubo0q5H+VRNvox3nSwM1qZOYThCRtmj9v1H6E+x8+SEOSZ3MrJlJFr3lh
	xH7FQDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD9NY-00000001sph-1PrH;
	Thu, 08 May 2025 22:06:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD9NV-00000001spM-3FtV
	for linux-mediatek@lists.infradead.org;
	Thu, 08 May 2025 22:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E14034A33E;
	Thu,  8 May 2025 22:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE5DC4CEE7;
	Thu,  8 May 2025 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746741963;
	bh=nJGSya3nk9fSTp7YpGyO3JhSqO1gXL/uAOoUiq4UGgo=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=IN+DE+wuCAWPAELs5oW0EpKs5ORy43kC+oE1Q2vW0wWTQQwY29Op9abjDOt6onAQt
	 6Ut9bUmgXFuh+1IXL/m7ysUpkC/rhe6i7MrxqhnuU/+TzfpMMtkV28rrryI86j18RF
	 e3Cc3+28GQ2WCy0U/Rous0UTwRv/vo4y5PXoaO8zeV0rmPmRzAfwq/SqVTdoyKq+MY
	 dbXI/tF95dqosOSSmgIHom4Frq2mcOWUFPcGIME4Q4u62aPY/OnxzzDv9eoQarkt5Z
	 b1/2jIYRuD1IOX9x8F0skh/+az+G/LbnTZlnmanbtiH9tIf5mUmdGrnieIPwHOHkQ6
	 nRNNo290L6UZA==
Message-ID: <18a80b20916b2f7d73ea29cc67d1389662f9836b.camel@kernel.org>
Subject: Re: [PATCH v2] wifi: mt76: mt7925: fix missing hdr_trans_tlv
 command for broadcast wtbl
From: Niklas Schnelle <niks@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, nbd@nbd.name, 
	lorenzo@kernel.org
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Leon.Yen@mediatek.com, 
	Michael.Lo@mediatek.com, allan.wang@mediatek.com,
 Eric-SY.Chang@mediatek.com, 	km.lin@mediatek.com, Quan.Zhou@mediatek.com,
 Ryder.Lee@mediatek.com, 	Shayne.Chen@mediatek.com,
 linux-wireless@vger.kernel.org, 	linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, fossben@pm.me
Date: Fri, 09 May 2025 00:05:57 +0200
In-Reply-To: <20250508085534.305242-1-mingyen.hsieh@mediatek.com>
References: <20250508085534.305242-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_150605_857052_2551FDEA 
X-CRM114-Status: GOOD (  20.02  )
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

On Thu, 2025-05-08 at 16:55 +0800, Mingyen Hsieh wrote:
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>=20
> The hdr_trans_tlv function call has been moved inside the conditional blo=
ck
> to ensure it is executed when info->enable is true.
>=20
> Cc: stable@vger.kernel.org
> Fixes: cb1353ef3473 ("wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta=
_cmd")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Tested-by: Niklas Schnelle <niks@kernel.org>
> ---
> v2:
>     add tested-by tag
>=20

Thanks for adding the tag, appreciate it. If I may add some stylistic
comments. I saw that this is one of your first independent upstream
patches so congratulations on that and even better it's an actual
proper fix. Well done!

One thing, I noticed though is that your commit message lacks context,
like this affecting IPv6 and multicast. Basically it just re-iterates
what I can already see in the code. It also doesn't use the recommended
imperative tone (see [0]). Moreover, I think this would be a good case
for using a Link: tag pointing to the thread[1] of Ben's bisect result.
Relatedly one could also add a Reported-by tag for Ben, I still fondly
remember getting a Reported-by mention long before I did my first
kernel contribution. This stuff is hard to balance with getting fixes
out there and I still screw up some detail with mails sometimes, but
we're all learning so wanted to give my 5 cents.

Thanks,
Niklas

[0]
https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html#descr=
ibe-your-changes
[1]
https://lore.kernel.org/lkml/EmWnO5b-acRH1TXbGnkx41eJw654vmCR-8_xMBaPMwexCn=
fkvKCdlU5u19CGbaapJ3KRu-l3B-tSUhf8CCQwL0odjo6Cd5YG5lvNeB-vfdg=3D@pm.me/

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

