Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDF6CCFA05
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkBMuEFYniV7o/NZEZ9uUf/PpOYiog+if+0C8Zohm+8=; b=GLGnhrQRszR9IkvPudTtiJH7un
	oiL+3lgMTZrWPV6pXAchsg3pK6U01oap3uUdqyd2YPTP+GoKHbau1bzMPrDkncNOVXxLr2Z8kMciQ
	5+vudiXQqD32lgGvoxlYpbmxEl4Jo/zaf2WXS5e9gejcml2eL+rdtO+3d8gy+Ybqao5q5+YSGKxEL
	CJ3zKI+SDMC5GtvfbbUr3sB3hsSJLR1MrR/v2RKuPLUIqfWYTKpcM1WuxRUMOS8ykTDRlCUYXCQkc
	Kjeq4B+5L2EUodSYPUbmAejRktM2RPwLKN4gZXoB+J6VMhWp4b687613jViG/9/SxL+z57CNGQxrW
	aZIfzd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOtF-000000002aq-3jGJ;
	Fri, 07 Nov 2025 16:00:41 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOtC-000000002ZK-3I6C
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 16:00:40 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7277324204so160663966b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 08:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531236; x=1763136036;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkBMuEFYniV7o/NZEZ9uUf/PpOYiog+if+0C8Zohm+8=;
        b=vhjdIzfrfcVvGc90IAkzHra3Q2It9Cd/Hj5+iwLLJe1OeR1VUnRAp6sSu6JCQHuab4
         8IaYAsSqH7GymURQT3z6+2xA7o7VHAX0UMmXm0hKL/fJoG1myKBQGqQAfJMM0+YkIh+P
         Uyzshhwct/DRExG7rIhNyjn+ZDdgNlnbMwQxiQD5GPqSeyAhK2RpTEtYA0XVUfngLXSP
         /hnO1z1z3mKhhWeGqdnda6VKH04/6haF9dsHtFQfOSbNSmzW3qkRdv+ZWojSXEBTLfaf
         MQAR9sVxmH088Z0j1mPeJVBiqJobXZgjo7eHkll7f64UI+SLXweR/JWO/r9ssF4MKdty
         7Bkw==
X-Forwarded-Encrypted: i=1; AJvYcCVn7dQGAdlAAWoTCLA4WaBUsOuUS3Bd7Igd/8SRjivTcIGR8rBtThDYl+tlyZGCCxgzgTaQPG0Nn2FI90pULQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8PQGXjPnZ/zcr7dwf23OUQDXw7rhy6DUs+gOKqP9/b8MeCZRQ
	uDQaIhl8zpGl14sWN+3xW/IQdwwTl/P4/r4x8PdU6thFf2tjiVyL/vB/4ZtopMh4mzBMAMs8QAX
	Q3jt/dHFl7U+kFUS0Isdm4DKK5e4QU+o=
X-Gm-Gg: ASbGncuGMInBaQBMVAuo3TJzRoPmPF7xNePdrnw2/5ulNCb72Ez10W42V+vbB5XBpJI
	2y96K+gU36nESyO+r5cojakFAOSNwCg8/L2YRNUXOOQuQvWGQHt7Gge+Hb2facDcP/JX/VKIB2l
	/S3mLY9pXawc2pg02h7vbTDeP2O2sqJZAKoHzeKBqz6bT53g6V9i2yHxCdvMzMy3XUsJdLjWdod
	9H7RES8d7445yeM6Eu3ysraIf9+at4bEgg2gpafa/aCOQVe2hQcHgeYh4h1NyFYAKwkyWWEPabL
	k8A74DSG1RIgG4EMNQ==
X-Google-Smtp-Source: AGHT+IFOoHBXH/PzewtzvKKUtM610X3TQ1SmT9FLvQyuUDuxyBy4OLhIMpEqweiHRkcJBKlSnsBceRB/zJjkJgVr+9A=
X-Received: by 2002:a17:906:f582:b0:b70:a9fd:1170 with SMTP id
 a640c23a62f3a-b72c0eef5bfmr340953066b.65.1762531236039; Fri, 07 Nov 2025
 08:00:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
MIME-Version: 1.0
In-Reply-To: <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <kernel@esmil.dk>
User-Agent: alot/0.0.0
Date: Fri, 7 Nov 2025 11:00:35 -0500
X-Gm-Features: AWmQ_bnSZQW08h0NXQTG6zSRGIlnDRSY70b9JlHXkxjmDNLgOFrMa4uAbMmEPzM
Message-ID: <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
Subject: Re: [PATCH net-next 11/16] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080038_828757_D56C85EE 
X-CRM114-Status: GOOD (  11.20  )
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

Quoting Russell King (Oracle) (2025-11-07 15:28:55)
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 1ef72576c6f1..00078b7a6486 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>         struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
>         struct regmap *regmap;
>         unsigned int args[2];
> -       unsigned int mode;
> +       int phy_intf_sel;
>         int err;
>
> -       switch (plat_dat->phy_interface) {
> -       case PHY_INTERFACE_MODE_RMII:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> -               break;
> -
> -       case PHY_INTERFACE_MODE_RGMII:
> -       case PHY_INTERFACE_MODE_RGMII_ID:
> -       case PHY_INTERFACE_MODE_RGMII_RXID:
> -       case PHY_INTERFACE_MODE_RGMII_TXID:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> -               break;

After these two patches the STARFIVE_DWMAC_PHY_INFT_RMII and ..RGMII macros are
left unused. Maybe just squash the patches and remove the definitions?

/Emil

