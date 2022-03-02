Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3417C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 21:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gnmt0Q2Po6nNJBg5X1hU6lqw+jJeScv0P4nlJsmNm2A=; b=fyjqVwpvEmwxMTN9Ih6b/EUpC8
	9oShWGkiWkeUUyw8RiHz+4ln0V2UI7HD3x8xl6kNj4raneNia31znrj4OV9rrx9dcxjWIRJcUWHO2
	2THRuh+buQ6RKDZlAPPxkFmjlU7ydbeZhdE8YvamB8h5/oj+e1MrXoWLLuqsg73Vhd76HSkik8Msc
	979KaJJvA0mENJa6AHcrRZXJPJqwdebe9luH0OhGZgclLrBn/qEzunQ/KYIxjbhkuOdbdoQd/ephc
	gLFw6BU+qTLjdjlec3/sGqTVqSnTQwJhz4KQzxV0eCAHD/cQ9y/f6MXvNAFm/AK4cMlqWQkT8aZ9e
	th190f6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPWjK-004Oin-Ee; Wed, 02 Mar 2022 21:41:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPWfc-004NNz-HZ; Wed, 02 Mar 2022 21:38:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A50F619E4;
 Wed,  2 Mar 2022 21:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2F5C004E1;
 Wed,  2 Mar 2022 21:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646257083;
 bh=u3CiApm/HAA54PdzVzkQa0SMTvOR974KdivaMD9drI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZYrzcGxX7uFzIDR32pl5B/rTE0/WsMB1BWvGgu442qpQ74f11LAQKckgT97lFPwG
 HgXefWfUqNuA//PZU7OaDdbSYq6fSRWAfKDm2DHdYaGfQeV7EZQCa/98sp/U731dxB
 ose0XODYq3HUb9C5/FeaGYGyjpO/qgju1gXpC30CNKNEImQiMRX728nMscXoTdcNUM
 bfC20sjgcimXwUCFfigaveVy3hftkPdaXUiBzoPYKSe8aH7SYgDQdPXXthEdiWHTDQ
 a22Le4EGgnOtBLYINH+JEJ62n6GEEt+U8H/4zV5/kx5uzr4HWkNI/KDBVYqWtgaCLB
 aUPpD1LjQlKvw==
Date: Wed, 2 Mar 2022 22:38:00 +0100
From: Wolfram Sang <wsa@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <Yh/juKe395aNHajb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_133804_664274_0358E8A5 
X-CRM114-Status: GOOD (  12.88  )
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
Content-Type: multipart/mixed; boundary="===============5678734575945529051=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5678734575945529051==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0hUHtEcZp+Fkfqii"
Content-Disposition: inline


--0hUHtEcZp+Fkfqii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 02:33:58PM +0100, AngeloGioacchino Del Regno wrote:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Hmm, it doesn't apply to my for-mergewindow branch because of other
mediatek patches. Would you be so kind and rebase this patch on top of
it and add Qii Wang's tag, too?


--0hUHtEcZp+Fkfqii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf47gACgkQFA3kzBSg
KbanuhAAmqYnaoy6/gsLbutpo9FX8hs9F1lvxqeyg6zRxqY0Hc63iN8VZXioZXOK
MdvYwd25pL5u1+TAB7Ds+18sYd+qO+2t8v7KsM1g6f72ycT5v8cmaNfekJ0RqQ2G
gAXwOCbqhL8+N2P0Y4xqd2CLwc0SUWXv3nabFE6wMkW7U45ptNHLzctwF7EBzZnx
sNu0Tt3ke2oaOjvH27m/XCnJyWWCqlWqNfh4ntKYFqIO6GB9H6/kmpfOo9U7RSVR
6PM/56kLpVrfTbCqDgllQ0C06zUwvj80n66dBlvEQdQDXGewyJcK6herIYOoGRz3
bg1dSZQ2qunMfuf8QgVsZFv3xyFxHkXCfOv8G0ybc5pkr1SDjiemKp38zrtl93AV
2vQPyI/KySnLa+LpFseVHR2a8efOtBWGLVWl763GAKBQyp3rEMARXAn58iRonrBc
kmXMii7nbxGepw23ec4tTbyux14edXxIdNQ9atfuFi1fQ+qeOe8aM5PCu9DRtETY
p5I6E2WhD/21GfYAEQJhW6V9lRYv/I/VlMgjHQf5Zt/NazUpiQoMvemEqGc8lo23
hStP2HSI0ZAtBRf7V6HlM7io47nPmYAe3AKXNJ9KWYooQXh/PpcbGS8M9kCZ3qKR
SWdoU5fv93J7sZXgT3huWxvjVT293uUiRbc8FA3ZQ4LWwlR3jS8=
=78JX
-----END PGP SIGNATURE-----

--0hUHtEcZp+Fkfqii--


--===============5678734575945529051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5678734575945529051==--

