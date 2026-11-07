Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56D606A337
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IlS34W3+;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=kFb/dtKx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P3/ZtZc9uaQGFY2ihIoiddTSKQLXeow2WIExumNjyWU=; b=IlS34W3+TV13bb
	ktSMUeLSLGtweK2AAn+6JuQ4+OVzAyJw5BJkF9ngM3NB+xLjcx7uwscxDKGmT/UTEqE10vqustC/6
	/icSrfzAlXEtpaG4TXSoq23bKaEz+u7qr4ri5ceurZjJdXXA7+1RN+9cfvKlADWBNR/DofSOc5nb1
	Z1okRakPIFpynqcW8DTS+qhtjQHJmrAmBU7Ex+g0xr0gWZFawKMRPywY0h+gbIjNsFPNekX71/G+f
	C6XydryILTZuK9slGFzNREDAD/XzuSGiEm7TUbBCTsGXZsAOTePVNVCNIAooHp8bDrOU2ZfNEEZoh
	v+9kdUzpG7TDj2j6U5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgya-0000000EmbV-3RMt;
	Sat, 07 Nov 2026 14:01:00 +0000
Received: from mail-43103.protonmail.ch ([185.70.43.103])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgyY-0000000Emah-1LEO
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 14:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794060055; x=1794319255;
	bh=P3/ZtZc9uaQGFY2ihIoiddTSKQLXeow2WIExumNjyWU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kFb/dtKx0W21Hwap+7+8lga1HqsD4gxpdPl50pcvQ9e3S9KwwoYRPhb+Qrjm/49s7
	 7v9iGvxAW1p6TPLAUNDvDrRdgxAZHAoHpDMTfczNMAWo36XQCGKYb49v5VAkfu9y1c
	 gWdcVMQK+fAd0PlZgH/c7L6TxTYZvl+M4FVDX/qLL+Gr19LCcIqcK7zEBFxxu6MRxC
	 XATdPMFns2C+Oc9Fs+aTx5LUI0iDzaPlXsjviuVz1G+qfHrO8iIcPQigRxdD4d4d15
	 1jGpyBtntJOIQx7cMcbGAV266k+totjlYOv+551esKm92NBCxSd7lN8+5I5HPaELud
	 6sVHHm5qnQ/1Q==
Date: Sat, 07 Nov 2026 14:00:47 +0000
To: i@udp0.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: serial: mediatek,uart: Add MT6833
Message-ID: <joJnuIX4efIyYGdLotFbhAL7aSeQCOCIdfbE2p1dI3CIEHZuJ6cLh_xF34joTacjhgeBgBC_5AQfceHf9sCsdCStHhTeJSujzY7UNuVADps=@protonmail.com>
In-Reply-To: <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com> <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 68a5641e2b162357b5d491fe81981b1fa2444ff5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_060058_543580_31B158F5 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
> Add MediaTek's MT6833 (Dimensity 700). Its UARTs are MT6577-compatible:
> MediaTek's MT6833 device tree gives them "mediatek,mt6577-uart" alone.
>=20
> Signed-off-by: Rui Cao <i@udp0.com>

Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml =
b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> index 5bd8a8853ae..8fb793c3408 100644
> --- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> @@ -34,6 +34,7 @@ properties:
>                - mediatek,mt6779-uart
>                - mediatek,mt6795-uart
>                - mediatek,mt6797-uart
> +              - mediatek,mt6833-uart
>                - mediatek,mt6893-uart
>                - mediatek,mt7622-uart
>                - mediatek,mt7623-uart
>=20
> --
> Git-157)
>=20
>=20
>=20
>

