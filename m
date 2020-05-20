Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7BAC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 13:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3951B20748
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 13:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gKeN3X5b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3951B20748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uxeyD5Qi3VUvHjr0KC2yasgoIkQ65jeD75R6YC7QC2M=; b=gKeN3X5bJTJ73q5s7VotnpIjB
	d+9Sfai/rcGd/R3gAdXi608MDNm1gE3G6H1morB0uJWLQHmQ9JXXl8teZa67D1NWc6W+r4RM3AgXw
	bx5bV+2nYXn+reHZ9t3jVkiVqJpPeGD9fYPaFU7srbx9diMLfplTYflrCZdnrxOWb7OYBEWdN96nQ
	KIyiM3dIZ4FtqP/ZWDZTOjwpCQ4oPINB8QGHoTnESy7YWg0cKHwE+jcD8TgxzzPHB2vnn7moryGMz
	CHsuNu6hpCQ4wRzsbcHfzuspUY5BCvApqwBRCSGcBAIrkYAY+1xjNi4pMxaax9Z8wKGZMWblOXnCo
	Mlei+lgyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbOmw-0002Vk-O5; Wed, 20 May 2020 13:29:38 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbOmo-0002Pb-CN; Wed, 20 May 2020 13:29:32 +0000
Received: from localhost (p5486cd24.dip0.t-ipconnect.de [84.134.205.36])
 by pokefinder.org (Postfix) with ESMTPSA id 98CC72C1FD1;
 Wed, 20 May 2020 15:29:13 +0200 (CEST)
Date: Wed, 20 May 2020 15:29:13 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Subject: Re: [next] i2c: mediatek: Use div_u64 for 64-bit division to fix
 32-bit kernels
Message-ID: <20200520132913.GB5759@ninjato>
References: <1589970713-19944-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1589970713-19944-1-git-send-email-qii.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_062930_571338_7D796742 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2703720941032650607=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2703720941032650607==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 06:31:53PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> Use div_u64 for 64-bit division, and change sample_ns type to
> unsigned int. Otherwise, the module will reference __udivdi3
> under 32-bit kernels, which is not allowed in kernel space.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next by squashing it into the relevant commit, thanks!


--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7FMKkACgkQFA3kzBSg
KbbynRAAmwCukXP9v4Fs9sjBIrxVil2vgnjXCEmpHgr7IZ37e9uoqxlUndj/oHhs
YuDiSBGBVXU/ZYFP2VDsUdMRBa11pyoNALMiO0uIThiQ4gkn132Ej4DJ+s9o54cz
nh74h8be69a0EmvvYY99oBfIFZ7ORRtvL5lIktHUaP9h4YvU1CC/neJ5o97q4bVU
GBugpXgWfXEBApFPyXr3ShOaUyxnCJKYHAFyHShqoEtgIwXlyurDYG9yzkeI3d6w
U5jKdhAp97EwNf+b1iLj/2EEOpE0G1wEWke8rTL1mjJMJRVCwUQqzeFzPORfGMK+
YpphdJtvU6mvl2wjnybBcc4gb9WoQP7wRkb7lEdgW9kmlNIqPgzuds7F6ePHMNRD
GxdMBnOiLFC6UnTih18N4gMnH9AwjX/1Hz4k8g9riHdF1+BGpcytZsosCXXE7n7C
9rVPE/9HE9juuEWLBTqdonrOje8DOtOtOqX1b7DwEbHotanakMQY1C5xPbX6Wzr3
QnKeVyuTbd0nUVkLgMCOJP/d9/1mJWWNvJSKdG/7zRyyz2nhOr4C8lJhLLH14Hub
XKK5/K8qiufXzdhryt/EmiThF5WbhcRHQ4HH+irt9droO08MkBlZfnuW7NT0NPuY
uk3OkrWasxCtb9udRSUrM6rGmfcueB//OzLR3xiq8GH/AykuwaM=
=gKRd
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--


--===============2703720941032650607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2703720941032650607==--

