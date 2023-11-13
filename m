Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E215C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwKUQgZ8c/rCfYaF4u6mj2l9ehYS2OQ+enRdM0kGD08=; b=F/7vWkEURuZim6ZFWUeir6NKQU
	kWINYdYVzX/0oJ7qBcAJK79qZ2V40oYU9eTTw9tJRnbu4mBPtw/ej/LZhprlzyF03h5xXil5HMXVn
	aZJhhc7FCXjpiLHIbTmNNTHlLoe/IPtUlGQtGihkgvfobz7FHn0PbUB812ETum7kjmvDKf7rHKgKc
	2LgVDuQufRVdMRsEd4531neKmvM4KDFLbNzV795wA1936l9oiTPeEyMkgTrmnijRb5Udi0xZUyPKr
	KHlIx8uPdzmXFx/PPIgrgEe/lvAUu3Noz9X2Sv63UNV8yW71X0d7NbYGtPm8mvJ0LKJO7HlcJIIEH
	JW4t5MZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2U4D-00Ddt5-2o;
	Mon, 13 Nov 2023 10:21:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2U4A-00Ddrw-1t
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 10:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=rwKUQgZ8c/rCfYaF4u6mj2l9ehYS2OQ+enRdM0kGD08=;
	t=1699870869; x=1701080469; b=xTEJbuE9EnwcdhCRsDfGk1HJ8D1Q23644CcoYQxIRCx8eZM
	OPwBGkwYbX6npdW6voLcBrXBRfYpenHcnnVdHLyT3D/HeJE7RQIy/gEeu3hKZCVE3oJ1r2bdq28NP
	+xFRSCmxwqQAwftkykA/DB6ZKQQpkTq1yC+Lci76IYw07olvJBdFBdetl+RpX4TMwDsLlAhElGO84
	tmCakU73ooXpjAFKSyl1Ob2jKs7YyBQSLlXyXUkr7ZoEOIu+OjxIKU3HnH7xs9v0kGoct2kHmz7rf
	B10Kmu5khWdzwRAtV+Ik7x08V7+Xg2Cgzg4sSYqSXHTr3H7KpX1BiuS++ZKPAnkA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r2U3r-00000006dsI-0RQY;
	Mon, 13 Nov 2023 11:20:55 +0100
Message-ID: <2eaa04080702230b8dbe3b3541d6d831484c4f1f.camel@sipsolutions.net>
Subject: Re: [PATCH v2,2/2] wifi: mac80211: Refactor STA CSA parsing flow
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Mon, 13 Nov 2023 11:20:53 +0100
In-Reply-To: <20231113021107.13110-2-michael-cy.lee@mediatek.com>
References: <20231113021107.13110-1-michael-cy.lee@mediatek.com>
	 <20231113021107.13110-2-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_022115_103791_8903C26A 
X-CRM114-Status: GOOD (  18.06  )
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

On Mon, 2023-11-13 at 10:11 +0800, Michael-CY Lee wrote:
> The Wi-Fi Standard (IEEE 802.11-2020 9.4.2.160) initially specified that
> the Wide Bandwidth Channel Switch (WBCS) IE subfields have same definitio=
ns
> as the S1G or VHT Operation Information according to the operating band.
>=20
> However, it did not change the definitions in the amendment for 6 GHz
> (IEEE 802.11ax-2021), so the logic remain the same for handling the WBCS
> IE even if there is no VHT mode in 6 GHz.
>=20
> Now the Wi-Fi Standard draft (IEEE P80211be D3.2 9.4.2.159) modifies the
> defitions, making the WBCS IE subfields follow the definitions of S1G,

type - definitions

> VHT and HE Operation Information in S1G, 5 GHz and 6 GHz band, respective=
ly.
>=20
> APs in 6 GHz band might use the VHT or HE Operation Information to build
> a WBCS IE according to the Wi-Fi Standard they follow. Originally, the ST=
A

Probably should say "Element" in place of all those "IE" - the spec
stopped calling them "Information Elements" a long time ago :)

> just parsed the WBCS IE as VHT Operation Inforamtion, which was wrong if
> the AP was actually build the IE by the HE Operation Information.
>=20
> To avoid the ambiguity, STA should prefer the op_class in the Extended
> Channel Switch Announcement (ECSA) IE rathen than the WBCS IE. If the ECS=
A

typo - rather

> IE is not presented in a channel switch to 6 GHz, the STA should be aware
> of the possible ambiguity when parsing the WBCS IE.
>=20
> To derive the correct bandwidtin in use, the STA should check the

typo - bandwidth in

> +	case 4:
> +		/* 320 MHz bandwidth
> +		 * TODO channel switch to 320 MHz bandwidth should be indiated
> +		 * by Bandwidth Indication IE (IEEE P80211be D3.2 9.4.2.159)
> +		 */
> +		he_6ghz_oper->control =3D IEEE80211_EHT_OPER_CHAN_WIDTH_320MHZ;
> +		break;

I'm not sure what this TODO was meant to refer to, but I do know that
D4.1 made some changes here, maybe we should check those? I haven't even
checked what the changes are though.

In any case, checking with a newer draft and using that would seem
useful?

Haven't really read all the other things here yet, this just caught my
eye since I also just heard about D4.1 changes, but I don't have that or
even the old stuff all in my head right now.

johannes


