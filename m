Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7836C61DE2
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=; b=1TrdbbUvVaB3o5j0Hd0+Oy6dGP
	EwhrR6UCVz1moPntHxscWo4uONr4alcdXfrKSyng3cnEWe4tRZpMlqUJWexF5JawiISHctDFxM4Us
	pvjjScM4i2ADLO9OVcoXuAZrv7R8uBUx6yQrmd7SzoWKNnE3Ug30ZO5bMUw8zBmV7iCG1hLRJSEnh
	uPE8yXh0uz8X7i/7z6rfeyByI95kEKnZUy98nM1WhBGw20Q11BFLsdkT6QpROsQgey/a+VyQ/Z3Lq
	2ZQeQfEKPyvGJD9ZTbkllAfKj0qJJrFHBLv2j6F81+iV9XNFNRN2035GY0qP6e3WNCuiW/cNUT/DU
	YE5EPk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xv1-00000008yPY-2ciI;
	Mon, 31 Aug 2026 09:03:07 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xuy-00000008yOe-3i3y
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 09:03:05 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66f79f58123so609477d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 02:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788166983; cv=none;
        d=google.com; s=arc-20260327;
        b=Hx4F0CXcPXB090o9DYb1HP1GV15MnUPrRO7gK7IEGHGnlUhg0ma3UBVr9MYqCkSUmK
         YoFVnWEEkw/Ar3SgdL5vN0yMjmCt0u8v4CrKax+ifg69HaszhtNz4NnWLkuvWcnKpCjj
         eI5zpgf+NXycanUzPqZdNKttV3KXWi/S6fRxJFN60aQ2dAFDAP/FC1S6veAS1R0aem+c
         Iyx7vAXRlUWD3VDcKbuYl9o1CdAqRW6eCxCyEnqx3eaEHDW7nvvjLSaGaJ/cUUtUX24K
         Uch9knPuMFyzJky4uxxOn/hkGxuC2bpSig6LYkr4FKnYhjmDZq1DfqIbkdBnLG/Z/4eo
         Sf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        fh=V98GFe8VZEGx94TmaiF1oXOqhPoNmCTMOQhNBoHoNE8=;
        b=asxe0l2BEwxCnOkY+iDjPxwJ6TRxlyL6OuBmmXGuNzn8PYbFYlwjT49rYY4ERzRKHl
         ujPlBfEzWyir6x+BNAiTyXJzjrB8tIrXInW7V00SHDxTrsAeef38BzzF4uFeGmP0OaFn
         PMKvEeP8uyw7OXdMEC8CPj34hEd2gTxACmPGY3WEUN0TDi8nAlgz7G2NQ3pqWzH5VgBY
         MAQYa/gPQglYONRQo1fU8+gUZY0Pzk2apfw3CJDErEFQh3cfQ3jWFGgY8cYpW7weY9I/
         C8uEEXpO3EwWCDWlD5l2y4HfcHfac6VI6kzCx0fDp5gQl8F6lE6xb3Y41LKZkUoew0XO
         11TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788166983; x=1788771783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=BhB6r7JXlcKdDVniAOklRQobu4THhqMYKCFEf239AeTD3kAsU29Smdz+JYyEcps+RT
         NtOg2Oi8yORua+b54CX6ETWQ7sDNyqX7oFPn/zCU0QCBRhPpd5MUtJmOT5cWchdheITF
         HZzSI5pOMaig2TPBTe1CoeBm9oBdPeHSiwG5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166983; x=1788771783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=OYIo5EWmBZCnXZraxF+ztC0xK+y4mhhdhLtjWY8m018yqLb5/7LhelnetSVTT109f6
         gap2w0LGmyr2QYezYVPrnm+4t0FD4e0DGqTKbGXlMaVNGwae5gZwR+ODeya8VhHWkVkr
         NvPj/LHLqv+n9xYwJGUnd5lrIx/brTeYOLoZeb755xytlzOzjqk3iO6+Af9jMQuDFPZ3
         C0WI0YZmbZ3t/9/u5QBBXFVg6duynJsVx8VtK/Ne2ekJYhiIqbPghw8lFCf/G/5oaln+
         XtNZiDqp4G0psvRpdYqKM5eIYoz2MkFEHxOOV5ZHvJdORu515a36z9UTKvqllocMNEpl
         P9ug==
X-Forwarded-Encrypted: i=1; AKwUvBzWzocCM+MQ2tPIJZT+TQdLA8cPjidL3xqLqba2klikxUMbRgSKFRG1UFpuPB6JQ0PaOI5Ys79pFSMxkpHsGw==@lists.infradead.org
X-Gm-Message-State: AFuF++mdgS98QLTklgQw1LXVvalHZzfIVpB6Z/0+0UpHKZ3yvBeGXDy6
	mKqT9PoSn4wJCKpyyEqFHNntXNCtN9T24BNE/qpDGmYfWdrwETkAsGuoXa88t3AitptuwYVUQwm
	5jtScDqFFFqthjh07GElj573pugaDoY8X3AofWgwv
X-Gm-Gg: AYBFou0g4f1rNxyBeNRVdc3+BDqqH0j9VOlzFKgJK9wtb6RvLYl4+ArcTR/2gbU3DhO
	cka6G2AOjCyVGyBxQ9wwomQKcZOBIaGrTaMDDOb1zVtrjZQaPNz0CtBjxipQ0mZtvVFpda1twvH
	f9io34LW8lYpTj2drrYI5iIPQGUhXlzgB4jz1AG8rlGqIzoSkk9ebA4X+aygGG7tdQq2RAe1hT/
	3XiQD05XcCT9y0Y0DDhR4p/vnzgl4FZ5LxzE8HcWyk90W7foBSGFDGpsAJyDwHXFVRGB8TjKsWw
	kvxRb4kOvZlOZ0HOXo4ypYarA4mj8JkoZASECMU39TClMJF5G/X7QNDI0iZ8Xea5kgikuzrYaQ=
	=
X-Received: by 2002:a53:b9c9:0:b0:66d:289f:6498 with SMTP id
 956f58d0204a3-66f814d5729mr574191d50.36.1788166981090; Mon, 31 Aug 2026
 02:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 31 Aug 2026 17:02:49 +0800
X-Gm-Features: AcwNN1VqX8uTSrN71dAKaA8eOGbgkkf6CrhjupqKO6wVb7uBj_O5pF3ip4I9SqE
Message-ID: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_020304_924006_B2F5EC88 
X-CRM114-Status: GOOD (  13.18  )
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

On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> adding a depend on OF, the following warning is triggered:
>
> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
>   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIATE=
K || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]

I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

> This patch explicitly adds a dependency on OF to solve this issue.
>
> Cc: stable@vger.kernel.org
> Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks!

