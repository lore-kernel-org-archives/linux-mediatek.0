Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901C9CEB2D2
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Nov 2025 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=; b=nrZK3dI8xLYKKKmixRDjy/GBgx
	1YmfEk+ZwxwoB/iHr7f1GaN/etRsEM5Urb70gQjOjU2tNpFnOaOMRB+PTgzXhI7JXRvlDHbGtE+7I
	kJ9GLuA0US7STPMrhGXf7F2cu7fmi/HVgp50XYXQtxl+TwL+U0V/CuPMy7iv7+by17uCsJpO41OCJ
	WZ04LjbHHhPWfcRDrBbqEZ2oUsSoS0Q1UOINymD30sb+wJx2lU92v9TCxiKEjipm2ecSBS8Q1Z5ho
	x0WpPpqxM+38Ao3qkuzaEU7L2Sc1HfrKvd32BwzPLSDYsb7RBrp4klaocqLAHjDdaJRsxY+aEh4wb
	DUph5CPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMN3-0000000E2ON-38El;
	Sat, 15 Nov 2025 19:55:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMN2-0000000E2NS-1BRc
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Nov 2025 19:55:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42b31c610fcso2672514f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 11:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763236538; x=1763841338; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=;
        b=BUkVxYsuDdBrUm70yYt5z2NduPhOlv8ZUO+nUWmq7Q5ZaVPIBnZWHtF1PD49985AfF
         aOrXf7KWLiVVRH46icYk89UZRgd8LAWevyktRFgYBIFl14rhCPJUKYJqkrEFV++oXhXO
         rH6H4inuz6gSTEL7J2mJ1yKfCkpAe2E5sKCMa/BKeLJBanTK+GZobLdJsrbcXs75pgSE
         dbVwaTcFc9zyhA0WCgdG7XgU/aH5INC98jsSWjnMi4dbVAw2yyIBkYruiNvWL+RHtRqg
         LF3f++GdaBTOo+AIduCdbJXVx4GnhSsiPYEQuEW1dpuqh9Ye/9l4m3SHotn/73P5vTsw
         5SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763236538; x=1763841338;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuleB7Uof+tsaQSPA6fNwqHx1Lp/3ZhdyDUy1IclBq8=;
        b=SWYh5595rkyk7zO/lk85CcTpxZlJ+rZzawuFdvFurN1u948MMbwM6pKvXKfVmLH55p
         +pbmvhCJwZNWIkUYbVK+0i5hsjJ0MkGlfEvTtAEn3CEop4zGsUgGkt+/n3wD83HnG1wb
         60wGraomMyzjQmNEASaB60fB8QGc5QIXhHSF8A4EH/w6s1kW5aq5RdOk8K60WJ+jSRJO
         bcx86SserTA4Uq+M5Xj2HUf3IYFiWztzWMqiJWMAfmux9HbXcVn0uYH+AgPC5CO8zqpt
         ztd5KZAnFhAu9B7akVA4MiaTheXZu97+lOSGdj9zp0AtqSyhrRIEPj0V5a9pQ+lblP7V
         i18A==
X-Forwarded-Encrypted: i=1; AJvYcCVM1WIUIqqmIc4GuEmT7W/6pubIsR5tmLwSWNXKhu3qvZZmm8IQau9egvhw+ZDlAkGydXoIRLmvQmVYBYUysg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYsPEp0cdir4I16Zswe8dWI+z77w8qDDGYOsGF1Cows6+EaLOw
	vIOuuDQQiVaBgYxNuss7BgbBDknbyFlSW3OC/+Xw+B3HzCElK2gGaRI+
X-Gm-Gg: ASbGncusMqBRmUGMv8YOXJHV9GKeZPHI5thvMeQrdaF7gZb4i79nFDwXVGbk3s5lmac
	s49sRopb8Q4aybLtz26gvKL8nP+KHldWXEXueC/MTTOYZ6oU0hE4in0J7Wyrs4V5Zsu6anSLBtd
	wImQKjZywMMmFSTDgM29AQqN3t4mtDmqdHJkzLs3577vt1XmJxe0waXw2M4Y+chubjWTmF+h0EZ
	VVZe1Aw6fbQ/6gqMtjanDZNx7xfJFJrQzGvtcw9dBmMlWECN16NH21I5DhoEjriQV77dKPWoQNy
	VwMXrfeo/7M0v6W7JlK462Ppyv8mTuwEyguJ1sWw6Zmh6UIxbUBoS3aGDdvNKZJDRbOaaqZacoU
	Wk8eFf/QoCffySxWlYc6o26FbqY4cFB7+HfsnFpKxO+SyUoOm2H1DRN6t9oBO82t0WUCWIVWKaF
	Yh4/47nloi4snQywpgp1y7r+QO4+fM9L13fdqI6meve4eHoJPedqTm0Z2q+fLTo04=
X-Google-Smtp-Source: AGHT+IEf62GmYjxzwvkFlgA1Y2k3Lbqy6ScY6eZSdDpeSqLPl8AdyiMH5V2WcDmQSZsaAfQG8l5H1g==
X-Received: by 2002:a05:6000:1447:b0:42b:3a84:1ee6 with SMTP id ffacd0b85a97d-42b5934e2d7mr6759730f8f.24.1763236538325;
        Sat, 15 Nov 2025 11:55:38 -0800 (PST)
Received: from Ansuel-XPS. (host-87-10-15-59.retail.telecomitalia.it. [87.10.15.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a4fsm17126800f8f.11.2025.11.15.11.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 11:55:37 -0800 (PST)
Message-ID: <6918dab9.5d0a0220.170613.3fe2@mx.google.com>
X-Google-Original-Message-ID: <aRjatPM0eXV0N5XZ@Ansuel-XPS.>
Date: Sat, 15 Nov 2025 20:55:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in
 an7583_pinctrl_match_data
References: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_115540_337524_5FBFF6F9 
X-CRM114-Status: GOOD (  20.07  )
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

On Wed, Nov 12, 2025 at 11:44:30AM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinctrl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>    2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
>         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
> ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
> evaluated at compile time, so it will not be needed in the final object
> file.
> 
> Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
> an7583_pinctrl_match_data to clear up the warning.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Christian Marangi <ansuelsmth@gmail.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index bfcedc7f920b..706532a820b0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2993,7 +2993,7 @@ static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
>  			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
>  		},
>  		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
> -			.confs = en7581_pinctrl_drive_e2_conf,
> +			.confs = an7583_pinctrl_drive_e2_conf,
>  			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
>  		},
>  		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
> 
> ---
> base-commit: 57916750bc0886917ea2c6209ca6a56acb7b8182
> change-id: 20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-bbf4cff20b50
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 

-- 
	Ansuel

