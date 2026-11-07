Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5386606A32D
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 13:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dOLzUdIg;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=EOjxcNSL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/3sAFHtPYKh4hfh5oHSjJm2FliB8mRvDUUYSRjLsl2w=; b=dOLzUdIgjQHTW7
	qxBhEmoGRfxrVMWC0j9/WTcHUI2f5hmFS1CNF3E3eZvlJGCeop5WJC3Ib485mskSqjEajpqjNuETb
	CK/wh+JbdE9DxA55NgSs+EG9iX482o3LGoWscFzNAOllUwyIj/jlFtxfa/tuI9EUPNyd7Iyfnyl6a
	Vw3gQrMa0lQLbXGLh7SNVGyREwJMmG8hXc9KeUbvUKNuyfcIaOatCHcfvnHm89DMaTuUbspVsEzZp
	g4+enoSWyVUA2fQfxSa+VT4QJQ4YFFIvJRJSGfiT1chBUtsgvgzMQaBJbFps4nqn6KRUvu61Or+Qn
	fuWbPeg34llnoRBcUMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPg7Q-0000000Ehft-1bjO;
	Sat, 07 Nov 2026 13:06:04 +0000
Received: from mail-24416.protonmail.ch ([109.224.244.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPg7M-0000000EhfG-3h5Z;
	Sat, 07 Nov 2026 13:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794056754; x=1794315954;
	bh=/3sAFHtPYKh4hfh5oHSjJm2FliB8mRvDUUYSRjLsl2w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EOjxcNSL5Bum7bEk2C0Vd49WKS7rrBFS6p11yhtRpfi2ClHAQh3If5jMEiWF5MD3R
	 tXqq67EqzYI/aIZadN8AOLn4pTIoRN04HKqVVeYlMgW4sk2YFmEiwoicCJS1Gs/eK6
	 4kq2HEt5fmyoka4M4vcvnX1nEhXRSI78DVHmij4HSbYCvfce+hYD9J0hB69+Fn1nn7
	 Dqpdt0vGmNRgvJsrazIqqScVqHglXH6fqZN4WlZ6dvREP26oZK9qIlGzmcIjd+UfWv
	 OSWnfPLrZAcQ7dfY22sGl1gkknl0xR/F9ex2evxNoW3yvgxlZtnWTXO48H8TaBenf1
	 r44//TQ5n2eVA==
Date: Sat, 07 Nov 2026 13:05:50 +0000
To: i@udp0.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT6833
Message-ID: <NHTtBa55FlZroePPfTapZ39Pvy1b4wyqCCdSD04TWCQXFLmLQy2sA6FNcAybpbZP5XAT42Ze_JPK1F8mA3c49Wk7dm8_Uir4anxYntb_CNI=@protonmail.com>
In-Reply-To: <20261107-mt6833-base-v1-2-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com> <20261107-mt6833-base-v1-2-bda21083e9f3@udp0.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 457835996074fe34483b037e7f2162c30162acfc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_050601_101372_E777AB0C 
X-CRM114-Status: GOOD (  11.02  )
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

Hi,

On Saturday, November 7th, 2026 at 2:22 PM, Rui Cao via B4 Relay <devnull+i=
.udp0.com@kernel.org> wrote:

> From: Rui Cao <i@udp0.com>
>=20
> Add MediaTek's MT6833 (Dimensity 700). Its watchdog works as MT6589's,
> which it falls back to.
>=20
> Signed-off-by: Rui Cao <i@udp0.com>

Does mt6833 watchdog have the same resets as mt6589? Please take a look
at mt6895 series [1].

[1]: https://lore.kernel.org/linux-mediatek/au7UMdlP9O6oo41i@buffalo-ssd/

Best regards,
Roman

> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.=
yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index f9b725592c2..dfdc06c758d 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -38,6 +38,7 @@ properties:
>                - mediatek,mt6572-wdt
>                - mediatek,mt6582-wdt
>                - mediatek,mt6797-wdt
> +              - mediatek,mt6833-wdt
>                - mediatek,mt7622-wdt
>                - mediatek,mt7623-wdt
>                - mediatek,mt7629-wdt
>=20
> --
> Git-157)
>=20
>=20
>=20
> 

