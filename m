Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0559C83F04
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmjK8rNSM/xmVXwtCilTwJLsFw22/Z+6WW9SGkMh9Y4=; b=NKYxEJSxRl1YCNDPOoqYPBZo5i
	a8TjkhkWaqyidfxNGQTEQKRLjQGPLFLHtaGArmbi/4Xt5ZZlD+onWIZ2NjT8rSCfnfH2z+4kxGf1E
	n6caR09/nuE3Md/s67NnDV0cq7Ed8oSo5OcRCkgmbFiRQs2E0wCezZhnR8RBM5zIpbmDmu0eqylUa
	ULI+sCBMh9fkcUcuymgqilNYYCFmkA+2N2P7fmmgZ8uoSQe+Z3YtR6Ct+QXx1PyGKRRvAu+M3X7wM
	ifibaYYkVoZ0MUYzKN6vpXiwkk2M+22niRE8vAv9tHpdC18mjVjqLgaS36giN4B2FxiDClpZwxOLI
	lH6O9faA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwAF-00000008EGR-1DhI;
	Wed, 02 Jul 2025 12:02:11 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv4t-000000080wH-2kPB
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 10:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=VmjK8rNSM/xmVXwtCilTwJLsFw22/Z+6WW9SGkMh9Y4=;
	t=1751453553; x=1752663153; b=w4XBsX+Lk7xXkdx4lmWTrqg9znj8niS+ezC8FkXla0XgR1F
	hWWiRbFYBOGXvsHNHyyTGWc1G4IMbfyOdkBwvqzgHKCjiZFNBy7CrG7Z0WXg17uLuQ3HgmYksQur4
	I5Yb9sg2/expdNl86hCurKjFzRrkr1GuNsBGfDNo79VH31B0Q0lapqie3nhwpdUNLWiGHcBIaKNEe
	IgiVis35zV7fUocVAaGIzmpgaCuXfVNUYS6BtSt/62VCCF5iUgO7SAjSha6daLE1l7ASCM72hUkIk
	NabEmS2WyYIBAEqPXr7fhrm9ixOc1D/BeOSK9K0ogftbcewcZXxp5Q0pNOpuKyfw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uWv4m-0000000429T-40sT;
	Wed, 02 Jul 2025 12:52:29 +0200
Message-ID: <6c666ab6d83ba45f9f15643eeffed5d0f4770867.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: determine missing link_id in
 ieee80211_rx_for_interface() based on band
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek	
 <linux-mediatek@lists.infradead.org>
Date: Wed, 02 Jul 2025 12:52:27 +0200
In-Reply-To: <20250702104403.2738634-1-michael-cy.lee@mediatek.com>
References: <20250702104403.2738634-1-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035235_710237_531967E6 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2025-07-02 at 18:44 +0800, Michael-CY Lee wrote:
> For broadcast frames, every interface might have to process it and
> therefore the link_id cannot be determined in the driver.
>=20
> When the frame is about to be forwarded to each interface, we can
> use the member "band" in struct ieee80211_rx_status to determine the
> "link_id" for each interface.

Hm. Qualcomm has a similar thing with frequency, I think, and that
probably makes more sense for them since 'band' isn't unique for the
radio:

https://lore.kernel.org/linux-wireless/20250612121127.1960948-3-maharaja.ke=
nnadyrajan@oss.qualcomm.com/

Or is it not related?

johannes

