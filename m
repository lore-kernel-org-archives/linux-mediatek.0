Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD1606A322
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eC3sVxzn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ki3Ju/o7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=; b=eC3sVxznnYUkgPhU1WkAuWgzqa
	BuCfNdTC2RyR5x6beHHJVbdPYVLJdzJjHx5Ki4f7FpjCgZOANwhT37MUB8NW4R6cukv6kSBCNz3OQ
	kzFOcEuF421oqo/qFLQEOi31rqgb9bCxHkxg82qem3NyNSvMvo+BdVvqJrRtDjC0/VQUJBoLUcp4W
	HM7s99yO8gwWGRMw2WiQ6AVZVOdSHH+EbeHr2m5O5JCPWm6haHJusUKV0vWlzqTY2WxzMu/OonLbD
	kIaPrMlg+pI2nzhVo5+/pvQzRDsA0rKXWQa8sqdq8e7275TalaZjG0aklHxJV/Qz/V/vwuzDcznUy
	us1KQRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPZZ-00000000qV6-3iLs;
	Mon, 09 Nov 2026 13:38:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPZW-00000000qSR-480k
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 13:38:09 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso1026071a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 05:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794231484; cv=none;
        d=google.com; s=arc-20260327;
        b=ct9i5WckT9D0BCdndJDZtuouJRVyw7fkRSJvldfrGbU71reO7qloZZm41c0J1bQ0n3
         qZNB4KGHWIP+ZmuEerCGMsIAo2J0EOJ0OeXDpus84X/3+Vernqo3rqZp2GVjiN3pJwmg
         LsoSsal/Xtwx/FBHHZ/t/dHj9rpAXk7Du3FMI0iipMI+noCYaG+OclsQVSfMeI1jCxvY
         TrZIkkHRJryK9+IoOtBxyWaahs6vtslYLUo8pd5UsNV4cg0DvMs4E9VfS+TDC6fhtYRu
         cVG7uVcedT6xVoEoUiB02Jvh7cfvervKrk7JLnj8vtZ0QwLozJ2dQavWVnJW4wxZBhCD
         3tcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        fh=jYu6BRPAAfeTYLw1y2Yb4BE8+WLoJhmtY8PBqOkKM3Q=;
        b=sDPVfBS2DD3FYOw6gJVbC0Wy5qBKtShZAFTLxFoxMf2BOdaM90+VbLXuGc1WpPLPIz
         FQXc3yr1H1cYNvCstL18oQkhABYHdTz5JzKTh3TO3Qg7vKMr4zb2yNAZ9Ezd5iFu6HLH
         WTwjUtzoseltfJV1cHdwKZPc7YxWJ2LQw+pB8/iwaSAI7L0rrCtQdzMXXoAzKmz5PBb0
         rzJzQLBYj5/UP9ylraDyHCQJ4MxxLaYrLJgDSent7rjMZxFrv3it/5Xff71AeL33NF4J
         196u8EiFbQfCuM6sXZzIvsV8b8OMXiBMsuLQtrhTQxtl2GNayPe1byA3zp8W6+YY4La1
         6S8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231484; x=1794836284; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        b=Ki3Ju/o7pOKXcA0pzzRylPdEIsKGkAC6wxUeOFJjD2iharktqJLyateNyvgzypcvWj
         /44//+xCwgJz1BZe/HGV2I2MNALQvRWBozvqocQkNIcWHYUMm8fvdLpj3NtZ20cGqg/h
         OffNeOaHeYSx9Z5OTMT+LOIf2E4AFNoj3m3gSo67ImBs1CQ3t2bptfNL+jsIFsikywfq
         e2usn92iVx3s/7or/KXqQq27V98zPQqqubBdUhcwIli0w8c5Vj9xKBj8aBvJ4LO+Vnsc
         Wzd+/kdMOeQX3+YLgOWo0M83sdIHpuy8cUfgDI8x3yElskvqZP0H+xMUthzJjUZoM6Qb
         BkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231484; x=1794836284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        b=R2lTBHprmZWAENdCA4tnWv+wrp02yDTiVGmJNT0zKiPE9FZl2Uzq3G7h+wnQqFe5R3
         d1IkpTN6xuJucsoGeZZd/qhkzsVUFrONQiTDUyxV89D7QtZzw5SERvq176PACmhcgm5v
         3y4TNF3s/RtcSoF7qW0A45FsMFulvYSZ2pICVHHE4aZBsJkBnDtTkStQcJIQLIdugRRN
         yYpiXsHb9jls3C0BDol81E7iKubgxkcjBUMCRXyfvy6Q/ANOekN6bUZq/iJxcBga4K8E
         SvbSA5BGvwqX/lt/64pdr5iCWxOTAsPe4G3toS99IY/GJskB39FgQeVEhHZiJaMcGxA6
         V/yA==
X-Forwarded-Encrypted: i=1; AL+hErHMVeFqsaBE9J0ytxGVX2XYpLGJB8dKCpw9Z+8DAPHQS45aVMfd6hs9f2K6GqrOyIyYJs/VvanehuupoHu22Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+amwh7x3zimDBlCHx8ARzDXFga9DD3mMsEw2vyMgz1oykIIjGY
	rax9k6VuW9rhuoxL4m9lkVL2angrBZ/eAGFMdvQj+DhOnv61v5LYLO8/XqRzhyYEiEcoNEADx6a
	FyI5KoboGgp33suM9fw+mzbVZtbsDKoE=
X-Gm-Gg: AYBFou3OKjeJLugNruIoxFqbAFD8SJ3UuxwogJpK9dWC7O/e3W0B/g0UxQzsm3EtU8W
	WjUNlEKBsS4IOI5SA61In5b5q949+htTgl3GlNjhzVs3fK5YCOBfOKXlaMA3gIaHklvqjiKD+X2
	NzCWpd6GMvQ65nTy8glRAIW7NqhWbBC/g8Kor5RkZBzch4Yr3V2w5QV896pJMYih5m/1u3cToRV
	SGsMV9ypORHEzgQw0h0CnqfGw0qDZ0b3Ls10Qek3xUk01u/ZYBBmXlgeDpAY2EhnpiLLhXpqLxs
	Kyx86MV4vRGRS03/4Y1VtHdfAzDngRZjqvOa+nMOPobkNcZt0HEHi23u+x0v5hUiwWY25sIQV0C
	KEA1cqOx19L/qslu71xhVf3PbZ+XRsY3+gCw=
X-Received: by 2002:a05:6402:4403:b0:6b7:186:e60b with SMTP id
 4fb4d7f45d1cf-6b722370721mr3069483a12.5.1794231484049; Mon, 09 Nov 2026
 05:38:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Nov 2026 14:37:52 +0100
X-Gm-Features: AclHuK-GwXS5uzKJjXZFVGbrq4GgjBtjHoVwLZJ345xo66Ul2iiUwy2U-krDQME
Message-ID: <CAORyz2L6Q=EeY5Oa=ch2R+Mh=xCeWosFPPRe+o8Qjg+Zc4QpDw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053807_042223_328EFC9B 
X-CRM114-Status: UNSURE (   6.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Thank you!

Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
Sony PSC and mt8167 Xiaomi Clock

