Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE6606A337
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xKiinXBO;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=bFrtAkQ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ggxRUmnt8EfrK5EcxblzoupqkjNgWhTE5turDSMEfKI=; b=xKiinXBOHDrsM7
	cX0NRKOTSptzRKsMvfSj4c8KdpAWURyDiG09gY7LSBXtX4V6YUFOAu8BJ8xNE+hwcvdDedGOcUpU3
	HQAV20UAzMQWDEv/SRCqOozUORS/v0pIeiI4is8ayLGJ/zuia+iRQjCFuPdcl2AB63HClp3siMXSY
	+bSfrjVG9qH3AdWVGx8w7vK4q9Ut6BAKU3OVedhiF9szeF1kEPEw/OqQv1j5cpym2XDJFFA+TOWTe
	kXxz6N+O2mYo33Z9FIRIWcycK86rODCdFFmm62ztyeRF73aOK+wmumQ8ZZTb2PGEGnCepPOFmSVer
	e+ul9UH986loxw1V/zXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgwf-0000000EmHX-0nBn;
	Sat, 07 Nov 2026 13:59:01 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgwb-0000000EmGZ-0Htj
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 13:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794059933; x=1794319133;
	bh=ggxRUmnt8EfrK5EcxblzoupqkjNgWhTE5turDSMEfKI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bFrtAkQ6tOUYKqXxdmzhmLZTs+vVerVwCQS2wqUgfoqUBHCTqSAGYyW2sk7sa+ytU
	 5bqqUyliFofSzrM4Lx+tbRQmezdKwc9CBTNXMVvo/gjzu+H92XgQGHHpZHhlIgowrg
	 W5oxsYadM07IKkJ3+4KHWsfvsh/BJxcweK7aPfFrAk/+cY9dr5EMufjySKmWRb1r4+
	 Vq/JGbxI7/5IQ/6Q5P3fohRgNtj3YshpOPRWgsKz2/eNyZSuoERSSl9puPZa7BU/9D
	 Z8Lva58ocSKiVfQjOmYnOw1tZFrK5f5d6czowWDv1c1kRricbK0n3AGcSeB+CsUX4X
	 UcAL4QekVkb8g==
Date: Sat, 07 Nov 2026 13:58:45 +0000
To: i@udp0.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: mediatek: Add MT6833 and the Xiaomi Redmi Note 13 5G
Message-ID: <ZZQvVFkEtu09SueBM4cpOyT8Lvc5AE5kjAhCYj_i90Yy_HGK05NgwpMXjnrG-yoPdoUOdMZU78ixaR67bHKg6oto5txtZci-CevsM21bJqA=@protonmail.com>
In-Reply-To: <20261107-mt6833-base-v1-1-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com> <20261107-mt6833-base-v1-1-bda21083e9f3@udp0.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 91a443bb6ab5850971b9019c18190fcdd348bbc6
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055857_472935_6C8F0E64 
X-CRM114-Status: GOOD (  10.10  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Saturday, November 7th, 2026 at 2:22 PM, Rui Cao via B4 Relay <devnull+i=
.udp0.com@kernel.org> wrote:

> From: Rui Cao <i@udp0.com>
>=20
> Add MediaTek's MT6833 (Dimensity 700) and the Xiaomi Redmi Note 13 5G,
> codenamed gold, which is built on it.
>=20
> Signed-off-by: Rui Cao <i@udp0.com>

Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 180e6e4948e..900f16b57dc 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -72,6 +72,10 @@ properties:
>                - archermind,mt6797-x20-dev
>                - mediatek,mt6797-evb
>            - const: mediatek,mt6797
> +      - items:
> +          - enum:
> +              - xiaomi,gold
> +          - const: mediatek,mt6833
>        - items:
>            - enum:
>                - bananapi,bpi-r64
>=20
> --
> Git-157)
>=20
>=20
>=20
>

