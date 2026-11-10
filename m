Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3EA606A337
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 20:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRkL8sW0;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=UKFr5+vd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6sd8Fxw8RgJN2LkojRTcxAliLWNvv3VyjAmV4UhwdY=; b=SRkL8sW0VoPmM/
	Q0zT9wG5OC3PfA6ODsawCzfcNbIk9d8jZ/ivsgnKwdQpgERX4WwJWg3LnpEJ3ADeigNByKZ8UdgwY
	rvF8d+e/l5OGZQY9XyZUeGPmx9P1x/3o6SVqIJZ+AWLcwvu1dJU9RQOO6Q8nFUAMGzia+alAvFVrx
	zVfe0+bh7TMIem9nE91TVtaxA4+IXHAhS+e4A63+eQTZ9MieyDG0edgIl6qPjLw5d7AQcsSa5DDzR
	f1/ZqiwjvJHPlThw5zf2l+0+9+Kh5tv1h3m1DtwMh8v8wRdTxUETmaeXnB0ZLdGLltSWhHSNY0wRJ
	hKOrup1m9oOL2n+en4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsdN-000000050Fr-1nds;
	Tue, 10 Nov 2026 20:40:01 +0000
Received: from mail-244121.protonmail.ch ([109.224.244.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsdK-000000050El-3JZB
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 20:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794343192; x=1794602392;
	bh=P6sd8Fxw8RgJN2LkojRTcxAliLWNvv3VyjAmV4UhwdY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UKFr5+vdS2CcKQZ66wAV33bnnPfsWmXwFMwOlmX55jrq90/cy3ZOWQE7R0LpGMm9j
	 NpbnDyyko9nK6WMnY+H9zv2GtO7vNKUKrVhBW7AYBPbTKt7RfLHET0ZDO5KiGF6kFF
	 ex0G828YnS26lw44xlyff/ZmB3VsIUC682ZzCiOngu+WEG+ZACQzC6R3ioGpoMy+pq
	 NVh1qYrCQhu/DUItaOFzm7w85pMpUv8AUPYz2V5d7asVTu1nTLl3/ZVILGFYBzUerc
	 exbSKEyNX8+SZRxy/Y+j1s+NomMCcKGVd5ikryYFe04u6rpTGjwrdCNSuKsUKGjXsw
	 y/7gdetRotjEQ==
Date: Tue, 10 Nov 2026 20:39:47 +0000
To: Jonathan Cameron <jic23@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] iio: adc: mt6359-auxadc: correct channel types to IIO_VOLTAGE
Message-ID: <LVXIwHr3ekY5Ao7bcfza5XGvBZor-SdLtC_MF1qWu5S0zG2vylGpgamn2xVPcw5hQ5Vedb4ALvs1oyzs7Td3ssP1pF6OjogIICu97Suo1bI=@protonmail.com>
In-Reply-To: <20261103234237.0dbbe924@jic23-hlaptop>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com> <20261103-6768-6358-fixes-v1-1-2a868a33152b@protonmail.com> <20261103234237.0dbbe924@jic23-hlaptop>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 9649aa0484921d7e6192cd8e212f588f1aae299f
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_123958_977935_5312AF34 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Jonathan,

On Wednesday, November 4th, 2026 at 1:42 AM, Jonathan Cameron <jic23@kernel=
.org> wrote:

> On Tue, 03 Nov 2026 18:32:07 +0200
> Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wro=
te:

...

> >
> > Correct all channel types to IIO_VOLTAGE.
> >
> > Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Aux=
iliary ADC")
> > Fixes: d6f49313272b ("iio: adc: mt6359: Add support for MediaTek MT6363=
 PMIC AUXADC")
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>=20
> This one makes me very nervous, not because it is wrong but rather
> because there may be a bunch of userspace relying on these wrong
> channel types.
>=20
> It is horrible but I think we can't touch that :(  What we can do is
> put the right interface in place as well. Thankfully it looks like
> the channel index is independent of the channel type so we can duplicate
> the wrong channels with voltage ones + some comments to make sure this
> doesn't propagate to any new supported devices.

Sorry I forgot to include this in my previous reply, but do you suggest
duplicating the old channels and adding the fixed ones as separate entries?

That would cause issues for in-kernel consumers. In my tree I have a
battery thermal zone driven by ntc_thermistor (which is actually how I
found this bug, as it refused to probe due to the wrong channel type),
and I will soon send a new revision of the PMIC thermal driver. They all
require IIO_VOLTAGE channels to operate properly. If we duplicate the
channels, consumers will get the wrong type unless we reorder the array
or add a custom xlate callback.

Existing userspace tools would get bogus values from the current ABI
anyway. The driver applies a raw mV scale to all channels, while thermal
needs efuse calibration with a special formula applied, and even plain
voltage channels like bat_adc and cdt_v were mislabeled as resistance and
temperature.

Given all this, I think it's better to simply fix channel types.

Best regards,
Roman

