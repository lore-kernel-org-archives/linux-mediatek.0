Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909C4109E54B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=; b=GQKO58Ud2wU3YnzeAifTcHKS0t
	ezdtS9b719l3kT0a5k56Uc7ywJD2/Qbw3/dEqlt4804qdFxRPQLA3Hs0xEeXkZxdQhEHOhfqEkDQH
	CekkZ+PYKtYVmZAU2g2c3xGdhJUg9aZ8o5sx991Bpsnp0MZNLSUGwr8o7e0WZYnDzSzftYHK2FnIn
	gQ99PAwgeiDYI/C2KvywIclgSUL7Eb4+ZSiDi7z4/oLcfnjaw50eKbmxOIlAgY8n8ar/LU5b0PT18
	EDowrqr+THbPldQlOZhi4EGrPzA1DBRevoEUXIIGi3MbaRVQHV1ZDYs0OZwqK3CCZuq+ld+n+ASlV
	8W84xMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eM1-00000004rDu-2hDx;
	Thu, 26 Mar 2026 06:38:05 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eLx-00000004rCQ-0LYU
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 06:38:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so731740e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 23:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507079; cv=none;
        d=google.com; s=arc-20240605;
        b=SNW5qf2oEoHF9Epx/AY4jahDlf0GOevlPq/6G5bmq64GITFwGcnifPj1hkJKnAW+57
         J7Ij+pdtBpdkLea2FXvhHzSMrEdAU5WZAV8H+P9JOPe3NBiqsEjKxN1KIfCEp/6NOvpD
         aKewSlCofTOBk9zibgAntJ6LwZimuem6nf/iPSjnbbEyYUgwuMCiYFNfq5RI+yfFyoJu
         4I2lZ71MwJofNvdHgYCGk+5hrGos1KkghVaBmMI7cwRF6cL39Y0bvJtcw2GzVH7J6gtb
         wz/dj3npjCldnFV7PcgPHdBLIZ6GV2V2ShHqjCQsfaFYo4zLqxs1XOvKemC/MBJy6/G/
         h+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        fh=tBNXN9LFqjU2eEMVlr9kBNK+zrrfAFPE+lwJv9VwEI8=;
        b=D0Q7y/GZi0QiXxgROpI7qenoXexgBRPWgm7Nr+OXJBHsXiD0b4or6ESBQaPixRH9/A
         f+sdvNpjl9SgMD7GClZGMGVWBk8yoMi4xz1yp5NpOhiWKDk0wmyRmyhckj4IsNnbiWpb
         LG139gevF044qgRsVGSKKe4Nvo5nVM1xqW41Wmnx8yG6BIRXN8vjC8HlwXr2HyLUPgOF
         R8Kzv+KoRD7ir/8JXhNTgkqxl+yPFTn2e2gCkcOHJmd8gMyKwWSbiT+70qAsXpGtxqw+
         Qm1Pec/mhvPnKDS2Vkw45vYkJRDEpBPt/n6GH5lcU1ancK7aFGoyYkl3vGELmfqcr0rA
         qARA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507079; x=1775111879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        b=cKzhhynNRLI7s2CcJnqUzZsBTsuDdaxo6IssoisgW7iDU+o+8YLjdGpE3TOvbPbRr9
         ZU2hf2z8nrFlQDvhbHiHLc7nAyBq/5Bcfil6ytNTNKfVNg8r2+ikocu0bnaKyx32Cx9H
         12rBcBVOD8sDCjGX4klh5UN9NTeDmfHYSKz9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507079; x=1775111879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tVhwLNRG5DJX+OCxWP8m+5PqP4pB8W/QHKcecYw9ug=;
        b=lfnaIajYzrak5br5XUBlUEd/ygwCGLdrpLEHAYI9dCmjtiy8/kXDFVJNjtFpJpr+wD
         3r4oa9R3Yh/DGPtX17cOwWB1kxCsmaBzso6bXBmejkdh+jOG5PpSHeB9gYy6PW9EWZsS
         ewNo6xt7zoIoRWEPJDhdRZK/73u37yD5TzWznU8navplOZtmkmB3yw3nsFGdIg+qsw1q
         yHQRsSv90BH3YhL36BmZ8uaMZUmh3vGcnCSjk8vNcZMRxmet5QgUlWREfqjAppps/gO6
         TMBQN+mlyL45zHo46Cy2nX4f/VZ4RYdWpGHp6gOCVHzrvfMD7mOdrDc3Rk7ukYxeZfmq
         jrLg==
X-Forwarded-Encrypted: i=1; AJvYcCXzWVU+Uqun4LyshJzQi346elqebaElfrH/j6U9yCLYA0jtAUBg91mnTgOWjMoy2BAouB0uaJeE1UCjpEdDaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGdKYnnvmMqllhpaHnm6MFKcsK9GZIzubYZFdJd/2+oTFgDLXU
	soaCXtFaekzFs5eZYRfeBJY1m1hC62UmbIpTiNw21nIxw9E9ea3qVdw0HMS67bRfd/srTTwQCa7
	jPanALKjgYNs8zpsyTB4ZZUBebWLJwPPTOTqw3ZT4
X-Gm-Gg: ATEYQzxHNpDe916xCkZZB7izHpFaQc1wchLiBIHJMlSPrzrS/3NSJY3jpsEdy3ZNYj/
	mz0ZJe4GSI/lfhWusLesbRepdRfYi1bLkUJ3rfQUhZBkmfAPSb1FVZDvHaFaHb0KYt7g7roDHHr
	jO9P4NBtcTf50cFVLwLU+PyvWd3QA40Rct/rM7tZCUdCASNiWo22qaoN0FPqjBrdrPIkJ8Ysb+Y
	IgImtUrwpWkgjlEu4qhbXPHWCimOXmwRWM6wOQ6g/5kTTzgijdxtVlnknezL0Cgx0DyRwxIgvkz
	7XcB6B3PcGRUF2XsSXxLNvEN4eQGc6PBW9y/7A==
X-Received: by 2002:a05:6512:61c3:10b0:5a2:9bd9:3e4e with SMTP id
 2adb3069b0e04-5a29bd93eb4mr1620218e87.6.1774507078882; Wed, 25 Mar 2026
 23:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:37:47 +0800
X-Gm-Features: AQROBzCzCBfG5zo_X8L9j-toqTRqPRgfo1sPkCT0CAUHICe3uzlCQupUiDPCQQE
Message-ID: <CAGXv+5ERgruwWEU9mxThGNaRy9i=T-_Miumh6m9uFRtZPk8uJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: mediatek: mt8192: use MUX_CLR_SET
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_233801_142375_895FF905 
X-CRM114-Status: GOOD (  11.27  )
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

On Thu, Mar 26, 2026 at 1:10=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> The mfg_pll_sel mux has neither a clock gate nor an update register,
> and upd_ofs is stored as u32, so the -1 truncates to 0xFFFFFFFF.
>
> While upd_shift being -1 (as s8) prevents the update path from
> executing at runtime, the bogus upd_ofs value is still stored in the
> struct.
>
> Use MUX_CLR_SET to avoid passing sentinel values to wrongly-typed
> fields.
>
> Fixes: 710573dee31b4 ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

