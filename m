Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43BAC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxxADGM7ougpcYQ83aeznKVeHn9174ZSNJoBCrMRZW4=; b=A0nQALyDFzmsu5EysDzwNUNyUn
	Xng8BWLSp01KZyuGv+URsodU8d6Y+BAT/T7gFrdhQQ9XqVPMusKD3rjRpBvUfATNnT7dHfTuAA52k
	JNIpN5ilVlL5DZkzloyAo9gNsSQsmzOxm1SSkZJzZyyF8U13dk69265NftIr9dgH4oh/RtyoYGYKR
	EpqoriHl3i6tnb5MSV7eGDi2863UHkQa8hr+B+HncF1ghmmx1Hraygd5MDp3St6n24YGG3FZcHTXc
	Pj0vGWvO5fF9eP9HbI6ltG3iFa6QA9eJitpXq4vcnEm9hZifIUuc4F4Y+mp39Rf+/D3kd30ADR3U3
	/VqeFj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGNo-001HBU-0f;
	Thu, 23 Mar 2023 08:33:16 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGNk-001HA5-09
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Mar 2023 08:33:14 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-536af432ee5so383788087b3.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Mar 2023 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxxADGM7ougpcYQ83aeznKVeHn9174ZSNJoBCrMRZW4=;
        b=BTbo8CJVXRcdmDMOM4UfP124qgFd+Dy8GJUF6z0c3o+Y+FsK72/6RlC3M/w1pIQDbw
         GOY8S+I+6J0LGanKOboWWqcovlIQQS8iN/HozNnyX3v3CItJW7atXtnUQwr15/DLiuAH
         0OQ5HGlVelykx478Yy98SmI3GhHbB3/Gc0hTt+1aUfJyKuZTP0gTDwChy29fpSpMZJPK
         /ttN/GdglwV3yLoS/q2TOwUwVFd6kczeZQZYr6LD5uyerO40xK+zmw+YyxY7LaWGPidO
         2WMcTauKGs3pReavYjS1Roat157c8dqXUdRR8/3M+780QB+JvBjGJuVYLd/aq9/LfUow
         2O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxxADGM7ougpcYQ83aeznKVeHn9174ZSNJoBCrMRZW4=;
        b=k/wQdI8rdWaKE4KNfVJsLO/DmWNtNpgYjvlw4+2YPxV00kEhlHv/oV3LI5YGQ0oY7m
         mOHeMolXa13id9w2lWaZSeZQ1VHVq7xdd72ib5IfK+23+cg13EqgGUvjkWQIIVE488kr
         lQyX9z2/zhKU0iJ+pdMPNkjz1jFnYZmIjK8x+w2Om0S+ihT8+rQw57B2szM8hkJaOUk+
         r0csClGjhmtXBbFj438jcCKQFF46EkFTKweAy9jbTcch9bjT7OvLdf9UBUiTBYGNjzdn
         pCpQka5LhsPQf57FwUC7sPDXgIxHwclFxgiixUuy8vt+GSy2T9OiF81JwJ/1tjs6Zhg9
         /aEA==
X-Gm-Message-State: AAQBX9ecIFLWzLpY5P+M4ZsMHjenXx5x85oUaLDvuu1XoAMGV4HB3TKI
	7+mEeG9sQjX8wkC7eA/KprrdGb8moIWkwvluQYwMBQ==
X-Google-Smtp-Source: AKy350beNfKqYmxZD6Py6G2/x4UomJShnG3A20iBsq0qiIUpVjYvYk7dcPiC73v8tqDiLG/XhlxCs6p4eoqkD5syZ9E=
X-Received: by 2002:a81:ed09:0:b0:545:8202:bbcf with SMTP id
 k9-20020a81ed09000000b005458202bbcfmr1373175ywm.9.1679560386843; Thu, 23 Mar
 2023 01:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230322173549.3972106-1-robh@kernel.org>
In-Reply-To: <20230322173549.3972106-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:32:55 +0100
Message-ID: <CACRpkdaWJX6Dgk5DeVS2uyFuL863jdAgBj2_+dhriiek0zPkKw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_013312_087027_B32535A5 
X-CRM114-Status: UNSURE (   8.38  )
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

On Wed, Mar 22, 2023 at 6:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

