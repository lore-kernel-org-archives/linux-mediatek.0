Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7CBC83F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 07:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReysCIs7gq0oi5nUfD4Oni43aeEvSwKZl5a77+O+C1o=; b=DS/TrUpWf6r1ClObQc9Okuu3l1
	N/81xTJk5EIhmeVazESlUSFZt7/aChmbW59QrPq9I0x3OkslF19CJT9FmmgrHoelakEyE42kbQIlx
	ML7Pn5GvDPukdCrk5jbGzXKVDHm0rDJHrmQLAjCScxb/vMxEehxN1h8ExiC2BwMewQxFE2yWK25GW
	CJ7Z9KFffWYfyeev9yacKtaJG8HeMLBAHwvWpBNHkqyC0/5QiK4Q4tIXliqrwQM/c8oAaNeiPDT0N
	d26n4q20xGxdRhmZD7a+HCzuphYso/jroyW+7z1nF8UCXl9Q9ok74k2H+krb0Z1LpdYQgJAbfbCdR
	wBa0XQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbr5-00Engl-0a;
	Thu, 31 Aug 2023 07:12:39 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbr1-00Enfm-3B
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 07:12:37 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-44d3a5cd2f9so278495137.3
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Aug 2023 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693465953; x=1694070753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReysCIs7gq0oi5nUfD4Oni43aeEvSwKZl5a77+O+C1o=;
        b=TM/TEnG1bKjZMzzVO0I/z8ILjgW6/qBdwOAG6GQo6LOEgl0oOiDryedM+9RuC0Wo8U
         Wm3uYYW8TMLXenQn/ZWK8Ma5AJktLjYIpwq6wwUKf5a2Hmm5ld9CaR4dHLTNluuQNZFM
         Rq/6fDKPCoJqemg8nYx6Hoc2xUXPrMjZxzTTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693465953; x=1694070753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReysCIs7gq0oi5nUfD4Oni43aeEvSwKZl5a77+O+C1o=;
        b=UuH6J/5M4vNyCD3/aCARoerTGMUDglr4+BcztI/JvKenDc6TeElVO/j1O1vuy8/8Pp
         /+n7gfPq3nnUq1XWt1hp7S2/aJCOkle1lKrCB83eS4TtpDK0Zp27GbiR9iK0ZbgIsyd2
         gxmiDR0qym6E+DMWBS9sd8I8UCJ9kdK2n0UoX9ZPnsCMBDW2qT7RAg4kSHCRpgVUjupH
         av0xbywpsFkFOXd8RRWPn2vvE50KRUH+qF+rInfYQsCgRqTNi5Gz6nZeHTed2Oc6Z4XB
         1yKYIMJrGSW14j4KXrJm9JH5m+4yTsrXLt05Zkp0BM6ZlYyZ22D2bQqEOeuvAOkdTsB6
         szRw==
X-Gm-Message-State: AOJu0YyTXdqYCtgtkXA8X6ASk6rPmSfU910IcrE2f3OLyf7tnkjLYqzt
	7hCNUT5yfE1k4BxSIi0012F5chzOLkM2Gy6reQe4yWQ9Mmm5Gzhh
X-Google-Smtp-Source: AGHT+IEneBwezWd78+nn9jl49tfxl8BZvYZXgWguzLYuo4e9Q+XIEon8QDAlyMWu54MCqddD8Jskma2vLyFTYNb89kU=
X-Received: by 2002:a67:cd11:0:b0:44e:dd14:24a4 with SMTP id
 u17-20020a67cd11000000b0044edd1424a4mr4319898vsl.29.1693465953651; Thu, 31
 Aug 2023 00:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org> <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org> <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org> <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
 <7a3257dddac78c46408341253a3286f4@kernel.org>
In-Reply-To: <7a3257dddac78c46408341253a3286f4@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 31 Aug 2023 15:12:22 +0800
Message-ID: <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
To: Michael Walle <mwalle@kernel.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	angelogioacchino.delregno@collabora.com, airlied@gmail.com, 
	amergnat@baylibre.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org, ehristev@collabora.com, 
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_001236_031546_B3ED7B4F 
X-CRM114-Status: GOOD (  30.47  )
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

On Wed, Aug 30, 2023 at 7:11=E2=80=AFPM Michael Walle <mwalle@kernel.org> w=
rote:
>
> >> While digging through the code I realized that all the outputs and
> >> pipelines
> >> are harcoded. Doh. For all the mediatek SoCs. Looks like major
> >> restriction
> >> to
> >> me. E.g. there is also DSI and HDMI output on the mt8195. I looked at
> >> the
> >> downstream linux and there, the output is not part of the pipeline.
> >> Are you
> >> aware of any work in that direction?
> >
> > I'm not sure I get what output and pipelines are hardcoded that you're
> > referring
> > to (besides the one in the mtk-dsi/dpi driver that you already sent the
> > patch
> > fixing).
>
> Have a look at [1]. That main path ends with the DP_INTF0 which is the
> eDP output. But from what I understand that path can also use the DSI
> output. But that is a pattern for all the paths in that file. Looks like
> all supported boards in the kernel will have the output type for a given
> SoC/path (or maybe the mt8195 is the first one which supports different
> output interfaces).
>
> If you have a look at the mediatek kernel instead [2], there the last
> part of the path is not fixed, but there is also a .conn_routes property
> by which you seem to be able to choose the actual output interface.
>
> I was just curious if you know of any development for that (or similar)
> in the kernel.

This is probably because support for this SoC began with Chromebooks,
which have fixed and defined uses for the pipelines. I suspect that
what you are working on is much more flexible.

The driver should be made to allow dynamic selection of outputs, as
is commonly seen with other drivers, but I don't know if that's on
anyone's TODO list.

ChenYu

> > And I'm not familiar with the DSI and HDMI output support on MT8195, so
> > I can't
> > help with that.
> >
> > Thanks,
> > N=C3=ADcolas
>
> [1]
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/mediatek/mtk=
_drm_drv.c#L210
> [2]
> https://gitlab.com/mediatek/aiot/bsp/linux/-/blob/mtk-v5.15-dev/drivers/g=
pu/drm/mediatek/mtk_drm_drv.c?ref_type=3Dheads#L425

