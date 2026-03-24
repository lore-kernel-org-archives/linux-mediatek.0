Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9041EF532ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=; b=3/Cywbf0MEZQ49ZOJ5srZm0Tf9
	33olMeDtFYOo2NoNJgTqXyF1fc2J0lQpjbS/clJptwcsUQ8QJblapgMpMMgqjqA44B9b9Pncw7Z+e
	xbHEECmwWeqXZSwr9EHp0ZeM7U1BZzgeO2SKls2ewthjkdZRsrhbWFGbxfZ+hDWIMy5RlUK8I4hmO
	vmoLe2w7cs4cOPbtHTrIEp2hrvr6nJnhpL6f9/WJfCbjc36IkzPxIimLYWpsk8lnUShCV7clRAJn2
	GBuh64MsJdiuu0NWw3gdHB0bzO1K1SyA8gLe293aI1HNgXT2IYuvmDW3wlOXx8ffne6xXSqZDkk2P
	uIgkSOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpw-00000000xjw-26PB;
	Tue, 24 Mar 2026 08:10:04 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpr-00000000xgj-1fNv
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 08:10:00 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5674d8be45eso398532e0c.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 01:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774339798; x=1774944598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=;
        b=B27hVlVyuN89kB6kik7/SKX4IZWxwoAnlt0CtOiC3zq4XsvhwMeLo21A2JYo8PdJIt
         DeJNOJe/z+0DKqLmHBiu2NHc7SHlq9ytSMbSY/84KqqWCRz61QEUGmD3ojYUXNEhKmQx
         +7v7HtlAMPK5IPh6AWDFjuDKzYt0OVAwUgv1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339798; x=1774944598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=;
        b=eHMV5+IEYJMH/t5xP4lLkvxmSS8UNfuV2R+ci3ZZKyV4bQ5Or3wi7/vu41jcKSjtru
         W1J+Eizd6nfNgzZq8MqCMgPjNo8Ph7Psmuzo8kDhe72v1y9j5qggdH1XMkTgU25wO/uA
         Tx19hcWP8ZYUOnxFfWGPIExbXuSfm9u2Dg5GzO3cphJkqeBEHxQ0D6lppg+fzBKOCwh7
         EXApQ8J/XaHV/xomFYmvTMeuWlzfa+r/8/sSDXZ9DxXVQ+s57o/8lRQOEzAhVbYvuwlC
         KR4TssNTRyN0JhT94mHwmHB6xlgG2xib0kg1as3n7D86lKkYKY2HDHmV3QOtw6pUidNe
         9NqA==
X-Forwarded-Encrypted: i=1; AJvYcCUvr07+EMWP8G6FSWHrknvdg9MSDyD3gQiun7jGvYNmHpn+Pqv54r+VDJBBJ2e8MJN9XRS9at7ugu4zM4gGxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0BpJ9u4CHS+9uLS8nalF/jbv4Xt5uqDmSG6XeiB1KRwRPQGdR
	a9yf5dGfMSrDWpDaY0yleZUrlgXdWuUH5TDZZmCpxE5AMMFw1/9qB2PysIpTOg8me/vtJ7RqH3u
	3rio=
X-Gm-Gg: ATEYQzyf5GKWAhjvPXV/rfeMXeSz5GgNsc2kNVbzz8QCZ4Z73Lo6IBPTqU+ld3g6YV0
	k1LHlegCE4s271VrryOXlyminxzrLXnC0Mv+vQ3vYnfL9bbVPjybx0BtRLVZAG6AgAI2Hfrxx9G
	CJokLqVgpYBoQFrC4jQ/92t8LK+0lUBQo9UDjjxm8CraQWQxgk5+dZpx+2eJo/rwPlkTLsH83lV
	FsWqvGrZSRNd3Nk0MwDqAtWOvCDLC5/rGWLJqk3S5V2H2f7nJPcUwYPM+okiUnA10Fr1DcH9lkE
	Nxw1DtE7Th/zz+oajQSgfA6GkwKPvcbwApvyb4YYitgZ6L/cz+jFdgb9m1g1Xt2tYQmngCz12ZP
	XjwcoDQDrTVb9Nd6K4CxiZvUU2SMYoABssMnfqhbe/NB5KtOxp4CeYGxdu3wcSqrcArprEXyPWi
	CR4wEiHjauMrsT8hWJvPaBo83Kep7OD+0EqF/2bVHtDOhx7tu4Dcn43PY9yQ==
X-Received: by 2002:a05:6122:3a1a:b0:56b:960a:a4a7 with SMTP id 71dfb90a1353d-56cde3439bamr7087019e0c.8.1774339797918;
        Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f882sm14515778e0c.9.2026.03.24.01.09.57
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-602947681ccso313774137.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFgTHwUibsdM+meTComn5ynAg8WZSEVjAnRSyzkXrdxAxs1nkRIfIErpN/edGXh/rZbFj1SC38CC64zPOIsg==@lists.infradead.org
X-Received: by 2002:a05:6102:4b85:b0:602:95a8:c665 with SMTP id
 ada2fe7eead31-602aeabedbcmr5833303137.4.1774339796662; Tue, 24 Mar 2026
 01:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-14-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-14-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 24 Mar 2026 16:09:20 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhBREre_kOTjzbfodCQMHqd_fX=im9PFayv-gFyQHhL4g@mail.gmail.com>
X-Gm-Features: AQROBzA8Z-8iiIqSqMrZecLtNyZ6Np86Mk_AZ4ugqrIbZNBYNSNcAaxSBrLyCNI
Message-ID: <CAC=S1nhBREre_kOTjzbfodCQMHqd_fX=im9PFayv-gFyQHhL4g@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: mediatek: mt8188-geralt: Add little
 core CPU power supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010959_441714_DFE56174 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The device tree for the MT8188 Geralt is missing power supplies for all
> the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
> Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
> is currently not working in Linux.
>
> Add the power supplies for the little cores.
>
> Supplies for the big cores will be added once the issue with SPMI is
> resolved.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>

Reviewed-by: Fei Shao <fshao@chromium.org>

