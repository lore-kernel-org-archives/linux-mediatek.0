Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A7C606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I/4gW1pp;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=mtM9STWX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XUSJGTide+xDGpIYleL0SwfRegZX5gU/UVkOK9ZOXc0=; b=I/4gW1ppkUkDRB
	aa8G7XRxSCsYtvMeHDRfj4hzuVG2Xld2bDQ0cTsGd82Y/e0XTuEQFKxQuSV8k0eAUqC/x7ZdXwp92
	7eZrjITc5TURA5v1lRxFuqn1JR6XeAF2VUFs3vo/memgt4omqyWFsOk8hEBQ2yLZENCjZ064l0wqk
	4GKKKqRsYWVk9CwTxyhIxfSOqs4FALWEd+U+TJ4Yo3qMRDfsHMPecH+e31/ZkitfkPyJdv2FLucST
	muAj0pgvThQnd08WmO+kYWEdN7qjDdZXB7P76NG1LIr8UPel/DxhQLsqkYI74bwlvl1/Lyj0c55Y9
	qWAwj64t+tOYFe9kOG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWU0v-0000000CIuK-178S;
	Thu, 26 Nov 2026 07:35:29 +0000
Received: from mail-244123.protonmail.ch ([109.224.244.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWU0r-0000000CItM-150B;
	Thu, 26 Nov 2026 07:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795678520; x=1795937720;
	bh=XUSJGTide+xDGpIYleL0SwfRegZX5gU/UVkOK9ZOXc0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mtM9STWXKAqD9WGspzMlHKmC6U4qA0TSAq53ucmxbzOIASs2A7rXAYkYTqoiAm35v
	 xTKZPc76zxQPDHAA6sbS0mkDMDwY8XHGl5OimhViNuEwG5c7UkVDDtLaj9oGjW6L6G
	 r5N/m7aUP/LY2kMjM4VjtMiBVlzWjCYuLvDG2U9spFA3d6796bSicAk/l4b3R2wVuD
	 tcc9h3bK+rHaZ/YzJWhiEzHzNh2y0t46Mcw5rk4LiRa/fncrRFEdH98kkxY2ia7LB4
	 RWDr4t9g/9LjPcxHaMOs94wo1+FxqiLl5IbGi4s/wqhRCRNgeO0ooxx/daMPvnm6Gc
	 d75jHqlB1vdCg==
Date: Thu, 26 Nov 2026 07:35:14 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: mt6359: fix MT6358 VBAT impedance resistance ratio
Message-ID: <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
In-Reply-To: <20261126031013.27701-4-iasnezhkov@gmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com> <20261126031013.27701-4-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: d24a110af2aa28dfc2cca5959e1a53a29ffd220d
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_233526_268490_BA5957CB 
X-CRM114-Status: UNSURE (   8.43  )
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
> On MT6358 (and MT6366), both BATADC and the battery impedance VBAT
> channel use a 3/1 voltage divider (5400 mV full scale with 1800 mV
> VREF). mt6358_auxadc_ch_desc[PMIC_AUXADC_CHAN_VBAT] erroneously uses
> 7/2 (copied from MT6359), over-reporting VBAT impedance readings by
> 16.7%.
>=20
> Change MT6358 VBAT r_ratio from 7/2 to 3/1 to match MT6358 BATADC and
> hardware.
>=20
> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxil=
iary ADC")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Although this change looks correct to me, it's a no-op given that it's
not possible to read the channel.

~ # cat /sys/bus/iio/devices/iio:device0/in_voltage13_raw
cat: read error: Operation timed out
~ # [  243.402155] mt6359-auxadc mt6359-auxadc: Resetting stuck ADC!

You might want to fix it in the previous patch.

Best regards,
Roman

