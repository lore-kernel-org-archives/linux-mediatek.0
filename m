Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF9606A32D
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qITZTEgk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qf3TA9Z9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LPmuSB4GQqVZUVPJgtjDEsgFvIRG4UWskQFfExXoCUc=; b=qITZTEgkvj2Qsw
	fNer/XwYMp9EjU/g0uJj8lS3m5m55xU1wBvJrAMH8XwrlroHcrLRP0MbGJ6n46l9hc/JwTLxuIkNw
	lOadaOVKqjLt024Vyd89gnRWalyQ3/YlSiwJfBI6GvX24JZrw8w8GDB6rMyyWOawjlXXohe/v7Gch
	woR5/+NlHXMXoINaPq1s2q24I65+KSi5h6kKaZURfSHBkf34jIg1Z7xdV1p+1R5baCMxgtl5rHux2
	izVhGw6DNc+bL3DwArpY3bXOlmWXo9SrcNniFr12qgVZtYK8ma9iAWg9OfK92SaQ1h1d8RrelAf8G
	z7LgGJY/qK67kHM801aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIo6-0000000GdB4-47Or;
	Sat, 14 Nov 2026 18:48:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIo6-0000000GdAr-0ePu;
	Sat, 14 Nov 2026 18:48:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D1AD42B5E;
	Sat, 14 Nov 2026 18:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784E71F000C4;
	Sat, 14 Nov 2026 18:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794682137;
	bh=LPmuSB4GQqVZUVPJgtjDEsgFvIRG4UWskQFfExXoCUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Qf3TA9Z9IUpGXCTCgXO8VGJ+5zD41Nhg53sssKh9r+3WC0nHHXYXHTG/AsEvRLrid
	 1wDu48Z7mhY/Sku+jBg7GS7COL5lzOOW14Ycr8uIUEh/qyQRhchbH0LTq1LaCsrVI3
	 SiEE11KJZ7HOwWEsiONpjUcJPfLxPl0FFv8weHhscfI6lBFAQ7Ma6kRZBF6coW/fBk
	 vG/HwO3oyE+rT4xONb63unA+WU/WZD/sevxJNXGYvcNuUmH3N4b1M1wz/XOf7lKTCz
	 keLngttJk5aFQ8SRZAO0wzl9F4/DC8pCrvxmDwU0Yb8v4SpM8JMeWTnw5dqLb4E8xI
	 g4KcVDb/lJJIg==
Date: Sat, 14 Nov 2026 18:48:47 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "=?UTF-8?B?TsOtY29sYXM=?= F. R.
 A. Prado" <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] iio: adc: mt6359-auxadc: correct channel types to
 IIO_VOLTAGE
Message-ID: <20261114184847.70ae590e@jic23-hlaptop>
In-Reply-To: <LVXIwHr3ekY5Ao7bcfza5XGvBZor-SdLtC_MF1qWu5S0zG2vylGpgamn2xVPcw5hQ5Vedb4ALvs1oyzs7Td3ssP1pF6OjogIICu97Suo1bI=@protonmail.com>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
	<20261103-6768-6358-fixes-v1-1-2a868a33152b@protonmail.com>
	<20261103234237.0dbbe924@jic23-hlaptop>
	<LVXIwHr3ekY5Ao7bcfza5XGvBZor-SdLtC_MF1qWu5S0zG2vylGpgamn2xVPcw5hQ5Vedb4ALvs1oyzs7Td3ssP1pF6OjogIICu97Suo1bI=@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 20:39:47 +0000
Roman Vivchar <rva333@protonmail.com> wrote:

> Hi Jonathan,
> 
> On Wednesday, November 4th, 2026 at 1:42 AM, Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 03 Nov 2026 18:32:07 +0200
> > Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:  
> 
> ...
> 
> > >
> > > Correct all channel types to IIO_VOLTAGE.
> > >
> > > Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> > > Fixes: d6f49313272b ("iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC")
> > > Signed-off-by: Roman Vivchar <rva333@protonmail.com>  
> > 
> > This one makes me very nervous, not because it is wrong but rather
> > because there may be a bunch of userspace relying on these wrong
> > channel types.
> > 
> > It is horrible but I think we can't touch that :(  What we can do is
> > put the right interface in place as well. Thankfully it looks like
> > the channel index is independent of the channel type so we can duplicate
> > the wrong channels with voltage ones + some comments to make sure this
> > doesn't propagate to any new supported devices.  
> 
> Sorry I forgot to include this in my previous reply, but do you suggest
> duplicating the old channels and adding the fixed ones as separate entries?

Yes.

> 
> That would cause issues for in-kernel consumers. In my tree I have a
> battery thermal zone driven by ntc_thermistor (which is actually how I
> found this bug, as it refused to probe due to the wrong channel type),
> and I will soon send a new revision of the PMIC thermal driver. They all
> require IIO_VOLTAGE channels to operate properly. If we duplicate the
> channels, consumers will get the wrong type unless we reorder the array
> or add a custom xlate callback.

Indeed, one of those two solutions should deal with this.
> 
> Existing userspace tools would get bogus values from the current ABI
> anyway. The driver applies a raw mV scale to all channels, while thermal
> needs efuse calibration with a special formula applied, and even plain
> voltage channels like bat_adc and cdt_v were mislabeled as resistance and
> temperature.

Ah.  If the values are effectively useless we can hopefully assume no
one is actually using them and hence the risk is low.
> 
> Given all this, I think it's better to simply fix channel types.
> 
> Best regards,
> Roman
> 


