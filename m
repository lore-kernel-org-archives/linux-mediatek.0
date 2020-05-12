Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8A4C54E4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 13:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECC8206D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 13:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X6rOo+7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECC8206D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H3ITzBFvmGCH8akbdpM2ezLbgyEUAaOF8CRDAeZHLz0=; b=X6rOo+7Mfjubden1JexEqbNEG
	T7kziQ5CJF9qYqJ8OMtQ2t5WVL143sd0n8tkI39VKgath4lWBf8rDLeD45qjWQl6u6t8fKRy7gFah
	8/wUpZLDNLn9zAQIvhxSs+8o7pOD4tl0ZBgthckgfaWI65QxWWcuaFlQh/G2NabBCBCvnNTv4j6Sm
	NaKa6KyBiexwd9w3rgYb8EwSmYpjMwM25zgKnyVJWGKzfmCxO6RjC1A14YIsPGbHKicBIXWhuAxLG
	YNNwV8bbKRv2sKXDfSguiykVDa78RmlvZxz6DOFnbvhjNoZYR3FCnbZ4Yn6w+qe2Q7w0ERDhIqO8p
	ikH3DnD1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYV7i-0001J3-N6; Tue, 12 May 2020 13:39:06 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYV7Z-0001BX-H4; Tue, 12 May 2020 13:38:59 +0000
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
 by pokefinder.org (Postfix) with ESMTPSA id 1A6642C1F86;
 Tue, 12 May 2020 15:38:53 +0200 (CEST)
Date: Tue, 12 May 2020 15:38:52 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
Message-ID: <20200512133852.GE13516@ninjato>
References: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_063857_717704_1230E2C9 
X-CRM114-Status: GOOD (  11.47  )
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
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3748096459795340382=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3748096459795340382==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
Content-Disposition: inline


--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Qii Wang,

On Thu, Mar 26, 2020 at 07:54:36PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> This patch adds a algorithm to calculate some ac-timing parameters
> which can fully meet I2C Spec.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Could you rebase this on top of i2c/for-next or v5.7-rcX? Because of
commit 90224e6468e1 ("i2c: drivers: Use generic definitions for bus
frequencies") which was added two days before your patch was sent out.

Otherwise mostly minor nits.

> +static int mtk_i2c_max_step_cnt(unsigned int target_speed)
> +{
> +	if (target_speed > MAX_FS_MODE_SPEED)
> +		return MAX_HS_STEP_CNT_DIV;
> +	else
> +		return MAX_STEP_CNT_DIV;
> +}

Maybe ternary operator here? Your choice.

And my code checkers complained:

    CPPCHECK
drivers/i2c/busses/i2c-mt65xx.c:591:11: warning: Redundant assignment of 's=
da_max' to itself. [selfAssignment]
  sda_max =3D sda_max;
          ^
drivers/i2c/busses/i2c-mt65xx.c:597:11: warning: Redundant assignment of 's=
da_min' to itself. [selfAssignment]
  sda_min =3D sda_min;

Last question: You seem to be the one doing major updates to this
driver. Thanks for that! Are you maybe interested in becoming the
maintainer for this driver? I think there won't be much patches to
review and reports to handle but it will speed up processing for me.

All the best,

   Wolfram


--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66pugACgkQFA3kzBSg
Kba3FQ//feg8sBvAPAGQ1c3TSFF7+uw13pr2B3K6UysUq9MRXolh+3dXFzkWXahk
YXtv9nHURBVjj+2SnDD2ZwnD9x1UGyxPug6Sp62VJMS80rjYvsL3/8s58srZeHsI
MoO68IX50ZMvaJip6LPoNk8Sw9Pl4RhK1Q6hejBsihdf27cWXt/W4jNVBlENaw5u
mIhZR2faLpWYIVwI/7+tFVJWqp5fn8zh28/7YNi3B0+NJexDi+z+lRSuD17s4VV7
63S6JpAzZm9VOW8myXtcyMV+nVAyBhgxQ3O/WybHAgaceOcjZJuTYd1rYTAznZGd
UAdcdrfAnQnnVnLYtFsqtCNWtqrxwvV2fktTT6O01d1YNwSvKGYD7csCo8rB4kQZ
TctS7orhQi8YbhRTZAZoGmVOChgsQ/nwy3ik8BaC/vcziXkQ+OpsXsNYz23nNmvh
YgugC/ueHcklhIxhinDJx4R1NSVrpuqRSFHceX/7ez64lRtAGlm7A8zdcOBy3I3j
oAWgUgd0b6OLnW0j0E8rJAGQJ9ub58VLFAfaZH0GVpxtXkYQ6npgVxzjwwwj+ONX
rC+pocqPujlCKBidHpJh+obmCUMlalkm3W4EMlEp1Mz/yAZ6JKDnC60YzfJtUStz
GiCto6g4vEd8j+KeH0eVABf5LQoE7ia1SC3f4eg0pfU1juidIww=
=LYkG
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--


--===============3748096459795340382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3748096459795340382==--

