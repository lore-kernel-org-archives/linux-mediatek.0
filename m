Return-Path: <SRS0=UFSY=QB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BBEC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 05:35:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6579A61027
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 05:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6579A61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Nr8976UiYYIGAxGDwjoMFlkhkYsFiXvGi4xGxvfnHc=; b=LRKbL8xx5HB3H6
	YK4qU+DvQUXP78PQXPrShMB8ae+L66KbNI/DVXs+Kj+vVtcpkyt702r/O3HDbqnziGXhHAoQ36Fhv
	tjuDIKqdBMppdVuJfDMNNGCcRokQnoQJtdiipY6qAHnZff05inY0GuwqCM4M5DU+M0ReCiCovbJVg
	s2Gv4PBSIlmQc2BDkHqADqbgs4qBg0XWOHUhLe8y+E5tIaZSkzU0nhAy0jxe+GiPHKefIdWq327Ra
	NH6E2oojWng7QeOjECrHhftbovpV1+R2y/q0gjQhqNHQsvxsAcBupgs0HpBFhkt25hN7PN8eAtWjd
	lnvvNaC+FSrVGJYiD3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mm8AL-00DLhr-Ih; Sun, 14 Nov 2021 05:34:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mm8AI-00DLh4-2h
 for linux-mediatek@lists.infradead.org; Sun, 14 Nov 2021 05:34:56 +0000
X-UUID: 47072bd7742d489cb3dc816838d9f8ff-20211113
X-UUID: 47072bd7742d489cb3dc816838d9f8ff-20211113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 619399543; Sat, 13 Nov 2021 22:34:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Nov 2021 21:34:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 14 Nov 2021 13:34:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 14 Nov 2021 13:34:45 +0800
Message-ID: <91230c580e09a192f32217ff6fed160bf1645594.camel@mediatek.com>
Subject: Re: [PATCH v2] mt76: mt7921: introduce 160 MHz channel bandwidth
 support
From: Ryder Lee <ryder.lee@mediatek.com>
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>, "Lorenzo
 Bianconi" <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Sun, 14 Nov 2021 13:34:45 +0800
In-Reply-To: <9385a730618c9c3f09120313280cdeb0b10154a2.camel@mediatek.com>
References: <66edc3125e9a12dedeba1a61697d46322b0c004d.1636374449.git.deren.wu@mediatek.com>
 <c622447038b06d8a4068ec8126c7ec674fafe383.camel@mediatek.com>
 <6978659235747261d652379d7d1a823f6b2f6505.camel@mediatek.com>
 <ee169af76f1d45b6178204585489c187dae97757.camel@mediatek.com>
 <9385a730618c9c3f09120313280cdeb0b10154a2.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_213454_157176_94EC46D4 
X-CRM114-Status: GOOD (  14.39  )
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


> > > 
> > > Since 80p80MHz is not supprted in mt7921, we should not register
> > > this
> > > capability to mac80211. When the feature coming, we may have a
> > > new
> > > config cap.has_bw80p80 to adapte the new flow.
> > > 
> > 
> > Then, how to tell 80p80M and 160M apart with only checking
> > IEEE80211_STA_RX_BW_160? 
> > 
> >  * @IEEE80211_STA_RX_BW_160: station can receive up to 160 MHz
> >  *	(including 80+80 MHz)
> > 
> > Maybe move has_bw80p80 into mt7921_dev as it is not generic to me?
> > 
> 
> As you noted, both 80p80M and 160M are included in
> IEEE80211_STA_RX_BW_160. We may not check two features
> by IEEE80211_STA_RX_BW_160 only. That is why I prefer to have
> .has_bw160 and .has_80p80 at next stage.
> 
> With the new feature, HW should report different result in the flow
> of 
> chip capability check. The check point should start from
> mt76_connac_mcu_parse_XXXX_cap() and then we can know the real
> capabilities of this HW chip.
> 

What about using device id? I think we can easily determine the BW
without adding .has_xx in to common core, and it looks more like a 7921specific stuff though.  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
