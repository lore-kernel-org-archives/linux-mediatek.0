Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58E3C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7+FgLP6I8iI3gluqNCiw0N+h9DglAWZrrm+DHCQYzk=; b=WaUX57xZbfzTMEQNHA+IvGxQRt
	tlFMYoZgvl8vqhpZkWLjKwZaxAc4o+BEpw2+axHzV4BkKFqEE5EvEEEUcCSfwktvqCLaR3yZisCpt
	5G5tmkYK86PvqVLhaLZ+uBuusjVwSMfTFpadgY1gR87Tu2WknbnLzrOCpiDL4SkT5yE6gVog9uZny
	pkk/Uh7Qw4rOzMwgT0noONhKGCp/fWDbLU25AlpzCmUqbtdscfaDf6jnLKAgX1SHTEMCUTathPnLh
	gFe+DMOFdM9G/78VXITDbMLkAzmXvqAK21nswLAvzN6i1ejrAwbjkcee/UT3U5eH8vOFCw5HYCq7O
	5i2zY+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXAP-00000003A4y-0krf;
	Tue, 04 Jun 2024 16:37:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXAL-00000003A3k-1C9m;
	Tue, 04 Jun 2024 16:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38068CE0FCB;
	Tue,  4 Jun 2024 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F359C32786;
	Tue,  4 Jun 2024 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717519057;
	bh=Y7+FgLP6I8iI3gluqNCiw0N+h9DglAWZrrm+DHCQYzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzXHR17zM9MO7WcS93M+5rYdbppUnueqnF3e66ILV8dNc6JwpFbE10Uuqp1AbSWkV
	 jvLFa3rayffCWDjtCeluxzx5xNUuqIp++haB4igQGRAWPK+eBNO7xZZ3pWQ5hK49W4
	 /KJ6muSyaQXjHng54GMm60gSWSne+KcM8VVsimD5QABIGGDVYUrRFGHnB2MAdRSGeP
	 tAWgnB2lpPn6UTBLqK+LTazcK7+mkwdMDDmr9ARkq9gBusUfZPtw9acdl4qkkErNWE
	 fIExAHW9EeNLtr5Tu4FbvGzlujfx4bDgrpoLlop6xGTbMqr8Zt1YpNATORXUSlfx0s
	 oZXYaHtLp7z2g==
Date: Tue, 4 Jun 2024 17:37:32 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8188 SoC
Message-ID: <20240604-etching-shrunk-162bf233f483@spud>
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
 <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZNmaHLwdV+0Ezx3e"
Content-Disposition: inline
In-Reply-To: <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_093741_526862_2E40B677 
X-CRM114-Status: UNSURE (   8.72  )
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


--ZNmaHLwdV+0Ezx3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 02:39:21PM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ZNmaHLwdV+0Ezx3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl9CyAAKCRB4tDGHoIJi
0oOXAP9m+tBb+Ha+VYSTduN6nFhe1pWIbILjHx6C4dAD0iWh0QEAuYAAlRVVGxPw
NPLSMqfSlH7QXMhB4oIEvdfuTrfDIQ8=
=meGF
-----END PGP SIGNATURE-----

--ZNmaHLwdV+0Ezx3e--

