Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A13C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXTCWqMwOiGrqGhIfVICgdH59Rg8eG+wMJ5TIMLKcKA=; b=MfLgy9505nKMk3
	l5F3NcESY+mib111ZRMbTE6uOEjObay0nvu6sEJvmbkwmMxB0S/af/NWbQof+CzNha+N+hsR0ij1A
	T8JcQUE2vLUGuancVhBKGQcm6+EftYNGlON6M+/9NIegZGHUNLpFoPy2dvOLzyMYLE3/0UXAjeHcU
	CtPNHhdqtUV/QgIYRE2YyLDkk2Eofd/qg5qkLhfRJJz5JhLKH0aQploZJOLfHbBnC18DtiB0HMkSc
	Hi5zx9MSW/czlDhfzUnOOta9kmDMOzpuar2fPyTRsNoUIZfCYf7SnfzceTu+G0znEr0SG9XyYnUpm
	qPxGWATVc+Q7iTbZDk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrius-008MZ5-C9; Thu, 19 May 2022 16:22:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriuo-008MYB-FK
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 16:22:21 +0000
X-UUID: 7945eb0d9a804f09920a99f13b8d98f4-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:40abe4d9-3f05-47f9-a75b-d4922cd1c102, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:dbd3e379-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 7945eb0d9a804f09920a99f13b8d98f4-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 42313560; Thu, 19 May 2022 09:22:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 09:22:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 00:22:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 00:22:05 +0800
Message-ID: <db3cf5f53242ec98406e4bb577f7bbb40b371231.camel@mediatek.com>
Subject: Re: [PATCH 3/3] mt76: mt7921: introduce BIOS SAR config in tx power
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
 <mingyen.hsieh@mediatek.com>
Date: Fri, 20 May 2022 00:22:05 +0800
In-Reply-To: <8207b98b-0c10-aff4-55c4-6c7118454832@nbd.name>
References: <cover.1652941276.git.deren.wu@mediatek.com>
 <2e6b69a763d60897639101506e39a2b1a81d8eab.1652941276.git.deren.wu@mediatek.com>
 <8207b98b-0c10-aff4-55c4-6c7118454832@nbd.name>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_092218_563438_C107E409 
X-CRM114-Status: GOOD (  21.11  )
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

Hi Felix,

On Thu, 2022-05-19 at 17:33 +0200, Felix Fietkau wrote:
> On 19.05.22 08:38, Deren Wu wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > Add new function mt7921_set_tx_sar_pwr() to update SAR power from
> > .set_sar_specs and BIOS setting. Both settings would be merged into
> > mt76_freq_range_power for final tx power value.
> > 
> > Reviewed-by: Sean Wang <sean.wang@mediatek.com>
> > Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > ---
> >   .../net/wireless/mediatek/mt76/mt7921/init.c  |  3 +-
> >   .../net/wireless/mediatek/mt76/mt7921/main.c  | 32 +++++++++++++-
> > -----
> >   .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
> >   3 files changed, 26 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > index 80279f342109..c86d8805f291 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > @@ -1469,20 +1469,34 @@ static void mt7921_ipv6_addr_change(struct
> > ieee80211_hw *hw,
> >   }
> >   #endif
> >   
> > +int mt7921_set_tx_sar_pwr(struct ieee80211_hw *hw,
> > +			  const struct cfg80211_sar_specs *sar)
> > +{
> > +	struct mt76_phy *mphy = hw->priv;
> > +	int err;
> > +
> > +	if (sar) {
> > +		err = mt76_init_sar_power(hw, sar);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	mt7921_init_bios_sar_power(mt7921_hw_phy(hw), !sar);
> > +
> > +	err = mt76_connac_mcu_set_rate_txpower(mphy);
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(mt7921_set_tx_sar_pwr);
> 
> Why is this exported?

Thanks for pointing out. I will remove unnecessary export in next
version.


Regards,
Deren

> 
> - Felix
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
