Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001E7CA1010
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 04:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=; b=18AQl9moEXlBQdDkRIlpo9sUaR
	w1GZ6DZHrH7khFlUBM/J8SHuNIon8mWgRjYryjH2SdNxDsS0WPP0YrmACgb6ktBf0FGtbVja2jo8Q
	Ogwqq0pkkNnr2HzUD9K6doyoIxRJD4LHCO3MEUg2wb5YulgW5nPnbAoFSikOKfkIYRMF0pog6aVHb
	YARV64LwFtGJl/N0ZXuTjagIOBRBfqg5ey1xACEGBeyawxiVzCh6fWGOmsuwYowMgp2v23XOoMDBc
	j9+RKyNkHjAmdJHjPTnbrKq6Kh0sOc2jyix1euVI97eOtZnEA/wmUNnMpvamkLGYHW79gxR3aR2vQ
	hrVKzUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNuE-0000000GgdO-0XaP;
	Fri, 05 Sep 2025 04:18:34 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNpl-0000000GfTs-3WZW
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 04:13:59 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-333f92a69d4so16256841fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 21:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045636; x=1757650436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=;
        b=eJCz4krF8stjNCtsi22j69ASVVMg2qkCNxeBohdPMdJgznwxFb+7950NhMDph6MRK3
         TQIq7CsCKvPc/y/QAKWe1N9HWQkCHrR2uDnbgpAW/EoTa4jodpycHrO+Hpiubmk0DcT+
         2GeCgV7RkYQ+qLkvXXL9EeQwnjUDQPbun9q60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045636; x=1757650436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fYRl15KIX0WePQH2MFQdJgEu6wtt4B+4sM9XqpEHp0=;
        b=JVSfGdhCTI8Ijc8bm0yqUQssw6ndbfZodYZdgknpl89TzTIMaX16ZX1vDsieqYWA5n
         8vnthbu6RjmWGo8L+fKC+P2332365xe9LymnUxHwSSjxf+0f/TAcoo8dqNKfOP9lSYpB
         xiE6zhmPdUJ2TVrk6BshSM/NMgz9w6U6HniKnlKpFRBOXtUTXvgrDKq2d7FV7GYPa0Rr
         13jIKhJzJdHst4r74XinyJRyEbkt+1fTdrbiBsgIJmcdI4eIKoHsh4MBDGHAEhb1YFeE
         SPSRAUiMhzQB2lKJcizaZ6zW2ODPo+/R4uEgEDqddDEEX9T26Nfco3t4Vs0AXxsDNVSE
         naJw==
X-Forwarded-Encrypted: i=1; AJvYcCWs0s2QhzZ+hKg/yKf0R5e7IK+BisF5WtIsKldXK/bWtAdI4bblsVnzJggo9K5hF2sA6HCn3Ivh5M2XT6DMzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgmxxD89HhT0oT3HPJqvzEL51bvkpuQqQjK9uXREB+Z6/x1Bb
	90YQZaimzEn0+q4OE+3kmY3Z+wxFP1H5boe6ntUH75dJIhL4CtNFnzsZTEKJXjzw8mph5yk4zQW
	pHT7IkNx81Gicqkq5hl4I7zAni8Esje6T3lGLEUnA
X-Gm-Gg: ASbGncu7KRbgWbzHLBMCsuCfJ0U2Z6EAJPzXjKocbV74DYy21rOatyJlQel+KmEW0ye
	KZJl4UD4Uw1shkRykd6dXqSR6u0ziM55OT0JuxC1GGTjpJudaGOB1WYKwsa8UuFuurT87zGPIHm
	r4RE6V3EwHa0ulRGvvWsnAAJeUEwg5l3mXVqzMEiRvqi29CEOndQr8tdLWyGW+HMOeYo+EYK7BZ
	NRpnG67CASnkjNC7rGkARGdo8VV/sto3oMGgfx33aIcMGWX
X-Google-Smtp-Source: AGHT+IEa0TMIVMFiRNiOTeyQqmllYD/2S0wrm6EQ9v6TWvwu76YIEfNVYAC1dteqcnsTmIHsn61yA6m1gNmuAQeVk3M=
X-Received: by 2002:a05:651c:2129:b0:336:51d4:16b3 with SMTP id
 38308e7fff4ca-336caa4a818mr59122681fa.10.1757045636072; Thu, 04 Sep 2025
 21:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-7-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-7-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:13:44 +0800
X-Gm-Features: Ac12FXztQWtNoog-vK5ygrU2ksjNm_shuXo3XvVwDmyxsQtnU3LNJR6VMH81zew
Message-ID: <CAGXv+5HjikmVaK_++METYBvTciQt1OTm77TU_e4Zh52MpCZ8bw@mail.gmail.com>
Subject: Re: [PATCH v5 06/27] clk: mediatek: clk-gate: Refactor
 mtk_clk_register_gate to use mtk_gate struct
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_211357_875112_F9949BB7 
X-CRM114-Status: UNSURE (   8.07  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate, and add a pointer to
> it in struct mtk_clk_gate. This allows reuse of the static gate data
> (including HW voter register offsets) without adding extra function
> arguments, and removes redundant duplication in the runtime data struct.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

