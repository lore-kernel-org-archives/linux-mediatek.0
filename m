Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39347CA0EE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 03:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=; b=zQ2DNzYJGfABvw4c6ksaIQ+uKm
	ifsiWWI8dR8xi6xRCBd1oeiFJIsBqj/yOtk8nDskYq6Sk7voLNe2Os8WV1DdqYAsT4KVue54XJNB5
	/bxqbNh2wMxNL8p5UB5metylwMGQpSMhr4wgpN8Fc06L0ciY7Ckav7cYynTUxMN2itX2Bapi9iuMI
	+g1VUjhDDy4YWkXrlZh0WRrU3Vsjp6kesZLv7ru41O5Er0ITD9x/Ak+5SgnXfuHh37NyMjzNAzxk3
	Ji+G1XAXXL5n/0/eZA1LtmGVfMSdF/Eyimhg2Ct42G9HB8dcB1lTx0X8a7TZMifEv7HnaWBfaq8rj
	bjmeef9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlH1-00000001JM3-1Ivf;
	Fri, 15 Aug 2025 03:38:35 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uml4h-00000001I5s-01BJ
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 03:25:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so1246204e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 20:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755228349; x=1755833149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=;
        b=Yfqhm7/NTQ8f74RK/2/cmbalMPyPFKlag65hYBLIXLVHt3opj2I9ss3wTgJkf1GIc6
         s3i43uhhV6JJtjalLlWkn699zHNCLn/dnq8CaFDhz6PB6Pvui5xFCPiGo37q0avSMUTe
         3GOD/PNQRVVtG6XkJ7uuetsjg7JVvXbIOgY38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755228349; x=1755833149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJdg2qnj0enHiTuyutu3+3woV8+hTcgzDCVgV816pbw=;
        b=snt1UN7faiCf+ewQBRUPPmLzBNfKtYuvdyBy0mFxmKi/MV6MEvLh7UxgL6bSLQ3oYQ
         OJOcMkjBOd1gtJNy+Pz9/ykyRSxg5aJOxv6RddWbOBPlqSl5kB48FimbiQZ/K0aQilld
         IGXOs/95vQmwLIfR6fMpSAwvcICWl8Q4xbI3WRNgjwrFZWCGxDMDMr4+IEortVtWk6qo
         /AWsxjTbTqGTEGOOs1lc+MzvOtTb6JZCRYrTjvBrCsAXJxX1iiCtZ1cLvfvZMKsHlHJS
         CB9snPwXXgwqEnlffRGeBB2mmTW4+sWkRc2Ijjiz1sOJFlXQaPgrwMWpDSeSwfLvGTwy
         05zg==
X-Forwarded-Encrypted: i=1; AJvYcCWdPhfZBVIQflnn4B2OtdsgNZFMmlnzTTGzdKqLqgUcScM46+5oakucdOpPnq/O4TW3F7J/DnF7gOSqxhTzTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLzL+JORRPUHVVtDd4TKapLOGVlaU44pbMiSYGFXv81ZqAFlj2
	5Yn2rn5KchSDXPLyUfzYF4qvvpbbOBoPMKm0ixKkeJWsLseyiOZSey2EePJjoWLR+mH4XOWN1OY
	/A30dwaPieF515FuyO9CTZLnVTNlh1CqQwe8tDJkz
X-Gm-Gg: ASbGncufa9GLcOPhf6pKwDAHiu/iG2dmwV+wkQHMZXTWtRJsVRKePeTM+UyC4NFH8Fe
	0HiBIpz5rKKtQ6DpthAwxzz7dj9ASiBd0ToNxW+YV0BU7k8dIFN7EMwILfVyl9conl0r5FIsjpV
	9gS5XQ0IbWPkLAJ6ismMvvYr3PUALc+4VWR9v65WU62TDUd2XRTtvJY/71c+VSd8eABF1jz7tMQ
	SypdXeCUIVlzc6uis5/dsDzMVZjgfiuXwOqFm7XgVIVugSc
X-Google-Smtp-Source: AGHT+IHML+FnX/LTF4Glnv3hTMjadeJlzca/Pry92PrR9MSNtfqTK7+3shW4DsnQEIw8uD+VwPOVAyVIaNye6SvIV90=
X-Received: by 2002:a05:6512:250d:b0:553:3a0a:1892 with SMTP id
 2adb3069b0e04-55ceea26136mr167317e87.15.1755228349428; Thu, 14 Aug 2025
 20:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-5-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-5-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:25:38 +0900
X-Gm-Features: Ac12FXyNFrgNnv9v_gZ4B-DIdoLeQQJfDCsM2y3l0UccKVx-_zcaQDAz8pYASzA
Message-ID: <CAGXv+5F4r+tN4vFVFcL5U=o2WrNZHUQN_VNTy=qLo4MKTrjmcQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/27] clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_202551_047581_1AC81545 
X-CRM114-Status: UNSURE (   7.44  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, some clock controllers use a separate regmap for hardware
> voting via set/clear/status registers. Add=E2=80=AFmtk_clk_get_hwv_regmap=
() to
> retrieve this optional regmap, avoiding duplicated lookup code in
> mtk_clk_register_muxes() and=E2=80=AFmtk_clk_register_gate().
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

