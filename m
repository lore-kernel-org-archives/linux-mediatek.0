Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A82C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMc2AnlV82kWeOQMw4Z57Uy8gyinuEGs+efX/3BzdrM=; b=N/+AP7IWbccr65jVH2uoikoLy9
	q3mCz1qFm2pN/ipXlLYioBmgutznw9n3tTSvKenI/G7mDJ60f0bD0n8wX2rO8riVGEMygpkYiv96F
	BHowShMKn40OAjhu9KCqW8bTATu/kGQYIthiK9ApPdIf5S0GG6H1Ra+ORXc1d1DbEdfL2AvAK4NAQ
	QtPUjzo8MXf6TYSPW+0Xmi6wx12znvWofEQm8sOJDu6leExiYFtEsg91Pem0ESPWBcbAQvkRwtViK
	wvGtrzTY8Kg1f7KP/4rfLuS8oP6uxOCvGUjgFQzTP/+9efn0epdCeL80SH6naESrOSBfYTOekHUpS
	q8muAJYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAhB-00BNmn-2V;
	Tue, 14 Mar 2023 19:52:29 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAh5-00BNjw-2b;
	Tue, 14 Mar 2023 19:52:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id h8so22941684ede.8;
        Tue, 14 Mar 2023 12:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678823542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMc2AnlV82kWeOQMw4Z57Uy8gyinuEGs+efX/3BzdrM=;
        b=GaBPzv3wgeHg5mdOzdiwOVazLXCDhdCOrdePbsgJDi21f+1qnJM6ELcpmu7tU1rMST
         cjE8SlnKUyVc4FxAIbKf3kico9yQhyCmf0umFoCZlG8v7KZ0XkFh8PPO3cbZAyTm2nCH
         N/kIfjmK/Egjl5SbHw3k/SOTTT6+sIiCwY0kZpqrJ8gMnQq/7AIDTMp8yEnpdz4rfQuf
         D54Rs5kZCp++koUnziuR0GUPgtpl8GPiw5dywdDwOYVUCaLameqj32/emey+m+Tq2FGK
         OIou9a5lMr8BdC8svsyN5SZf9s8l5a3EQLYTP6FU0J3IWkhor6AUTxk78E26aUy22uE6
         zKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMc2AnlV82kWeOQMw4Z57Uy8gyinuEGs+efX/3BzdrM=;
        b=KsbWNNcA/CJj0BKmLoSRxWPf+UUIB4Y/sKkh6a9fnuyX9DdxC5pptGGuIV64tPKheg
         9yK4F47vMEoPu3uniSycl7eLMjjUAVKFiSw/6j8EogsUdPTaeWr1/DKq/Z9GIYyoxVVj
         sMj5NFd61tl7Vaztv71JESJSWSlYMeq+P5QhbdSenLhLKUa269thvoAor52RvxnCtBhO
         uxtOq/5k70kMwEnZEiFm34es4zo7sJoA8XGc0z+bCeY+aXLOhZnyvK3NKmJEDp656C5Y
         I1wT0SHbx/QzEMg9sGhlZD17nScRJEyRQXClIT/UWdf5uJwDAO/I+lrCT7cDo1FD17+M
         UbTQ==
X-Gm-Message-State: AO0yUKVHym4onCkmI7ZMAybdHguk3cPsjNi3JBo5uiEqLDso7ZnErMFR
	SHgvo3eMiguwmc8E7ulU6rA=
X-Google-Smtp-Source: AK7set9lGQSvj/0qLoxjjRbWIJWyy4clOJmKgKtnIzH8T77Xxvcq28Mg1JfG2Pp6mT42x0CH2tiMRw==
X-Received: by 2002:a50:fe92:0:b0:4af:62af:460a with SMTP id d18-20020a50fe92000000b004af62af460amr322583edt.8.1678823542126;
        Tue, 14 Mar 2023 12:52:22 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id v10-20020a50a44a000000b004fd204d180dsm1484455edb.64.2023.03.14.12.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 12:52:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:  Re: [PATCH 17/28] media: platform: sun6i-mipi-csi2: drop of_match_ptr for ID
 table
Date: Tue, 14 Mar 2023 20:52:19 +0100
Message-ID: <5654872.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230312131318.351173-17-krzysztof.kozlowski@linaro.org>
References:  <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-17-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_125223_850711_AB11204B 
X-CRM114-Status: GOOD (  16.08  )
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

Dne nedelja, 12. marec 2023 ob 14:13:07 CET je Krzysztof Kozlowski napisal(=
a):
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>=20
>   drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:751:34:
> error: =E2=80=98sun6i_mipi_csi2_of_match=E2=80=99 defined but not used
> [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
=2Ec
> b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c index
> a220ce849b41..0851b6b4e1ff 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -759,7 +759,7 @@ static struct platform_driver
> sun6i_mipi_csi2_platform_driver =3D { .remove	=3D sun6i_mipi_csi2_remove,
>  	.driver	=3D {
>  		.name		=3D SUN6I_MIPI_CSI2_NAME,
> -		.of_match_table	=3D=20
of_match_ptr(sun6i_mipi_csi2_of_match),
> +		.of_match_table	=3D sun6i_mipi_csi2_of_match,
>  		.pm		=3D &sun6i_mipi_csi2_pm_ops,
>  	},
>  };





