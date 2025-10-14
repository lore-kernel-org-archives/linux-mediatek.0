Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DF3CCD18E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=; b=N9/YfejYgU2k4cvxOYUeTriDEl
	eh8wJNjZ3KejdTey+ALJyHN5bmx6MrwyDID/QRQmj70kGW5o7SuAwJTva84Dx+io2HYRoaPYovhdC
	SBeZKIN/8obc8Vn4Y/cN6HDdPUcZOU7OiTAz+Pp8UGibnzFBpUA6yyUI/8aFXFUn7S9lo090zdCA0
	OyQwEUIyGW4C+yjs+McDgHqfPRkGV8E5aoFgBMcSBkXgUDRFjfoYtpJTYGdIxqk/X3Pp/b5dFgUG4
	WBRxowW1scDDvyT6Ni3GweZ/8a4tAaj28vz+V643ABVDBdNidKynOpmn2bq6wxSu3dykNuZXKSRYJ
	0fxHgxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mHy-0000000HQEY-2AGc;
	Tue, 14 Oct 2025 21:10:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mHv-0000000HQCo-3pVV
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 21:10:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so46929125e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Oct 2025 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476230; x=1761081030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=hQx4DoV3W4dpEK6dEobq2QEK2uOw/ISHlg6hGmrE/mqlIMhaHHYvBoWlLr36qbW9qc
         G9pthLE832y94NlXiVDxNKJREhJ6PE9Nky/yNBY50sy7irxCYb4ON+wRNR2KqXMWvU59
         gLHIBR99VOEhzIJzATMpIr7Lp0AUxRRO+Pu0HHGC9uz+It+S3TpRY4DqwdBZ9cnCrcj9
         cU8nleKaDqbnHpOBASAzFtdLHJ9o2zHl2Q/7G0JIT1zNWhMdAvi3toJ1zh6Y9rnj8Ify
         hvzyvdOI48Vt0tyn+5b9KtQpxxyPLNtFe6Yq/G0OcuuSVGvlmqdRDuM2SS0KaHXEwxgJ
         ye7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476230; x=1761081030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=B6XBNsYP+TQMD/2G2BJuqk40redxIMd55DyqjfBLlEk+c2DBpzaBFEGoleZM6mD43d
         cm9gEk+WTj8EVY/uP5idO8dbD/sf13frxD3qTzHw0i9D8EthAKG51RJcIyiIKsolg4AP
         ACGgkSHzz/EAKbmyDdtvhkLa0yluCvR0VvgyPAm/1RXk9wV2Cypt4QPrGk9T/bejRnxu
         XiWxEt8RuwijojWBwl8ZPGoKEgZp7iCnccWfAAqrILHjOWtqXviCNcGvpTsT3Mt4cmmb
         dhz27G5N6k9/gAriU0yy590qwpjdUSDqGakMu+4OtrhCpO/OrXYrSXXQkpmXvrhQphuB
         TjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbdw1dpzEkqX9Bfhm9Kww1RxHYlpLaMXoz5PkfT8smBPa4iyZ//2JC3xKdai1ODMOxtd1PNG6A28zQwy2OoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRF4dj5NLBo4Poc1UmwVbEgmo0Lr49c8PG8C4khF/mKcFVoHzH
	/D1KYPRq50VzCPaI9PVatj4xSSyWPjzRjRjx0qfvzZEtrPNTcemAQVlovlyfvEKFILc=
X-Gm-Gg: ASbGncuD6MhUEgq7DczpC8vudhRFzXV6Ixq8N6oMDI4VIJAmlrK1LSS8RLDfqoZp8A9
	wCUHD5+Yrqh8VysLBN8XCP4m+Okc4zpIn8mlzhz7J4ufQlUcjBIBzpfhcHopEVcVylfLa7iIUb1
	9Tp7RidZxhC7zcBKbbPcpw7MqI+kA7DFvLws0i4n95mGDvN919cJOkPYdpsls5INptQbjOZu6l6
	ucTMSeE5pwW6KT6hNt5XZ/Aqoe5k/qgRsQOREmT+LrDgcSr5cVBMpuYlVoAjRpCHlsHsIr8v9I0
	McRnji19k+Equ0JesfZimiTt5qBQeEoBGlfHM244IKdnIeUix8KUGhhduFW8AuBEBV7qq37lEF5
	0JZhesv9biG5DHdqbo0GbQR+HTVTs+CuC9iFmvH1NO1gjM0nwwcPUhj2TlJMXGRzTT7qr3nXriW
	Fesk1GK8TO94g=
X-Google-Smtp-Source: AGHT+IEbhID2cy30VH28xdYyFKoHwK5zb9GEgSYaTfKLNAL9ivTZVl5Wqfb64+N4E6V8zmftUTcSQw==
X-Received: by 2002:a05:600c:502c:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-46fa9aa0eacmr170991135e9.10.1760476230196;
        Tue, 14 Oct 2025 14:10:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe74sm25122327f8f.35.2025.10.14.14.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:29 -0700 (PDT)
Message-ID: <269f3575-b315-4855-a2f8-243a91cd62f4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/32] media: i2c: ov5675: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <mtwaxgCCtRmzwKQWossgjGCuiRpYsskzaiJXACP41oCx5DY1kIZtPt-agjTCBTTa_kRJb5g4XI-AoGUeIQ8nmQ==@protonmail.internalid>
 <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141032_001691_D9CDEE32 
X-CRM114-Status: GOOD (  15.99  )
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

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov5675.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 30e27d39ee445c2603b8fecf7a1107969eb97df3..ea26df328189eef449ce121c0f62a4ef02631830 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1184,8 +1184,8 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
>   	if (IS_ERR(ov5675->xvclk))
>   		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> -				     "failed to get xvclk: %ld\n",
> -				     PTR_ERR(ov5675->xvclk));
> +				     "failed to get xvclk: %pe\n",
> +				     ov5675->xvclk);
> 
>   	xvclk_rate = clk_get_rate(ov5675->xvclk);
>   	if (xvclk_rate != OV5675_XVCLK_19_2) {
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

