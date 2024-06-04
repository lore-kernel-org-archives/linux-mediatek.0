Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6BAC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CL5J75RKeSsjGaFERVr4h+iONwKJd6j+jNrY6jpR54Q=; b=QSgs+TDq/lbtaUo+zObHS9qkkX
	HC/yxfowW+ZHRSkIZfdMTE4pglotr3oO13h4K0Q9qW4Erq+IFDXbiP3y76CN51mQO+/c/9B4tFB1p
	ph4wkmxp+aqMr0XyQzqrxUXr/bIyZ0BzxSJavSe+YnyaFpDRE5pHBffhpiKS1CEHXGMgYKwVgwWX2
	Q1VUJHsooLqCoSqAgAQeltoMssH/kzOiOPucZQ0Tsye0/rjbYg1K1aIF5ZgeZc4cODk+ORX+WG60J
	Uam8+v5TMnjCKXqUilg20PhIiCxzeKscklxWEO3Jg/HI9EqtANS/+kKXsf8KJRr5AmgHtEwj/kh3Z
	jBRnaYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWsu-0000000360U-3XO2;
	Tue, 04 Jun 2024 16:19:40 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWsq-000000035zY-2sY3
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 16:19:39 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-794b1052194so380075085a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717517974; x=1718122774; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CL5J75RKeSsjGaFERVr4h+iONwKJd6j+jNrY6jpR54Q=;
        b=zwvJSSvTQeECnVXjRRiFbQffr32EL6ARf1w+cyTyIm9QqnPg8CM68H5Au8KFDmtS2B
         fTTGrUq5xcccRIA9VZHWuInxNQ3FL5DBpXmkMwT5K+HSkum47ghl5keE+NR+NAahBCSF
         piJPa70m/jU33Ng5La9O54DWxj7ZYNSdILL4R2+06HLovWYSFq+JOBG7IWJ1FYZ2bH+3
         Zjt4VU5kFvYJcwsFEgFDXmAQ9cm94e+5413+C/D7PYYdw/b5xsnMUNseNmonOeWpmwGa
         I02kRpmFQbBSFFgBgNsF/c2itOZ1SrKIlpts4X9S85xpRsgRt1Rby0ikxweCKSuKip6W
         j0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517974; x=1718122774;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL5J75RKeSsjGaFERVr4h+iONwKJd6j+jNrY6jpR54Q=;
        b=U5SWWlReKfptim3adQAOSPKS1J6Wq43cQTXiSE4Xrpj4/yu+E9D//s+pxzEO7Vjv29
         sIPMxGA/Z0F8YuQgrxrMPyiyoAZPndYzDwGrjaQUXpGxQ4l5ncmhvxrCquhNvUFdrPmS
         vKisiA/RuOpRNEAF6NfTTtFs0FSY0JBZ6jpRMQs64UwZNHz7hswZFxZiPXpFECX6zXsG
         nuVtNAsTql41EGEZH2+r5WituJchtUvJR+vvKTUSHyYLmat81e34PwxK2Dqgri0c2gMy
         qe4iRonaIUJ3j51Ds7e9Mjrz1YJ5bM/s3Q/1UtygcUnrjAJ6tlH224k2OhnbcBz1ZUix
         J2IA==
X-Forwarded-Encrypted: i=1; AJvYcCU8xuFrk9jsH2sAMbytRH6Rf1El+UKYdreca6gxANfKkO1TquI/W73mbq6owLhAb8EHXj3W3DlsoXyFQr2fIg0WoR2fQr0WeYreqLDetfEf2vRA
X-Gm-Message-State: AOJu0YyCAE641FrNkZQ9u6B3TKMGV22v63GUrB5s/oGsdged0LKagFiZ
	0YpxRLJekMs5+mvrKbIEUfROZG0rUPcX+UgMHL77VPNq9+LMhrfazM7Mk0dnQfM=
X-Google-Smtp-Source: AGHT+IFSAArPIaEjpMH4jgaXVYpVXpMimK68ul2RbeeR3lZN0wdr6tbhaKym2ezsrx+vrYGQeTnziQ==
X-Received: by 2002:a05:6214:3d05:b0:6ad:60d8:183c with SMTP id 6a1803df08f44-6aecd5a30b5mr139932906d6.20.1717517974480;
        Tue, 04 Jun 2024 09:19:34 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6afb70d56eesm23119596d6.132.2024.06.04.09.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:19:34 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:19:32 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Julien Panis <jpanis@baylibre.com>
cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
In-Reply-To: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
Message-ID: <345r636r-487s-75qq-07o5-4n022ppro11p@onlyvoer.pbz>
References: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_091937_026215_FDE6E62B 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon, 3 Jun 2024, Julien Panis wrote:

> This patch prevents from registering thermal entries and letting the
> driver misbehave if efuse data is invalid. A device is not properly
> calibrated if the golden temperature is zero.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> Guard against invalid calibration data, following this discussion:
> https://lore.kernel.org/all/ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com/
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 0bb3a495b56e..185d5a32711f 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -769,7 +769,11 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
>  	 */
>  	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
>  
> -	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
> +	/* A zero value for gt means that device has invalid efuse data */
> +	if (!gt)
> +		return -ENODATA;
> +
> +	if (gt < LVTS_GOLDEN_TEMP_MAX)
>  		golden_temp = gt;
>  
>  	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;
> 
> ---
> base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
> change-id: 20240603-mtk-thermal-calib-check-ba2ec24a1c32
> 
> Best regards,
> -- 
> Julien Panis <jpanis@baylibre.com>
> 
> 

