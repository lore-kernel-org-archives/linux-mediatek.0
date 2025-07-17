Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5995FC83F38
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYi0/WapeRzpmbObHuOB/kY1akJu7pL4zSBarvKzMK0=; b=DNxFpo1lTkibQqWyD2EPtKpwEW
	zZ78gxATmPwqirRwUvusGLUgQoUIF8hpk3xkVAC15z+ZTzIQNqWFUPjPe30F9+gQ8G4+ff+DstNCn
	v9gOrkqtUpsuBUJCgGEGXQQy9zRXexz8JfLdqoQvMwKtev6eFGt2JxTOygWgOjFZFGu4vtN/+he7s
	o+AJoPI3toO6+2383H+fdxztNFvie1KsnjcZespfvEHPbvY9EtaUzxt5RxL11tarABXFRG/mh389+
	sFrD/HTG8wRG2RFizDARA7DU/2lAyHOH/QiouheR6Ckxh7+HYRTVapbMHJtgcQOdOXjv3ftyk3XeC
	R4/fPTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ7Z-0000000ARWc-2HHD;
	Thu, 17 Jul 2025 15:02:05 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOw2-0000000AI2B-3X2T
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 13:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=xYi0/WapeRzpmbObHuOB/kY1akJu7pL4zSBarvKzMK0=;
	t=1752759965; x=1753969565; b=HE1NH0QWF3U0kb8eNRJ0KjwzIFLhTazfIZXapfi4IzV8LOK
	5zltkPVSTKUKQimq1VyK2M+XZ6NkvGqOkAhUXWWtYeZq5ApvR9AIW/izmev2kkFwdtbg6V0G+9A5t
	wjca4szRrjWOentmbYPMBbBiD7BDhR3S4RTqpURawOr3C2OP97iYL4adm5S9ePgHqcFFDT03iqslW
	P7fkZZ8i9KTGoh6WIakzWF7PzxGlpp8KhSjCKYOVXG/iE1NZ3Ymlbb05gjpNWRQCM9gzGNsN6Bb6t
	EU+FQpZQvM6WMwT12G2lnf6LGhUX/LCA6QNEArIjD5uSeysvDRpqeKqW8scxJP+Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ucOvx-0000000Aeey-2J22;
	Thu, 17 Jul 2025 15:46:01 +0200
Message-ID: <fa538ba960369497f6d65c1448ab7710f76aa078.camel@sipsolutions.net>
Subject: Re: [PATCH wireless v2 1/2] wifi: mac80211: Update skb's control
 block key in ieee80211_tx_dequeue()
From: Johannes Berg <johannes@sipsolutions.net>
To: Remi Pommarel <repk@triplefau.lt>, Bert Karwatzki <spasswolf@web.de>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 17 Jul 2025 15:46:00 +0200
In-Reply-To: <aHj4zS_3uhDRhzDn@pilgrim>
References: <06aa507b853ca385ceded81c18b0a6dd0f081bc8.1742833382.git.repk@triplefau.lt>
	 <20250410215527.3001-1-spasswolf@web.de> <Z_jpq26P99qzPP1c@pilgrim>
	 <1df3a3df19b77e3b8d1f71a3a93c61221ff46a6b.camel@web.de>
	 <aHj4zS_3uhDRhzDn@pilgrim>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_064606_878102_842D1D88 
X-CRM114-Status: GOOD (  12.28  )
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

Hi,

On Thu, 2025-07-17 at 15:21 +0200, Remi Pommarel wrote:
> I have ordered a mt7921 card so I could reproduce this and finally took
> time to debug that.=C2=A0

Oh wow, talk about dedication. Thank you!

> The issue comes to the fact that mt7921 uses 802.11
> encapsulation offloading and as such we are calling
> ieee80211_tx_h_select_key() on a 802.3 frame.

Oh... Guess we could've thought about that, sorry. Though I would've
thought ath12k will also do that. Maybe not in the config you were
seeing the issue in?

> This function casts the skb data as a 802.11 header regardless the skb
> is 802.11 or not in order to decide if the info->control.hw_key needs to
> be set. So the hw_key is likely to remain NULL in ieee80211_tx_dequeue()
> and because mt7921 driver needs this key to be valid data frames are
> dropped.
>=20
> Will send a patch so that ieee80211_tx_h_select_key() does not try to
> get info from a ieee80211_hdr mapped on 802.3 packet data (i.e. when
> IEEE80211_TX_CTL_HW_80211_ENCAP is set).
>=20

Sounds good!

johannes

