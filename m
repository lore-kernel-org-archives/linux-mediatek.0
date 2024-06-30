Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3A6C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jun 2024 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtspAwYzEx4DvtvrzpeF1w+TJrhq8dDK8mk/R4JZVV8=; b=3/Hd8OyAQSCqv+4y2OQZaXUlQk
	3MVJpIlKhRBrsfnvwxrGu0aTZ5BzPyJd+DfG3hh2KwDilcibv7L/qn/NEs+s6tnAi44rlMqLzzgpJ
	F3Uc7+rqj1DBTLynIDNSSX7rNmQPKJcsYU3AEyhpBLLgf26ZpQusaJHDmMvZ+PFPeSEtEh17gxuMI
	caBUkTzOk91q9Ofl+TcDnhhBcsZviIgYg/PclEzXVZHvuhpJrnDpcbLUgplHK6A8nhWhhfl8CXK/t
	KiNMP80ll48Tj52LSgCiQI6LGVo5b2DAFVICvBobXFRF7+BLNJyhmKg4Imd3juY6zEqkHyERHUuMi
	/xE+TExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNvGZ-00000000UdE-235N;
	Sun, 30 Jun 2024 14:10:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNvGO-00000000Uac-23bQ;
	Sun, 30 Jun 2024 14:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E60B160DD5;
	Sun, 30 Jun 2024 14:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C113C2BD10;
	Sun, 30 Jun 2024 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719756634;
	bh=dtspAwYzEx4DvtvrzpeF1w+TJrhq8dDK8mk/R4JZVV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEKfl5pvor6XMB1i9mZLzeT5v9kSWnKQv5OfaNC1vRP0g6vzFKdRf48C3O7CMYi71
	 3zg9nohBI0CBuSa2QWO9E/zjds0QtujQY7ZzQcZ9ttT+cpBuUE6cON1u1zmAmbP+VC
	 LWVYIAsOcresETeez8sItNbWKsHMtLI6D0LgNQ5OCyR0xCZZRB3ZK4PaBCLhaxJVke
	 HCWfQf3KKamdBMbd72yCM/UPHvQkKP+ADaQgFDM4lDIrIWNK66UThmnlab/M1uQ8Ph
	 m/TkYPS86mJjYLPMii1gXnYZPzMT6RR1un3ozIZQja4F+Hle6EbedgmiEX6jXAGkLp
	 oYGx216M7Y9jg==
Date: Sun, 30 Jun 2024 15:10:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3 1/4] dt-bindings: PCI: mediatek-gen3: add support for
 Airoha EN7581
Message-ID: <20240630-regally-gluten-2e4dd445ba0e@spud>
References: <cover.1719668763.git.lorenzo@kernel.org>
 <7622715d622413d1b4d8752657f87ea81001deb9.1719668763.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P6aqo8yz8abeQ6PR"
Content-Disposition: inline
In-Reply-To: <7622715d622413d1b4d8752657f87ea81001deb9.1719668763.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_071044_670098_FFE83C67 
X-CRM114-Status: UNSURE (   6.87  )
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


--P6aqo8yz8abeQ6PR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 03:51:51PM +0200, Lorenzo Bianconi wrote:
> Introduce Airoha EN7581 entry in mediatek-gen3 PCIe controller binding
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--P6aqo8yz8abeQ6PR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoFnVQAKCRB4tDGHoIJi
0unLAP44wkl3iYFSy4gS4GG6SCbKDB7YlCj4qhjCd70t3mjiEQEA48VH8ZuF1r9d
6rhsNrd4APLPteFcKQ7vn0T8H/99nAQ=
=mN15
-----END PGP SIGNATURE-----

--P6aqo8yz8abeQ6PR--

