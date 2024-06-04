Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D60BC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJVMvwv8yrvbQTt6Dpj5ooLvEPn9RhqjCuP8saFqK3k=; b=OhaQ07v0HSrJ5zMqIoKFbqadvd
	EWtOGqEJjpFr+RTZ/6lJcC2yLgbwAzElJuAt3gsvD9//hYol7PG084sZ2WAcAZPw2YXkTnJRHLDoM
	mnX8AGvhKMPFMl2XOt5gctcxKoMNJmpd3Jp266aHOoTlnw0hidlSgfpaDbYODjdHOurJZxN2euNAf
	wxn8N5C5h2Keg+nL9PzOnscvom28U56847aZJb0Tm3DNOhe3fl1zjsjUy5QfoDouLowltHZx9NRt2
	/y05ghKoxmDqKnQvVxjYiQYfivJazBOW9/UDkqzx7VGDwn4af40TPDZ+Ci1XtFXqRhbb5GV+ddXet
	1RFa4rCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEU4U-00000002TsN-32zn;
	Tue, 04 Jun 2024 13:19:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEU4R-00000002Tqf-1qhG;
	Tue, 04 Jun 2024 13:19:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57a50fecbadso3515800a12.3;
        Tue, 04 Jun 2024 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717507162; x=1718111962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJVMvwv8yrvbQTt6Dpj5ooLvEPn9RhqjCuP8saFqK3k=;
        b=bbvbjpLl/gXX6Rl1d7Wz/ixmtqJVC63V/zR98zaArJcKMkH0xU12wtxW+75PiR537w
         ZzKPEZJbHwQyyiTzggPkb4xfxVbk5o+ZgNxGN6Ou4eQBK+0rv6J1fS85s4s9VYgGeSfY
         oeOyTvBayeWJ2tc21tsI0fFeTmxk2jYyqgyZ0QL+ietnwOQQyFaTT0XcoRLjq8W+VxnO
         oWYGILeavIXdRu7+tRWBFFLNsGfq4X59/soXmXuaW3qcAwzzg2k2C6si/XK0f3PBk8iL
         t/iFJHX12F7qXo5ptqlsSinxzm51YHazd91NA2Vjg7tFotyNAFY6e/Bu8MSbXbw74cz7
         PGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717507162; x=1718111962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJVMvwv8yrvbQTt6Dpj5ooLvEPn9RhqjCuP8saFqK3k=;
        b=StG2yqliPr6LItnlJa0FhRAYkSLHkqw743/jHpfUQVTfqdswy5m90430uCLrohwVaD
         1TOHLHOJAF6vef+ILBtswKWY/s+dtzuzj1ez9BpnFAVgY6oHBuaRmqpI58SdmwM7Dy7n
         B+YMaSHirSkExi1z5eHQ/bp1Eqcsc3xAqcOeDJC4Ux2+BQIklZ3sVMR9rh1HcgIxAmqA
         7QcAcSSxxkO5luW+4gCbpUjkpGw3V0kwAR+GF8XCjkZtthbG3oilQEVlkWoR7UMM6LkL
         TgUrUGOLXzbIeKyEeNI1ROXimGjFegRxrU04vCdesOUxMY9DHgRRT7dUyJedgI5SJ+1T
         fo+w==
X-Forwarded-Encrypted: i=1; AJvYcCXtlyVH7HeQbcnrqI3EIW1bV3Hj2B7eVccF+QcC1IHBrCzei16wjRGN8wgbRf+Ju4jaxHotFH+boQQU8hxi9nsFR7+J1IqCOFU6S0YoMBkudygS8QAqM6GQE0+qC/Zf5DzVNdjk7oEXU9J6OOeyLGFMOrzhcJJwdPs=
X-Gm-Message-State: AOJu0Yyxg28JV1lQOLzpaP7YMYk3IAl00uu8gQBqLGI38RDp4vsvB5GR
	IRzWIwSPBHcbxzIL+ArpH2WGeCOYYnwtBQ5msoRvo9IBjn/TJN/jsxrzcuu2pl4AXSF6GJwhvaa
	YL7Abog+uVg00aC14INW2/sR05Hs=
X-Google-Smtp-Source: AGHT+IHDbpSFR8VgGbrUMxndBUIdfujfvQsl0DAQdoYXCdvQ0K5qPJ6brxy9idGG/uw3HyLxGrGZcT0HjfDhQ1mq2G4=
X-Received: by 2002:a17:906:d794:b0:a68:eca8:2d3e with SMTP id
 a640c23a62f3a-a68eca82ef6mr449184766b.12.1717507161399; Tue, 04 Jun 2024
 06:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com> <20240604123008.327424-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240604123008.327424-4-angelogioacchino.delregno@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Jun 2024 16:18:43 +0300
Message-ID: <CAHp75VdtfsSA7quU3Eo0=Yv=J_yXVo5_+_WgxGFJ5M_MLbf7NA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] math.h: Add unsigned 8 bits fractional numbers type
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, bigunclemax@gmail.com, dlechner@baylibre.com, 
	marius.cristea@microchip.com, marcelo.schmitt@analog.com, fr0st61te@gmail.com, 
	mitrutzceclan@gmail.com, mike.looijmans@topic.nl, marcus.folkesson@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_061923_500098_DEEE7423 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 4, 2024 at 3:30=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Some users may be requiring only rather small numbers as both
> numerator and denominator: add signed and unsigned 8 bits
> structs {s8,u8}_fract.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Thank you!

--=20
With Best Regards,
Andy Shevchenko

