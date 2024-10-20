Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3C9D3C935
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvD5zxUD8sPwgrPuyc+CgRrn6Hv13waPalrojCn8pqI=; b=nASgNrtN049qtpn3GNVlk/WJEU
	WsCYCil17Y9xpdU8EzkgvzG2Ai5wInpDcdxq7wY4BTS5s7CzpAwV34FTy0GMJdbpQMpoHJo0BrGrW
	I0YZZJ8bFxd6p5pJOt8cFfk8z06/BBz55Z83aLeYHPwmKmmi4ZiW+chTw0C9bAEdJzgZs+MLg0T4q
	cRzPLVlgBFiYsWI99K1AixWcbgjKCoD5u/o6xKtlNsLXml3eiKFLDPqxLUglJ9fuoetoVSitEUV0o
	nguMQKLDULyHc9NqaxowS4hy9seTr+K7OljCxpP/+QaBJKWLYhbg9nIAyUXyIBxbMmx5Tg8DhkuMW
	wvKxgw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NR2-00000004ONX-2vnm;
	Sun, 20 Oct 2024 04:20:56 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NQ3-00000004O9f-2C5y;
	Sun, 20 Oct 2024 04:19:56 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2358106b3a.2;
        Sat, 19 Oct 2024 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397994; x=1730002794; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvD5zxUD8sPwgrPuyc+CgRrn6Hv13waPalrojCn8pqI=;
        b=Ene7yas9ldsSwvCOwMrXchiH91YnaxRPhsHknM6X3x+gRUo5+pQlOB8I60rQ88jJZk
         ybP/My2A4DOW+kj703QIlfE2zx7yy1I73bhYqawAvtPTlRGiBHW3SouyC1Wr4MlyEwwJ
         QgUmrG6uK4VxgP45jFutFAdQ7MhGZt/jkvv4nfmrlFDTp6sorsRN6pxo31D1z0o+1tij
         iCMrx8Y0UA3ESuwbJeIzBliEm4T/kx/Ebz1C5QQSThq0JjnnnfE7V1SHLol0rv2ztCIy
         u3n3EyAFQcSEG/r0TnxYTtfAn+87VV8UnzPyNeZJG6B/nftRuignrxSR5iIosuRAnhHI
         jbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397994; x=1730002794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvD5zxUD8sPwgrPuyc+CgRrn6Hv13waPalrojCn8pqI=;
        b=A6CMKYmkvlYo9BCcHqYQ5VjREL+3UdaD1u8+PAmH8j/mDpcNPfEN9u/qOGf7XTLHzM
         XEGUna6fCwQELre5dGrax7ZC3LeL+1is2aqfXrPWkuTQ1J7x0rFb3mp2OkEBZUh2rwnp
         055oburO8AM4sKUVDu41+nnQT5D2ampmlP+FhmIGbtmrPagvTM7Pz7JVcMtZpxRgKVhm
         NuNvLh3XEh5MN4T+Ry4mKVHS0nR7BblRrqmJi7mW8MEmheUtTfCTCgSsLRFN6pBbDycJ
         kktvS+yINJfI0EwFaQMYlvNZHTBbaWOURiiI0Z4/3UOamNs5Gc7ZgWqzZwVHFE9bsVrL
         qR/w==
X-Forwarded-Encrypted: i=1; AJvYcCU74ajdTHicvqbbuxEdw+7pTqIGwoL3tsP/HHfC6dRxjig5Cm0qLnQ6vZpT6sx1QEBJLdtPdikxqsJOyWR46fyFRw==@lists.infradead.org, AJvYcCV7Xv5hfsjQieg3itCvf7aOMFuFV8uB/Zzh4WRkzoi17sg5FcWA7PaJ/n3QxrCiBUKwyXH6Lo5JbkoHAmEil0Hf@lists.infradead.org, AJvYcCWvYSyMRM1vamfU6dgjAz/L9Qc+MR/g7eyH82z8kbED8TDNgxjAq3D/VwGrm/UXvoo2y6eNPIxZ+7jAs5/FUTk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPEtKBAF97SGDBLLYzD2q6cRwO6/HM4hPLYGGvSOjzXJd15A9j
	ZIQsQHa122LA8WkZzTNSrI3lEFJEgEOMBuN77iUTY+BDbGIXxKhL
X-Google-Smtp-Source: AGHT+IEaqtdBarckQ2MLamn5brMtFxndPeCUFri6Du9gBuXr8+fp6GAzR0kiZvvGZMIDLC3RejE/0Q==
X-Received: by 2002:a05:6a00:2789:b0:71d:f15e:d023 with SMTP id d2e1a72fcca58-71ea314d7damr9272975b3a.11.1729397994019;
        Sat, 19 Oct 2024 21:19:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13eb2c0sm508744b3a.142.2024.10.19.21.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:19:53 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:19:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 08/10] Input: i8042 - use cleanup facility for device_node
Message-ID: <ZxSE59Qc_Zp_Azb3@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_211955_584709_43B94CC1 
X-CRM114-Status: GOOD (  18.06  )
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

On Thu, Oct 10, 2024 at 11:25:58PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/serio/i8042-sparcio.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
> index c2fda54dc384..8f38b6f4ae77 100644
> --- a/drivers/input/serio/i8042-sparcio.h
> +++ b/drivers/input/serio/i8042-sparcio.h
> @@ -106,17 +106,13 @@ static struct platform_driver sparc_i8042_driver = {
>  
>  static bool i8042_is_mr_coffee(void)
>  {
> -	struct device_node *root;
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
>  	const char *name;
>  	bool is_mr_coffee;

This temporary is no longer needed. I removed it and applied, thanks.

>  
> -	root = of_find_node_by_path("/");
> -
>  	name = of_get_property(root, "name", NULL);
>  	is_mr_coffee = name && !strcmp(name, "SUNW,JavaStation-1");
>  
> -	of_node_put(root);
> -
>  	return is_mr_coffee;
>  }
>  
> 
> -- 
> 2.43.0
> 

-- 
Dmitry

