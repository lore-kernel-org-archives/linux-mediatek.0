Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4251A606A31E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=js71XGyx;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cbCdnlGL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=; b=js71XGyxNZWyFW
	OlYnSUtPGFylMuN8mD1mRS8hwt7IQgttaRKeR2n50AzUoZE+GbpLnteFpUxK+2gRYpGWcvQJA1iKA
	c4BLLS50R8A8ucLKSFubFYrg6ZcdHtF8sI4rnt3/O6ISKnq/9epTHSRLzLXaEkwxNXbjGgu4qShIW
	MihGSSzA42VsI7HqobQSnjq5RO7NlBwhE2d8q3h4ICZLiLlsdhGB/dzqNhD8lOMM2dEt4f5h3ed4P
	TKJOReX8h9iHpWPWbZtmOBNDnzPBFPnImIy/d27rIcteXaGUsIKhazmm3wFweNs9XSpgDRemdpYqI
	OLOn8CBEXMm3wf0+rS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNlJ-00000002O7Q-24QS;
	Mon, 23 Nov 2026 06:42:49 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNlF-00000002O6Y-2dJb
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 06:42:47 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b4efdc8c20so16726897b3.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 22:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795416164; cv=none;
        d=google.com; s=arc-20260327;
        b=pCJD3OPi2YrxnHs9UiQyXlKMDK5TEo0D/7ELbexuCcdinv2RgGcy9pBYATc3rGTeeY
         Dvh8floc3KnB3I2T1P6TO/Jz/3ctzzkQi/rXKcaD7uZ07kQ7NtowRhL5urj2AT0FfJvX
         h9TGTp09xupD2iebUzEq0pzt/pAz4gG9QeAvLD6hFLITuVbcaneeY7bCuCWkeAcr01Ml
         e05d18kEKy0Ezy0pqWDtO6oNDR2cTihRzpC+bRSxM7DsB+Mk09aDtoXrorluzpyH4bSO
         YmIm87EgYR+UXYluSvlkliSkwsDXQHkV/oamP0KgErGEIlY4z0GBOkMvAQCX31bgDusJ
         58ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        fh=hYEzcaCgU7liYIXB+mHBC+7EyZ/NDVhH62kk6rHmYrI=;
        b=d2wSWt5Bledz4QxJgmvKt9Tm2QMMRHnLge7ltiwEuZPnQQPcm9ruosAy0zu2vaGt/v
         q4fyjIPgNLIZaNeUJ4/MG/LfGz+lLsPQBfWaHf3vsW/l/EmSXffFhlAxanlXlAWT+mNK
         V9ArDGtlGguREvftlFq2oeppU0zR3OcXNQiwbEpMujbONfq65AxUu75rcdVv2XlpIDln
         uXTQ5X7j/JWC5NmsWOx9M9jz4B/O3gnukn3hcVYCiVhhYh7/6mVu0MC+N44M5QPwH4z7
         jIINrYydA1eWVj2zoh5XJbZWTVTtdfGXJYJ2AlYl+KQSEMq1vDOoW/NqvhnHu+bqCc8P
         tjTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795416164; x=1796020964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=cbCdnlGLRxfUfa7TuWeUjpB50F5lIpQnvb41SsWWxzuebc/Q270Gn30VwfipXBwzNA
         BELUWZw+QB5ql2ADKm9V32OWqaZP0gOoGsuBjJSJkQNyOQFi27rtlx/l7xNOXGqDpi8g
         3sbhzncWGu0R5pZv4GBEla4UzBc+u8OXC3Hso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416164; x=1796020964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=HOQU5er8liAlzDcOm7GxMo2ZrjMMZUPfNsJaoPx+lD8BScXpMB/5AFLboWWKQErMM5
         OtslleK3yaz9LXkfnCfJsPzocp9n3gm7jCW/nvX8bDeoJ7zJ+Nz7VBWZ9gPJUU/dR2Mg
         JGqrhmSEsDSYu7UCdMSfSJhjsSUvAbFYimCrV349dLgfuAyzh7nAf+j9IHirriidM7Tm
         lQ7Xmov/nzoCQlrNkixRy/2iGXXzitiS49gc7IQ+rhrJizsHkJrn4j2ZjEXpG+omBz1I
         lNHYeRcqyXzrnwX3JZXJnUfU6VKf94vcipOc9L/Suj2aqQlQxuA1cW1TFB9CXFqnphn3
         2zow==
