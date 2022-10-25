Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C965C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwXtOrBGmhN+rfXZEJWhEkUK9+9OxseQHuwTgjxb580=; b=Nlm1ySMI5O9WjN3jbpGSwOQuOl
	G5caQVE130oYuPRFy/O0XWnjledXZmb3GjSIhBwA/ck+zL7TY5+xx3Q0E4PvfItfY1X+BVw35pUJy
	/yBsQUHAVgt4cJGFYo5fmuOPjPwpdWh0/wzvdyHt/E6hdYFILTT1NfH6fdKtcqdAylfXZx8TDpL7o
	pOf7VrrqEmfgMczT8YI/kh1SgVUtmARfH3Zdu4wEBeNiIwwWI21kh4mrCQiylazWVFTJFPlL8BLSs
	sk8LZwvK3ttRCdcKpT21CeiVIL9+4njy0V61C4PmXhgC20WxPIL5OtImiDkwgKedLocCr0RwCrrJp
	nhflbqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHON-004pjg-FC; Tue, 25 Oct 2022 10:42:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHOK-004pit-8W
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 10:42:41 +0000
X-UUID: 04ca266647d04240b5f8640916630dd4-20221025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nwXtOrBGmhN+rfXZEJWhEkUK9+9OxseQHuwTgjxb580=;
	b=hDsK3fl8B3MN/Dg8xk7mwD2JQs9xMg9x629ERwVWh8eWTLIVqocU3USFyBBOnv6GlEagdWpl+InfXTtOLfDH6opD0fOOs4Okuu7FgDNZdYFx2Vmpq3zX3r0GA7O6mup1DUagdLvKfCavIAa4vMhYUS9sruQ4MaaEKILG8PkN0pM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:036c4c43-fcd3-4216-8cb3-53397f602cc3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:babe1327-9eb1-469f-b210-e32d06cfa36e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 04ca266647d04240b5f8640916630dd4-20221025
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1159897608; Tue, 25 Oct 2022 03:42:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 25 Oct 2022 18:31:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 25 Oct 2022 18:31:57 +0800
Message-ID: <8db3eb8a72da2d478780782a54305e3cf1b5b50a.camel@mediatek.com>
Subject: Re: [PATCH v2] wifi: mt76: fix bandwidth 80MHz link fail in 6GHz
 band
From: Deren Wu <deren.wu@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, "Soul
 Huang" <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Date: Tue, 25 Oct 2022 18:31:56 +0800
In-Reply-To: <Y1efUIq4aCFO7V6j@lore-desk>
References: <85b5e8374fc9b86fb955060c1840f3b2a1d187e4.1666614616.git.deren.wu@mediatek.com>
	 <Y1efUIq4aCFO7V6j@lore-desk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_034240_337744_D7ADBC85 
X-CRM114-Status: GOOD (  19.02  )
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

Hi Lorenzo,

On Tue, 2022-10-25 at 10:33 +0200, Lorenzo Bianconi wrote:
> > From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > 
> > Due to information missing, the firmware may be fail on bandwidth
> > related settings in mt7921/mt7922. Add new cmd STA_REC_HE_V2 to
> > apply
> > additional capabilities in 6GHz band.
> > 
> > Tested-by: Ben Greear <greearb@candelatech.com>
> > Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > ---
> > v2: Fix le16/cpu type problem, reported by kernel test robot <
> > lkp@intel.com>
> > ---
> >  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 34
> > +++++++++++++++++++
> >  .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 11 ++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > index 011fc9729b38..9bba18d24c71 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > @@ -744,6 +744,39 @@ mt76_connac_mcu_sta_he_tlv(struct sk_buff
> > *skb, struct ieee80211_sta *sta)
> >  	he->pkt_ext = 2;
> >  }
> >  
> > +static void
> > +mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct
> > ieee80211_sta *sta)
> 
> Is this tlv available just for 7921 fw? If so I guess we should add
> it just for
> it since mt76_connac_mcu_sta_tlv is used even by other chipsets.
> 
> Regards,
> Lorenzo
> 

For now, mt76_connac_mcu_sta_he_tlv_v2() would be used for mt7921 only,
not for other chips. However, it would be used for all next-generation
chipsets. I propose to put it here and we will take this API in new
chip porting.

Regards,
Deren



