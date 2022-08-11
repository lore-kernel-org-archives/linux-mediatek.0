Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765DCC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhLwNU5WWH07RPXDa9ooc80ovrDkt0ZabEwfrL16a9Q=; b=ndLFU2HmDVIfKj9KsEumVQHiVb
	2cqQpfOW4jBrz45QSYm96kL+lLpk6eCJwYdIlZCHSUwjr1IVhYMFtt90wTXVAv0tM3TO64ilJjJTY
	L2O79TlvnvQPsJx52MVZMLIXf7Bngv1rsF41a/kIwFMd2LQRbuePLxGxw5+z8t2eXka1OlsaosyhE
	Bnpy/ApHUDKLiVEHcEE36+3k1WUHrR/+6OkU4ga3R/xTrGxO2ueSGAHeySPnO1aLM9hGi/TkkLPsw
	w3R5i+yooDya+QEePJ1h9TOQEs0QCei39Su0qP49KJ5jWwTXIdsMAnrjVyfXiKbaWxHVVSE7PP5mr
	vR+BB5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM7VI-00CCrV-Tw; Thu, 11 Aug 2022 12:41:36 +0000
Received: from pokefinder.org ([135.181.139.117])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM7Uw-00CCUC-8R; Thu, 11 Aug 2022 12:41:15 +0000
Received: from localhost (dynamic-046-114-180-205.46.114.pool.telefonica.de [46.114.180.205])
	by pokefinder.org (Postfix) with ESMTPSA id 896FEA42807;
	Thu, 11 Aug 2022 14:34:16 +0200 (CEST)
Date: Thu, 11 Aug 2022 14:34:15 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: kewei.xu@mediatek.com
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
	qii.wang@mediatek.com, liguo.zhang@mediatek.com,
	caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
	yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com,
	david-yh.chiu@mediatek.com
Subject: Re: [PATCH v5 2/2] i2c: mediatek: add i2c compatible for MT8188
Message-ID: <YvT3R81eivQy5hec@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, kewei.xu@mediatek.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
	leilk.liu@mediatek.com, qii.wang@mediatek.com,
	liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
	housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
	ryan-jh.yu@mediatek.com, david-yh.chiu@mediatek.com
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
 <20220806100249.12375-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vZzt3QRaHY7bPIUb"
Content-Disposition: inline
In-Reply-To: <20220806100249.12375-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_054114_512228_7E0F1B76 
X-CRM114-Status: UNSURE (   8.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--vZzt3QRaHY7bPIUb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 06, 2022 at 06:02:49PM +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
>=20
> Add i2c compatible for MT8188 and added mt_i2c_regs_v3[], since
> MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied to for-current, thanks!


--vZzt3QRaHY7bPIUb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL090cACgkQFA3kzBSg
Kbbmwg//RlfI5YLoh9bZ0auBIbMQVv8PJ3mY0Zy6fEhhUr7L8JXGUkYuIqlj+Ce9
bgrO5gfIbKCptseQBJTzfeKAHeAfP403xc5fs0p6MxBTsxIlmnJiOYdJa1/w2gW6
ef8dlsWVz0vy4IzApsCqKMQmzRnpS3JWe6t6yPlGvLCNP/7Jg28AsL5BJ7xcWBII
mOd4ltxQKNzNKr+JOQP72bOhTJ8QvpDkQWXYIHzo7JDX7xcEArKI8rdLeQtzaMK0
Tgbu9Vh8A456ieBhJOTppR6MnhPfAJHTPAnaT/DRc0uiXmlFBZSYHxMNjxGxIm7w
VhATBi5TXC/YOHuoGrCPs2unNza7mhaS7lLyb7hloWyiqKe4LQ3Q03ACtZly4TeI
hu3n/K+U/W18yFJmCS/pioHl0HUNk3b8BiRQZsZbR7tKvP1RKLJrP9eAEv/poygp
JPe6oD4Zb2Z7rY2WpakHtBsEZDJPye4GtfC9DpQV9Zxo8f4ca//cCZj6gJvhG6CZ
2MmbIpD+ZMhkLtcxy+/yKrMraAtZJ47G4AHM78/JqvzsLf0iD5qTktGomBTsX6y+
thefaLUDG40BbRQerko6p41PG4+JbJGTzmQ3QhIkoBhs1vF+RtwrgajyvwZdSRzB
5/bSw8OpHEqorF/u2lSnuVP23IRILQFNx/2oYqMGaaj+SYXOFek=
=r+cJ
-----END PGP SIGNATURE-----

--vZzt3QRaHY7bPIUb--

