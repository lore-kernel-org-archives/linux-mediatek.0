Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16237CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3dTkfTfTmTvc+VC+51bPMt1Qpx/m6tf4J512elF7jQ=; b=xAy/9gHlBjecY7FA85nw8HflKH
	RXWnnyyZeQQXriohogKxi+dMPwUWIFnhmt7/x8LPWJZbeFlmTkTM7JhouYWogjAM3j45g/Ma6Pwt4
	gCGnM0jt6VSbUKiP04U/4mXW8ugPXt3h+63IDp6CpAsqTVgkvRYBG6ijEFbJEtkN8bVSX1fCIosfB
	PqBNWp2CpLQB5YnMlVj6WLP7YX8QFRpdC9sKALVFHHL+XTKqz51BO0rRsnGodBFkcGBI6+6YVq7iW
	VLxdev+x2scJNXzYeExybCBXdzAW1ei5BnIgix76ptDSsvefBf8TPy9hR1Ne2cfBDTabKvvZX2EcJ
	zuobb0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb6L-0000000AaPT-2thf;
	Tue, 02 Apr 2024 10:10:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb6H-0000000AaMS-3IOY
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 10:10:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-515a81928a1so8116009e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712052639; x=1712657439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3dTkfTfTmTvc+VC+51bPMt1Qpx/m6tf4J512elF7jQ=;
        b=RLe0Gi0KedZxmpnhiTXUzbeqLoQavtNnduBTY81NzDPQqeHmbQciC+juwVuCPjWzly
         FSDUX6vy4Oqq6hQkWjOz8gVdsP9QEcxQksieTHFRf8A8eiWM0OqTEvRlKh0xwyYcHeSp
         cBksMy2vzhKenv+duF+KpS+UBgf5RVg70vjd1DHJ/EgtA3swm0Ychd72xMhCbqZsf7fN
         mpm8aRuuguQKMpuBloS2sV09qqBTaYoNpd9rlNFh7lM67evpoEacF2HOVvKvlgqjYXTJ
         JraAH3OedM8BUZm+OcziZ29E5/8Ze1xjn7QcEztj5SItLMy0TXOmTuLf9SFL2PIcgrnS
         U/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052639; x=1712657439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3dTkfTfTmTvc+VC+51bPMt1Qpx/m6tf4J512elF7jQ=;
        b=WYbxUTt7yoF4uXvJak/DJm9cuYwlEVDTUTx6kHVExVpS8FPCpR17xY/C9A4pmkyH52
         Im8Vgo9ijk5JPC1qeN+3z1fBbYodWZGBH1u6u/sEUJa1+ytNKjPZ0tLhRvaPNdtVIN1c
         f7lVFKDLv4Gd1oLuvHyPP8Z6Tq0pEWUPO+XX93+WUJLb94/XSS1y29ooN1lIQpwqOZkL
         26uZgrHrkVpdWVqUIZ/Js9Ds9y8tKgywmn/67T18LjqTd7J6QD2XY9T18046DN8sYMZj
         YU0TcrXCMwsN1f9AJFYHQuP6H2OrQfxdr7gKszQTVR9SBUFHEhc3TQWcixz2bHY6Dr0r
         qeIw==
X-Forwarded-Encrypted: i=1; AJvYcCXIkuLH/JgaHufaQqZODIcPX0J7mcFevl7V4dvl+bJebx4ALuFuww+hqrRQ5ElkovenEoIrUqhELk9r7s7usNKmdvSzUpgHAkrF8y8X4Ru3al4j
X-Gm-Message-State: AOJu0Yy6+/MQw8W3Wz/sDPIinQRpRD4eBYT5SXjf+WBQjiChlBKYqElx
	fHwR57EgwamUJ5/6KQc3o2lsERpbnvmSAysX+EQx0ciixY55Gyoxz6XgK15X/fs=
X-Google-Smtp-Source: AGHT+IHNkFT8bTmOdfTTgGqZjVoDCZyaezeA9aZ2HSvnF4VqQ6nRD668Hld3aD1xS3tB5xSXeI+ptA==
X-Received: by 2002:a05:6512:312d:b0:512:fe25:550b with SMTP id p13-20020a056512312d00b00512fe25550bmr1006845lfd.47.1712052638622;
        Tue, 02 Apr 2024 03:10:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id js18-20020a170906ca9200b00a4e57c8e947sm3385482ejb.118.2024.04.02.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 03:10:38 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:10:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: mediatek: paris: Fix
 PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
Message-ID: <88555630-7232-4762-8215-afb65006e290@moroto.mountain>
References: <20240327091336.3434141-1-wenst@chromium.org>
 <20240327091336.3434141-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327091336.3434141-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_031042_599458_ADABAE16 
X-CRM114-Status: GOOD (  21.97  )
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

On Wed, Mar 27, 2024 at 05:13:33PM +0800, Chen-Yu Tsai wrote:
> In the generic pin config library, readback of some options are handled
> differently compared to the setting of those options: the argument value
> is used to convey enable/disable of an option in the set path, but
> success or -EINVAL is used to convey if an option is enabled or disabled
> in the debugfs readback path.
> 
> PIN_CONFIG_INPUT_SCHMITT_ENABLE is one such option. Fix the readback of
> the option in the mediatek-paris library, so that the debugfs dump is
> not showing "input schmitt enabled" for pins that don't have it enabled.
> 
> Fixes: 1bea6afbc842 ("pinctrl: mediatek: Refine mtk_pinconf_get()")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index b6bc31abd2b0..9353f78a52f0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -193,6 +193,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>  		}
>  
>  		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &ret);
> +		if (!ret)
> +			err = -EINVAL;

In this function "ret" contains a mix of different data depending on
what the param is.  It's not always clear what "ret" means from one
line to the next.  I think it would be more clear to say
if (ret == MTK_DISABLE) in this case...

(I'm sorry to the list for sending so many nit picks today).

regards,
dan carpenter

