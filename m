Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225C1C7EE24
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp09oC0XYB4JLRhyX/gn6pp2c8Dkb0vyY2wv2QtPbqo=; b=VWXbeZd46MHC9CW+2qB7SlSScQ
	TSo+bW8rOeZH+TCHqUFTG6mWajhsRYZCIWuTxRRkbIIqjKouVAt2Sn/XHClvHTXpNJVS73vGnyKED
	3ft720FmpIJc8W6Jb+JYlsbX6Ge8OKMumxsAotu3dB0bnW24ej1KpkhhGMSpDURh7S6us0Cx3zsOh
	rsXxjB84MVXUMqP7X9u1W3WIP8YNv9kxmbpntZmBcjBFNVivwWu+RZCJcdG1SOhs4GBos8BAAlR67
	XONw45shOeMpbOIcfDJSrfa5FLvUxV+viASx1/BSIbYHlzqdMnUhq3xjLldyMrg/WRgUTGE/TTo+1
	sWjLBAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GYo-00GVNb-32;
	Wed, 31 May 2023 07:47:58 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GYm-00GVMQ-0a
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 07:47:57 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6af6fe73f11so4279645a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 00:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685519275; x=1688111275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp09oC0XYB4JLRhyX/gn6pp2c8Dkb0vyY2wv2QtPbqo=;
        b=dHEcw0s50T0TavPx92KHGlt9fp0NKlq/J+csm/EiO82Ju0SOcL7jA0MxjB/iE46/ap
         Tk5ahhLN8HaYB3aWi3hZC/N+3W4ivoJ7LOT4H+Cc/YYlp9EwgnnHR7ZtsMN7DmQBKOLI
         6YeTmONHbCw9vaHbBNnyK0N/c4jiD6tcdvRgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519275; x=1688111275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp09oC0XYB4JLRhyX/gn6pp2c8Dkb0vyY2wv2QtPbqo=;
        b=apMmRGp/lplbA4tZPXBQHlPgqSOBW05wEaq+x+h6R7tgbKCXAoe5syx5YTsJvVfKrz
         WWE6SrSoSbDzoYXvGRLL2zZCqOAbFrQwxv8HTKcSxSXPeuNFuG1wjfpISMc2BKJVyJK9
         jB+YTgHznDDX++1p/uvsXHmqepF3JxN4OzyuMIebMVN2qqx7ziAGHMX6L6SQIWyjfsKs
         TQ/mjc4NhWlcr+bR1MpRR8dwVvpXLlLUTcUjS4hh401mOhlAh0IllJkBEIuaffVrp9qq
         PPXEDxBd7xVbmb/RzlgoJ91nFqqUNHAY763FiVftmsCKAcXJ9xhWpTPA7muElGgQ+++a
         1sCg==
X-Gm-Message-State: AC+VfDyfKKfFEgJGzk309Ht6NCKv2kZtqCFW9oTfFg5G0bl2RpmFfwf7
	gjbxRwqfEXZSCL9ofWGaUfV5ejZO0fW9V/beGTK8fQ==
X-Google-Smtp-Source: ACHHUZ63/Qzq4BBuqzthn/qLvJxVn4qXwUCGwkGxl3urL6Mv36TaDqIJZrF0tqMfyK7JNofIH0vkQgnak10KDGpNp+A=
X-Received: by 2002:a9d:5616:0:b0:6af:74c7:e949 with SMTP id
 e22-20020a9d5616000000b006af74c7e949mr1401878oti.29.1685519274922; Wed, 31
 May 2023 00:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230220093343.3447381-1-hsinyi@chromium.org> <CAGXv+5E4_k1jKTnninYkuT6Tf=skB00AowHpM+hc8j_VFM-RfQ@mail.gmail.com>
 <CAJMQK-hnK69iVJhqW_8UtKHHLQ3608Cb74Jk_b+xHH0BBu4yVw@mail.gmail.com>
 <d39b0e77-e013-fe7e-9523-9bdbaacb5853@collabora.com> <90ad9b86-e03c-8e80-88d6-d514bbe9cacd@gmail.com>
In-Reply-To: <90ad9b86-e03c-8e80-88d6-d514bbe9cacd@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 31 May 2023 15:47:28 +0800
Message-ID: <CAJMQK-jmT1YDf0y6FYUUFHkQ0b-ZHD9S4X2zpkrmNoz5Dz4ctQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp firmware-name
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_004756_222634_49A67A20 
X-CRM114-Status: GOOD (  14.53  )
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

On Wed, May 31, 2023 at 3:30=E2=80=AFPM Matthias Brugger <matthias.bgg@gmai=
l.com> wrote:
>
>
>
> On 30/05/2023 09:12, AngeloGioacchino Del Regno wrote:
> > Il 30/05/23 07:12, Hsin-Yi Wang ha scritto:
> >> On Tue, Feb 21, 2023 at 11:25=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> >>>
> >>> On Mon, Feb 20, 2023 at 5:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wr=
ote:
> >>>>
> >>>> The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.=
img
> >>>>
> >>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >>>
> >>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> hi Matthias,
> >>
> >> Kindly ping on the patch, thanks!
> >
> > Agreed. Matthias, please pick this one.
> >
> > Hsin-Yi, can you also please send a version of this patch for stable?

I sent a patch based on stable:
https://patchwork.kernel.org/project/linux-mediatek/patch/20230531074421.88=
8652-1-hsinyi@chromium.org/

> >
>
> Applied thanks!

Thanks!

