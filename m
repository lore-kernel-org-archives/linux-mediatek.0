Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AA0CCD183
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c5+mJ/UHP/9LbfelQ205BO5Ehj3e8KPSEEqoMsr+r0=; b=YKIC9s07xe8TRhsPTtF+uBbMXJ
	GdNbf778WzPiuziTPJekiQCF8hHM/lGTfkhe7qTrW6CA9unnIZ1gkFPl3Hn3Uhu/38udFode4xPV6
	qUBVTQTmHWjamhApgqQBWMbqEtZHx/j7nXwm4xuJYnNyfMawSeqPE7na/nYUWfG+iksirHcwJGGLQ
	KXhxn2HFomeUbIrP+4IMPOdChF0xAtnpmIsbPDiUiejit4g+SadCKBNLLST73xeBdlw1MId9ndVpg
	oJDjXionEF760caLYiKTvx5m0C/YTsfSLUd0MXwRAMVHus4B6294f2yigyfAIqAU3ZN6rzWzSO+gN
	RXH9c0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kwB-00000005Lbz-2PtC;
	Thu, 09 Oct 2025 07:19:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kw8-00000005Lb7-1wW3
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Oct 2025 07:19:42 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-57a59124323so829273e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Oct 2025 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759994378; x=1760599178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c5+mJ/UHP/9LbfelQ205BO5Ehj3e8KPSEEqoMsr+r0=;
        b=hmRSvpDAmUxtAbW1jP3OTYmgodzbVtBzIyLSwFXZQddlcXWJGzdz6YvZdlyDzWLCrU
         sxxfJF4JbfR8MHdh3ezRFHRDYBaKaIGXwjrjUl0ulQzqXTh8RAVXpqBcuWhJoUa6c3MK
         PTFEInq2QUi7tt80qvgnCuHiaitkS11hwXuFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994378; x=1760599178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c5+mJ/UHP/9LbfelQ205BO5Ehj3e8KPSEEqoMsr+r0=;
        b=nCB4ydHXX2BSyyjf9/agR0YfH0hBBe8rwvMUm9ehHyLfNxzAcgQKDOGyBPcGYELi/w
         hYTklUXxIXNfryVCOxSR9cZN7S0F+sd+VQV9R2EiUlEpgEUoso7XmkQCK9b2RWrcWqoe
         5wVjKz73SFgprzUHoVhmrfKS5r71VSuOMXKDuUro0eqRGjLuMZ0tOgFtZy/sFY8y7JXO
         JP2meqPHCJhmDs/OmFwxg0U1RzaRUBGPa4q+twYOVB6ttps3tkKWKiFTU/6h/LCkeZU1
         Ddo/77iWNhe1lGsWqVa9puumt1YhS5ID+NbfEoD2wj0tfYyc+b5O6801IvQGEcMWEtoB
         xzEA==
X-Forwarded-Encrypted: i=1; AJvYcCU8CsJc4is8KgBCjCPD9ceTzKymQD8spmM3zuK/SAfzTHmaVsFFJVo9j0LskseXH/6OHwuTOEgej3dgQKKS0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1NtcwtvH8dOU/xIlj0Hw1K9M8+yRDCEypE8avlpjfvrac3oKT
	Oc91F34YbWJy0fQiWNrfbyX6A+JwwrG0iaGp6XShQRCd92Aa3t4Tjg7j4uONI183XYTY4+8HNsX
	TicwySmig6NIMFWCf+UiRvZSYnyqwHz5YlxcoSmS8
X-Gm-Gg: ASbGncsNEgizWLB0sk1IL4kEc4PhLSR79NHvHscf3cHlB7ILlEqtg/oPKqJ64vjR5kW
	mjOZRiN+ixi7rdTd+NA9/d2z6t6oJzOyRrzjH3+TZciAO22x4/UACwqYUL7Ip2ypVYzvIf9Y0AM
	9MFQQ5VkQpF53htxIipikRfONZMOU0++gxYYA4QveDx6CmsydssZ3NNCPZCyuv7JW9febNumL8l
	rLgs/aUj9cL5/Sm/vIvcurCig6MovNK8feOE9JQ2Yz8FSIT8q/IzhHu5CNMEA==
X-Google-Smtp-Source: AGHT+IHSaW0g4YpO769xUwsa4iNj202mqOPzRJ46LGO1j2gm27+8xePTXEdB7gctFN8wB6vE1Rr8nunFbpgl3JoXAJg=
X-Received: by 2002:a05:6512:a90:b0:55f:6759:a792 with SMTP id
 2adb3069b0e04-5906d8ed836mr1731541e87.34.1759994378341; Thu, 09 Oct 2025
 00:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:19:27 +0800
X-Gm-Features: AS18NWDNV8mYg3wiP9Z1G6zwejV94_0pr6WyN1XzhbiCP9cR62AhpDcipKqCy2M
Message-ID: <CAGXv+5GGSKVwvQihGVJNch6qxv88t03BcBhN9tgB=K-5VvN+Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_001940_564986_C7E5A61A 
X-CRM114-Status: GOOD (  16.51  )
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Actually,

> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pl=
l.h
> index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3b04e=
9ab24c2526471da 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -78,9 +78,9 @@ struct mtk_clk_pll {
>         const struct mtk_pll_data *data;
>  };

Please replace the |struct device_node| forward declaration at the top
of this file with one for |struct device|.

> -int mtk_clk_register_plls(struct device_node *node,
> -                         const struct mtk_pll_data *plls, int num_plls,
> -                         struct clk_hw_onecell_data *clk_data);
> +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_data =
*plls,
> +                         int num_plls, struct clk_hw_onecell_data *clk_d=
ata);
> +
>  void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_pl=
ls,
>                              struct clk_hw_onecell_data *clk_data);
>
>
> --
> 2.51.0
>

