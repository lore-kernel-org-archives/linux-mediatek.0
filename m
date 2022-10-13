Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D18C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ViHuil8PnhqqIda2qisrZIAtbDkwmd6nRFvTkmtl5Y=; b=pAqmpC4lYcD2gy2Esu/awAGojc
	BFB/r7OuXxhZyInEp/ACpRJTLldT/f+/WKsimYzrmTHifXPKrM3DjYwxwscPp3k0tq9OSZcNSI/Nk
	PzrYmaNjlpFguFcKLVyAhSYEHpyCe4kWS/8bUJo4bs7C0FKOOA4t0aoXlCGJAQTnakAozWfAxQZ3o
	5iGGFc9tJPhQGFeOXz4ZLvMfaJdV4Hsl9Cae8fRU/1BkCHMCl+AN6HvWPi+XfoD6iFSku3VRDmWOn
	db8tVrY3U5m6wmfvdsCjDcVycLbm90swAod1q59YIvVKOxkEkijEhh46G6Km0GefP1XSxgRqFsW6p
	D1H2g8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiuBN-00BDW1-BH; Thu, 13 Oct 2022 09:07:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiuBK-00BDUn-E8
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 09:07:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D47A86173A;
	Thu, 13 Oct 2022 09:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF41C433D7;
	Thu, 13 Oct 2022 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665652029;
	bh=/ViHuil8PnhqqIda2qisrZIAtbDkwmd6nRFvTkmtl5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiAu4Uuqsm3rF4NfGcczcENjmqoPeUfjWj7obGIVo12Vv1hOKspx79VnTjvztqKkM
	 ALq6Y2s6GuSETyxcH3scdu1ZYfeuUAICNZyssybROHmMkXFzF8xnqxLTeh9+WjMWl6
	 BUPzXsznUmTD4yc0REtWbH0ZqbaWQVc/91zq9peyrUhFLnP11lgo5X/pC1iQWHM339
	 l+nL/ptR3mIFnkOMw5V5/oezn8ZmpuPMdTIGFof0L+GadDvZYjqN96cWcTi+KAE6w7
	 TQjxRlXT3QkawT4Gij1n8mSSACo0+No8WLD4JB+cJGFqgKlS+fZwlmToPUvPq3R5Hy
	 KlH+jhyrkb3tg==
Date: Thu, 13 Oct 2022 11:07:05 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	daniel@makrotopia.org, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
Message-ID: <Y0fVOX5tvbWabVZI@lore-desk>
References: <cover.1664356281.git.lorenzo@kernel.org>
 <87r0zd4mxw.fsf@kernel.org>
 <Y0aH8T8pTARNWcPE@lore-desk>
 <87zge0memc.fsf@kernel.org>
 <Y0fQ0f3uy5p9f2mP@lore-desk>
 <3b029dc7-054b-3510-f159-de6622d8ce01@nbd.name>
 <87v8oom6wl.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hWagu6+icqVdB5Z+"
Content-Disposition: inline
In-Reply-To: <87v8oom6wl.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_020710_547184_B659B09C 
X-CRM114-Status: GOOD (  23.47  )
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


--hWagu6+icqVdB5Z+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Felix Fietkau <nbd@nbd.name> writes:
>=20
> > On 13.10.22 10:48, Lorenzo Bianconi wrote:
> >>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
> >>>
> >>> >> Lorenzo Bianconi <lorenzo@kernel.org> writes:
> >>> >> >> > Enable WED TX support for mt7915 and mt7986-wmac drivers
> >>> running on MT7986 SoC.
> >>> >> >> What's WED TX?
> >>> >
> >>> > It is the same as we did for MT7622. It is the capability to offloa=
d traffic
> >>> > from lan/wan to wlan. I specified "TX" since MT7986 supports even RX
> >>> > offloading (I am working on it at the moment).
> >>>
> >>> It would be nice to mention in the commit log that the feature is abo=
ut
> >>> offloading traffic from lan/wan to wlan. That way it's stored to to g=
it
> >>> history and people like me have some clue what the patch is about,
> >>> otherwise we are totally in dark.
> >>
> >> I think Felix has already applied them.
> >> @Felix: are you taking care of it or do I need to repost?
> >
> > No need to repost - just send me the description that you want to put
> > in there, and I'll update the commit.
>=20
> Thanks. And if it's too much work to change it feel free to keep it as
> is. Just try to keep this mind in the future when using exotic acronyms :)

ack, I will do for the rx counterpart :)

Regards,
Lorenzo

>=20
> --=20
> https://patchwork.kernel.org/project/linux-wireless/list/
>=20
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

--hWagu6+icqVdB5Z+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY0fVOQAKCRA6cBh0uS2t
rFufAQCGvi6u8fZ/b1WQgqSyEjlMguskyH3c210+fqmlmppywgEAk4I/p4OOnQSQ
RmZznhpQG4ONKnjsoVfM9VtJRhYACQg=
=if/y
-----END PGP SIGNATURE-----

--hWagu6+icqVdB5Z+--

