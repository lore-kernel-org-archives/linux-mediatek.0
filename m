Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784ACC001DE
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHphB4LnIXM8B5KTzxaE1knTLhvmv4UUsDUmEXJtUjc=; b=KJ494vnpXua51ZxBdpcQYWJWGF
	MxNf644Jd0b2vxO90ww1Uysc42IvbnutlEDPfrMt7g2Fh7OvsKDt+X2gqZxr2WpTjbuQSiMbajHdi
	1is2vqoYYpsQOpjks10gcigpK9TkZCnPM/h33AYZaplDmTYLQ7TlQjbIB/eVnJPBTigobrmgupBvz
	QC4LjhIGYS7wSfcTxeWFSIfl5cInxeIh5WkQ1leRLuuPAxjDdLLyX6SpbVboGjtwW9uR3d2VAJ1L8
	SHZFRu9fHFt5Kzu1cC004+3DXkxqAllHpMVIuCdl+2tXhht12i+n1uoYiWLiyiIfEFXKE3vpatJRH
	fU1Y1JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbYH-008IEj-0J;
	Sat, 15 Jul 2023 09:26:57 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbYB-008IDN-27;
	Sat, 15 Jul 2023 09:26:53 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1b056276889so2090123fac.2;
        Sat, 15 Jul 2023 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689413210; x=1692005210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHphB4LnIXM8B5KTzxaE1knTLhvmv4UUsDUmEXJtUjc=;
        b=KNtkg40Donc1RJ+Y/N6bMmujMSl9cywEa6fXVSQYqV4W4lT8G1IFlO5DKCTqezy9NY
         lefwY54PRhNWProidCgY7SJny7AEfavu3g+BjFgAL5dZzNMIElbAwgo4QZnm4OLwjy+V
         CVJWSo1L7gWOhYkpGKP0r9oukax6+UlfkfofBx8xxPcLUf3ek7zbTjABn/JHDdvTWXCu
         WWDX31kpkxyfmd7Q/WE+0i7y3grMAoIl2p8ABV+V0g6ZwAueUBzPNbjvXwLF4/1Voo58
         THpoQ4ecU8W2lHElPdLC420Acx2PDSK/3KkrYlQGhj1Cbwmy3bV4wSFCbbKfSoIqtJyV
         8cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689413210; x=1692005210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHphB4LnIXM8B5KTzxaE1knTLhvmv4UUsDUmEXJtUjc=;
        b=kHlIYqvXhlsHYo7ETWKyY5WUchr2JpdUgo4u8S+UiI1MKkG7LywgmdzuJJnBnXK+iY
         vfZ3ci4rXDc3RKFt0fV9ok1yyK1rWeCqPEbweCmhHVaN5/L47YDr6a4O3ZCLS2pQh+yM
         HybHB3KklwvslNtiB+nGiDsHTJt4lIgz3mcdfbSXPedg+bU0rLmsPMFmqaAI0/4QLIM3
         Wt2wUSJpqnINYnNvVlye43qPstAu6NibOvRwzSEZzIpcOuUPG/gffGpV/z3W95jm8was
         n2AzeXXv18/IVpHOotSTsoClgVFIeiCjhaP76qsQKAl+/QVhIoeEAkihIRBvptLkZHJb
         u4fA==
X-Gm-Message-State: ABy/qLaOE6Ocf30kVG+iwC4gRs6uO3FyqCQX41ZY+TxOUg2aFld+7LRR
	q1Nqs/TeEtV8wnw11wdE9whgOBT3LY7uMWiigrw=
X-Google-Smtp-Source: APBJJlGwdJmxyzGjSGIAgoqFi7CGlWiMJBmcsPBzo9lxW5BLyYxxPOYfHlixbBaupkZxkAV8b0mEWpZJ8j8VMX6oWRI=
X-Received: by 2002:a05:6870:328d:b0:177:a158:9ef6 with SMTP id
 q13-20020a056870328d00b00177a1589ef6mr6679986oac.52.1689413209848; Sat, 15
 Jul 2023 02:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174841.4061919-1-robh@kernel.org>
In-Reply-To: <20230714174841.4061919-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 15 Jul 2023 11:26:38 +0200
Message-ID: <CAMhs-H-6tAV-+U-4zZDKs47eKCJr+kZ-Op8vR4SyJyE5LK_2aw@mail.gmail.com>
Subject: Re: [PATCH] phy: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Yu Chen <chenyu56@huawei.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Alban Bedel <albeu@free.fr>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Marko <robert.marko@sartura.hr>, 
	Luka Perkov <luka.perkov@sartura.hr>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vincent Shih <vincent.sunplus@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_022651_698638_D5D4F033 
X-CRM114-Status: GOOD (  11.35  )
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

On Fri, Jul 14, 2023 at 7:49=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/phy/ralink/phy-mt7621-pci.c                   | 3 +--

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

