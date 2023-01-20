Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACA8C25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKOtrO4qEvfU2v7n0sOZxuyMB/iDpeXkgjzeYkeZiOw=; b=U3MK+yZm+qtbzaPZZJMjBfH7yO
	d8GUv6brhtMqzpWdwp5t/H1uyG5Gcz9JgMX6l/tdElKFm6TBpBXKcGD4puRlYH/DZslB1eINE66x3
	fskKykYrWSz36zEufSd8RzvkHSUALV0fNf1pEN+aKHj9ADpuahOXmQZM1SuwKzir11wbvR1BGU9QQ
	BHMPUC5JNMwwY/hUkllj9f/dghf/3yRLMwmt9x1Nm4VaDTSUjOe111HtLtt8AQ1jOH3RrgNJqVMJd
	Sj7PMPmGgIPpY3fdeucSB2Ys0cLWsw/L37ndNeo9k0S/z9TEpzqhaaVoVLRpAM9l7psITH3YMzPxk
	fffL2wRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIo8M-009aQ5-SW; Fri, 20 Jan 2023 09:56:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInju-009O91-QW; Fri, 20 Jan 2023 09:31:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BFC9261E5D;
	Fri, 20 Jan 2023 09:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B61CC433EF;
	Fri, 20 Jan 2023 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674207070;
	bh=CKOtrO4qEvfU2v7n0sOZxuyMB/iDpeXkgjzeYkeZiOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYB2WIrxqbuDQhGdXFRPx7IpEmt+OzFJpaPxSHgP6GQW3G+VBLx1f4dNvJYUftQTN
	 TsKQMwt/v37982YqiGff/rqz+tL1btpZjirtUkwAjhUMz9LuUb9emTPqOL0h7t5lp1
	 YIxy7GOOCTOrxQsJvRt+uEPCDgsNRUHM+uZ5jxtFuqvwANP3W65PQIc8qpw8wnBsQk
	 5nZfxTaJc9kSbjUl607NKG3azOwUIsY3jJ3xF3Guisa6hrTw3QJFujtBDVAz8J3Z3e
	 AIw3RiT+u+g3K5cOLDpbi/o2X04DG7p5h/0utHHtXgCgpmLUdg7RJUzPwB3N+2aO0q
	 z1qBMvz2ICTXA==
Date: Fri, 20 Jan 2023 10:31:07 +0100
From: Wolfram Sang <wsa@kernel.org>
To: ye.xingchen@zte.com.cn
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-mt65xx: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <Y8pfW9tr3ZxW/xl+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
	qii.wang@mediatek.com, matthias.bgg@gmail.com,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202301191719589508843@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7G+d9qaccbupwLTd"
Content-Disposition: inline
In-Reply-To: <202301191719589508843@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_013114_945117_324B14D8 
X-CRM114-Status: GOOD (  10.82  )
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


--7G+d9qaccbupwLTd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:19:58PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--7G+d9qaccbupwLTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKX1sACgkQFA3kzBSg
KbZlxBAAsFG9Ww7RAqxOh6qF1WLDMNIsH1bdzLVi/yY2FIsrvhwicdNFvb+yn1Qe
fxGmquGQ13AtMlnOu8XX8ppF8EdQJ5e1kb63qVcc+OeVOrml6ryBnz64ovpj/Ncq
Oqgr9SqEUa0kq4TRltecjhaC+/wLnnSScCjqx5MHd4DzfS+5wLzBgtr0WuSfSg8C
7JwFEKdID8s4Kow/L697BUHGHkplhRPKjOBMj7QfkDHpAOmdgslq1pwaeQ7w67nC
o7I/5GxrinLlA/jEwD7nZbrzkyHC4vjMzE4g4nf5raofpFWRLLOrTlvMk+F1qGId
ze1XdU0tOoo6V4WH6RE7A7Kb3LPp4BdaNF1/STeoWh7QZZJU77PLm+yyLM3AZFvW
/HoNeOdX8FIWn/QzEcK+SUoECloO/OZf9nzpKor/PfDv4AK8WDNKtqCKjbo1s6zN
0k2rCI0uuD0JfmhU56APP608EUdsDJlb1ZhJLVXnI6xhd1AMvkDGSqDCPSNqtVmg
JnKwvAxrNqALX5RZu8KtvIL770VlOBGVOeioUzMlbcO7cZu/4n4eetpFbGABpwlX
lGDtEHwD2h0S1AmRB0GaY61pnOMHuttl28Cphv2tV9MPC9WCnHAiJykSlYUOCg+l
Amu/r0sjUk/HOvMuzcok2L4HAzongmTLHmRv8o5Nl07NEM0kQqo=
=NCwr
-----END PGP SIGNATURE-----

--7G+d9qaccbupwLTd--

