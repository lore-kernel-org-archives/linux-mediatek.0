Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FEDC83F0F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21hQW5N5nZA/JerVYq7h605l0Ii0PUeCaKPMFrRer5c=; b=4HtNbvV83qtaVIk+BtyVKddMeQ
	leNYDToMozqSLUJjBZ9l/uSzWvVlXHtCzjeeEK3Z50aykp09KC0AYvpbxZTaML5/D+qiOcGlsoj66
	BoDdKFnOSu2ca7Ew1E7oQXwzMWDc+HmxgCOLJvN47e3xJV/kLuDTY96XRyUehJ3AroFxiXWmT7Dqm
	QZQfqsrxtiwKXqzpIfks+JLYXDTrBDzC7pQva2+Seadbq+GHjleBvgzVrSFDoc8fAh8rDV6dmhLMe
	G4r9hq0LD37PEbvfLKF8ym4Njdj9xzecsFJ+uSq6z+NvbyFDsePn3fnD5OL/h4ZvCn+yesEHkxHuD
	usPM32Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3jP-00000004ktn-1sYj;
	Tue, 08 Jul 2025 08:31:15 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3fD-00000004kAp-2nCN
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 08:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=21hQW5N5nZA/JerVYq7h605l0Ii0PUeCaKPMFrRer5c=;
	t=1751963215; x=1753172815; b=ekJKu//1JUapgTiYu1Mz58oLDWbgVvzuPGUGbtRgYgpwq5p
	k2E0rJ49hyVmXd8gjwq3NVdaqGgvqnguvZ8U03HDN39WKrK12gPEzUaM8VoDhvDDLcK3bj+iTcFcp
	w8Bys03UkBMMVBtShXRqP1QgtGM/Zhet0fM3X+P5uhN+riybkyhxi660br+kMHgd3JTsTClxlyAbz
	ETqPHQalp6TE/MUxVP2XeCOCN9OQvOOY5Llghyn03mTzyqQbGIU6KXHN6PYp70t0u/TLn9/uHCoQr
	G/jh0bnpBf4K2xP7HW+m5jGAjkHNE+54b6c04zhscbE9T/yQYyq2zdpbx11EDRCw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uZ3f2-0000000Bjtz-2SO1;
	Tue, 08 Jul 2025 10:26:44 +0200
Message-ID: <e4200088d9a56fa4ec6bf25c13375df7b9d13b42.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: disallow AP interface from getting
 BIGTK in RX path
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek	
 <linux-mediatek@lists.infradead.org>
Date: Tue, 08 Jul 2025 10:26:43 +0200
In-Reply-To: <20250702104516.2738962-1-michael-cy.lee@mediatek.com>
References: <20250702104516.2738962-1-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012655_701347_DF48AC71 
X-CRM114-Status: GOOD (  17.87  )
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

On Wed, 2025-07-02 at 18:45 +0800, Michael-CY Lee wrote:
> The problem was that when the AP interface with BIGTK set received
> beacons with MMIE from other BSSes, it tried to verify the MIC using its
> BIGTK, which must fail and be notified to the upper layer by
> cfg80211_rx_unprot_mlme_mgmt().
>=20
> The solution is to prevent the AP interface from getting BIGTK in
> the RX path, as the AP should only use the BIGTK to calculate the
> beacon's MIC value.
>=20
> Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
> Reviewed-by: Money Wang <money.wang@mediatek.com>
> ---
>  net/mac80211/rx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index 7671fd39a60e..f2d63a7cc642 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -1888,6 +1888,10 @@ ieee80211_rx_get_bigtk(struct ieee80211_rx_data *r=
x, int idx)
>  	 * index (i.e., a key that we do not have).
>  	 */
> =20
> +	/* AP interface sould not use BIGTK to decrypt */
> +	if (rx->sdata->vif.type =3D=3D NL80211_IFTYPE_AP)
> +		return NULL;

Could this apply to other interface types (AP_VLAN? mesh?) as well?
Maybe this validation should instead be restricted to where it matters?
Or maybe it should only limit the rx->link->gtk[] lookups, not the per-
STA ones?

(Also, what about wireless/wireless-next? please add a tag)

johannes

