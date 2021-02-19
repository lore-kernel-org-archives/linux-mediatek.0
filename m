Return-Path: <SRS0=fv9r=HV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A041AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 10:54:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C74B64EB7
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 10:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C74B64EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e3QO1dG/3zv5NVj1S7bRDXwDPyGoei+8S7jEg4Mpg4Q=; b=J6jM8RWDSxuwPpcO+Rt0wKGpG
	MiSRVcoKqXLBD8N7RvVOxY7yNeie0oaBIn8C3RpxXKVcc0XDjctLfsF1evXctXDEL3tiL+iX8dJTr
	SQ42OsmnH0ASwdsaVaREqcD2XEJbk0DM8TfWEXmlFWcaK8lDuznNSafwotiP/HMrY+QYM3hKK9QNa
	pVFdAwUyefmWafJG+BbXoYgmeTOKtI3Fi3L/Bqy0KoMwkEpm06OLAuL55tWaPypsFc3fVwm0IqkUi
	ThOoWgD+kiaxhAC3/s1H7laUbwm+xMCvwPdT0JBMCULTW0VpPsOFsGKCoEHdikQ3QVq93FJyLWSC/
	RqycluuSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD3Qj-0002XQ-P4; Fri, 19 Feb 2021 10:54:37 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD3Qf-0002WW-NQ; Fri, 19 Feb 2021 10:54:34 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id BE18A1C0B80; Fri, 19 Feb 2021 11:54:31 +0100 (CET)
Date: Fri, 19 Feb 2021 11:54:31 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v13 2/5] leds: flash: Fix multicolor no-ops registration
 by return 0
Message-ID: <20210219105431.GE19207@duo.ucw.cz>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1608547554-6602-3-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_055433_909798_66753C9F 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============6299597838842518839=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6299597838842518839==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-12-21 18:45:51, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>=20
> Fix multicolor no-ops registration by return 0,
> and move the same registration functions outside of #ifdef block.
>=20
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

I applied the first two.

Best regards,
									Pavel
								=09
--=20
http://www.livejournal.com/~pavelmachek

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+Y5wAKCRAw5/Bqldv6
8qb1AJ9XxeNlZH+EPgrXOniC/RLIiLZs7QCgxLA9z8wbAPEn/KIJHJ6l4gOaNmM=
=5iwm
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--


--===============6299597838842518839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6299597838842518839==--