X-Forwarded-Encrypted: i=1; AL+hErElmmbjT72ksnA9MGYnJuPdfo4Oao6Is+U2ScuJAq/0R7/Ab3rGw3M75hh8rBWJTL1ky5AUOzFPBNlH1+XuhQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/8sJwu3kcn5A3uBiBI8xEbeeD9WugaGfDYIPWYZosE2c3PIuUq
	Fa3I/J3YO/u0zjtgJgSD3l9ZBV23ZvNLBV2hWTwsxMWWmfNK2ntHOV9rluaXWv2WLQ/xUnNKN/0
	gOc9Fe+7kea9U/F8/bIDCsg6rwlZloUM1ZVYgUL81
X-Gm-Gg: AZFdTZdivg1+b3G1a2mRfaUMYjYVH0BqlYcG5JWx5FH2+q1odBckG8XgqH/WJLH9dZp
	t2uxt6bFUIn3mgx7+qkils29COoyjgRtlzusuGd3dNntHsdQxUjQlO06u0yoShVfUhVhGIVIGzj
	SQE6kfcKQXW7jwF+ipt1H29vCvlBcf9sDyYczbHZ4okDfpV9wm/ReBt3vwvd6wEr8OwCYggYip5
	QvEP968Pgy8+AuqS2xsMQkUMEAdJ4APa/pmS7MvK5pb3i5bSybZw+zTpZdtjylDvrKlSPd835LZ
	au92m41ujCE0jIJnNR653VPCFijXPVYrULZBUGWUgmOjiWiaibV3wg6E2tHfKkaqdPGHy1aPX80
	S9uGbcf828fMzgEPkKwJZcXAXyPY+qwRr+7PYW4GazNxG8LUCilppS1XHTeLcARVI4RI=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr41593057b3.35.1795416164019; Sun, 22 Nov 2026
 22:42:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <20261103043734.2179858-5-wenst@chromium.org>
 <avLw2AiqcnO9Blun@shikoro>
In-Reply-To: <avLw2AiqcnO9Blun@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Nov 2026 14:42:31 +0800
X-Gm-Features: Aa3M54qFQQaP0XRNtPCyFnaJIa2pdaKUHFg7uIqYmbd3iYo_i21tDqRJOm5IHRA
Message-ID: <CAGXv+5F5hf_8U6j6tJ1WcS6gUCiA82ny+6DXPv12g=vUjwYUhw@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_224245_712666_6F6C66C0 
X-CRM114-Status: GOOD (  19.70  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andi,

On Tue, Nov 10, 2026 at 6:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> > On some devices the I2C component is powered from an always-on power
> > rail, or the power rail has been left on by either POR defaults or
> > the bootloader. By the time the prober probes the device, the device
> > most certainly has finished initializing and can respond. There is no
> > need for the delay.
> >
> > In such designs, the system integrators tend to work around the delay
> > to avoid the boot time penalty by simply omitting it from the device
> > tree and the component prober. This is undesired, as the device tree
> > is not fully describing the hardware.
> >
> > Switch to the new regulator_enable_and_wait() function that makes sure
> > a certain amount of time has passed since the regulator supply was
> > actually enabled.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> @Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
> changes just go in together with this series.

For this series, you'll need to first merge in a tag from Mark's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
    tags/regulator-enable-wait

This tag provides the new regulator_enable_and_wait() function this patch
depends on.


Thanks
ChenYu

