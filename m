Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E087BC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:53:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B98A65125
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B98A65125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c8rso7KRbpcujfp4dTC2u5kDlppUSOdSB8KbFW0FKFk=; b=kSFrfQQJMe5k87HVbyqiUO5VD
	eAe3YqyQYx0K2xjZw/CnRKQDFXUxLO3kUs+gQs6d35ptVDYjhS8EBH1Uo8kYzRkqnOi7XYX1qK9O3
	GImiwTent/QgUn9F/c7MKbs+G9C2fMyHLwi3ncfM5Lih3cZiw4N570t+ydfYSJ7FfU8OhSImYI3BP
	kF5m8CXwRet1yQY3NuizCB9yCZwydx1ZV7k0mxZ6JyYBikrA8PqF2/0OkCNzYniYEdM1ajQMNaBhc
	i8IKZO0x9QiB8lNdfwHSfvprUxzvpOjGXdERB8Sf1e6U8R9rpaKMi256g/154iB4CIOa8FpAzPBQL
	ZLlYzpVMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDsX-001TAS-2B; Tue, 16 Mar 2021 17:53:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDrb-001SuP-J1; Tue, 16 Mar 2021 17:52:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A420065104;
 Tue, 16 Mar 2021 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917132;
 bh=LrCfL2n1Vbvh/ZZstKFwLeSaiNZmxKeObFOpeIxy6NA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ay4zejDKIBL1jPO1i2vCSej+X0bGBaXlnSVHQdEA/pq4MFRD9BOTTaNoSNAgufJEO
 MHKz9tLyE3r06eBh90db7ZOhXpbg2teMoLPNHnINtsqO+QQPGpQmJCYo4AppfTdyOO
 nmMkg36aMDNQRtfFO5DrHvrX8l/mAlvmO37eR3mhoImV8vEVDnaWmbuxbSZ2fKQtS1
 58+EaRDrA4XLcPyj+S2myNfqyuTMSH2Qz0AGXanPh7B0TfM6oPMv0j0RTQa/f31QtU
 MBPYzZ2Wqibsz5eiFF7BRO27HAhF4QRCYrTcl+Gd9ropMxwQBNcSyx403skwglRJaO
 E47YZMOVojnRw==
Date: Tue, 16 Mar 2021 17:52:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Wen Su <wen.su@mediatek.com>
Subject: Re: [PATCH v6 6/8] regulator: mt6359: Add support for MT6359 regulator
Message-ID: <20210316175209.GC4309@sirena.org.uk>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-7-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1615829757-3223-7-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_175216_061583_8DB443F9 
X-CRM114-Status: GOOD (  10.55  )
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
Content-Type: multipart/mixed; boundary="===============0614000625599267708=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0614000625599267708==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:35:55AM +0800, Hsin-Hsiung Wang wrote:
> From: Wen Su <wen.su@mediatek.com>
>=20
> The MT6359 is a regulator found on boards based on MediaTek MT6779 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.

Acked-by: Mark Brown <broonie@kernel.org>

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQ8EkACgkQJNaLcl1U
h9BDswf8D316wKmXhcYKPDi/YmkRhytOAgIc6953T88rWdO3gCUFY/SK/jYWCmMR
KzzfbYbaNqqAfA/sr/MciroVnmjvxnCXxUT9Xjud5lJ0Jt+33OK3a7zg0zRx+Fot
DV/I2r5LRwRoT7r1yRu0+nHD43UuFr+G0cHnIuCDnhTfsXrohLb7LSMBo2R7i49L
hHZXlELlaCEjgJWXlc6nTkoRkfPGwTLwMXZhmnsJUwseBMbnaYNgd9T9/JFFfSWK
nDz7U8odYibHz/AhbsZpaFwJcKBEmHVr+oL65l/UR8pz9Wd2omTkWrbPN5JgrHva
lIvHg1XYtMnPuHyTJJE6hSoWNCfKIQ==
=14Z0
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--


--===============0614000625599267708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0614000625599267708==--

