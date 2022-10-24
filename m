Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D479C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 21:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mie0dwILOoL5NP5Cg3Tf9BLyHE4I1j5avRUFdQRyJZQ=; b=gxr2qGPhgDd/q0ZJInxnUonlKW
	UYYOsiC/I3z69gkpnKUtu7ZW/rJjhwOypk35YUdBzLkvQRf+3lPJjQqzyRK6F6aKUeI86FukRkmCs
	aKzJ5XCdjdcNtvcxUuHpqeaLkn7RjfP2Yora/nUxvCo/Vz8R41TGBNdjgLgl2pnK9MI6hoChd9EdH
	B6IhTLICyb+dGd6/BET5lKAZx7ULt7Pwv2eAxSC9B7Nf4tIBLyuXw1dLcfdSqpAaKmbIiVmIzFs7q
	brdMRr0oC/LtLt3x+kCj1tTVdKB9UlYNZVpWw4wYt9egX5MtHn/GY5NUCYcD/4ibEr004WHtq6L/x
	WXe1pHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5Ru-003AWI-3a; Mon, 24 Oct 2022 21:57:34 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5Rj-003AU4-BI
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 21:57:25 +0000
Received: by mail-vs1-xe33.google.com with SMTP id s28so9201999vsr.10
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 14:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mie0dwILOoL5NP5Cg3Tf9BLyHE4I1j5avRUFdQRyJZQ=;
        b=gNXcO91AfhdJU+tqEckzPK3JYjWSz1Js/FUQZO3PvIsUgwYmnA80qUARF9QI7nqyrK
         7aDzrWPVkNNS9jt3kjz3H/2gbEyMAFDMxioj5GYU9tN+InKZaAywQuBlsdxCD8up/ZC1
         cARm+ZNoI+B5/t+4cl+QXzAJHzscPydD8zxqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mie0dwILOoL5NP5Cg3Tf9BLyHE4I1j5avRUFdQRyJZQ=;
        b=QqoZJ2U8k+c+drQxQ06wlHknYp3F3J/YDvwyFX5Fng3IzJ9JljR8w+Fy5EYf2Ni70u
         gd7HlLHgcPkFfRd8x6U5KpwNmwZOzzFqZOvSt0UiqBCF74OfcS92x/FlJoknzgc/Lqq1
         TV92s+9LFj8/Pov6MDHukul1MT6a4WTqorcKKMf6Q1pa6Y7MykdrrNUVlzpjX85ae5qV
         fbaTa6IhQbv5mL1aYU5RoZ/v7Ic03AOqArq6mZszlYJkuaFOP0A8HKpy/9IoH+t/O2yK
         ROOplfK155i5wQzpuae3hjiEC2uZQvOqWHrUCWM7SvD81/AEhPl5fMql2gMsQYd0tQ+J
         KMew==
X-Gm-Message-State: ACrzQf3QtNUDqN84lD+x6Iih7SlO/ln/gQlzXR9UvuPEU6N6+bivfxj7
	fqu5JBKkMTO71NGB+eJ2Q1Od1od7OH+fds6pFNxCRA==
X-Google-Smtp-Source: AMsMyM6PPYTAcOUSy3ZKM+pzj2N+X3xlMfiu8aQLbFXu3p60GkgOWzwhnMJsay3y56pkP1gHlZx4uqvmP7yqCYRajpU=
X-Received: by 2002:a67:fa14:0:b0:3aa:1ba5:4ab0 with SMTP id
 i20-20020a67fa14000000b003aa1ba54ab0mr3994142vsq.77.1666648640519; Mon, 24
 Oct 2022 14:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 14:57:09 -0700
Message-ID: <CAGXv+5HnJgmoX=8596OJZki_0qDaipP+cbbTWpkVxuOkErSBdA@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: mediatek: clk-mtk: Allow specifying flags on
 mtk_fixed_factor clocks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_145723_416695_F9AF467B 
X-CRM114-Status: GOOD (  18.73  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Before this change, every mtk_fixed_factor clock forced clock flags to
> CLK_SET_RATE_PARENT: while this is harmless in some cases, it may not
> be desired in some others, especially when performing clock muxing on
> a clock having multiple parents of which one is a dedicated PLL and the
> others are not.
>
> This is especially seen on the GPU clocks on some SoCs, where we are
> muxing between multiple parents: a fixed clock (crystal), a programmable
> GPU PLL and one or more dividers for the MAINPLL, used for a number of
> devices; it happens that when a rate change is called for the GPU, the
> clock framework will try to satisfy the rate request by using one of the
> MAINPLL dividers, which have CLK_SET_RATE_PARENT and will set the rate
> on MAINPLL itself - overclocking or underclocking many devices in the
> system - and making it to lock up.
>
> Logically, it should be harmless (and would only reduce possible bugs)
> to change all of the univpll and mainpll related fixed factor clocks
> to not declare the CLK_SET_RATE_PARENT by default but, on some SoCs,
> this is also used for dividers of other PLLs for which a rate change
> based on the divider may be desired, hence introduce a new FACTOR_FLAGS()
> macro to use custom flags (or none) on selected fixed factor clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

