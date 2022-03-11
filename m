Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF857C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMGJHiObxnpZz3cNeiXyIVdBHbG06W8vEuu1AHvL1bA=; b=gRd+m6Ks1WGLgRNylxwIjqnNJi
	wMB9II7wQQ33h4wn/Xp9vwfKU7jJe9v6TOOeI1QR0gEmHBbKXjUPSHJLZ5evNs6IlKhzjHYYkYE/E
	JyFP7RhpxLC8EhzUCd4wzu4Jazj58WbspFUxmXQO9/ZMKXBdXFc6wJlf1l0bY2N3yxwCKVh6Zezkl
	qfL6uoy1KooM0TCsBiMFrzZQ6yAz26b+SlN9cwTVcFFP9eIAP+c7s1dYa8zDNk4kw2+KTu4IfmjA8
	mi5HCm3qIme4qrwdIAIk1L3gH+OoBQhuTDUQDrQem9QEce9ntBLRbnCzU8NW4Wprp9ALQcrVnI9qA
	zBI81A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSm1F-000D5S-UB; Fri, 11 Mar 2022 20:37:49 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSm0t-000Cyz-89; Fri, 11 Mar 2022 20:37:28 +0000
Received: from localhost (i5E861B4A.versanet.de [94.134.27.74])
 by pokefinder.org (Postfix) with ESMTPSA id 675962C01AD;
 Fri, 11 Mar 2022 21:37:26 +0100 (CET)
Date: Fri, 11 Mar 2022 21:37:25 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v1 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8168
Message-ID: <YiuzBTybck2ygFGP@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220307033649.11564-3-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_123727_458225_C4581CA2 
X-CRM114-Status: UNSURE (   7.23  )
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
Content-Type: multipart/mixed; boundary="===============3196433099281132075=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3196433099281132075==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvpBfzgmPgH6jx37"
Content-Disposition: inline


--kvpBfzgmPgH6jx37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 11:36:49AM +0800, Kewei Xu wrote:
> Add i2c compatible for MT8168. Compare to MT2712 i2c controller,
> MT8168 need to synchronize signal with dma.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks!


--kvpBfzgmPgH6jx37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrswUACgkQFA3kzBSg
KbYB/BAAswZN1HvmpZKWvzonpPNjH7FaJ+tKlzhUwGv2PL8JC5YK9F/R2wYZ23Co
0bvhk/d2004q2DjJeEja8YAQ7nkZqq/Tmy64PabF5mRrgHh46ur1eLco3JsuIev6
MOxec7LwCrJMRm56IIIiHRSwLbuKiA9PhmgRp7jw7OlDD3cHA7y9E6QHX234YX5/
ntzJyosKv05rwHuobLDJpQYbRT0kfz7rhuCK07soDlSdtSjNoRWmKK8jk9JGDAN+
Vk8BYje1Nfx5i2zz8++PPQyBHiBn91Qse18D3nxTIc+32BP9rFR7Jmkz21NR4COo
FdugFZxlWumPpTbRyzqh5NWsCSovM9fyV1rCzztVfcqcbdDTnNWrX1l7qD2MOpp0
h9SjGzdwA9xZrAf0awwDb7vYTiKd5gvxsxgNEqP/eT9cyAManNxvbrcZjIyn7bjW
2JUPxzwYLj+9IISovG77X45kI9L3dT1GQkKlXAs7OsPM41uHtSuc832R/YMADC01
ch4QX90Mo1f54SdshPvlYlENhjIu5dBKrXCR7+vuSxEZ45RHPKN1qZX48u42rW0N
/hDS0SSLM4a5AVkyNvSwReOPRm6rfSCaPtVBAWXtp43NOYHzBd6CvzYvtwCsVEMn
JZ9Sg7KFgkznAw5oh1vyEPuyfYGHyuL/7RNyUtcKB8hkkwds4+U=
=DttB
-----END PGP SIGNATURE-----

--kvpBfzgmPgH6jx37--


--===============3196433099281132075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3196433099281132075==--

