Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D6BC636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 06:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfNQZUW7vpWk49el8p5YyTuQXOt0xJcu7Hm6/2uj/BA=; b=2yuQeXFJnpLNvjOLVHDLzFF86h
	N4noXgp5Dhrsb7XiL0L7oI8sukDA8atqUwu5IYPTmPM3MDMHc/sssEEbCGLjNoYD3tZWFkXqmCJi4
	zeZB9oIK/k0qNbonXGknUuRIcthdjqwc7G9J0cZnJlwvPQ0LmTXVr9i8/uwOGfebKULVfA6n5JX05
	FQd47zUlkkvmhUFImSGRO3r1bWuLQsy6BFls+mE7dp8A05Ca35rMIZKTdBA/s8CaZ191i2dMzrseE
	2J8A32MsazfvjNFssLQfh8RHz1ljBMW6TnqwPEzRDI4W//ckRtolQof/aNi2fPQLHIsPbg5IG5sjG
	bup8vrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpxB-000d3h-5d; Fri, 03 Feb 2023 06:53:45 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpx6-000d2d-4R
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 06:53:43 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id m1so2552814vst.7
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 22:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nfNQZUW7vpWk49el8p5YyTuQXOt0xJcu7Hm6/2uj/BA=;
        b=JsBkmFybia9ZW4Tn80tNqvi4ejQ4duK48gNUWa7XECiICD86WWBXRtTBeA6TxCaLj1
         3YLNlaQfEKLP73hBaYLAGIzg/4qXKBvekULoYrWh5JHUTM/TahtLg4+g5d0N7DcgGtfm
         JAUetCNYzeWrNrUklnq2G6/DceDMZl4M+Ms2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfNQZUW7vpWk49el8p5YyTuQXOt0xJcu7Hm6/2uj/BA=;
        b=kQStyt5OJokhPpdABiwlRa/np7K8wc+a6w1Mt5QghNwK/o08JsqggMndX4NVdYHKNg
         f6USLkRVPbtVrJV7CDoptwCnRW2SUUEApGegtw3qiggsc+5P1EEeQwG4pTDMLmOV+S04
         ho/Y0iGDbZ5fYiDKNFvNlA2pV2d771UIsbJnvcZjkVrNMZujseFjOV6QExXC8PSDNyHh
         Ln20A9sRs4uG3huCmjNTooPzIkK+qTLuJrfzjQ5EIJwJs8W7QC9+5GOQ0+Mz7VeBcNjO
         +HkdlldY90pZbiJ2e4BxMrD76FikJ4Z+sa97Qq9kezNuT6GHb1ZuLWYgSLVae9yEr+2b
         gLTA==
X-Gm-Message-State: AO0yUKXoLxLpjuJQNKtKvMu/0u4LlnlPSeS6Brj+3AbY4I8QA+tY7T9X
	/SMQCv2VSOx/BDsb2+BARIZ5vzl3pPyf8IJe4Rh0ow==
X-Google-Smtp-Source: AK7set9P71C7AZ8SPapudPPTNAfMRfdB/difo4XxWPYnTOB9xKAd3pZpzwIwaKo3jyt1LgHG+/GWReE5O9LqeBd1xBU=
X-Received: by 2002:a67:fc92:0:b0:3f7:93c4:9e56 with SMTP id
 x18-20020a67fc92000000b003f793c49e56mr1689947vsp.85.1675407218866; Thu, 02
 Feb 2023 22:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-7-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-7-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 14:53:27 +0800
Message-ID: <CAGXv+5HsQ-sG4+_uKdp5x++wzZvQMjbUpSrgyvUS+Tyo1kC-hw@mail.gmail.com>
Subject: Re: [PATCH v5 06/19] clk: mediatek: Add MT8188 camsys clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_225340_190982_3D27BEB9 
X-CRM114-Status: UNSURE (   6.85  )
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

On Thu, Jan 19, 2023 at 8:50 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 camsys clock controllers which provide clock gate
> control for camera IP blocks.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

