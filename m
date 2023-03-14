Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82018C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84n+oQ302Lrrw4Xj5iionDKBc2AXr3E7Vl/qNdfFHag=; b=rPFOPEV9lmH/ly3E5kBfDCDR9L
	LuMNNRINsdHul9xYHo/8Sqcz1zgjphuXVWAa33TPh6ayjfud3Ff/XxPG9a+D0Xpj+0JdfsmFl+R+F
	St8NM+MngWETT29+Wa68UJpkhwlyLNrdUveREQ+ol/19wTq0uE/GKwOTOeLKNJ/bQYVXquQPM23rD
	DK/GbtCpKQwFuG6DV7V6WIs11ee0UZaz0iLE9JKiLETdCgA+ROEtS85Z8H7S7XCCR2yFXZ830U+XD
	IyIayy7SuWBNAVxYmDz5hmOLvOrpoKRfCeTOXYwhIVmUElZMwnm2aMjG8X2BlLeeZ4Kv3CFQtAjlT
	Odwt992g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAha-00BNyJ-1V;
	Tue, 14 Mar 2023 19:52:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAhP-00BNrs-2M;
	Tue, 14 Mar 2023 19:52:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z21so1423559edb.4;
        Tue, 14 Mar 2023 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678823561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84n+oQ302Lrrw4Xj5iionDKBc2AXr3E7Vl/qNdfFHag=;
        b=jtMqk3VJbrkKpAHPz/4m10k3iyx5QewNEjy33UoSDCoiTp8RD6GFTQmtaqMT8czpXw
         +Uk+DEy81/sRL+3LcFriMiCaGN+2szqqX4YISqDiRotNme1tvGk59RHvoSOnTXZ41+H4
         2fXlBn+jPV377GGy9kXTImtKGbB3Q9yjIbbmPTWqafGJvuomVcnaxDMFP4Kn1LwZ9/Qh
         6tnk8G5PpSbXhsYwd0NwrROnOAQ3aDVqRWTfN9O+J/cafAD/5ixh9w63wF1MEzxsGni6
         Q3WwEbB1tZrj6RlW+hV5MrOK4tSO9IEydQF34bmg1ZSZQZNeRAl2iM9Tz9aIGfGnJlAv
         hIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84n+oQ302Lrrw4Xj5iionDKBc2AXr3E7Vl/qNdfFHag=;
        b=VrOly0Kn6WezorT+E28ZPXzXtAgw74D65zxeupCJzmsLCpkRBZfvOSq8ypSZz+XaO6
         1dB4jKVdhILH1RagLfPXWJ+jOGACNjYdTDmjN17yY0X2gzsgoym/9EDRNZOiNQ9nKxX5
         arLyBZbygeCccXfK0LkA5VbChJ8lMfYNnOYDNOSigEq0G/ufEXmfmkbyrPNVe6w1xlrN
         en5umtAc2sssJZxYu9rSHaxNKKQ1JY/yob+ygiyVXZ1lu9FodKlV/tSwMJrZ38RTMok7
         6vjKLuZdiF64ioLxISUmX4jwDSSsZuW45nhnVWdMmALui3A3K5NbjhxLEPgivPgJvf93
         BQdw==
X-Gm-Message-State: AO0yUKW5Tos7k+8Mns6z360tprC13lOxQYZK0BdETHJf1oRoW2MIHoAD
	HP6euZTY6XPPyhVdAmLzPTU=
X-Google-Smtp-Source: AK7set9vnDgs0zNzFk64fSk03ZwJbehhJo01RTpV7gmR2nsQclFdjqoiygwh42ihvzlFoYsvReQjWA==
X-Received: by 2002:a17:907:20f1:b0:924:943d:7181 with SMTP id rh17-20020a17090720f100b00924943d7181mr3347932ejb.51.1678823561589;
        Tue, 14 Mar 2023 12:52:41 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ot10-20020a170906ccca00b008e51a1fd7bfsm1538555ejb.172.2023.03.14.12.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 12:52:41 -0700 (PDT)
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
Subject:  Re: [PATCH 18/28] media: platform: sun8i-a83t-mipi-csi2: drop of_match_ptr
 for ID table
Date: Tue, 14 Mar 2023 20:52:38 +0100
Message-ID: <4812650.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230312131318.351173-18-krzysztof.kozlowski@linaro.org>
References:  <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-18-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_125243_885884_EA74E5D4 
X-CRM114-Status: GOOD (  16.81  )
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

Dne nedelja, 12. marec 2023 ob 14:13:08 CET je Krzysztof Kozlowski napisal(=
a):
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>=20
> =20
> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:=
81
> 8:34: error: =E2=80=98sun8i_a83t_mipi_csi2_of_match=E2=80=99 defined but =
not used
> [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> diff --git
> a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
> b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
> index cd2e92ae2293..1f0cc7b1ba47 100644
> ---
> a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
> +++
> b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
> @@ -826,7 +826,7 @@ static struct platform_driver
> sun8i_a83t_mipi_csi2_platform_driver =3D { .remove	=3D
> sun8i_a83t_mipi_csi2_remove,
>  	.driver	=3D {
>  		.name		=3D SUN8I_A83T_MIPI_CSI2_NAME,
> -		.of_match_table	=3D=20
of_match_ptr(sun8i_a83t_mipi_csi2_of_match),
> +		.of_match_table	=3D sun8i_a83t_mipi_csi2_of_match,
>  		.pm		=3D &sun8i_a83t_mipi_csi2_pm_ops,
>  	},
>  };





