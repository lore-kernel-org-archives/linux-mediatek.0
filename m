Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75378C47077
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 03:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IirnRXaj1MUEQGJO0zbDoWzQpnWpqMe52m35Flc2QA=; b=iJbDFguACmiRc4wggrmnoebqJX
	JP0B4zedKiiZgINppZ9Z01cavogINblXSuFfTIhZHrwDO5kBGYsWwtaBaQ0jEWsGTKt3Ej6un3n6Q
	bRjif0Ug1C1FO4iqVHWub6znWx6iNNF6GtG5Da3zyk+j6aYm8o8HK0Mx8JYg6GlhJrqeEtt9gaKe8
	dY64/K8l8TbK2+RhRKV0OfiZIEzvDv60a7owTzbYJiYkAPnhCEX+qQAiBp2sfCgXUi/wsuu3LjpD9
	ZdaJEqS5bjx3ZB303ahqiGP4w6KfktPNdnWD4tByE6XUAME3qH1OQVhyiFO7cZAQcVFcvVRvf00k2
	pcztAp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN32U-006oiB-0C;
	Tue, 09 Jan 2024 03:44:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN32R-006ogU-2s
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 03:44:29 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cca5d81826so32158271fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jan 2024 19:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704771866; x=1705376666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IirnRXaj1MUEQGJO0zbDoWzQpnWpqMe52m35Flc2QA=;
        b=msA+0H6zndFc79qGkM7yqt9FevwIgk/0mbF3oULBppjZ7n/Ra/Q7dnItJjAcPSrQto
         Np2f9FG9EBerQkDYvSV//inbxlnlXu3GF6NHcwj5PPywz4fBavu99pJvRwOc30VdYIZ4
         rxJ3zYgQOnIK9HgpvllHDWxiIQXoaJ3E0Pi48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704771866; x=1705376666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IirnRXaj1MUEQGJO0zbDoWzQpnWpqMe52m35Flc2QA=;
        b=GJskeyJmjJAT8yC5HvnL67Sn3JJhZF2GmQgLyQ0v/xHfyylcZp/dYyDGvy/vzH69Rx
         fOtwskX62O1uAd4cdMsqnk0gxKP60oTxw43tHqPJdCV2YyQbP4h2JdXfiZ3U8uE0Z6DH
         96xdGZA5yLwnzJPkVErMG7BdGAykJJSO5T0El4HY6w5YZ5xmOfGXXkSmwEnDSPykGpig
         z/X6R66Q9R2/o/MFbACZYoOAQX5LSG+gMRUKZ0LkjP2AmtH82oksUYOII69a7BjcFqDB
         /p+WSy4W28nFWELx+Y36E0S8FhzQHll8i8Fes6+Hju53bdJuC8dTkRgTyu1YrUnQwklE
         KJYA==
X-Gm-Message-State: AOJu0YxByt0w2ZjKYCx5AHiK5X/fsfARv0zBuXqiwyKbPcSHAGbSJDYK
	GhmLpAV8WAEb4mYnahHG2jWmnXZ42sp6m+k7K76ubDycNkF6
X-Google-Smtp-Source: AGHT+IHYdJnZJ+ia5j3MDP+U7FWEJutaJ/CAtYrvXrMKolc4lrDjHs3uboOZeTMPAaG800e+FJBUDwDxKqaytC01MRg=
X-Received: by 2002:a2e:9b18:0:b0:2cc:7718:edfe with SMTP id
 u24-20020a2e9b18000000b002cc7718edfemr2040200lji.41.1704771865390; Mon, 08
 Jan 2024 19:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20240108204508.691739-1-nfraprado@collabora.com>
In-Reply-To: <20240108204508.691739-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Jan 2024 11:44:14 +0800
Message-ID: <CAGXv+5G_7OA8m=KENsLbu3wig9D_LOA+oWswQK34wEHtzHXOhQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: Check existence of dai_name
 before dereferencing
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Jaroslav Kysela <perex@perex.cz>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	=?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_via_Alsa=2Ddevel?= <alsa-devel@alsa-project.org>, 
	Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_194427_982674_AA05FB6C 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, Jan 9, 2024 at 4:47=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), the dai_name field is only populated for
> dummy components after the card is registered. This causes a null
> pointer dereference in the mt8192-mt6359 sound card driver's probe
> function when searching for a dai_name among all the card's dai links.
>
> Verify that the dai_name is non-null before passing it to strcmp. While
> at it, also check that there's at least one codec.
>
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Closes: https://linux.kernelci.org/test/case/id/6582cd6d992645c680e13478/
> Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_=
DUMMY()")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Audio now works again on my MT8192 Hayato.

