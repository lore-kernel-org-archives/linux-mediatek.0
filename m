Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE62BC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:07:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 618B561184
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 618B561184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kM41+3YuhU1vvA+qo+KWwJH3Whl0wviCIeB7RjePq+o=; b=hVB5tEYeeXDm/IPh1jixtUzNO+
	bygegacTW+onid8rjmZKqa2QZWRADIaY9zHfe4ogx6E/wNYXL7eSi3R2K3/guf69z4TRnb/A1fN69
	pbPbAzG01k+7FIsfsG2EeLO+Xif22ao6RX75JCx4Cppo6S/byZ8n+kYCoJK43HLNt3T0uNVwmd6B2
	qhrvvPUO2xp1nLrJOvHi3DR7jJ8kYtWkNAXEz8qf35gPErrRwC02Y1fXCxJ9Lc4c2Bu3oUJyYcw82
	7RRFv3PzfMyw48i2pu86TXWvSbt3eZ1KWRt0rvOiIVhwmCLN589SsJZPdY6UCH6ZJgLffGD8K/XD0
	BMizdINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhpn-000XOi-Tb; Fri, 28 May 2021 19:07:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhpU-000XEH-1M; Fri, 28 May 2021 19:07:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD39C613E3;
 Fri, 28 May 2021 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622228851;
 bh=EvJaQnsE54Pm3sp3U27wVRm/L17tzpO62n58JVOjOhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qqLUp7FrsSj/FiyZpnTGYU55Phj/G+FIi+Zk0qMAG1WNWmCNeIpf3RXyJfLVUrWlp
 FjRyCgJuHbv4Yy06gy1pTJu+HonZud9PBE9jUt6+yIdJITw4Bs3wnli7cdTFfpgYaE
 lVHZ6P02h28t5HQGnq2k5lWXg4b2493rTBlJv2QR7Qyh2fBI7ADfkv/eoayWYaNDuq
 3Wt0/kp7WoO08Qu2zgLwK9K5h79vnK1PMdweVapkNXEAaj+u9SqJa+9w0u6lpzsPl9
 F0E8iBzKtrfzF3RNazx4YW7WO5OD0UJaujv3spzk2kD96wcPjGLGEIIrq9p4gFVpGM
 g+oGem3s1lmsA==
Date: Fri, 28 May 2021 21:07:28 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v21 RESEND 3/4] i2c: mediatek: mt65xx: add optional
 vbus-supply
Message-ID: <YLE/cNRatNpf1uR1@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-4-hsinyi@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210527075556.1709140-4-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_120732_141954_FF900A9A 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Type: multipart/mixed; boundary="===============7838950900425517778=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7838950900425517778==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZcRFboOTKi9zYWgv"
Content-Disposition: inline


--ZcRFboOTKi9zYWgv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:55PM +0800, Hsin-Yi Wang wrote:
> Add vbus-supply which provides power to SCL/SDA. Pass this regulator
> into core so it can be turned on/off for low power mode support.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--ZcRFboOTKi9zYWgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxP3AACgkQFA3kzBSg
KbbR1BAAhMpP42PeKOxHKScLjKzIM0yOV39wri2or4/lcv914rXi2+dcuYiNRML4
ktR1lAM9gOkghRGA+on+b3PQ3WN+N2HTH2IDlqXWF/NqDq35i6L1tDPXd5IUaP51
SVE0a6c+SHnTUKcDlCBvQxb17ra2NsR/m6TCMlUXHRoRZZQsiNkEqaxdnPjsFqbj
x/aLPmYmU3GohfEWEorfeLeZQjLGNmccAx67ATHvWjWgykdmLrSBH/4u3aEIXukH
XAPO5kuv5DbiKP5aQdu410hy0IEtS+GKM4eKb6YIK1EtxSgkxJVTzv+9rUqWglP7
nLtPEvqMrfJBs+sPhrIgE6auP7bG0OFNTmQjJpksv05XC3eboZpGJPwF5KjX/gzo
hZbTTrJPmLsMB3MN1oe3rzvA8MLrAdNbQ2O/uK29oVUzzNgcvZx59550DyIbIlz2
XL5zQNOqfKn1SrUzEalpFZReSu50PuYBS3qyBz6l+7eImXjDdF1c6083emLud72u
hIvrqDiYk9FzurLOnHlNCPrgKywZNwrFC2mpR4fZB8ehulIYr9x7Nieqfh9q8kbx
+06xFT7CDOQaqDSoNp3GCLW+LZJm5pwv3ggloS0DKl+yRexIV0klVFGN9AIiBhol
1bSigQvY6GhuI1lDVCQyEl45nDeO0xcltKgd4IvuBKOlJbsUI7U=
=4N0s
-----END PGP SIGNATURE-----

--ZcRFboOTKi9zYWgv--


--===============7838950900425517778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7838950900425517778==--

