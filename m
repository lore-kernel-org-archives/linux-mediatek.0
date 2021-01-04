Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1351BC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:32:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB64E21D94
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB64E21D94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FZ0H6eFKUujpSIjXqLiO8+LcnKfJlgItf9rxzAFTJAM=; b=gtKM5Iuvl3S6WjgCPxiOWWxV3
	xLzLB8IGtyvg0iPqCjswbI4nWAgZdBnLToMuIXi9gParIwoDKm39l/7X+sQ67D3BFqRU7EIKJjDuu
	xfT1onc/w/pz+R5qnB4RbCEIn7YrrSZROOuWDtMoRglD7JtblAmjpelhc9f8P/7TQo+Cwo8fysQ58
	ugk2vuoNBJffiyy5+H9GTcZu+0NwsKnD6dFP1I9wQrokqOkq7eU+5BMrnCuGFwuseosBE6bRDbU+2
	9dniz26NCen/yRuydXLI9aXpGuU8hW4jEmepM2bXXt5SiwVHD151Q9BFFaYHPuud5n5Qj6Szim3Qc
	Pq0KDvyKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwUeG-0006dP-Ja; Mon, 04 Jan 2021 18:32:08 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwUeB-0006XU-9f; Mon, 04 Jan 2021 18:32:04 +0000
Received: from localhost (p54b33105.dip0.t-ipconnect.de [84.179.49.5])
 by pokefinder.org (Postfix) with ESMTPSA id ACDC52C04DF;
 Mon,  4 Jan 2021 19:32:02 +0100 (CET)
Date: Mon, 4 Jan 2021 19:32:02 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Message-ID: <20210104183202.GD935@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
 <20210104182959.GC935@ninjato>
MIME-Version: 1.0
In-Reply-To: <20210104182959.GC935@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_133203_506746_E3746E56 
X-CRM114-Status: GOOD (  12.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3944673356373471357=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3944673356373471357==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 07:29:59PM +0100, Wolfram Sang wrote:
> On Thu, Dec 24, 2020 at 08:26:07PM +0800, qii.wang@mediatek.com wrote:
> > From: Qii Wang <qii.wang@mediatek.com>
> >=20
> > With the apdma remove hand-shake signal, it requirs special
> > operation timing to reset i2c manually, otherwise the interrupt
> > will not be triggered, i2c transmission will be timeout.
> >=20
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
>=20
> Applied to for-current, thanks!

Any Fixes:-Tag we could add?


--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/zXyIACgkQFA3kzBSg
KbZdEA/+P3rD8ApQef9W5LjRrab8KDgGqnMXQu09AfuzyQBnshelxTMu8B4MZqjI
NhfB/xNdPXXc/FsG4tr+48/KERJh/QtQG8t+WvWzbHjNASse1qwKjAHX2iP0Wf5x
PWj3Y63EVSX13vLLCqMnF1B1Cwn5LXgyAqoR1gPbt8SuT2TSyiE0/UMIEEkJE6AV
4Ta+16BLmuYsi8F6e5gp6Gn+YjNbbJqzzUJ0OSWM/vjsLHyajYlvORwHgjMnVy3R
GDMM3OEuFWEyFf1dZZqM6Ex7jq1huehNQH+9r/04XGHLatrw3J5nhcxgI8uVgkPw
5DVzj8m8vGs9R8UgCFE49sFTZfqjyxThRKzeWOInwambhKfBwj+1PNcEQvTgDOLs
ePpVhlBpbw3UxeV2ieit3PeEMiq2ULYMtdA7LxWHp2yFBjuY07nd/Nb3bu9lmtnH
K0RED212ymkP1g+D6zc6LQvH+A+IvX9fXPNWFpHnllbrnqSwHuwAL+2sKaFXdPdl
ok0rCMGRggqAEtorg2y/4ihytL/xtrmAkuNSc5NoandtWdHTMXT9nSOZvw/fQxEN
NwEnhX9GmHa6DR7BoK81Pz0Gpn//d5w0FIQxS+8Xp8JXneNvyL40WC0+6rHVRCey
QMCzjbg7igEfYR8J1x8mcHSIZyGVjdAQZ2236sG5OKVg8j6LnDU=
=DbV2
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--


--===============3944673356373471357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3944673356373471357==--

