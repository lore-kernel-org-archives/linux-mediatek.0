Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B1C25B79
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 May 2024 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/yx0LBa6BWxJcFbM41dPpkzsmx1uZjRYOaKe6bmwRA=; b=ykWlasiq5T8y2ipRoMskuwGNEe
	wIiaBlKba34dsumk79ipatWuLD1XEF/1jdYEWLR4C0GqbtGL/ySKOJcoQhk1VWQzBbUqPtgUw1vac
	XihJQW5Fgp1XY6ISUTcAeOx/EFLXqSsZOZMAnqwc5B761y52D7DcgEFxzLj6AYjhZG8fdMiF6BM17
	0nFPfxM5ZX4onHeBk5VNTDWKgSPdU7h/p8qA1ziYi8cyOhWQkxzjH8SERIf3l5w2Mfr0rDx9c222R
	5Qawkz3SzP/lCLAic26VeGWfQpp6oMefLaOQhEnEqaRqojVca1te046Zspc/iRxEwinKT6EZ2FseB
	iiVperOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s70zy-0000000HOsI-3z3m;
	Tue, 14 May 2024 22:51:54 +0000
Received: from prime.voidband.net ([2a05:f480:1800:ee:5400:4ff:feab:5961])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s70zv-0000000HOqq-10A4;
	Tue, 14 May 2024 22:51:52 +0000
Received: from spock.localnet (unknown [94.142.239.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 2A87A6356CD1;
	Wed, 15 May 2024 00:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1715727109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M/yx0LBa6BWxJcFbM41dPpkzsmx1uZjRYOaKe6bmwRA=;
	b=VG/cQyQnDLqz4Fw5M0R4xhc1in07k4Ww03a7FezDAlyes8JWwfW5sBdVy8dvEoTncQ6VeG
	p+BiQ+Cqvw4BQpgs0wDisTtmgrqbn+eu8S1OBM/qx7xYn3cQMIYZm15hfuCh9buSUMtAtR
	Bsn2gGRXMVYx/EosG8muwRDltjZR8D0=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>,
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Johannes Berg <johannes.berg@intel.com>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
Date: Wed, 15 May 2024 00:51:38 +0200
Message-ID: <2341660.ElGaqSPkdT@natalenko.name>
In-Reply-To: <6061263.lOV4Wx5bFT@natalenko.name>
References: <6061263.lOV4Wx5bFT@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4908084.GXAFRqVoOG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_155151_567402_312C100D 
X-CRM114-Status: GOOD (  10.36  )
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

--nextPart4908084.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
Date: Wed, 15 May 2024 00:51:38 +0200
Message-ID: <2341660.ElGaqSPkdT@natalenko.name>
In-Reply-To: <6061263.lOV4Wx5bFT@natalenko.name>
References: <6061263.lOV4Wx5bFT@natalenko.name>
MIME-Version: 1.0

Also /cc Johannes because of this commit:

6092077ad09ce wifi: mac80211: introduce 'channel request'

On st=C5=99eda 15. kv=C4=9Btna 2024 0:43:40, SEL=C4=8C Oleksandr Natalenko =
wrote:
> Hello Felix, Lorenzo et al.
>=20
> With v6.9 kernel the following card:
>=20
> 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax PCI E=
xpress Wireless Network Adapter [14c3:7915]
>=20
> doesn't work any more. Upon mt7915e module insertion the following splat =
happens:
>=20
> mt7915e 0000:01:00.0: enabling device (0000 -> 0002)
> WARNING: CPU: 3 PID: 1648 at net/mac80211/main.c:794 ieee80211_alloc_hw_n=
m+0x9a3/0x9f0 [mac80211]
> Call Trace:
>  <TASK>
>  mt76_alloc_device+0x24/0x290 [mt76 46e2c4f11be089903469a4d6045c71cb7842b=
4cd]
>  mt7915_mmio_probe+0x33/0x1d0 [mt7915e 9657e1926e619568545a08636674805d5e=
665c85]
>  mt7915_pci_probe+0xe1/0x3a0 [mt7915e 9657e1926e619568545a08636674805d5e6=
65c85]
>  pci_device_probe+0xf0/0x2d0
>  really_probe+0xde/0x3b0
>  __driver_probe_device+0x78/0x110
>  driver_probe_device+0x1f/0x130
>  __driver_attach+0x91/0x1e0
>  bus_for_each_dev+0x105/0x160
>  bus_add_driver+0x137/0x270
>  driver_register+0x72/0xd0
>  mt7915_init+0x44/0xff0 [mt7915e 9657e1926e619568545a08636674805d5e665c85]
>  do_one_initcall+0x5b/0x310
>  do_init_module+0x60/0x220
>  init_module_from_file+0x89/0xe0
>  idempotent_init_module+0x121/0x2b0
>  __x64_sys_finit_module+0x5e/0xb0
>  do_syscall_64+0x82/0x160
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> mt7915e 0000:01:00.0: probe with driver mt7915e failed with error -12
>=20
> and the card stays non-functional. Re-inserting the module triggers the s=
ame behaviour.
>=20
> The following condition is triggered:
>=20
>  794                 if (WARN_ON(!ops->add_chanctx ||
>  795                             !ops->remove_chanctx ||
>  796                             !ops->change_chanctx ||
>  797                             !ops->assign_vif_chanctx ||
>  798                             !ops->unassign_vif_chanctx))
>  799                         return NULL;
>=20
> This worked with v6.8 and earlier just fine.
>=20
> Please help.
>=20
> Thank you.
>=20
>=20


=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart4908084.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmZD6voACgkQil/iNcg8
M0slkBAA30d+dHMeOTWd6mWGNfJP06Ntug/dXjfFyRQeTnRqIXhfp5uTamhIDg1Q
1lbgClmG3vBtyw5vyYHemn9c3GjAPGSpVO5FvFAb72vHy/84KTfbrNU2jk9czRsP
kOVx1OxjWnn1wYgK3nJXgV+dVNft6/kphxSUFEtLFfkOR3KBpTCXwram74Dfx2O5
iK+X6damnucy+KB++AeimhjEY0tuLhXmRP/5me1m8SE5HojbCbBazBV8E/xPmPIx
Xy3K+mQIN8DZW3PNtVlgGVxwSwCB2Zeta6yfOrAnyt+ifA8mrIk/JeB+30IKFsUo
wEFc/yapWR1QXUzWK/Q2mi6bYprbHGYPusrrCHh/O3va2PuDvOksClCwaC8B36Lh
6k7ydaHrTeIH5fqwnCBTDk7Y/WRHQfOpZhuEtfmASXRGOR6nOaHwZoUxxUVr/kTk
K4SXM7h3A7kBPokz/EsVjWmV4tWmFmpm2XAIj0zP6S7ll8QCa6gZp31dknlezrHX
/dYvPnVgCf2yZ5ZH6s33lqB9HBj6uxmXKk/UnGSETtY+cEIfpDih6oat9TazyKS1
naiLMD51BfE+1SjAOokQqcZpFQOEB8eh8+DHK/5NaUh6u87pB9F03GFRaR2nEZvp
KWDoYnNLBWaEEoaD4fQzx8pbFOgWO88HcaSavorkESHcsE2EEFs=
=bD45
-----END PGP SIGNATURE-----

--nextPart4908084.GXAFRqVoOG--




