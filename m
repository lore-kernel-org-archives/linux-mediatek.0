Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E729C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 06:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQ6eCCvP2RIqVFnGOfA4yG/2BtjQTMpdxc/JWs/IikY=; b=Vaf9gk1NFRlCkE
	9zG2pAVL3kPKFYUHg5Ttim+RzWZ1+fD7hOpkm5gm6K3xFVLxzDyASCqZ5M4y68AMoOlB6eTE128fu
	JTFzWwWOQAIaqkqyavN0C+bdYU8I66J2gnF0EHThrPpAB0swp+p1u9nX3yMFtSYDykkzoPz6CHq7X
	e9fa4FVIPdcp0VL+Cjpyhgn/4lv9neOSFgIQtB4JU6ycL5l3d3S1vY0gQwekNLor/HoqK5jv9d+hZ
	3visDd8ZyLv78xet9njGLkX+HrOqOpZVJRhySVk2k1yPJYRv2ZFpSf7hkfqYONgZ44WvMMXD8GOLw
	ThEg0xGR2SJcagI9VN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cgz-0056EO-7Z; Thu, 01 Dec 2022 06:05:05 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cgv-0056AN-Pw; Thu, 01 Dec 2022 06:05:03 +0000
Received: by mail-oi1-x22f.google.com with SMTP id l127so1002168oia.8;
        Wed, 30 Nov 2022 22:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ6eCCvP2RIqVFnGOfA4yG/2BtjQTMpdxc/JWs/IikY=;
        b=PvHY6dBEyebJE6QNI6Wjq2MneXIl4rTpGS7fBC7Qv6R/Yiga7OIh4/Pj4BgHnrpndG
         GrmgooNZOVFverQjG/PwQwa+jNTTeu5eaofi0fQ6sUgKspL/GgqiAAoT7DsAPA/bcNeL
         CuuBxemNVt9HiH103qegQcLdL8byYtx9q2Sy8nfwvxBZulJQ2g5EAZZ4I/KTXdccwea1
         xayFiXCzBGxNpmCBPyhigLfeSVQaNBWPI/KTZtc4+CqnxGM8xxSJGEpvpTJVaXAoUIMI
         LhDFRKO2nzxUjEipEZonE2WghJNoafzVk4PIFC+1xTm7vj4OLlTNuK0dUH2dye1MdJio
         EOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ6eCCvP2RIqVFnGOfA4yG/2BtjQTMpdxc/JWs/IikY=;
        b=PLYZQc+7NuTFOuzQB/q8o8GOgOmKF+cR6OenUJ3oPg6GMkNyQX1hfVgC8y8APsS3jf
         MO7AH8t4kCLmLXGmsxG6beN0+4NC87mPIS/NcNGUz+ER3BfHFIW4bzfy84Fsrmw4nZFO
         XxyZ3KQZEEYIM/Wck5+OYFv4DBz1COmaPpTNkK+WBKMmW46sMYugjQEZEgEWx2Nr+eP1
         1dF6uH8gDwav10jM7y+cIMswHUv14/2LCssPLXu8ecD+Cf4cwuQw3kdu63bOLjrey/Q1
         6MFJx2DuPbq0k/SFvXouwNDf6q0O2zSzdvVTYw+I5/h1PabdejbaPrMEnsENWYqd25S/
         +3kg==
X-Gm-Message-State: ANoB5pnnFmcz9R63fmpzr1VFl1/AKM+z2gaoT7JSauE1bQkK0eh6uHU7
	CTsJlzb2IB6HMlVfoxshvUPbo9Db69zJhQcLav4=
X-Google-Smtp-Source: AA0mqf5l2e4XTILLZHTH7QTRBPvz28RAyHNavvCrAHgTBlylFcIYKmUFvkgoGR7uLixlsP/mcB3a5GSDsiHvA3KSd08=
X-Received: by 2002:aca:60c6:0:b0:35a:51fc:2134 with SMTP id
 u189-20020aca60c6000000b0035a51fc2134mr22358640oib.144.1669874698405; Wed, 30
 Nov 2022 22:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-5-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-5-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 1 Dec 2022 07:04:47 +0100
Message-ID: <CAMhs-H_yk4_ieChz9ZaMgZiQNSO7RxhAXPN0nHWWxbox=qY_mw@mail.gmail.com>
Subject: Re: [PATCH 4/5] mips: dts: remove label = "cpu" from DSA dt-binding
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_220501_913027_5E924D28 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 30, 2022 at 3:14 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

