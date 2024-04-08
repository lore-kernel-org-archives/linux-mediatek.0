Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A70CD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzIHovojG3644yJzi7Rp4zPvS+LnsKi9BT3OOCmERoA=; b=e/psyHY6v9Qr1jTKMAB2BCgsVQ
	afhvZKZXJWNPyB6lrlr5BZ27tO8ndAuaFibGjzbQWzW9wrb7QU+xAtLmoPOylh0IneRI5wI2MAlfI
	BpZhC3GPeK21X/3h4PCpX/fgCJT9u3ibJ9TWW8LCw1/r9bPB+SJ95uqYehJJORhs9+nsGF1ywXauD
	ALh88Kyt80uek8yXbddlBDXOJBT8co9kSla2vb93MXc5PQ6I7U/RB6BDcuFg5qmqfQGZqoWxm7r4G
	odw/+6UHq6YAD0i4IFxywPV8akZVbtLnbCiZjbXc9nAavESwGhrcMwRKcZgNv5+YNuJf+dBrGhx6t
	+7myta4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk50-0000000Eq3f-2W6c;
	Mon, 08 Apr 2024 08:10:14 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtk4n-0000000Epw3-0PZI
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 08:10:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso2142820a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Apr 2024 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712563797; x=1713168597; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OzIHovojG3644yJzi7Rp4zPvS+LnsKi9BT3OOCmERoA=;
        b=bEmUmqPXOJudKzeTMbMFH5K8qcm13HOekw0yJU2OLz/2PEYE6eXQw3+hCAjZEY2KKM
         oriCytPhbZLywNvteSzZ9CYkvblAVtGByGIRZvLdHSr1tAvJuZNDspqhNRG8ztvVM/lz
         e3OIpyV1IlY8/70lMm+uDHwa4jaL4bh9EO10brCDrrkinCU3EdTsGnPznx/0CkAf0SP0
         Fuv6SP/ggAXnUYswMtLIXWfNXzh0N15sqraLEgShwOHPoTqyJv2xjJbbEjuV4fvEJNve
         bmT9KIqunTxr74Dstq5bUkUP2Qc9sQZ5B1THFiXaM6Y/y5UUe3riX/NSsUgIqGUsvxZs
         gmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563797; x=1713168597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzIHovojG3644yJzi7Rp4zPvS+LnsKi9BT3OOCmERoA=;
        b=R4xz4N4lu5EZe5zSK2dJmRURfHNILU9bXqt6+cMcZ4uwVw8w8pwq+7155nXaWlTIln
         A5Ot8oKneXEkn8A4oaPeAUhujHjDhpEhKtOngdX0t8hGzHvM4xCVqwXZfC5ZwSY/tBoV
         1pzxC9IZcYoxz80UdzBINwAb58gpEP1euQdTohmz4z9qh8PHXa3kyJXSg87pu4/0gNqP
         jDy0h0sqFr+aLIlpR9qahIfrvwyTKc+pz12MyhFCg6QjXd2fcHrD7t24p1poz1UAllxg
         tUbWvMs+eJgTCrEovk5RwQI4kaBBgScHCkhbvwlx4hhrPkDLIWjM8CvhmgsTWJtmi14Q
         /uuA==
X-Forwarded-Encrypted: i=1; AJvYcCW0byfyjRNjEOOU+8OKGzY5DwN5DyJwrzn6juljm+Dj/2QXodfG82eRoz1RNPlxBVurJ0GoMMgowEKYkVMQigF6zd28/sQQGYwm8JcCSkNUX1tc
X-Gm-Message-State: AOJu0YzN3Mptj2iAK0Qb2WDg7A67NCA00kJUSHn3or30NcUdZQOgBgex
	/MtoGqKo1EQPupylhUeHMKANis9L+wdkMNYlL8Blhl2T6HM6eRQMrKvC1BBhuN0=
X-Google-Smtp-Source: AGHT+IHtvCDCPVlkweFZtEXFJMtCJqeKZm0fgLqDOmu+n81huoTOcfZOWzp5QNMYK38WJkLMK2XiTQ==
X-Received: by 2002:a17:906:3391:b0:a4e:768a:144f with SMTP id v17-20020a170906339100b00a4e768a144fmr4666050eja.36.1712563797196;
        Mon, 08 Apr 2024 01:09:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gt17-20020a1709072d9100b00a51b3d4bb39sm3081020ejc.59.2024.04.08.01.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:09:56 -0700 (PDT)
Date: Mon, 8 Apr 2024 11:09:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Improve some
 memory allocation
Message-ID: <d97f2a57-d318-455b-a860-8bd7972c8aaf@moroto.mountain>
References: <42a87fb9837f1760d1ad4eb7162a7536785dc6f5.1712520052.git.christophe.jaillet@wanadoo.fr>
 <8cb69f245311a348164b0b5ca3dbc59386746035.1712520052.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cb69f245311a348164b0b5ca3dbc59386746035.1712520052.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_011002_051770_C8881F85 
X-CRM114-Status: GOOD (  16.98  )
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

On Sun, Apr 07, 2024 at 10:01:49PM +0200, Christophe JAILLET wrote:
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 3003dc350766..b133f731c5ba 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -204,7 +204,7 @@ static const struct debugfs_reg32 lvts_regs[] = {
>  
>  static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
>  {
> -	struct debugfs_regset32 *regset;
> +	struct debugfs_regset32 *regsets;
>  	struct lvts_ctrl *lvts_ctrl;
>  	struct dentry *dentry;
>  	char name[64];
> @@ -214,8 +214,14 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
>  	if (IS_ERR(lvts_td->dom_dentry))
>  		return 0;
>  
> +	regsets = devm_kcalloc(dev, lvts_td->num_lvts_ctrl,
> +			       sizeof(*regsets), GFP_KERNEL);
> +	if (!regsets)
> +		return 0;

I understand that this preserved the behavior from the original code,
but the original code was wrong.  This should return -ENOMEM.

> +
>  	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
>  
> +		struct debugfs_regset32 *regset = &regsets[i];
>  		lvts_ctrl = &lvts_td->lvts_ctrl[i];

The blank line should come after the declaration.

regards,
dan carpenter


