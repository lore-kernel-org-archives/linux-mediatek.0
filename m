Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F252DC35FFC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 04:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=; b=aaFobMwIxIEq+OLOpZEMppg78b
	Tc8YpY0Ja6/51ct2NSEY+enavCLBVAg9fWa5I047cBGUdFx5h8NlWTnkXZPD6Be8zAL8r7RMmXhl3
	h28yeMCYPTDES42XyBBkyeH56BnvgaQISBKb+65IKz23DEKbrzlOsAGdsYzbV2TH6Kp0mzqzlpzsS
	tPZTRJe4KbnH5X58u5E0Ze/iEC+zdH78pluuOW2WgSzrgdYbWF5u/NKKENeO6uQw3/WfYm6wH01fG
	jP/rmyK3QUE9YlttZwX13Oy1Y4xhnVszRKs4xW3kXc9Oai4OWmDdJYD7UOr0VdBYOC5K/VaxgSUrG
	yL09Yd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukze-00000007yN8-46d7;
	Wed, 19 Mar 2025 04:25:26 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tukyO-00000007yEF-0lMg
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 04:24:09 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so62653251fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Mar 2025 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742358246; x=1742963046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=;
        b=JTmGfPqkx59eOME/EhrctoN393BdIsZKBaBaAFnfv1lzxVKK5RIAdRciCeoCt1PvGL
         hS/IrHN62gmIlhuVAvevcAGHblGyw+tTkCRLtLHJjXJeTcY8JpmACpyor2C080R+FXu9
         erzFyHXuMW7vKahK9zxfFNWqjAwp6QZAlQfxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742358246; x=1742963046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=;
        b=V+C1W7ZyR+5Gw8QE44RCPCcIloncIj998i1m7NT+rGcpl88ew1LZWpadexi3sGFssm
         S1roV2R1XyXWGk1/Ndydej4a+W8r58rQQ2z2uSRbZ8OJpdM/YDUCMkVvsa8QPhVXTmm2
         /NQ0xdXJYWvK4w5pl8W/jtJ0R7LJUfeDI7PJ2eYxnIK0AhK/cAgMB1ZbE2XD9N7BfXZk
         2jYuPptK1vNRiHZWoUJzBDJfA6QxD5K0z97QWKte3beiLH4vIoM2U3L/5Ypzwi7/XpKQ
         mUSRSOyzBCr7GCCIrRX1bc05aff5aRYqL44Cqbk22a5ufelCDneNu4DEis9LepLtFK5u
         37gg==
X-Forwarded-Encrypted: i=1; AJvYcCVVu6n9vUZY9qtBc9+Wfj5E4LoT/1+BjLV4AlMMD9Iz8CmVgskqdceceNJz3zQq4xNgKedKBkVur55bDJMWNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDmlx4lIS23A5tiVvowHubaWuiHEGN/f2BMuqqOrf22TGp1n8R
	tuHh6GbwftkCdBM4Ojs3Mv4k6IPAlghD7RqZpjVE4naPSs7YDejKJKtBNSBvKriwaWGQd1ngAUF
	OPM244469tKjodoj2xNsPVMblM3xMSct3MTlq
X-Gm-Gg: ASbGnctgwHR8fCbo8eOqemJluKrbKQdxpv4h3Ijpl21NHrnPQ0c7Z/zIjWvbGPiuK0j
	aG/cGf+yBfZqUOjeHetTB2Z87BVZMTnfS4y9tECHGIStR7N9YMgMgyWYagJIGTsGp4YJzkNvtfT
	Rk7HfoiVIrsMTWhDUCWxv6wCbgoe6JVyZj6R8xv59r6jJh893dpSGScg==
X-Google-Smtp-Source: AGHT+IEWZEscaVFUOUAsNjIprCbhq625oZrV53qjtBJsRwdVvGNmpIniSb7MX6P22AGKIV1DoFhBcxyYIRqcNBKHkLw=
X-Received: by 2002:a05:6512:2342:b0:549:8cc9:67d1 with SMTP id
 2adb3069b0e04-54acb2050cemr276298e87.38.1742358246305; Tue, 18 Mar 2025
 21:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com> <20250318102259.189289-3-laura.nao@collabora.com>
In-Reply-To: <20250318102259.189289-3-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Mar 2025 12:23:55 +0800
X-Gm-Features: AQ5f1JpqtWWWC0q87IWTa2_visyDIAAE7HlagkjknGbBQwFRTMIurzAoihaTquM
Message-ID: <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	nfraprado@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_212408_225452_020A3C76 
X-CRM114-Status: UNSURE (   8.83  )
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

On Tue, Mar 18, 2025 at 6:26=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Different Spherion variants use different trackpads on the same I2C2
> bus. Instead of enabling all of them by default, mark them as
> "fail-needs-probe" and let the implementation determine which one is
> actually present.
>
> Additionally, move the trackpad pinctrl entry back to the individual
> trackpad nodes.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

