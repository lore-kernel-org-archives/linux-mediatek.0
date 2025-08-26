Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B066CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 05:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1JIZerC9XYjkBh/CdzWClGmJGkTit8bSTofkNpBRWI=; b=kNQRN4TV98HUuhx0lIf/HG3uH9
	Vz1HC29iB4Os4lhtIwnqRNuJqvS6ZiNLbMmJmuLRKHsvL69Xj5z9iSaR2mfklJFsx5d2sDFEI73Dj
	l0OPhlaGD1dmXGAoq1KnQCf7vPgXFDxn33nZUrr4JvNSdvdCyjj9wAaFsHBo0NggChUB2mj9O/eyh
	bHA9mIKs75EGPll1izzH7HmyqtW/dUiT0svZ/6btFu58Ina9DOj4+MgiynMqAb1re4NtYDEftEmQD
	tsjuAt0LWnAILJNjfZI4LGWUajQ/QTgkmw6Q8IKpk8BYsmAaAlYABZmviVFU4TEOx45J8xoRr4cj5
	46rcT5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqm3A-0000000AZd0-3RLw;
	Tue, 26 Aug 2025 05:16:52 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqm37-0000000AZbb-2btf
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 05:16:51 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-8920c579f98so1399687241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Aug 2025 22:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756185408; x=1756790208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1JIZerC9XYjkBh/CdzWClGmJGkTit8bSTofkNpBRWI=;
        b=jmNWTx/TWvl1Y1CaaZ42WJkNxodea0PFerFfkrLGV2GtXyHDomAYlrboto0YddI/9B
         b2M1d70YZTN9dY7Jy6OXFbNHr7B6v+U9EO5v8RK3KBBwhZlAMXH3A5G02x07avb/qTAt
         yVrZ7YSafilF8jsc3GffvU/iemnbNkI/5ApGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756185408; x=1756790208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1JIZerC9XYjkBh/CdzWClGmJGkTit8bSTofkNpBRWI=;
        b=HlARVL0LYa8Vnqe4VCMzgh+PncDjmjRoEBAptxgxybHWQg4BBKzTojGR8wlcTUnE8F
         HjArNa5GH8ODdRZJ/XlL6adghatwyjfcx8qf98z+dmgNUs5q+lepv/iCxNbqiHPYFnba
         ZoU+WobY1Fgw+a4Gz3EOjDASDIzdV4E9IRpUSR/OpBJfaKdTF9UPtZW6FcJ4SnYbKmvQ
         pDabqE447ZGGgeWMEmlDyg2/StUwctHTsNCILokKADQgWUrqFEZNidt6qERN+gCOeMas
         YtnPE4T/Opayg9jSqXvwjO6m6TY6p9AjGOvUqdAjjtJ7t5i7168+7qV6FKtSIYgRSBUj
         xKcg==
X-Forwarded-Encrypted: i=1; AJvYcCU23eMoUyvuFIL51Pe9kHv1/fQJR35DyeeZCULrqXj/4oRpvG8iZWJlCmRGK6S9NY9gYhXK9QFHrGcd+zrpQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoS3iIIynTEA0uLoKlL6rYDSJQ2qIpCHdaSExW4jWlQr/m9I2y
	z9/BR9w18L+uj93g8wW00kkWxCPkIQS8iq99z9DGHPufaHdSx968wWAo1t6nVGauJFckV4u76ql
	nmnQ=
X-Gm-Gg: ASbGncsrUzKo4SuVSZu2drneEfmP1EU4H4JFP/tsMpa5w/3QH5n3VHn0ZzhSQlNYc43
	DvzafBqQEMWDqVJcDMzMzIpDIjN9M1dr7ggLWjBiR9sKcDPv5gPLenVUFTw5f3f6gKbVnCWFhNt
	+mU6zuUT88+t76fgFC/AGNu1lY67GT1tyO/Mi98g25ho1CZvDQX7OgU7W17u966tgcq59RICjiR
	XYiXdH3VPukjm6PNLVt6/ZQ9FhGkDjkh7+zowEfzKMab9IRzsW0DS37drD0dC5Ybar/I7lp52sU
	pYLrs+QjtHurYFXyaCezfBDrgJaZEmX2smDqZgZBCnTI23QcyuOX3t4LCfh3+HxeoX4lyeOMjSD
	L3mwQx9V/UrtN6yljl3QnQGb4zugo92OYnlwC7o/B/wBSvd5ui0jWxe9vaVxco+PRNEML
X-Google-Smtp-Source: AGHT+IHv0v5Yof0gzfv8YalaIZhTH47vYIUZTtLRzcyXZRtpf7wOeEO3QQlgBhfuGP7QOaMDPhGunA==
X-Received: by 2002:a05:6102:2ac6:b0:4f9:69a9:4ec4 with SMTP id ada2fe7eead31-51d0f2f13d4mr4709302137.26.1756185407732;
        Mon, 25 Aug 2025 22:16:47 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5435bd348dasm130705e0c.13.2025.08.25.22.16.46
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 22:16:47 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-52252e9e907so445583137.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Aug 2025 22:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPZoirlt9PXlLtneseoB96t5MnEw9pVGl+8U/7uoHpapr78r9DSbtaPI8C/aTnNcF5dwjeob03MvLFaJu2Nw==@lists.infradead.org
X-Received: by 2002:a05:6102:2b84:b0:4e9:9281:85aa with SMTP id
 ada2fe7eead31-51d0cde292cmr5071231137.1.1756185406133; Mon, 25 Aug 2025
 22:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250825151111.3696404-1-wenst@chromium.org>
In-Reply-To: <20250825151111.3696404-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 26 Aug 2025 13:16:09 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhJpGD5ro+QiNTkDn90Nbw49jDQjVvwRT1XFQJbwA=z8A@mail.gmail.com>
X-Gm-Features: Ac12FXxPVcynR36QGxsqlVXBYl9-P7WGDtVc3IOfN03AppRsLVWt_DvyhTCcM3g
Message-ID: <CAC=S1nhJpGD5ro+QiNTkDn90Nbw49jDQjVvwRT1XFQJbwA=z8A@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_221650_041473_86B1D352 
X-CRM114-Status: GOOD (  13.74  )
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

On Mon, Aug 25, 2025 at 11:55=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> Using for_each_available_child_of_node_scoped() allows us to get rid of
> of_node_put() calls from early returns or breaks in the loop. It also
> fixes issues with missing of_node_put() calls.
>
> Switch to for_each_available_child_of_node_scoped() in parse_dai_link_inf=
o().
> Also drop the braces around if blocks now that the inner block is just
> one statement.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Dropped unused variable
> ---
>  .../mediatek/common/mtk-soundcard-driver.c    | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)

Reviewed-by: Fei Shao <fshao@chromium.org>

