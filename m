Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEEACCFA18
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=; b=a/JRXO1UMTm/26BqHM5gjmxkVH
	KXJNTZlNF7udHiaJEX2baO2x09Q5ZCk88b7C+2iOW+QviiCQFR9WHq8t3ZJMwRrP/0rat9S3csLSE
	1mgWWhFXEjEocew9Fr6ztQETZFPcUAh6C50O1nkPsmmE1zAmeFIJqL7VIDhlFiily1VPTln+vPjT2
	OurT6HHjv6g/fEoaCXYxHgdzSpFldQd+b8TmcL8a7MoUg0rIE0eb5CFd0HI1FbU4nSEIXS04BGXj1
	Bdb9xySQf4oBfz/qv+kQ+sR/TxyVKuWg0BVJrg10859jM76uVLo3nLQjuT0JS8oPCfHMUJGfHDlV8
	K4Dskj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi6J-000000037AB-2QDS;
	Sat, 08 Nov 2025 12:31:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi6G-0000000377y-0zTM
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Nov 2025 12:31:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3436a97f092so886257a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 08 Nov 2025 04:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605083; x=1763209883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=fIf3w2bVAq5YPmJUA5shFinG41AWqtA8AJ+wOdu6FDdFKb4bFzCoRSv2zscTXlHI9P
         uyA69YFj5QM78PX3FsfqYpO4eVCCzv/jBnJRPVfScrom5RNjPdjn7t7rvTTRu/23y/HP
         UDhdReVDcHcamhCKS2saDgsyiM59bxAH1aVL2Yyh94YEqAkavPusUmK7YR/3xS6LK0Ot
         9s1rt+1mVPIXRhMpoT2g3PPMcyauZVOIRXJb/X7luStQhiD4q057CkEp3dHZf/k0iAkn
         3Q37nk51SLy4BXqEQ8NMO3C2wQvi2v2bz22iDsiTg+DaJimCBId47SsQb147ipow31m4
         e+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605083; x=1763209883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=kBd7r2lt1bPeuy/GtCM129SPdBfE+gk2dR7m6wLrVRqs9nG0fQxO3KaxutTvNuU2WS
         fOch1WzihXY092LaRiCB41wTUl0Ie4iUPOQr/+ljg12KRKGXYAqFw78V6tOFjG9y0atS
         Kwf07CmnAbyUe8KWx0ZHXwmDGrBYJtuF4h4uf/Bjg9SUpw9SkjxpYIYcSUGVS/wprIEJ
         j/UmrgLD6DtpjBrRPQ3kcZSUSqT05vftGM21leHD6NONPJfGHVSMCIwhmuPkVa2f9lp0
         c7zp6vLNQDqflEjNmkK8KQLrusSQVVj0/h/qhSG65oMPGekH+iiTFS09Vmh1ZUQv+SyG
         FRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgCwBylJhWxdCY6V7tIhWtnfBR5/DuJNFiDmBeVMYg5fAbZkh3nyUzPiMdyepIW5+5bzPVTiN/tBxspHwShQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ8X2esmydoVQwLFm5zZkxaU/nyxJT7B0pggoMZ3Dlzf8W3hkq
	29uttCl7ZeJ32z85K3oKvQPGIyFzSO2G7Rl4qui8vg20X2RBEmlGNNJB2xAfJZ7zHqVlu7aIWHI
	G6e0wN0HesorB+NOhg6oldYV3DiXGDQ0=
X-Gm-Gg: ASbGncsm9zhsTwv/BKB7qhS7TTW6YIUxPhJaLF08r/X1WYKNVxA8pw5/iI73HqCoOHc
	oyOeaXjaxSxVLml5cCFN0MmafG1zMRQjTavxrKuIroJubBslapJSbBJ0WLvPgu6OJz9Yu4ipCLu
	X5JAz5R8qoGD9SFbqzQj8uuItPKMDLGoxTHSlfvUj7hjU2N/I4LJnbGppiQwVHV8uP0UCErO4S/
	y8j4O8aZvCdS9patYhegg+bvbWe6EDgLa9Yb2WWXcsu1cI5ysjXJI9ZoDXRyE/X032Bg4E/RWMj
	fM7LrkpnI6LxZcmhahBvIIejSrrrzuaxqJRq7g==
X-Google-Smtp-Source: AGHT+IHx494bsoHJaju4RengP4iXpGRFmMQLliiMWy2Q89R/cSWBMiB3q+hcgQyoomcv+0z0cS+rAooMlyw+VCTekJU=
X-Received: by 2002:a17:902:f791:b0:297:dfc8:8fd with SMTP id
 d9443c01a7336-297e571236dmr29139155ad.51.1762605083407; Sat, 08 Nov 2025
 04:31:23 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:31:12 +0100
X-Gm-Features: AWmQ_bn_kIDv-pwz4dNwmzBqCanYs2atUFgMMshyNEi0RKuzPdaQ1v4towlIcoM
Message-ID: <CAFBinCBp1x3KWe-5mWoGwFEVxEoSKhTXKYfGgNKS-eDsbW8X+A@mail.gmail.com>
Subject: Re: [PATCH net-next 09/16] net: stmmac: meson8b: use stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_043124_310966_E8ADC473 
X-CRM114-Status: UNSURE (   7.75  )
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

On Fri, Nov 7, 2025 at 3:29=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

