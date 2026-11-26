Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD4606A336
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ag9LHdZk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yctRHugk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=; b=Ag9LHdZkqI+izpcQ7LWuCVdN3X
	oNEUlmb3rYp4MhFODEXYhBrOQawB26KqaGpX0FTCO+KujN1nWKyNRK0zuk2CeHL4DLtOsdynudx+a
	nMcMy5mb4YX7F3XqAEUgI7kRFuPnT7CDhBq5XD4PCtoKJnlL2n13eo6/vOwrkYmfaweEuDlE34+yk
	RtxI0McXbz/vF+0Gb+caSRbXLh8I7QD1Z700kY0yQ0edHDFSJm1WYjYR4lkyZz4Qlqi96fbxlLCez
	7R37/eEKoaqtiL6I7ylWnhuU6BHpQ7N6scXHCG8M93Zyxx7+6BYtDUKGE8sSaUDBK2J0w9pNYTMod
	omJW2vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVrA-0000000CZej-46QF;
	Thu, 26 Nov 2026 09:33:33 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVr9-0000000CZda-0R4Y
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 09:33:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so7848098a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 01:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795685609; cv=none;
        d=google.com; s=arc-20260327;
        b=lKemuYXQFL13n+p3qxfp9bhqfq4U1+10N0WCnIb9/cuQTZKUMTbcFLD48xQSX9ssPe
         wfydnBp/bYqOX1MWcHmIC7/Yqxxa4JzG6rTz3k/tF9MY6EeSvN7LCp/0JI/PVQOW8ZMq
         iKCKtL5GnbMkQ+ADAs2sVXZPAO6wDUXluUcC+cK7fD4A6Lx3MEZCUnU/nYMjYtptvIqI
         jV/oWQekD50gaftGD7jXaBU8fnDp3n4JyCpAEdiDQZj/fKZx/Kgscsd/E03hcxBJ5WNI
         ECP0A1EPtGDyugYOT2hpgoDguR81T1UAGCO1DDNj6doEdpEETpX7hDjxMIItRqfkjGLr
         scrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        fh=5ibTsgZYBOkN1xxqgcE3ROfKS4KMAGJ5hUKcyn3BR9E=;
        b=qEl2n+yYHgTZx2MJOxWFFfrwR2VIVo38DuWCqoWvXlIrQOfXbHeVRfwCuUef12++oA
         +1/O3BskAPxflAtwbMqC3VKFGahoePNxU0lrl6KUKQdfAQ8Go1kgLDh78sYxTPa0gS0U
         ADYx0l0/2RRUEeCukyKuiVso9K8K3M6raPvWi48v4J4L+13mMI1DdVZgRRIyOClAARV+
         Im0CbM0SpJm+u/nr6GwOkoOtvqg6lm/ib7nhxuem/p6s8+eFCioW7pUxC/qwkfjPBUaC
         NUpKlmWwGOXsiiiMMTPMrbmwoJUR0J5oQGXOQt1v6vQY0sLpZW3eEjIzb19VUN/d1Xa5
         JQKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685608; x=1796290408; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        b=yctRHugkuxuIadvoZTCsNqbhTkiuJHxh9cHZCQoc0mD4Izy0AbRM8tXdTBQMTTYKv0
         gaVTjN9nM0HbelkgLxInbd7/cdl/Dw7PsjKdeT41gJ/N1OdLo0bD2eN13UQJA/CxA7Ej
         fl3X6uysKFod0eplfNo7yD7mrslIb23+EVEyVzAAGxyN155c3y3hxJ2RaL0iJ8nUhHya
         Buzd7OFEE9HaaRLOGP9AMYf34ZOS7dKkpAaBc3PJC6Wb8auAEpatql+6xMEFwWO9Ek45
         pREUKf/mUCd4hL6D2F1wzdszRJ4jpcCDRLtRPRuWUEmf7g5M+Bueud/hB5AsZ+retzQ4
         mEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685608; x=1796290408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGbTvmGYxAXv1/EcBwgvim0eodoihEUYoQ15lt3DIkM=;
        b=sSSbOujo0vTr4WalF/O5hei1QNSFD4p0qTff46E9FLJQ2ffvyL4Rk/VwuCpdQofkRG
         jelj3A+hhdsWAYyTluAsKySnTwMEAYBuYiZ+hr3wTj5X/pCun2r1axVW1DpCOGpcLTsq
         7IGfukyVjd1bSg9bMYrz4lWxG703v+XvQXOLkYf753YV8Z1XbAM/ZdcnxGzQQDgFq4zo
         5yxbY/LoKcymal/1+aQBWlThlFJ0sAn9jH5tT8y9F9UTZB7X/KFog9zPj2wma9HtS+No
         WK14orhGm+S8/10Jr66TZXxirYfphjRNm2W1krA+vhMxO0BdXQZphMzAB4/ZbgWARUMS
         c43w==
X-Forwarded-Encrypted: i=1; AL+hErEDKxCq/GLv33dwHMsuuosA4i4tBdzcpjnVk4TgpXjcvpFM2ZxnToOSD2K1GsSMl7nU5GKWpB0SFIZRqNy8Iw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/VRYy+JQ5GX6b6tWShRn0WQR/AVEm4iJOM07H0FX6Rkq/h70tw
	M5p/NqEiJY+FbZvhMVwoBYEjYPo22Wq8t5+tWNQdfhWZswswGMz+yRw1hFie4wWnDZtIN7E0xmX
	V4mufROjXQpv/5XbrtB1x5fVOFpPQBO4=
X-Gm-Gg: AZFdTZeHWRxvrOEBk4sb8FgqMlTKEdaYBaUSkxrq8t3OpdRkbXZirvYomShtm37LNJp
	u+Us+QuALX4DNe3cM8IT99d+ol6S3N0i7VrqcKtg95NHNYVvPYSbPGgZrCH62sFiIY6Aiu2oBfF
	GI8GUj6jdiIWDJsNY7wdHV9meDD1Fb6Z0q4b/FBxrxbbIxIi/hPaxFfWz+qKd63Xr81bV429W8B
	08O6KgETL0bz6p2q4z4Nt0pJuExrbuc+6GO01T/4RCz5ghtUxjgyhxvL4t4Cwqp0fex6zVbvBhq
	zm9up2NA37WKf8iPyK3plTmP7Nj8lat0h6VPMez4pfVjjKZNv0j9qaN8YrzRAzHd4zgfRv9e6gB
	MfQOThfWlOV+PIK5dsIjNno19oB+A1JQMU9I=
X-Received: by 2002:a05:6402:400d:b0:6b3:f891:c2d4 with SMTP id
 4fb4d7f45d1cf-6ba37ea5360mr13616725a12.29.1795685607957; Thu, 26 Nov 2026
 01:33:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 26 Nov 2026 10:33:16 +0100
X-Gm-Features: Aa3M54pI24nQZXDlYenmTwMKyRI5daIxAw0Ak8m40BV3tPU-M9NeeIVYIMbKRNc
Message-ID: <CAORyz2LXi4vpwb2dEiq8R8t7x6nUk-DBUNs9t-cCrP7rUodbHw@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013331_156754_2D5D05C4 
X-CRM114-Status: UNSURE (   9.92  )
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

> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up. With the bit set, the timer that
> mtk_gpt_setup() leaves running could latch an interrupt that
> registration doesn't acknowledge, the kind of pending interrupt that
> commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
> leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
> timer before enabling the interrupt, until the core programs an event.

Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # MT8167 Sony PSC Mini
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

