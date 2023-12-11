Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F4C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CykTHh1hqBcv3lKDskZucqp2rC4spPVBJz+bCkyVI0Y=; b=zI1IL0lSQjmPx7v6l62tImC3un
	IZ+vDSdBOlv5WOBgTuTUNnBdqTclg8Zh/WMFVBAPsJB3AhPwmHUlh4dxrJ5S/QmqM7Y+PnKIOkzSW
	7NaiPR33NZM4P67mJti6SpDYebgbXJYwQNqGhj65mzmdI1672LXqW5CZwq9S45ILGArq5W1yUSONw
	k/PW5KCnS4xChgVGRY8XKBjR+YQ7NZeXRVIYFwZU2jZDCLq6no76ZwZNgJ7NVfidf/L6Pozvf35XJ
	2ULfpMD4TrocYPkRjLGKcAkkoh3L3hvEfCWAqqK4zlKPCaJGg8cLA5yx+vIIdw6EzlQtVcFTA1d/z
	CRNIwcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCnGi-008IMo-05;
	Mon, 11 Dec 2023 20:52:48 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCnGe-008IJx-13;
	Mon, 11 Dec 2023 20:52:45 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1fae54afb66so641231fac.1;
        Mon, 11 Dec 2023 12:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702327963; x=1702932763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CykTHh1hqBcv3lKDskZucqp2rC4spPVBJz+bCkyVI0Y=;
        b=UoOVWBs6RU3ag7IvwGygUWTf6cMRQOKAr5xgkPOYXi4OpGn63crr/YzFyLwWivm0ut
         MdKkyC4qXdHR4b3Y2i3zwSypGtsK9qVPR91KlDiVo7C5chTyPIQOpwdapjdePpRKpf+r
         RZT6gODszmb5zdNHEdgzJ0ql3t7xhLgf7mttRtvojNiQbVQiOleCHxCpbe4O8v1DRZTO
         Td3/jFaddZm3cCT4rlPOGheTxwgjYNIdCzPHeG6Mowg8JIpTtf7uRuZGMrG/Ha84mfqP
         Zjz5yi+rAU2oS3ohsSXoMP/Cbwxm/JfiwrsUoAlR01qA0h3qibUn/bJ1pk2GEjzoqk4y
         Rpuw==
X-Gm-Message-State: AOJu0YwNTyshlB7q8y1A0Pz47euf54KEuYOEck688x4RMNyjHqVwS50y
	gAkmBSc+fO0SYhYnHf76vB6YDz5VFyZ2mT6ci3g=
X-Google-Smtp-Source: AGHT+IFiPTo3RDtP82ZwRSC8e4XK+Lt0aEs8qo9f/K5fbtrpNzhp0pRvpS807F8FJY7idqMywszjXwC+xT4Tilxbgr4=
X-Received: by 2002:a05:6871:208c:b0:1fb:19d6:8715 with SMTP id
 ry12-20020a056871208c00b001fb19d68715mr9409171oab.4.1702327963105; Mon, 11
 Dec 2023 12:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20231116132619.69500-1-bo.ye@mediatek.com>
In-Reply-To: <20231116132619.69500-1-bo.ye@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 11 Dec 2023 21:52:31 +0100
Message-ID: <CAJZ5v0hP6VRKmBy9gSPkg82w+g7wwQBVGs6gHDW9BJnr-qrBnw@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: idle exit_latency overflow
To: Bo Ye <bo.ye@mediatek.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yongdong.zhang@mediatek.com, 
	mtk24676 <C.Cheng@mediatek.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_125244_370696_16B5B01F 
X-CRM114-Status: GOOD (  20.22  )
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

On Thu, Nov 16, 2023 at 2:26=E2=80=AFPM Bo Ye <bo.ye@mediatek.com> wrote:
>
> From: mtk24676 <C.Cheng@mediatek.com>
>
> In detail:
> In kernel-6.1, in the __cpuidle_driver_init function in
> driver/cpuidle/driver.c, there is a line of code that causes
> an overflow. The line is s->exit_latency_ns =3D s->exit_latency
> * NSEC_PER_USEC. The overflow occurs because the product of an
> int type and a constant exceeds the range of the int type.

In general, but does it actually occur in that code?  IOW, is there
any system for which the exit latency of an idle state is so large
that it will trigger the overflow, for example?

> In C language, when you perform a multiplication operation, if
> both operands are of int type, the multiplication operation is
> performed on the int type, and then the result is converted to
> the target type.

Right, that's how C works.

> This means that if the product of int type
> multiplication exceeds the range that int type can represent,
> an overflow will occur even if you store the result in a
> variable of int64_t type.

True.  However, does this really happen in the particular case at hand?

If not, it would be better to say something like "For a multiplication
of two int values, it is better to use mul_u32_u32() that prevents
overflows from occurring."

> Signed-off-by: mtk24676 <C.Cheng@mediatek.com>
> Signed-off-by: bo.ye <bo.ye@mediatek.com>
> ---
>
> diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
> index d9cda7f..631ca16 100644
> --- a/drivers/cpuidle/driver.c
> +++ b/drivers/cpuidle/driver.c
> @@ -187,7 +187,7 @@
>                         s->target_residency =3D div_u64(s->target_residen=
cy_ns, NSEC_PER_USEC);
>
>                 if (s->exit_latency > 0)
> -                       s->exit_latency_ns =3D s->exit_latency * NSEC_PER=
_USEC;
> +                       s->exit_latency_ns =3D (u64)s->exit_latency * NSE=
C_PER_USEC;

mul_u32_u32()/?

>                 else if (s->exit_latency_ns < 0)
>                         s->exit_latency_ns =3D  0;
>                 else

