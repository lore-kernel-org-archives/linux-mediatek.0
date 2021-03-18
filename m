Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8000BC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 11:33:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7696264F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 11:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7696264F2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zW3YVTe+cKrZs+ixyZZVBZG8XvYJaoWLirJiFUO4QGM=; b=USi69FztaqTJYUchofd0ExUhG
	i8J6V6dMvszoRPKNkPmkygrXlxWfGvk+Syo+Nw1JX2RqtOikc9i5H+X4YQdeWS6liZ0RFE/yBiah6
	NE4LM70eu3MeLlsyy+F1Lo2J6CScBCFtZuOjYqwl8IkPtrVgN9WfwdqvAPNANEe9gKx/G2rrNL6uK
	JJIILe2S2XZ/hfRQ+fe2WWHwhI2oX5YkPHdRD5BVrFOV4C3eMKNOcSXnsb3Us2rzUJOfi9EUtJoqo
	iLVwnVmo8A8cbApwTv+by0SYiLnNM5ICBfw+/L+nPeDJX8hQCXdCCf2nvz5h0rRCtMpqh+kfKUfYl
	hoIvLFzSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMqtf-0056Zn-Nn; Thu, 18 Mar 2021 11:32:59 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lMqtW-0056Yx-8E; Thu, 18 Mar 2021 11:32:52 +0000
Received: from localhost (i577BC015.versanet.de [87.123.192.21])
 by pokefinder.org (Postfix) with ESMTPSA id CEA032C0640;
 Thu, 18 Mar 2021 12:23:04 +0100 (CET)
Date: Thu, 18 Mar 2021 12:23:04 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210318112304.GN974@ninjato>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_113250_405759_413E7613 
X-CRM114-Status: UNSURE (   7.93  )
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
Content-Type: multipart/mixed; boundary="===============3025094833309745037=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3025094833309745037==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0aF+6pWUK5w8WdCh"
Content-Disposition: inline


--0aF+6pWUK5w8WdCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

I will look at this next and think about it. New bindings are always a
bit more time consuming.


--0aF+6pWUK5w8WdCh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTOBgACgkQFA3kzBSg
KbZRThAAjau0thEmr8qwOPK+lgNrBOVmicwqn/No7ZIrH5/uicp1251YepZ7hZ+d
IeUEJ5jMaqUQckvPmalKpFshG2XzRDc8samRvPxqoFEttNgrj0Ped6VF5q8JIjXk
+uhG+w8d/v3uPoaWA+XXDTB8tcN5ep9xi+2TeVNLbHqyX4+uM7JYdCUXI3xPBjwZ
gWo5jt8KzOk/VAltY3TDAR1bKT4vyOEUP928bzcib4lRM+S9FRf49i3xpc0C2AkO
dr340fXlX9BqaDxYL+0/sYZ38Rw7ju0TBfd6piSKt+9ZpIERZY5vusmgRBwtTf8J
GuPk3dNazPezZU0bpIvxquGhl3O0TmZioXDIvcZ5BkJJIOLMrOuhQw7X8msNyb//
dexUymGeDmgZqpZ/dmXPlAhIdYJLxrOZYYXivNkfKkIttchNMhvFD2pmQFdchGqD
CbLseCHKH5p9EmGy4f5AnxOS/q+i23p8uZdWmnbnZbUR+oE2BDhkA196VzOfYT8p
p5G85HWwDMSx491nb/g2jhy92Zjt0nIl5jBUmbtxmY1Eg8+LTTi4qauEwHcALdYr
lDLEA1MF8x/v1qN8kVEUfX5kwssdlkiO28bz+JoaoHymE9RoLRlQA/keBiuGl1z6
XNpZIt1EjcFQBO9hytzWqXs34AAIWmTLXUwahZyYcEVhRNF7yr8=
=B7sP
-----END PGP SIGNATURE-----

--0aF+6pWUK5w8WdCh--


--===============3025094833309745037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3025094833309745037==--

