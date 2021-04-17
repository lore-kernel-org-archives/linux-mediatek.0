Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714EEC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:09:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CFB961245
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CFB961245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pfADg7iJ6RTv374tQ8HMi3dpzeePMSzYXEhSKv7Ii/A=; b=qNFW4Uw8/N4gIypW+cVlc4PN8
	I2vaBD3FsXRK3Dw1hPNKxFgyWaJGVrM+Eu5cAu4uH7KkJ0MlwHwqmWrvmD4ZOOoHzvkXr58GCg0vr
	8tbgMoDT1cEgx4oocKSmrt3UNfhtdo43N6VlL3sD1KbJUfGjbWuKQDGLa0cXLzzxSFMWwQwa0bwUh
	WQAbAsaHWZaGENnU+QhrFLqr91cioXsadQ2AsABflzq0JJ1wXYcEmWGLR/J8F97P4fq33n65NygKo
	tmUYUcvsry0BvBnYoq/U+hxJ8LpWtQX40KWYa+JqlpyxstimGaSjeCzMu0JyzgkjJOtxTN/XXgYeW
	pt6YLeFrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXrG9-0069RT-DI; Sat, 17 Apr 2021 20:09:41 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lXrFw-0069Pb-Nv; Sat, 17 Apr 2021 20:09:30 +0000
Received: from localhost (p5486c83a.dip0.t-ipconnect.de [84.134.200.58])
 by pokefinder.org (Postfix) with ESMTPSA id 5CAB62C04D8;
 Sat, 17 Apr 2021 22:09:24 +0200 (CEST)
Date: Sat, 17 Apr 2021 22:09:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [PATCH 3/3] i2c: mediatek: Use scl_int_delay_ns to compensate
 clock-stretching
Message-ID: <20210417200923.GD9996@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
 <1618642012-10444-4-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1618642012-10444-4-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_210928_850860_ECB37661 
X-CRM114-Status: UNSURE (   8.63  )
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
Content-Type: multipart/mixed; boundary="===============6648058263623918533=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6648058263623918533==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 02:46:52PM +0800, Qii Wang wrote:
> The parameters of tSU,STA/tHD,STA/tSU,STOP maybe out of spec due
> to device clock-stretch or circuit loss, we could get a suitable
> scl_int_delay_ns from i2c_timings to compensate these parameters
> to meet the spec via EXT_CONF register.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7QHMACgkQFA3kzBSg
Kba+NBAAn6JF4qXFNrDhGxvLXRTjPqXUMD6/NwnxMpuk8enYQIOz18Y+jbXlbNNb
3lLX/OuSDB4Veclu/q5/EW5DH/066q7DAp3WkVkxXEOqsP5KgfsjxKy0RH166WtX
7Xo1bUecsTdlqFxO8SObPsid2FDabhoEAKCuQ3bhkr1vjuW7dLra0ZgzK/CE4tnP
8HlqKkzY9VYeXKjVi/GnjadVLsfcX8Q47DwlTJ4f+G2zBAWwoXGio48FJkZsZagW
STxoSdOE17gvIk3O+0MzfuCbam8XtJmgfo68CmouIPKNaJcB4i6WAkJYr05U1lQ6
LYhnJyDZ0ytDGpDlRnTyfJbSdQaeecuCXoIxDgYOOXoed3rjqQ10ZmaTC7nygj1v
FDOV3OMEEzbjSysFb1/V6QMdlRxELSDxXNS2HtEpqspCAkIl3PMM1Xvfz8gW/WG+
wyuEpgtDYPhtv7SxOrOFJxb8aRJcVCEbjyV4T1IoMzQYzvAmZxmNdRwRuTC7429G
Ou8qgEa2QsblpDzUoFhmFjwJp10qBt7I27L2EH9xVRPmeQa+wqCg2+AHVbSlQWOu
/QhPt8MG4bZSM887RT5tVfof6eyXeJ6OmA8GkMz5UnmD+ReUEiAmoGeWvaBh5b9J
WHCXZgcvNMgTBG8WuU0MuFjQclhQ9bfujZcMaABjmiZVBR8ssyQ=
=z08x
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--


--===============6648058263623918533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6648058263623918533==--

