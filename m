Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294B9CCA480
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2PQt3HxkBxUYjC+VtlXEq4NoCpstcc7waq7Ie+ZSSw=; b=RcR/4RlHifschT9rCNFT4+Ge+M
	nOcswUxCVSf9IRwhJlqX1hk7FL3s6y1Who2E/iwPevx4ZjYyTDHaHjovXFs59+VRLpJYmOCb1WanH
	sqNg3EhXLMhd1jddctUwqlGL90rrr71WRbJqFeyYaAyFMfoYfsIyhg8Yr1PCoJLgb70Rr3bf4ekGW
	0jCtKM4+rPmWeVJ4l4KlRrdxqljZJ8SoUnBprMnlC9yK3r+tqcY1GJDB7/j8fpCt51O98p0jyixAR
	jy296gk5yfTeg6lKPlwctRGvqE0tW6O93MKxO8IQ7i6db7FhzBWu8a6ipilNs24U4lRrAL3HKfztK
	XCutY4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7qjp-00DXYo-OP; Sun, 03 Jul 2022 03:57:37 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7qjk-00DXUD-Fj
	for linux-mediatek@lists.infradead.org; Sun, 03 Jul 2022 03:57:35 +0000
Received: by mail-oi1-x236.google.com with SMTP id i126so8957079oih.4
        for <linux-mediatek@lists.infradead.org>; Sat, 02 Jul 2022 20:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2PQt3HxkBxUYjC+VtlXEq4NoCpstcc7waq7Ie+ZSSw=;
        b=LcxkuQlcBom6K7cYz2cObFcKqvmFziGvIewxr5CVdQDXpiVs4Qe1p9/ma3MjpEBl0m
         LdiaLTeEwxUPT1iylGK2uBRwa96fvGW0y6QRWq5F+NZCFL6N1e6TXJlkAQCGEx5XaKBZ
         bMXT/f+ogoq6vs4TCzgBdramsCAz0nmWRD4br2nzTC8FHRTsVjgo15di4+fdqYbsWQIV
         4/vga7HK3myEs7r2HcBsoYeS5QL/sXXpo879hazt2tPiyyJMP+yzm9vvBM9i2od8IqAh
         LSpFzHsWhZD+5n1ToMnLkj0S4zSlSFpghH27+UmeVqnGiX+vxJHJBYAk1fLnQfBbxsFF
         J2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2PQt3HxkBxUYjC+VtlXEq4NoCpstcc7waq7Ie+ZSSw=;
        b=7rvspEUoctNhL3e5YXpwb5DAF/lsmmS0lAs27BtX236MzYtwv0IwuIbAtkalO9LiEp
         ByUgShiWV+L8K2r0lzz0M/1H1NAg6WTMcimoYj73OZCsfaROtHkWHkBhM7jTgqBGD0iV
         BTd/1kfd/EDwWEWMrI/mGOO45tRY2NeuXiDRbIyDenXpzoMUL82FbCNMCN9DMQ/gdYsi
         IBD1PNcdK7Va+ILj3dxq334eieLMevQGADilWDo31po84eamBoN5Hnlu8hBAhmLXGTGM
         pmMP4R7gkrPRkD+6sBJAx0O1+MYG+VZO7E9+dlY0ktrear3+ZT+I/cNhVnPFLR26cq63
         +AfA==
X-Gm-Message-State: AJIora/VTSSst0EHwplEFZVFMK9Ka6uul3QS17yesWDy2KBf+iOPAulm
	176k46oDFcqEM8hTks98wC/38A==
X-Google-Smtp-Source: AGRyM1vPsLVLSd2YTyZeBHDlHn82rVPH0GlTr+Bdo5oMuTiVoQgn60DY/3PL3sh3O2ct5ts3e02W/w==
X-Received: by 2002:a05:6808:1b25:b0:32e:e59c:3901 with SMTP id bx37-20020a0568081b2500b0032ee59c3901mr13881725oib.186.1656820650648;
        Sat, 02 Jul 2022 20:57:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org
Cc: Li Yang <leoyang.li@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rockchip@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-tegra@vger.kernel.org,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-gpio@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-samsung-soc@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Heiko Stuebner <heiko@sntech.de>,
	Nishanth Menon <nm@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Peter Rosin <peda@axentia.se>,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	openbmc@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Andy Gross <agross@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ray Jui <rjui@broadcom.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-input@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Chen-Yu Tsai <wens@csie.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: (subset) [PATCH v2 00/48] dt-bindings: input: gpio-keys: rework matching children
Date: Sat,  2 Jul 2022 22:56:25 -0500
Message-Id: <165682055971.445910.5189932421143220440.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_205732_571466_4E389CD1 
X-CRM114-Status: GOOD (  10.87  )
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

On Thu, 9 Jun 2022 13:37:21 +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[27/48] arm64: dts: qcom: align gpio-key node names with dtschema
        commit: b08f5cbd69dcd25f5ab2a0798fe3836a97a9d7c6
[28/48] arm64: dts: qcom: correct gpio-keys properties
        commit: 5a4b0b853a2914403746b0a1decab695202ff242
[29/48] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
        commit: 9d8840f6ee426b6dfcb65bdf39e2898652e2b1e5
[30/48] arm64: dts: qcom: align led node names with dtschema
        commit: 3cfe94d660a8ebc19e78ea0a4781d7e9a1054c65

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

