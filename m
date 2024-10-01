Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAF3CE7D07
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJZZRH5f3SlZnl5oD83B2IHXh9EXL5azgjHetsdsSic=; b=Jr9DFgX3ZiJ/6fRemZvhF/dSAa
	fBzS0imWhPRRSIwo+h77rdCdIwxtRrwqx5PXeZbdAIOjQJch1SgGOfjTUs62Q2IcII0PVsECbUB6r
	SdLDB2M661pmXSaUkit36UmIQh7bSLkSGvh+Gy7Ow5FSXqV1x6ak0IPqBycu9J41iMdM1XKB1fpX5
	QMb4AG/lOdJpjf3jJuRMF0PX7kiiobwAE2yEZjxZlyro880ToEM69L3YlTOsq0WO11UEQW2WxiPJ0
	tFECDs1EpkRJCRqgsy1KVqt3tjAK9HYOINxEhqW8IXhssLB0UGiuhZ//V36OVr95SefZPFQ0SXMAv
	AUUNQ8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZd6-00000002HaH-2Pvy;
	Tue, 01 Oct 2024 09:57:16 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZd4-00000002HZW-1D1C
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 09:57:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20ba8d92af9so8322505ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727776633; x=1728381433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJZZRH5f3SlZnl5oD83B2IHXh9EXL5azgjHetsdsSic=;
        b=R9efEGDBOo7dtEM2vaSdQ9JdHPzM4byO2ZlSD048Ga7WVwMX+ZFT1UqB64wOlAnhJI
         EcIr1+TiHrZnNcL+3uBa04KICBKFRUZyz/if1nchpZNdgcaJG4uK+eLsJUMFK5m9QkRX
         qOYzrq5JfM2Sb1ndMcJd0UtQK1/xK7k00zaP4E6vf31CTgZOY89+95Yuo4fBGvZHhOOn
         jl7wlvzh+De49d4DkaMxQJxNVJWliDlTsV29mlbrcO1Jt8jv6rLEQlWhh5YqOR0ks87J
         ytZ7m24XzVYn7/Tb0kEmf99/LtWK8cZ/zDAzIwvpZ/nZPMfqX8pwkUy4A6FZiBLtkhXH
         2mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776633; x=1728381433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJZZRH5f3SlZnl5oD83B2IHXh9EXL5azgjHetsdsSic=;
        b=RqyZ0319W7QNCi/OFL633wocz7vL3TeTn3gKa6f07WsMiIkYjCtUMs8oxLDYRCsbcR
         t+gIyR3Q3AxpTL4i5X4hk8zuD/AUo2Dif4wctQHVSbxSB4eQAyAjVhKCRsJkZhSXU6a/
         mzaqzlDQ4NmLeQly/6RHW4RaqXBzZ6Xb07zXDhvtTHwIpfBr4qbmtqFWvqpqBh1N/GiU
         mKzpv7/GBQHl8kSB5QKBSzXrUB+RuyX5ikmEi2sTpOI5o8leU186hV4QGQsRsynrBiMN
         u+qN9mLiY3+vQG56mCLhucptaxrrDI/MtRqrIP7TSHAYJXo69yZWiz47QkiY28ANgyMG
         Pa2A==
X-Forwarded-Encrypted: i=1; AJvYcCXpT5mMFHsc8KCbNB55MK8ZNdWOtckxcGlnLtga3lSnTpoxIZymV5ryaaA2kXvJ9Bnsv4MwW85z4UHI73NZuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcofGVKJa4eTGtvYu1WHyL8CVRs8VWrQjgCQAmWFfdkmKDHGRJ
	ETklNsg8yJ3h5Bskv4Me+VC8mfTQ8N0xGyPfKRrrZVvfxlzHOWk4
X-Google-Smtp-Source: AGHT+IFg49hq/u73GrCxeA0RXbOWXevk7voboCl/fDLoMZqqtQhmBtjQhddqMRoGeEFpmxyMKZ7Sqg==
X-Received: by 2002:a17:902:e94d:b0:20b:8d7f:d13 with SMTP id d9443c01a7336-20b8d7f0f82mr95866485ad.58.1727776633324;
        Tue, 01 Oct 2024 02:57:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6ca63f9sm9620563a91.33.2024.10.01.02.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:57:13 -0700 (PDT)
Date: Tue, 1 Oct 2024 02:57:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <ZvvHdlD6E5bzsWwV@google.com>
References: <20241001093815.2481899-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001093815.2481899-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_025714_353200_9A7A15A9 
X-CRM114-Status: GOOD (  25.91  )
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

On Tue, Oct 01, 2024 at 05:38:14PM +0800, Chen-Yu Tsai wrote:
> Elan trackpad controllers require some delay after enabling power to
> the controller for the hardware and firmware to initialize:
> 
>   - 2ms for hardware initialization
>   - 100ms for firmware initialization
> 
> Until then, the hardware will not respond to I2C transfers. This was
> observed on the MT8173 Chromebooks after the regulator supply for the
> trackpad was changed to "not always on".
> 
> Add proper delays after regulator_enable() calls.
> 
> Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This will unfortunately slightly slow down the driver probe and resume.
> An optimization would be to check if the regulator is enabled already,
> and shorten or skip the delay if it is. This would require a new API
> though.
> ---
>  drivers/input/mouse/elan_i2c_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index ce96513b34f6..89556f61004e 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -46,6 +46,8 @@
>  #define ETP_FWIDTH_REDUCE	90
>  #define ETP_FINGER_WIDTH	15
>  #define ETP_RETRY_COUNT		3
> +/* H/W init 2 ms + F/W init 100 ms w/ round up */
> +#define ETP_POWER_ON_DELAY	110
>  
>  /* quirks to control the device */
>  #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
> @@ -1237,6 +1239,8 @@ static int elan_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> +	msleep(ETP_POWER_ON_DELAY);
> +
>  	/* Make sure there is something at this address */
>  	error = i2c_smbus_read_byte(client);
>  	if (error < 0) {
> @@ -1374,6 +1378,8 @@ static int elan_resume(struct device *dev)
>  			dev_err(dev, "error %d enabling regulator\n", error);
>  			goto err;
>  		}
> +
> +		msleep(ETP_POWER_ON_DELAY);

This will add an unwanted delay on ACPI systems that handle power
sequencing in firmware. However use of "optional" regulators is frowned
upon in this case as the supply in reality is not optional.

Mark, has there been any developments that would help reconciling
difference in behavior between ACPI and DT systems. Ideally we'd need to
know when supply was turned on, and adjust the wait accordingly.

Thanks.

-- 
Dmitry

