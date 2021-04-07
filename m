Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6125FC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 18:20:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE2C611C1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 18:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AE2C611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dyuOk/uOiV2dWKcZ9bZ08OWN3NfUxIjNsGHwprp47JY=; b=hQNSKEMUNkXa7bgU5W7UUmY3Z
	zluJAyGBkV9TcQe4KKuFYGV2J0Sc5wH/7ifFXLllOxfWyDe7+mjjshWb8rraba/zDybaH9cG8XZ0z
	+Fc388tZMPTDQBTjzkNftGnUTgR+wSLVvm+nz9b9Wd6WJkz/bvgQXhwIO86cZa45pJ3TWtw9nm3pw
	PPEEwJo5hSvz4gBl41gAVxvZGwHe2OPRPYgPBq/J8ELnfD/pLE3eVYuExjEG7zZ5Hbvd5M6kQqLpd
	4Sa8blM1CHCfIbTt7elU4iMOzwd/mBYjPEXKVCUa+NjrdiVVLYtv9wpvbZ9Eeg/bFLrQsu5gYt6AM
	AVuvpC7CA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUCmR-005jMs-Ko; Wed, 07 Apr 2021 18:19:55 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUCmI-005jLv-HI; Wed, 07 Apr 2021 18:19:48 +0000
Received: from localhost (p5486cf96.dip0.t-ipconnect.de [84.134.207.150])
 by pokefinder.org (Postfix) with ESMTPSA id A2B1F2C04E4;
 Wed,  7 Apr 2021 20:19:45 +0200 (CEST)
Date: Wed, 7 Apr 2021 20:19:36 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210407181936.GA1614@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
 <20210406194856.GF3122@kunai> <1617797706.32076.1.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1617797706.32076.1.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_191946_679886_086BA7E2 
X-CRM114-Status: UNSURE (   8.43  )
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
Content-Type: multipart/mixed; boundary="===============7685394860038986473=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7685394860038986473==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Due to clock stretch, our HW IP cannot meet the ac-timing
> spec(tSU;STA,tSU;STO).=20
> There isn't a same delay for clock stretching, so we need pass a
> parameter which can be found through measurement to meet most
> conditions.

What about using this existing binding?

- i2c-scl-internal-delay-ns
        Number of nanoseconds the IP core additionally needs to setup SCL.


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBt97QACgkQFA3kzBSg
KbZGCxAAjTn07oN3fOfLU6hpW7yIEBiz+GxSzByvRRuqIrVft8GqetCvK5oMvd7p
diD/VhZ+4P1kw4/mA6zzsRpNJNerUBPeQ7xsF7cFMU7cfvG6A0zUuOieWM7+zwvw
zCllS2a+a9Pld3QZQKhQKySazasct2LvhDh2HOpiNwm+mtmpWFur1c2Wra+JovF1
soq+CYPCOB/5OkZvEGhpsXIvoCJp1/hlx3hEuAGPh34ZkOOWoZBXty6yJJsTOH+m
r25H0sceNddaabw05fs+F90zs5Y6wgyCvaIp1mT/R51HKOHzR7dVLq+JZhy+AZKN
uQeGtveLnr8BcS3gud44R3AhBpejil8h0DNYd2BMGp7bqOujiWbK/GkRTfT/gnZA
w+omah9S/tGhZKT9RY/6lFjeI1mn+r1A3vmHfjT5WiONjMLcHLe9+5SvK/N4vfxw
cqEahaLoa8TkOOD7MI5gZROtwe4BDWtFdmyujWbql9a0lO/QGzGuchKgfBCDHGZD
WF35ChYRvunAJr3dyfbaThKS7/KpolBLQz+z4Hs2x7PkRmvyK18AIJkdv/d7c82O
scccsm6zgp1151zd9CfFKm355CmCgfUDU/naFCEic8HsmWAjc/gxjkNYpQyUjNPP
+BjFP14MBlLhaAC2vGVJTqKQnStBlWAfbUr8vaV6yL/0hBnamxQ=
=zMkw
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--


--===============7685394860038986473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7685394860038986473==--

