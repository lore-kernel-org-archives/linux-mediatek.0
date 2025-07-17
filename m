Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2942DC83F38
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8aWAVi1JHdhRfr6mcngPcM1V/JkdL8TAXeFc1ey/hs=; b=KtleU4sWVLOKJCYUxtl+Q/GXjI
	9GFfNtc2SbKxiVFASXnF/ru7RhWy64La/sWxHKVaWL9Vhs2fmrCju5soa35+bDvW7HTSdjRQkYSm4
	bE+NGztyQdGpsPKxCpAvHqA3DUy1XhDYpKJw7xSPvi18ytuW9ahnRdcJKiL0mJPIgNSgP5B7bMcrF
	XzLi9frCTHT4gF7rNipPSZCapEKPFn7bBMtwgMlZu5rF5AgvP0cp6yKmZTXSQ4xOxX6TYckQuZBrB
	D/OM0TA0eJFupUbvBIBi8czP2nbIj1L7ryC5cTCuxtN7OZgAlRwfje+lJ4yv1mb/g/0eXeeH74qrz
	CJzN00mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ9J-0000000ASZ3-3Ikj;
	Thu, 17 Jul 2025 15:03:54 +0000
Received: from e3i105.smtp2go.com ([158.120.84.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPfk-0000000AOAK-2KNu
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 14:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1752762792; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=P8aWAVi1JHdhRfr6mcngPcM1V/JkdL8TAXeFc1ey/hs=;
 b=YkrsQbmqBAUXsYMJ5CCtf7v1KzU5aDUZTn71dQusZHUWg1lO478SlP9w+MQ/961LrafoT
 uj6NOGrExX7/ReKvXYZUpuJ0PFZgOTSh9cQD7OXyPYsNFjikvLeZeck0n0jxYA6uWebGjwi
 sJljqLL0PGi6ek2wJHXsttlJkuLYC0iTlO0WtFqe5Z0zRInKhUnMHk/cnqMkZKVP7pxTcXf
 6aYo2TIrcSzG/C9PldSRKBbBCozjGIxzuIpgGwKMIrdJGydYsn9eRENhB06VOOpKaW9Vz87
 jV0VrMOXYr1VBaVaPh/BYTHNOHblU1oS8mlv0kYi9rI9wLzILthJgUNIhlqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1752762792; h=from : subject
 : to : message-id : date;
 bh=P8aWAVi1JHdhRfr6mcngPcM1V/JkdL8TAXeFc1ey/hs=;
 b=ZlNVgmmFyRGFIZZCXMwzoyeXSPy3d9GJHDVl2w6n+IAnDPgFn1bzRKJY0glUcB5ZbrOaJ
 k9FULI+RV6e/QxbhuuY4MAXFWJycd35QCuOIb4JNX56jy5Yku6GYUQVdzRjSWSIaBothF3O
 xXUFNIFIuXgmUuljIO112noLKuvVOdLovy8RSTPcgh5BrT/cqVD7epO2QJzcjRExk1jts0c
 2XbnOvs5rFC6/AnVlohk5TB1IfgZiZO56X3FSFrW7SRNgun8q0+uyaF0YH+dsP3bVSCiy1w
 nYZUBs0C0qxvoIeq+Z8DeNvZXtEAOjPL10dc+NBog0xW56f070kiFPckkDlw==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1ucPfU-4o5NDgrfJDm-sFY3;
	Thu, 17 Jul 2025 14:33:04 +0000
Date: Thu, 17 Jul 2025 16:22:48 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless v2 1/2] wifi: mac80211: Update skb's control
 block key in ieee80211_tx_dequeue()
Message-ID: <aHkHOC6DYBXtnE5e@pilgrim>
References: <06aa507b853ca385ceded81c18b0a6dd0f081bc8.1742833382.git.repk@triplefau.lt>
 <20250410215527.3001-1-spasswolf@web.de>
 <Z_jpq26P99qzPP1c@pilgrim>
 <1df3a3df19b77e3b8d1f71a3a93c61221ff46a6b.camel@web.de>
 <aHj4zS_3uhDRhzDn@pilgrim>
 <fa538ba960369497f6d65c1448ab7710f76aa078.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa538ba960369497f6d65c1448ab7710f76aa078.camel@sipsolutions.net>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sBGiWowcYh
X-smtpcorp-track: 1n5Nh4DXWtvQ.q6lGNdJ4btFq._zxQxguT_Df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_073320_928112_24274049 
X-CRM114-Status: GOOD (  25.70  )
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

On Thu, Jul 17, 2025 at 03:46:00PM +0200, Johannes Berg wrote:
> Hi,
> 
> On Thu, 2025-07-17 at 15:21 +0200, Remi Pommarel wrote:
> > I have ordered a mt7921 card so I could reproduce this and finally took
> > time to debug that. 
> 
> Oh wow, talk about dedication. Thank you!
> 
> > The issue comes to the fact that mt7921 uses 802.11
> > encapsulation offloading and as such we are calling
> > ieee80211_tx_h_select_key() on a 802.3 frame.
> 
> Oh... Guess we could've thought about that, sorry. Though I would've
> thought ath12k will also do that. Maybe not in the config you were
> seeing the issue in?

I've mainly tested on ath*k HW. Either without 802.11 encapsulation HW
offloading or with it but only on ath12k and it seems that this driver
does not need the key in this mode. After a quick look into ath11k and
10k that also seems to be the case for those chips.

For the record, if I am not mistaken, ath12k driver does not seem to
support 802.11 encaps HW offloading mainline yet, I do seem to have some
vendor patches to support it though.

> 
> > This function casts the skb data as a 802.11 header regardless the skb
> > is 802.11 or not in order to decide if the info->control.hw_key needs to
> > be set. So the hw_key is likely to remain NULL in ieee80211_tx_dequeue()
> > and because mt7921 driver needs this key to be valid data frames are
> > dropped.
> > 
> > Will send a patch so that ieee80211_tx_h_select_key() does not try to
> > get info from a ieee80211_hdr mapped on 802.3 packet data (i.e. when
> > IEEE80211_TX_CTL_HW_80211_ENCAP is set).
> > 
> 
> Sounds good!
> 
> johannes

-- 
Remi

