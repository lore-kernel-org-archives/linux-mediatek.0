Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989CC2D0CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 06:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drNlR+oPu307Cld2c2bhZ4PbduC0VAwweKZySGP+xWk=; b=g2pAD2VWDOlgsrphcOzB6moBR3
	kEcnmNqNzWGBnGovf0aUemDLQM0++7v0wCVUca9u8yf+BpYIzBHlHc1IiER47eQ0YtDzlKAthZYzj
	nEQihkefltX+E1rQVHkVA3GHLM2DLrsRQbu/JFmuuDOfoyJa541tHJoZBIShIqU5yf+GfRlLI92kQ
	8do5colDHooh6QymMVjWYJ9zf3t/JZPX3e6MhSQGJR9VN/yTmmylgIPeXu2lvKssQv0WklXt9J4sH
	3NeH/itYo58TE2czNmT5RanS9/Yl5MpeExR6s6/OMqXJ7Fcx6fkNRMsYMUC2aafEROX5ovzs11Yzf
	GfVOkRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRr9-0000000H7eW-0kyC;
	Thu, 15 May 2025 06:14:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRr6-0000000H7d3-3Svz
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 06:14:10 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54fc9e3564cso623689e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 May 2025 23:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747289646; x=1747894446; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drNlR+oPu307Cld2c2bhZ4PbduC0VAwweKZySGP+xWk=;
        b=oYuVNAYlopudzj+y3ITIJEm1Ioa+fTlydxb9QQ4jCqwCEKpM4PLcFjU4gVKxiy1vdF
         FsExRp1y8mko8gwQbvKHi3FPaWJycu5J65zjwZi4sF0hxMEmcHJVd7T2+BGoCPEbhYds
         6uvYrjFLIRaJ+eW3qvfhUg2JXXLBmkxWt5O50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747289646; x=1747894446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drNlR+oPu307Cld2c2bhZ4PbduC0VAwweKZySGP+xWk=;
        b=kr/tuDTexV52QYeFc38oHtdrglgNUibfu4Itx0tGEWQoL3vrWuhGkmBgPrDNotLnvH
         dj/sSsRqCgioRXl79bv3eyt/I8TRAmZpl9Lqrp+qVSUvg5tisqU/f1NZrocIBYTXKqcS
         dNGXoldu7ntCiho/ovbVv28C3Jv2i5Vqwb3qp2ymAG3/DlxAynkt7O8o9vTXVUNtIqwL
         cMpitWH278N645jBd1PPiHP8LPlb2MsOREtPVecEYF/1sjmb2P0jxEs0SoYu31mHbfCt
         PCue6Y7dyYZBxhXhE2ff9LwoxD2vjjOSHPn25l5cA22Z4PRG8+yxzcP5ROi89h4cXDF6
         pTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd+n2iqakDccstjihkNw58CKG63Jcf+PuHjv9RI2A9OcrFzIZCpheDOz8RWclwILAbWlRtOdLvxvtLZpCCcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFdPSimSvCSHjz/Ksk9BOJkYw7DCRezwhwESsG2vaA0wkh3v0h
	zZHeQQn1JPckcO9DiFG9j4o6GsXP+xgYNl7kBicqQiHdJ+vrGk/MvINW/q7JfUGOlMLQ1ZjXxFR
	f5oGtn5PlwKjJRogun2jP/RXsA/aVjQk/gc5v
X-Gm-Gg: ASbGncvxCS1rvbXvWPoPrWwRVYelF1pfxMZvw2CS402TAXNAv1XtYvWgi2/YtpEoo3T
	tV7+6rxUdt7Iv9sOfrwKVk+ItoVfUc47Mr8yI5jXrpgk5So1GYCBXycdTZn4KGdHd8jv4OwsUif
	xmslclU7uYdagmIEmOk6hFSl+jqLyY0SXkQp8UccH3EvRLJbQSc15atTY2kk/g5d22NzZJI98=
X-Google-Smtp-Source: AGHT+IH6Tu1s7qfro8eTjpXXBa9bg/YMXFMFe0rGRv+AYRa3osr+ecXdrIFoJAbS7ovq5tmuUpU4zvFeFidf93w3Epg=
X-Received: by 2002:a05:651c:1993:b0:30b:cd68:b69c with SMTP id
 38308e7fff4ca-327ed09f95emr25687631fa.3.1747289646393; Wed, 14 May 2025
 23:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250425082551.1467042-1-wenst@chromium.org> <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
 <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
In-Reply-To: <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 May 2025 14:13:53 +0800
X-Gm-Features: AX0GCFsS6xRp3ubfx5sogziOmFxZtWhFobfvOPwhpAASmoDhOKkToNpIA5VukSg
Message-ID: <CAGXv+5Eq1=TqhZmdhNY5H1s52omit7CZhNhYpRddcJAxGN2P6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Darren Ye <darren.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_231408_890285_43ABDF44 
X-CRM114-Status: GOOD (  17.19  )
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

On Wed, May 14, 2025 at 10:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, May 14, 2025 at 03:49:48PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 25/04/25 10:25, Chen-Yu Tsai ha scritto:
>
> > > This series is meant as an example on how to use macros and range cas=
es
> > > to shorten the MediaTek audio frontend drivers. The drivers have larg=
e
> > > tables describing the registers and register fields for every support=
ed
> > > audio DMA interface. (Some are actually skipped!) There's a lot of
> > > duplication which can be eliminated using macros. This should serve a=
s
> > > a reference for the MT8196 AFE driver that I had commented on.
>
> > Sorry for the very long wait here; the entire series is
>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Unfortunately this doesn't apply against current code (I guess due to
> development in the intervening time), could you please check and resend?

This series is based on the other series that I sent for reworking
reserved memory, in particular the patch

    ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses

touches the same parts.

Since this series is ready, I'll rebase it and resend.

ChenYu

