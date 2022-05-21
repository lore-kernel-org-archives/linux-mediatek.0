Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E7EC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3zvSzNPkiThd0hdGL5nazNPW/Gz0ITD19UCeOAkqGQ=; b=fuBdPaumyT5XeybIxcYG9bsKP0
	NgSrvYBVJ/mxS6/m9rpDCnexjJGuJPZbcBA86jh6wAcJIawEaWeQJ1kdDWT/5feeqceyysZrMO5uM
	7ZQpKj/W0poCqHLGWLVWKNLxukw2OTGpqHTOUKVMSfh1auSQQ1rtnraDf52R6jPC/X0LyRmpl+vHf
	2cxPJ4Y4LUY+XCnKRHH0RtQZi1kj1yO/yXLZegzZqSBozXPBIye2ZZdegTaOUAWnZTnNdmy7Z14uE
	wnrNp5EC+tmoIF8FxJfGzTXsa/xlRmUz40ZMEHZ/FmIn9nITHNHWEMod36gqIqdua7irxAY9KA1cE
	UglHtfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsMCL-00G9pD-V5; Sat, 21 May 2022 10:19:01 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsMC1-00G9m0-OC; Sat, 21 May 2022 10:18:44 +0000
Received: from localhost (p54ac0650.dip0.t-ipconnect.de [84.172.6.80])
 by pokefinder.org (Postfix) with ESMTPSA id 4E04D2C0024;
 Sat, 21 May 2022 12:12:27 +0200 (CEST)
Date: Sat, 21 May 2022 12:12:26 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH -next v2 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
Message-ID: <Yoi7CtG+ZoNHvKdl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 matthias.bgg@gmail.com, sr@denx.de, christophe.jaillet@wanadoo.fr
References: <20220514023148.305457-1-yangyingliang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220514023148.305457-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_031841_992968_C43A610F 
X-CRM114-Status: UNSURE (   8.11  )
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
Content-Type: multipart/mixed; boundary="===============0228967774217982614=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0228967774217982614==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/QvgFcbHc+KnC2YM"
Content-Disposition: inline


--/QvgFcbHc+KnC2YM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 10:31:47AM +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from mtk_i2c_probe() in the error handling case.
>=20
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driv=
er")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to for-current, thanks!


--/QvgFcbHc+KnC2YM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIuwoACgkQFA3kzBSg
KbaAgg//aO+UxNd59hJiNRJesX7hbSoNvNi/Am6E07iqb75UlXN1Ljx1FhagnAGY
GvFXynEZsyCG8kFRRi2SN11MSYm0KVcGTQ9R5ZPPMB7YMZkNoUMzm1TOCUPKk1vV
I862euXxp00U7PTZ6MlyzabWcEPhjBTU0pLmSDb5LAnT0QD5Qsb69hvk64ZWk3i6
bpuN+DUehqjQ5tnDURtC6UBwGar7WoY/sAQtLh80fBgKrLY1Q7SzYMmuLerCJmiU
QFR/L+/aJZw9ZLsN9sKFhT83xNxkQRfbBYQ+SY+WSoNapX8q0KajBQkdH9a2lzs0
ORJhGv25QzIudNLVAB1crTPq/uKN4o22T6HZlngIh9Dl+yFiI2WWZg1De2TevgwT
MTV+L9hm9SCkrAwIwpxWHzXdcz31Fh2yM1wNn/HRhH6dxiIxlsEqBW2NeIvbNwzZ
KNLPW5Xa2vE5PI8OeNDBpIMN/hu/YXs9ZBLb/0JjiWbsrpJTrLCwHQ78yxYHk2WN
OvNzqj4cUXeyhTox8xJUFSHtQa1EKxPyRF4QDR7alh7oQ1PQfUDDX1b4PM5oplkf
e9nclfIbgN3l/AgumUc0EGYzUXPGNiznz0rDbQInIGZAjCY6ldLaYjMR9XSxrfW0
Dw22qdw2mTXZ01Iy1BYwNow/BHcyZNIMM1MVvdg3HayduC2xCvA=
=VY7J
-----END PGP SIGNATURE-----

--/QvgFcbHc+KnC2YM--


--===============0228967774217982614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0228967774217982614==--

