Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FAA606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTz8tJmH;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=xcIIn+Dy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gd5OPWaMkDUUnMjrqTNlvKgo/YuPUSfOI1ie5YD+3dQ=; b=OTz8tJmHq4pEK8
	K+rZcpqMwLmpMgASOTtkU9AiH1i5QlDwzji6ioCZOYquXZWs8aKlEQcaaaTkByZknTKdg4UKtp3rf
	PLtg2szNMDPC4El8GAzwobCl9wGFMsSbcDBrhivrEyTY4E1wheUWCnB4uBRSgDJ/VtKBUT916ucn0
	Ss1LH9bCQlCwMdgxMObmdk7Qh9cXZoxQ/8O8plgFwwNhZ0Ew3K2brRLFV61RUon6FqrBK4E/Hj5fC
	0dOKnWU/0r7CKwfJRUQeHBVcxJmS4hpmmTkDIgRk0F2a0lK8EiOoUVVGXNb087MYhBqn7Zi/GNHOI
	r4b/tJD8x6bnhK6XxehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTya-0000000CIbq-3aMX;
	Thu, 26 Nov 2026 07:33:04 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTyX-0000000CIb6-414B
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 07:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795678379; x=1795937579;
	bh=Gd5OPWaMkDUUnMjrqTNlvKgo/YuPUSfOI1ie5YD+3dQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xcIIn+DyvpSiZrHpjcVsm1jQa8TLIEkIzdcQM/f7sy2L/G60qLOmQkzeFVHArEJ8y
	 9ymoX72VDcKjzEPH8eDIpaw+BP+64G4t5/FWeXfZaj+UMsKQ88TPuSEi90M0dPlpTz
	 90H+2Em+rkreoNMXAHLGtJ6ZXTuC75LcPTwG6u1F2eb5d7p/e2+jwU9MayItjzswWJ
	 WlLyq6hBgQ2zrTd4XMdI0nMQc8JuelqbfV8hZ5WFHr11H7NVEXl7PB9hEUeYJisMfc
	 SA+8rh5O3Z0Z1D0Ez2TioIcd9yBOf3cv2f3nnevbgjQdEghECrEP5XOLMT274mX/Pl
	 1EuD/tMuxhD7w==
Date: Thu, 26 Nov 2026 07:32:53 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and MT6358 VCDT request bits
Message-ID: <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
In-Reply-To: <20261126031013.27701-3-iasnezhkov@gmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com> <20261126031013.27701-3-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: f2f976825cf3640273303d75940ba7bcaadb679f
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_233302_370273_FCC56D6A 
X-CRM114-Status: UNSURE (   6.79  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thursday, November 26th, 2026 at 5:11 AM, Ilia Snezhkov via B4 Relay <de=
vnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> mt6357_auxadc_ch_desc[] sets req_bit to 0 for both ISENSE and VCDT, and
> mt6358_auxadc_ch_desc[] sets req_bit to 0 for VCDT. Bit 0 of
> PMIC_AUXADC_RQST0 triggers BATADC (ADC0) rather than ISENSE (ADC1) or
> VCDT (ADC2), so polling the ready bit of ADC1/ADC2 times out unless the
> channel was triggered externally.
>=20
> Use the actual hardware request bits in PMIC_AUXADC_RQST0: bit 1 for
> MT6357 ISENSE and bit 2 for MT6357/MT6358 VCDT (matching MT6363 VCDT
> and the MediaTek PMIC AUXADC hardware registers).
>=20
> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxil=
iary ADC")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

VCDT timeout is gone.

Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6358
Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

