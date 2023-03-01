Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A993CC64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McoBXip6N0wzllPSImTtIlILRkDkokjO1vKAG/mcycc=; b=2iil5vyGsYNa3d9PcXaQ+hxKi8
	LVcvZdPn+Xc655v8tC8iiofFAoBj+TAv4fMkNuSUnWGgIjcWZ1N2Y/jAogMP9jL5WUa6B7/GGmp8u
	CM1CtvnAo5/o5tM0p3VJHEV9P/3qqCYHvsR27khmThCtL2hYGT+y/qHnZ+cjSILlFetOvkymmLSVP
	4tq3DbDLkEcV00TRUCnway8vDqMBQUYVkRbB9sYz+makNtJ6FGGJ0TK5baMmhJAgSsc8oX3z6ubRc
	4yn+JLFWc2jgFrGUraHP9sKXRLoB4zQZtY6gTl5Hc+ZUfI9EO/I815lBXDGtlWS3JaP1SkOKoAYoH
	IKWxq3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHav-00FQGe-Eb; Wed, 01 Mar 2023 08:13:49 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHat-00FQFc-4B
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 08:13:48 +0000
Received: by mail-ua1-x92d.google.com with SMTP id n4so3095862ual.13
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Mar 2023 00:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McoBXip6N0wzllPSImTtIlILRkDkokjO1vKAG/mcycc=;
        b=Tmw8Vpx0Flh0EJ9YIzobExLydlByQ1dTM1gZgR846ityPEUe7ycNEZuTrk7zuksAG7
         P9LXGws14CpzFMXQ5tJFp0UU8D9rTUptnK7uX2Ylz0TWfJmDhA4AxhVavhWh3Wqrd1C7
         rXOwoLkcrI7C83YqLuKVz45rRlaeSDUkXOXio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McoBXip6N0wzllPSImTtIlILRkDkokjO1vKAG/mcycc=;
        b=cDmn3lW9Pf+7B1H61FSHHFPeLFVHOQNL7szIyW806JSYOPUuAA/FoLyTIQSCX6S4I/
         c+8vr8BbCohoLoQq7zTszNvzTMuz6bO2Vf+TcDJ+7MceOmByhD7+RGlWRU9iUc9fQ70t
         l0m+Fvy1tsiusi7ajNoHj83t63nd2lhuNlH2cs5cy25F389YCjTckZ+e07dQd4I01NHs
         l/t+jt0DpTjrx+qA+AO7OoBkh/DNhzntXv6DC1ICzh59zJqjSAXkQlFioCngLCRMOok3
         9R61ft3qALaEbBMj4hJ7K2WL7Ux6v57YXxByglehL/6URJlzOfg7sRuPL8UHWpw6+cCs
         Ntlw==
X-Gm-Message-State: AO0yUKVCb7l62h7saLfG7rojo2yijEv1hPs7fHqcUGMZASDed8o7zkJI
	AgbPYOUukwOCU0F0/E/soRvwhni081UGR8PT0aVdxQ==
X-Google-Smtp-Source: AK7set/4y2CsFDtk/+kTuBAhzQVJG7wyQ420WDaIir/XDYYqlinCDd4UHs4pAft4BmRED3pB7RYXWp8GMSPeHGfZO/g=
X-Received: by 2002:ab0:4ad5:0:b0:68b:90f4:1d8c with SMTP id
 t21-20020ab04ad5000000b0068b90f41d8cmr3405014uae.1.1677658424931; Wed, 01 Mar
 2023 00:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
 <20230228104741.717819-19-angelogioacchino.delregno@collabora.com> <CAGXv+5GYc1X0J7tXfqQ0yj5rCFgEcTN5kwB4720vCkNvEKgiOg@mail.gmail.com>
In-Reply-To: <CAGXv+5GYc1X0J7tXfqQ0yj5rCFgEcTN5kwB4720vCkNvEKgiOg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Mar 2023 16:13:34 +0800
Message-ID: <CAGXv+5H+KkLFQD9D9Op+=XjEcBd+ehGWGq--E28A94=8pvmLEQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/18] arm64: dts: mediatek: mt8183-evb: Override
 vgpu/vsram_gpu constraints
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_001347_259621_FB23AD8C 
X-CRM114-Status: UNSURE (   9.19  )
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

On Wed, Mar 1, 2023 at 12:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Tue, Feb 28, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
> > with the platform specific vmin/vmax for the highest possible SoC
> > binning.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

