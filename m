Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3438BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUZnG6y2lWdgWCqG7Dp3zbomsCqxL51xcyy5ftvpA+k=; b=yMz37eNaHVU0Oj2Av5KShlPq6D
	3AUErWn0IvqfNg/fLjEvGdiRrhuxDq3jyaKxRNDFJJMeqkY9pW5x/hMnJE5xsT75cY5kVjnsfM5+i
	E9xVMPsr1W/CoAVpBQAnl3W704Bp7O+4JvHZmiw8Lf2RleJ7KWzN0ZNAWEDXtlKc89qNl5z8Zs8J9
	bgTcjNBSSBzyml8GQ0e3T0vHt3G2DdHQN4FbX4YkERJkkrS4sd/HzajJ/j+uJMP+VmZOyft8/cUXo
	+fQzoOMrRnE4+j79+peuvZPFW6RlsXFcIwXz422fGf7VsMwanMP8Cm+VE5upu5kdmlNHt8d30idJf
	yw71AZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPkAk-006Hl0-NS; Thu, 03 Mar 2022 12:03:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPkAX-006HiU-ES; Thu, 03 Mar 2022 12:02:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3B52617B8;
 Thu,  3 Mar 2022 12:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C15EC004E1;
 Thu,  3 Mar 2022 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646308972;
 bh=joVFOZmms9HBOXgoZuJ9RkqFVCdj5U89jr7ZSVH6EQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZZSF6TfMAQvdtUbORxyyZ1laxtoEDK+breNkO3og95FYG+sCa+lfCi20qQth4/yt
 CED3FwKQEixoFfzJDy1Px5awEACzAjHNWNtPw7YhoX20sBuRmdZ0gN1plPHNcwN1zu
 QsBhk0dinEYAp4Hc/tMYSHYOJ+8VGk5lg6NtzCh1PlXdy21Rx36AVYCH66UEmG2G1D
 ObRTKStZHJ5iZw4A87eI5bTzqTzkKAedEzmkUzzKEV6+/ZarqU7pxVlKrbDq/5VjlB
 cx4nyHUS4axCPej7NQkRqcft0KhM9ywXE3A8nbgJRN9TfgAmZa5ZQVbrW1yYPRU+E8
 kyjdwCJC5gaZg==
Date: Thu, 3 Mar 2022 13:02:45 +0100
From: Wolfram Sang <wsa@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
Subject: Re: [PATCH v2] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <YiCuZZs8T6AKtpbe@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
References: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
 <22eccb9e-45fa-683e-640d-6f34fa63ca52@collabora.com>
MIME-Version: 1.0
In-Reply-To: <22eccb9e-45fa-683e-640d-6f34fa63ca52@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_040253_563434_248208A8 
X-CRM114-Status: UNSURE (   8.57  )
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
Content-Type: multipart/mixed; boundary="===============2614771561085328788=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2614771561085328788==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j0lwsQweqcGwCt7j"
Content-Disposition: inline


--j0lwsQweqcGwCt7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please, can you fix that while applying, or should I send a v3?

I'll fix it. Thank you for the rebase!


--j0lwsQweqcGwCt7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIgrmEACgkQFA3kzBSg
KbZ7Vw/+P4t6jxxU+NlXS44NM14j/3DF6/rUS+26gLGmUiUUHI9Ggr63ImC/481K
QeHlVA+WluBuP8OWKvFWReTCOM1t1KnapFDGWESqanG6W0vSN5Br3cNq2nLmD2+P
JHdQ5m6Ssn12KkTm1i3+EpFpTlU4kx5TyvAvvQ1iM/W8jNRwmKIx93pcL1pYU9Z9
xsNbJ6isE2ZdicxaaHuHnSy0XCIkl6YXtDwDNo3vMmmAvLvMwxGjcLO3PW+j9PWm
YvMC+CuiyJ3l9OCA3vAEDuJdneW9sBz25mNpzE2esUuQrPyHjTTAHThbE075q40y
5SkdcJL9G1gdPAHiJeFkW+P0j22o1JVFm7T6SZJdnvmilslBqtn7ay1QMuqDuBEr
KuR2h9kB4wUs9bklY1coegtkNpk75O6wQ1CA5e8Ec5l6kq8S0OFxXXFa1jv9Q3a3
kZ8si8YEH2+NWYESsbgtIQXoohFHC85x9T3PpvEewlNPpyCP6eRwfcUdkMHQuvcT
oBkXd4OWlNZC9PLotz5NPp5xHPrKptRxoPcIfbdR9tYaSnN+vhq9VEU2qPS40iiB
Ae1O6W82yVeTXZEQ5VUUnYdYvfBP3hUxFT+GHqBx+sV4hQrc70YDr10dVPf0IMPP
loOnoSm7D5eXmeMecI6jxmEfd4SEApZ0E4faYO1pMMJ9SBaOtvA=
=vPdX
-----END PGP SIGNATURE-----

--j0lwsQweqcGwCt7j--


--===============2614771561085328788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2614771561085328788==--

