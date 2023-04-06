Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E94C7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 14:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D46T9b+JJuDM9M92e3n0i/9IffXB1t0ukgzPjf3oFz0=; b=veFKoDrS/Oc6oMtSuKe8EzVevN
	6GwnSIehcE374Jnx7cV0a0CiBq47ZkBOwYrGeZvxO/GRRuRICiQv9DLLa+97AlC0vV8O0TERJtgnM
	XsnnTpV3kfPrvI9r0MTzURMZyuF8ct4/jM8cJ4iytgv8QNME0krkm/ZxDV7eyUYM1/TjML9Cm5qFd
	VYkMYnlH0mNbP1puoeLLtuuLRo/ZXmZVi29WI9J8bqf5t+zQsxFw9PboCEjMMBEnFegpu2G1g+Km6
	1f+7hERB7aSQx+bVNS3nSD2L6om8s86LZeUP7Fm2MR8OfvIbMbjtjr12eRBXZ5mDb3Amlb8XFMPXu
	kK70RsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQXQ-007ZRW-2T;
	Thu, 06 Apr 2023 14:24:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQXN-007ZQc-2A;
	Thu, 06 Apr 2023 14:24:30 +0000
Received: by mail-ej1-x62f.google.com with SMTP id by26so1824340ejb.2;
        Thu, 06 Apr 2023 07:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680791067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D46T9b+JJuDM9M92e3n0i/9IffXB1t0ukgzPjf3oFz0=;
        b=A/r7tQ0PnsQ64+9g5Gfs6KSA3+qzI8bsgiGZZgE16Gp3vDtw48exdxiJ8Iz0C07izX
         nuFakgJIseCy73hgs1F6h2/NT3hOmk4B2+vQ1/kj6uh1MsCoh4Xm3gIf1WqKJfgBlCTr
         5v+5SOI/bR2os9onRTUEA8D7WUIBmBwcGEcpQMk44PKMF5+/8y6eM0RBMrkHqTd9zDqA
         o0gnXO64FgVrQda+i0mrswuPYmK0GeXHY40hI2D5pTE/WZ5nva5EeOxHftNIBGZlR5qU
         Pxr9m3VOqRlVUj4Zm7ck3HRqlTYQzthHHytI0qFfjC2WwEurSX//CLE+NKTxlW4yOw5n
         0JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680791067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D46T9b+JJuDM9M92e3n0i/9IffXB1t0ukgzPjf3oFz0=;
        b=DRuEXfAYkyQS1EcFVgN5M4HH4sRZ/70ulwD8ViCtAsmTAP/zeEOlEP2LP6p19bB2w4
         z+57W/FrAjm1i3lNaFehpbpnl6Md48AnhScyF4G0zc2nLw6w27FB067LomRdUf+BmHnp
         or1KZ8BY/JfYF2eghREIINnS7V9cdz0W7XYbGwGTz59eqxZ5c/XUmtzpE40WuLiSgCJ0
         jsDWx6/iArIT7aT8A3t9iDJfkAmrpMbD8EPlUKw8RylWpTE34+gSUbrT8ef0iN5EkJX5
         raXseoAsl5iR9g+34MAOYuzdg+/CTNnmSvkYJxtKyeLU3US0+pt8100DXpZHGRpiWH4q
         9Y7A==
X-Gm-Message-State: AAQBX9c/nUTRfIdf2pvKnQ8kHFhbCRDNVcm0WRbmux6H04f+e/ID/u0u
	XAxNrwAZCvhgId9hQpnimrE=
X-Google-Smtp-Source: AKy350bCrQlikbBNVUPFFO3VqIfZ5VOfMh1r211B7R/tc1dagRENa+zD/kM2XqL0g+dZplFOqWL2iA==
X-Received: by 2002:a17:906:9383:b0:948:d1af:3afb with SMTP id l3-20020a170906938300b00948d1af3afbmr5046735ejx.13.1680791066760;
        Thu, 06 Apr 2023 07:24:26 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g8-20020a170906348800b009473bbe5f7dsm851290ejb.208.2023.04.06.07.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 07:24:26 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	u.kleine-koenig@pengutronix.de,
	wenst@chromium.org,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	jitao.shi@mediatek.com,
	weiqing.kong@mediatek.com,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] pwm: mtk-disp: Fix backlight configuration at boot
Date: Thu,  6 Apr 2023 16:24:25 +0200
Message-Id: <168079104605.1968941.232523344220592816.b4-ty@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
References: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_072429_707942_6C6B24AA 
X-CRM114-Status: GOOD (  10.05  )
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

On Mon, 3 Apr 2023 15:30:52 +0200, AngeloGioacchino Del Regno wrote:
> Since the pwm-mtk-disp driver was fixed to get PWM_EN state from the
> right register, an old two-wrongs-make-one-right issue emerged: as a
> result, MT8192 Asurada Spherion got no backlight at boot unless a
> suspend/resume cycle was performed.
> Also, the backlight would sometimes not get updated with the requested
> value, requiring the user to change it back and forth until it worked.
> 
> [...]

Applied, thanks!

[1/2] pwm: mtk-disp: Disable shadow registers before setting backlight values
      commit: 36dd7f530ae7d9ce9e853ffb8aa337de65c6600b
[2/2] pwm: mtk-disp: Configure double buffering before reading in .get_state()
      commit: b16c310115f2084b8826a35b77ef42bab6786d9f

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

