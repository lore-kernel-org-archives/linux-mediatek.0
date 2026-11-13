Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29D5606A32A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 01:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=exD6+VrJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdPAT8Kb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=; b=exD6+VrJg62ZKRfwbmR1vWli+Z
	YvcBXryUonSzyYIiEmaiuho6D2GOca1Z2+pcdkCc6A6JsxEOq4AgFPReIO72SS/YZaCZNpud5UvSx
	A/jQuZ9zeU/8Z3IIEpUA9S4jZQc4Vcrt0r55L98t257cvp5Dd/vQT06KXYd2j1TNS4HislIc7MAyL
	8LMFZYFM3qN6mwUDK+bEETUmptaOAsU+9VwfGYvHRKzvV8A1djh8FZb1f4YDABHYtZgcrZOynPeQp
	mvhak8tDtx7LjPn3n5PQL+r+d7JX4liZFJyTzgF6/N2cCnZs1tDxZbpDUbfQ6Vrz3t17+pV0wotVT
	6CPGENYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRg88-0000000BRGz-0ijl;
	Fri, 13 Nov 2026 01:31:04 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRg85-0000000BRFe-0PnB
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 01:31:02 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso603948eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 17:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533460; x=1795138260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=;
        b=WdPAT8KbbFE2+FujmJWNdP6gjW5QMzA4lmV5RaqLkm3fGd+Nda5Awvvdw88y29rBRR
         Iw68N+4Rbkn4fQI8MoT17H5htNwzMhYqRqS8FVTvmXLTJbv8YhGoZW12k++Ez6apy2tU
         aZFreVTTQ2ul7qwZIwLgaAQQEEiOiuSC7z6wydbhROTSH3AS5ktAstgnuGX4gPuJsjeB
         P1NQ1qyIezy3eVU8Nx1rYbSJH8oVlV05oFVhy75Xrvu2ulap9MLK2pAqOmKrUAao8MIE
         S6B89nLo1LMvICcdDKlHw1jZzqQ/J1+o9PbKqcRH8pOiQVWA4XzCLWUReYYk9huux17U
         yaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533460; x=1795138260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=;
        b=I9kYW1cSuHnqVkQFZJODPe34c0SPBF4+WMV2qTdZZRA7iibZeY4P0clA2OmEBa528l
         XGwIk1oPgZcJjIXfXj21sPm0sSQ6dZTrIM0PuhSJoy6Ed+8gsw2rEzQfwapIFGFoajq5
         mOYxs7Pdg/NTeNsAnr1ZLBgHmLWY4pGPuPZqVND3PFd2LywvvahVgTh2UMpsxGtEL8Kj
         RjLn1cAULHI/h1ZO3r7HmT3aW4G92KBpGK9BzJLLC/uDGEMMswaZ0ZjJCJgb6v5HCc6i
         CTq7h+3GCkXWgz6k0EReg1ufuatZOpJydUt6GsF7UNiv/TCupbpD3qRwGWhnkB9yl+xa
         s7oQ==
X-Forwarded-Encrypted: i=1; AL+hErFiltvyH9+kXelnmpImkIbl93R7GftKojsNcyqniOOO3cCZNiqmqrDX2BlAMWK7dS4ahHnM+SrMUI4ReodAPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+N2C99la11toDMfSur3jUTAxgQ3rENuCqR1Dmk0Gw0fIc+KziP
	CG9aYyU9ZCaYPhjGE23vT+MvOxUUeX/4iW4XaNCp+vLKwZQmVM65mSsa
X-Gm-Gg: AYBFou3KOgJRISaEbLhE+oN3PmnXqVkiSwfjXnOOLJVSnHenGHhC91iK8wtuFE9EFGs
	0RiRCcBpS+xYhtJgmFA9ySRh5KdQ1BTkAx9Kit9MPlllxc9crGtnI9m3Y0XfOXf//bNMDSF9gA1
	GsPBz+kJTwAdmuVLsnHwHVTpcWDywXLZPZ1XlMHtqbiZyKaVjWDshb1MGv7Ph+sl5q4eceY1En7
	Af/CuXA3EWMTpNIcq9wxhBCavwh0YFaVfnmEuQ4xOiCzdUjXNjUf2hPls/7B0QbZ/zgmbdNBh+H
	DWUBEyQAmuxtRqC6l0ADGtc7AlNJ8UI5oLndrV9SYsda3y2uADrNkczdC/Xc/Je/Bg5aiYvSUNw
	ofc6QPMWZ4sTkHnuGuewqEzdw+bUvw8DOKKUU05CEpvNbN9nnbV/ZGbeaRODZfb2KxjvdiziWei
	fbom5eKpolc/XkB0r3vSVBoKYnjmL9kYtfRlsXTJ43r73fNqJ8oeq/XR9j0TsskVK6eTO4QOSUy
	I5fr0LCcvPBlIAr4kN9ZVWKb+2cYXyzQMnazB6M1f0sPf2uCGU8KOxHih7P2TDNlPc+DEPUJwU2
	MNlplx0WoKdTzNC6T7k37CZNO6vNH4No8Dm8w9pvjBEGRmC8jQ3PK+k4q8N88WQ0jLcu+F8=
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr1313899eec.2.1794533459424;
        Thu, 12 Nov 2026 17:30:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm2333563eec.28.2026.11.12.17.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:30:58 -0800 (PST)
Date: Thu, 12 Nov 2026 17:30:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting
 firmware
Message-ID: <avZiZoGO4jXjIP7D@google.com>
References: <20261020122712.526797-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020122712.526797-1-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_173101_149782_8ADFD6D3 
X-CRM114-Status: GOOD (  22.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luca,

On Tue, Oct 20, 2026 at 02:26:48PM +0200, Luca Leonardo Scorcia wrote:
> On the Lenovo Tab E7 TB-7104F which has a Goodix GT-912F touch screen,
> the touch screen fails to come online after loading firmware, producing
> the error "Error reading 1 bytes from 0x8041: -6".
> 
> Comparing the upstream code with the Android stock sources a call to
> goodix_int_sync is required between the upload of the firmware and the
> watchdog restart. With this change the touchscreen is correctly detected
> and working.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> Relevant bit of the stock source driver at [1].
> 
> Credits for noticing the issue and finding its cause go to matemiller992
> on the postmarketOS forums, I cannot provide tags as he wants to stay
> anonymous.
> 
> [1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529
> 
>  drivers/input/touchscreen/goodix_fwupload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
> index 5ae9a109ba0d..01e7705ef515 100644
> --- a/drivers/input/touchscreen/goodix_fwupload.c
> +++ b/drivers/input/touchscreen/goodix_fwupload.c
> @@ -155,6 +155,7 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
>  
>  static int goodix_start_firmware(struct i2c_client *client)
>  {
> +	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>  	int error;
>  	u8 val;
>  
> @@ -168,6 +169,10 @@ static int goodix_start_firmware(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	error = goodix_int_sync(ts);
> +	if (error)
> +		return error;
> +

There is call to goodix_int_sync() right after call to
goodix_start_firmware(). Is it still needed if we call it here? I think
the vendor drivers does not do it.

>  	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
>  	if (error)
>  		return error;

Thanks.

-- 
Dmitry

