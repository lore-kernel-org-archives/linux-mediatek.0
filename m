Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32466C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 00:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc6pY2X/kV1rFostxbU0Y7TflzeE7tCSZzGD8ktPRxY=; b=ZxfAexo2Hued8BH6RVkf13QH9d
	Cp8bo0Jc4uOVnbYDPQ3JqrHKEEPWGqVtWh4ytp0wfYRLa8VvdVYvXjWEcEjm/GskhxBeGkWBemJ6f
	lzEuTS6loqpMTp1KiVpdFd6quxEQEhQF2kuAPULrjNUV3NzHUjj5NNwWyXHB1n0+3eMFs1j1NsnTJ
	V7NNAkKddHCvS6HTorWVBkgGQzgzGElX+p38f92PL54Na5JbsCKq+fWgPIA7s+c0bsBc9+AnA++Df
	zesQQp8zr3Zjrl7sEX2f9Pp+L4cmHfSf3gs9zqUFme2I+/J/fz7ra/i1rCEBBM9UgOhNDmJOr8hax
	x/6mdgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bsi-009jE2-0K;
	Sat, 11 Nov 2023 00:29:48 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bse-009jAz-1v
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Nov 2023 00:29:46 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c51682fddeso40189231fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 16:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699662582; x=1700267382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc6pY2X/kV1rFostxbU0Y7TflzeE7tCSZzGD8ktPRxY=;
        b=lMF8FVqeHdotrl/4hzZ/nW0ywNVyYT/W439WOesozjlkmbD/kD5SgCvf80Zqhb+4i2
         4sUFJUv1a/sL9V91GsYvzq0sK87XuPLxf2MFe49+iBa5O5CcWknQ8dFMCTBL3e6Na+wB
         /mG2QrAEjioxQB1TnG8KYGixWXEj3KO7S2BLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699662582; x=1700267382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc6pY2X/kV1rFostxbU0Y7TflzeE7tCSZzGD8ktPRxY=;
        b=giW7crtRElV6BuDUm1X48PUR4dtuO4oyvimjFf3WU8YtZE6OHpCpvJEA23YVvx5ZUT
         U0AaJ0PRuJ47cIuXJUS8Nb4Qv4MCZYu1JMoQPRMPIO/ecwLu7glWs5iFlgtF52a2CbDr
         T0XH6b8/X6xc8dDX1b8vyVbJ2aKkJbKRnMVcxMvtwovzyLAyGCyP1bGSRM99kh4vIRcF
         nZuntVqyqWg8hfXQICebMAxre1Ozu9by8u9OKuyvd3NH+YL6D0t3yjYjuXQmxfBRTIHr
         7LgTZ7L8quHGR5p3dljRSNssQJ0fBVQ0WZkw3DZojBgT4/FMlUhxtRa0GIJAkbYTsLJf
         q5pQ==
X-Gm-Message-State: AOJu0YysTSt7QbrJTLMgMgVNyGgQTWZFnTnKRjehIPzYiKs04nm97svT
	FQPJjiS0tkNW7glh+PAhTToTtVkxGL30jq+B5tHLCi0K
X-Google-Smtp-Source: AGHT+IEyMLWmBV+sLugJzJUKfflKfMp441eoc+gJ2+vnKAxvpoiFsq8rZlFOMca/539S3PTNCjs1ZQ==
X-Received: by 2002:a05:651c:1690:b0:2c5:985:2484 with SMTP id bd16-20020a05651c169000b002c509852484mr1586319ljb.4.1699662581819;
        Fri, 10 Nov 2023 16:29:41 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id z20-20020a2e9b94000000b002bbacc6c523sm58828lji.49.2023.11.10.16.29.41
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 16:29:41 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507a5edc2ebso500e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 16:29:41 -0800 (PST)
X-Received: by 2002:a05:600c:1c91:b0:405:35bf:7362 with SMTP id
 k17-20020a05600c1c9100b0040535bf7362mr34662wms.0.1699662560938; Fri, 10 Nov
 2023 16:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <20231109100606.1245545-7-wenst@chromium.org>
 <20231110210443.GA419831-robh@kernel.org>
In-Reply-To: <20231110210443.GA419831-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2023 16:29:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XARZpeEZo-i+CNTAH=AQrxPfwnzSMXDWx6Pvj4k6cP8g@mail.gmail.com>
Message-ID: <CAD=FV=XARZpeEZo-i+CNTAH=AQrxPfwnzSMXDWx6Pvj4k6cP8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] dt-bindings: arm: mediatek: Remove SKU
 specific compatibles for Google Krane
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, petr.tesarik.ext@huawei.com, rafael@kernel.org, 
	tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_162944_632460_7A8417CF 
X-CRM114-Status: GOOD (  22.40  )
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

Hi,

On Fri, Nov 10, 2023 at 1:04=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Nov 09, 2023 at 06:06:03PM +0800, Chen-Yu Tsai wrote:
> > In cases where the same Chromebook model is manufactured with different
> > components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
> > touchscreens with conflicting addresses), a different SKU ID is
> > allocated to each specific combination. This SKU ID is exported by the
> > bootloader into the device tree, and can be used to "discover" which
> > combination is present on the current machine. Thus we no longer have
> > to specify separate compatible strings for each of them.
>
> You just broke an existing kernel with a new DT having this change.
>
> Just because you come up with a new way to do things, doesn't mean you
> can remove the old way.

I was wondering about that, actually. My understanding was that what
Chen-Yu was doing here was correct, but I'm happy to be educated.

Specifically, I think that after his series old device trees will
continue to boot just fine. ...so if someone took a device tree from
before his series and booted it on a kernel after his series that
everything would be hunky dory. If that doesn't work then, I agree,
that should be fixed.

However, here, he is documenting what the "latest and greatest" device
tree should look at and that matches what's checked into the "dts"
directory. In general, I thought that yaml files didn't necessarily
always document old/deprecated ways of doing things and just focused
on documenting the new/best way.

Now, obviously, if someone took a new device tree and tried to put it
on an old kernel then it wouldn't work, but I was always under the
impression that wasn't a requirement.


-Doug

