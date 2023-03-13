Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E874FC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMLvNFiF6A+cLlm+Md6S//7sOrhzSCiOnPwGbda9MTs=; b=QxKTeACraiS5R2xoqPv5bh2MUG
	Wi5WRVlF5E+VAR3ap624RCdF4sY0GqsJ1dtTi7S37XztmrEwoyf0WTmqi6oJ0Y4f9J0TsNtGkP8yx
	JaOye9vW7nQ4TL+IoI2PSVN14GZoMMG/FDAqxh1m5GLcm8v5Q3UdK627yjojgD43cH+qjn4NTTBvY
	Ke7qSqvq950Qb3rCZ1sxl8yE5L2i1SjtjlGBrtIR+e11jbgTUAGPbTYO4Y2/OliGPSol7xnTGaa7u
	zftSZsaIB0dvbZ6SZwBCmNVZm9SRXYDxyfp1uNwBlr41SGAOAbZhP/6FGMeuzKoV9ch/XOlUCnE+v
	UpXtuO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbqEv-0081XY-K3; Mon, 13 Mar 2023 22:01:57 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbqEk-0081Ul-0T; Mon, 13 Mar 2023 22:01:47 +0000
Received: by mail-il1-x12f.google.com with SMTP id h5so3651806ile.13;
        Mon, 13 Mar 2023 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678744904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMLvNFiF6A+cLlm+Md6S//7sOrhzSCiOnPwGbda9MTs=;
        b=aWXb3DK3A5HljkDmtHfJIax0Z4RexrlgcAXu6rc5w2LBmdFm0ZhzhLWq9rUOZmDdp2
         qjfynGlY/ln39BF9ghwsOTTnx2ty5W57Izt1vktIL66IwFpZ/SXIeL7yDa5HJPkJlCYF
         NuKPKFxU3VSN9QKyNg+xaVoMZ5ANKIiFT49KWS508WvyJUv1PSNLqT36iEIBajXHYKM2
         acqHQd4/vdBLJ+TdQuHL6ydeVF/R7kSdyCG95wHm3s6ebS7yK6DpiZc5sxZdrmyjrlR3
         Jyx/d7UvLyTcSFtZrbuWKS9R4+hA1qJSfOEOf/z7YJ4IiYDiNLA5Q6zZJgMbK8TX/7NT
         YeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMLvNFiF6A+cLlm+Md6S//7sOrhzSCiOnPwGbda9MTs=;
        b=tzh8yS1KkUZ2jPTrBHO+QHU4GiV9T10f4+1sjQQvkvW1y7oEWrDv5bk53IzsLT5P8J
         o8lUbVBCY8EBGUqligXPsb/OsTXsRbe66TVru/bqsecDfcb2dh9CstXyES9LCyHa+E5v
         oAA2n3vOd0XBn9TT17Wb6W278kvdR7xNK0193mAviD+wGakOu6PXiZ42tIbZn0VPogB4
         tp1pjpS1Z1R0sAr0mm0PSELjy/1p+p5sP3KJeo/gzmuL44d5jYpKcEQ3X9iOJh8FY4dD
         YD7WI0IMRGdsX7vU0K/13IdM7SIAWvkmjP5lBzDKhHmgf8vrMZNo+/5+nHYNQXnKpWt2
         2ZIw==
X-Gm-Message-State: AO0yUKUZ4RZANpEegzR3YmwdSx726cSL03ZS3AYPPDBLGdZeLKaxTYpC
	OSup0stqUXBhHrQ3utIu60Q=
X-Google-Smtp-Source: AK7set/CnpGrRNOlgdLP6A3PzpsbmZdrv5qoYIZVsXl6Lk7tiSYIV4Z0CbZ7o/CqEdQmrdQf0Yh05w==
X-Received: by 2002:a05:6e02:dc1:b0:315:5467:4a3f with SMTP id l1-20020a056e020dc100b0031554674a3fmr720344ilj.30.1678744904090;
        Mon, 13 Mar 2023 15:01:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d19-20020a056e020bf300b00316e3a38becsm282388ilu.18.2023.03.13.15.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 15:01:43 -0700 (PDT)
Date: Mon, 13 Mar 2023 15:01:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Message-ID: <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_150146_095573_F1F73FD8 
X-CRM114-Status: GOOD (  19.55  )
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

On Sun, Mar 12, 2023 at 02:12:51PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
> 
>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

FWIW: There is also
https://patches.linaro.org/project/linux-media/patch/20230215214724.3798917-1-linux@roeck-us.net/

The lack of ACPI support is a real problem and very relevant.

Guenter

> ---
>  drivers/media/cec/i2c/ch7322.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
> index 34fad7123704..3c6e6496a001 100644
> --- a/drivers/media/cec/i2c/ch7322.c
> +++ b/drivers/media/cec/i2c/ch7322.c
> @@ -589,7 +589,7 @@ MODULE_DEVICE_TABLE(of, ch7322_of_match);
>  static struct i2c_driver ch7322_i2c_driver = {
>  	.driver = {
>  		.name = "ch7322",
> -		.of_match_table = of_match_ptr(ch7322_of_match),
> +		.of_match_table = ch7322_of_match,
>  	},
>  	.probe_new	= ch7322_probe,
>  	.remove		= ch7322_remove,

