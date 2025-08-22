Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F036CA0EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=; b=WRa78wPo36gC4rZHGdauU3XCwd
	wwJT9PNBAiLSMv2p4bngzjwCC+eIVtiskw1hGMqZhGmrmdGru4j5SycnurACNOGMfqHQM575gr4OF
	4f0uXfF5hljVfLWWS2WoeW1CV+bzFkwj3u1VD+a3vIhUVwHyMFaMSozscXOjQOzxH5bOPLcedtOdD
	yPsjC7V7lKAydG2ld0jjiGwh8hxL50wWoh8TCUy1Uaj5Bm7RQGradTw9k/nOD/jV6WR+oUHNhzIB+
	a3rhC/051/5astxqQtBfkwDcFj1T1dWhjaNgEepVSM71xKCNYveQp9m10iMzCJ4hJrMB8fu0THwQV
	lFe16eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTn5-0000000330u-2A2A;
	Fri, 22 Aug 2025 15:34:55 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNzD-0000000226A-10nW
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 09:23:04 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-333f92cb94eso16493111fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Aug 2025 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854581; x=1756459381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=eLTPkhUz6VnRNl/KgVcBEExKRkJtoqhYpy4Ze4kFBDoaQPINl0q1XrzsJGZrQdeKqD
         O9DLGKVN2L3XnxMVFSM9mjiEU/1UAYdYz9wXYpOTnZs7bpQh1krWw1Eg//fleONa3zOf
         pXPXVR51O+wPJlsg6q0a8xqRcCdIU8TYIccg4CHV3pFSsT9XgzMsaWqcOwaGQ0ZXHU4M
         N84W/mdTc2vH1NF7O6UvT3CVmwk+8CeiHQmdwFrn/j98VcPlRaHxD9MbU56rBxk/Zhc8
         xybInKk7gcpqwm2kK81C4KnilB/RcxuRd4UV3KwpdH62sAyZ5Aa2+TvJSUXDaQ+cP+V6
         oVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854581; x=1756459381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=FaMaF6iQJVOagatXNdi3wtE2iFFDXVdmPfd4K7zqKs7wtVc9D5pTufiWYKRyW9qg0e
         8X/kIrUDWDhXPue5V456ufTqE2LH1sw4FQgPHV79TOMAoOPV/GpU1wvOML280zUInSm9
         ehHEEUy8dertidYRtm7auJRqGxihCAGRWCYXr0L2J1yAQ0K5LglVvb+ojWhT9QqKDB2J
         oDyPN1q+PsGD3KQxQY1XuhS3jMM1h6OfHWjG4oFLvUqvjGowez1VxcTWnNUwd5Wrs13p
         sCsNnwkamHTPENPJ9e7hsQYl3y8wUEBgBCDsAAN5NcY5v8FnVfjvVAA1wqpA7gM4L2cN
         Y10A==
X-Forwarded-Encrypted: i=1; AJvYcCXapjZXD+MELvt5QvptATuQ5Y80x6Yx7CjMhidmZoQPeGmdCoDG8wCOuQqkaWBP9vBX8MBgxOi+Z8crrHWU/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvsd+amoueLFPfjKY+sEsgH/bK8HdF6xBAWSu7jJvvQk1rgFtk
	y+l6VwsK7uiQsInPd2Y6lK5w48Kv8mEREg/++HqsTp/QUGdCMn8LsD6qmiwjhC2vBg74TcfRhsV
	ct78PUeavu1eCS5khpOn4B8gEFKMuP/h3d1j5NPwfZg==
X-Gm-Gg: ASbGncsmJFkg8TmeavafOfB/r9FinYcHRVXIGkYq2Rxlx0eX5vJjFbgkgjG+J2Vl8Rf
	SuzumuTDNq3mwemF84wVrwJx0E4456qt2J9dCMQkWJpTrC9HNjjkTNY4fbv3U/2t1P2LmhGy288
	my7tlrBdQOUlfTFbn4Tif2ytDUZ6JHgYCIuAyP1OchyO2LiJfrnqLW3XG23RLQPCn0MXp4OY3yO
	Ha5jQ5rxRE7uGMc8w==
X-Google-Smtp-Source: AGHT+IGmS+5jZRiY3M87jYqtd1N1nFCNBKn5R2TEdrmd3+xxfd4PG/kXNNSVVgmhRVuloDKPRDouFdqjsq+r/vvoIgA=
X-Received: by 2002:a2e:8a86:0:b0:32b:5272:38eb with SMTP id
 38308e7fff4ca-33651002d61mr7071001fa.40.1755854580887; Fri, 22 Aug 2025
 02:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 11:22:49 +0200
X-Gm-Features: Ac12FXwu_A2fq6cbJB5U4ofkj6w0TKETQ4RpzZE3LHHotvIJu8LJQDJ8_-1dTpA
Message-ID: <CACRpkdbLKXx7GEOPemFGSTFy8oDG99TUFwC7sH7xkaoqe-cY8A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own directory
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tim Harvey <tharvey@gateworks.com>, 
	Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Mathew McBride <matt@traverse.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_022303_280691_59327040 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, Aug 22, 2025 at 9:57=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Move ChromeOS Embedded Controller, Gateworks System Controller and
> Kontron sl28cpld Board Management Controller to new subdirectory
> "embedded-controller" matching their purpose.  MFD is coming from Linux
> and does not really fit the actual purpose of this hardware.
>
> Rename Gateworks GSC filename to match compatible, as preferred for
> bindings.

Maybe add some definition of what we mean with "embedded controller"?

Something like:

"An embedded controller is a discrete component that contains a
microcontroller (i.e. a small CPU running a small firmware without
operating system) mounted into a larger computer system running
a fully fledged operating system that needs to utilize the embedded
controller as part of its operation."

> Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Overall this looks reasonable:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

