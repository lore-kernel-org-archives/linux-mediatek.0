Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458F7C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1lCmDl3kZ3oppeDaUnuKslu+45Wjj5DjxvNo9AZ6Aw=; b=tE/hSKPtt4OrYH4WfNfTxjqKdC
	JIPpxMuCb2om7SlzyqKgCQI+q6D6C2kmUFii88NHs8Dva+ZpTN707ef2OmzuIqdGNIaSltei9QkHJ
	gLwhaWWbyWufDLCSrwQafgaURwwJlAWO7qgd/oZmC8z98984AhaHQM4Hrk1HnWjUryr76wkfjmeer
	6PDOWr50es4oYtNXgHdEnKi1XVXnAT0ZCEyR+yDbAd/Jzd/HhlNh5mJ+rUpU0NsULvpdXMDXas2UH
	Ef3W71r5njmHnV4QYJUyZazOxUJd1DkrcV7NkNb8a/3jhGI0K27BMyWPL0bPZyTOmD9I/YK6i7ANL
	brQh2OYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRR0-0054ru-A0; Tue, 23 Aug 2022 10:47:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRQy-0054pe-5u
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:47:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0BDE4B81CDB;
	Tue, 23 Aug 2022 10:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E287C433D6;
	Tue, 23 Aug 2022 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661251616;
	bh=D1lCmDl3kZ3oppeDaUnuKslu+45Wjj5DjxvNo9AZ6Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIe9w6lSdAOT+YkYvAfmv8vxbbA0JNvzeL7vbxyCY+pTiXGZKRqsZDBL1SPK2X+Ww
	 0RzI23LXGczeX+00LKZfOfAwm8/GCnMvT+HBdEX0JnY+BwJhjXu2OgXmFpk0A94Rpj
	 w0tmibpFcms6ylN756FehbGCsUhNtpBCwlqgFrQ2ktOS8ARMaLUv0Tj0+xdTpJqXyG
	 tQKMTsgnmBl0AwqytxemiG6I9nF6oh9p0lKL7FB3bFMqXOhVP0tniCBIFHCNbAyiDl
	 KX/N9BK8xghvZqdmhxneI9wvvvl9z0I9wy9gXy55fzrzJ5qvNX6tfM9fVa/riRsajl
	 G6oKKUP0cwDMw==
Date: Tue, 23 Aug 2022 12:46:52 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: fix hw hash
 reporting for MTK_NETSYS_V2
Message-ID: <YwSwHE7ArgX5nRe+@lore-desk>
References: <890fc9b747e7729fb6b082a1f7fd309a58768cca.1661012748.git.lorenzo@kernel.org>
 <abce7e128957b3e86a6d73a7b383b6404ba2db65.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W2RK5J5HQDSleOZC"
Content-Disposition: inline
In-Reply-To: <abce7e128957b3e86a6d73a7b383b6404ba2db65.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034700_434343_68D28987 
X-CRM114-Status: GOOD (  13.40  )
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


--W2RK5J5HQDSleOZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hello,

Hi Paolo,

>=20
> On Sat, 2022-08-20 at 18:27 +0200, Lorenzo Bianconi wrote:
> > Properly report hw rx hash for mt7986 chipset accroding to the new dma
> > descriptor layout.
> >=20
> > Fixes: 197c9e9b17b11 ("net: ethernet: mtk_eth_soc: introduce support fo=
r mt7986 chipset")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> This looks like a simple fix and the commit pointed by the 'fixes' tag
> is already on -net. Would you mind to repost this targeting the
> appropriate tree? Or there is any special reason to target net-next
> instead?

ack, I will repost for net. thx.

Regards,
Lorenzo

>=20
> Thanks!
>=20
> Paolo
>=20

--W2RK5J5HQDSleOZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYwSwHAAKCRA6cBh0uS2t
rG8zAP9A/Qk++Ac84U0PbJY7rfyuWpSIEA3FZbjBd4sVYeRjvAD/fiT1tUd5bbKx
R/8oeCWQ2stUkEkpRQE3NWqRvZzBjw4=
=1csL
-----END PGP SIGNATURE-----

--W2RK5J5HQDSleOZC--

