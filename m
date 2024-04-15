Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7370C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vh4G/AjMszS/t0HRqrjwJOahq/7qZsmwbbcrIjf8WJY=; b=l8rrz5FdGIZWCA6le1Qphf/w/z
	CFQeE9s/jkPMo3HXO0uUxmM65YazKWGpJe8VGnI0pz8MMAfITwAsJjesGkG0npECDOP0PEopXLj9C
	GQOFlu/UWPu7Mq5gOOrmC6uYQ68YgwlpNlxXqP3RKJEJUCGZu9zGC+7bErfALsvHvDQj9JRDZ1OLE
	9gnwAkcjEwRTgij5r4HjRUGHn5X86qzk6QOSfYZNDz05eVWUbOXnXNLL2TJ4NyxqcFL+/n6xIfrL5
	EQL4u3jElGqImh6ph2YHHVjsgZ5BuUx6l5wh6BEdRXGeSZeQaBt0wHrX20VkJOg98Vt34txnW6zsb
	LAH7kpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTBO-00000009ref-04r7;
	Mon, 15 Apr 2024 20:44:06 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTBH-00000009rdO-3HDi;
	Mon, 15 Apr 2024 20:44:01 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2da08b06e0dso39397351fa.2;
        Mon, 15 Apr 2024 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713213837; x=1713818637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh4G/AjMszS/t0HRqrjwJOahq/7qZsmwbbcrIjf8WJY=;
        b=QAXwa7gAStk0KuRjTPMlRQ5RMAIv2PGXkwEd3IQQ+oZpb5yOjOp6pk70RwQnCtWobY
         J04NA5GAYDIu0exJg/I7DlxLRWGeM1RX4OQZt1n49s5Mlo3DUXvDudV8Y7KfM2oTItkO
         H4kQhJIaF40wnTaPU+DCErzNOC1TOuF1n52oX2LiVsMsOUloTnE1T5GkeTR9fbPztcUQ
         BzFRmABC9OUrrdxkXS3qHyAnk64Ij32Tu+gvlOyd7EjPlJRjfg9OmC1amDIYXOFNf2OK
         mGm+CMXtkCM4D1rHcLW0nLRXgKiHCPyUcdm+OAw/F1e0qDHs3Vwi1ZBK0yegeNCACVie
         1tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713213837; x=1713818637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh4G/AjMszS/t0HRqrjwJOahq/7qZsmwbbcrIjf8WJY=;
        b=r7xyVJLkzm8kDW/UliXi1JwvXjNylQHfEW7axQ6K8/dxfzYv9xk9CI6YE3nrzyfH2V
         a8x5uE+Oxrk22V9AZCTE++e9jf9JPn01T3vbkaLZImbuS0xMXcQ6rpTLBoqvLPyDbmmB
         MJUL0j+LZBuuDoSjTNOL641Gua98ji0m8D95xUpCrdDdg2tYzG3ZmfXWbOtdjQf42vht
         IQI2+DnGfrsvEmrRqjXrP+r6VShL/3les/gk/jGkcNaSnuSyZGWcVnI8gGWW2H4ZTx5k
         O0X+U/zgie/O10AbxRechPJ3JLPtDBrRTFyxTI7lg2IayIEkQtVi96F4bk/c9CsbbjDW
         KX3w==
X-Forwarded-Encrypted: i=1; AJvYcCUOBYHcfCEdKf3ovmX9iEjnwYSfZQ93YWkK61XcXTUA7OueQyBkrQEsfCMkHyun6zyp/3MD0U4wRdNVsZRSTWNnGWlr6I9Hqd5XaiKBfPIOwkDErr7LHMTA3VgG79B/vO6TzEyGe1Di6HwzydejXHJYcgTj37aVr7o=
X-Gm-Message-State: AOJu0Yzb8OCQnxj+v1uc6LLpzlrdxKoXinPVqiffGCL/oRrh/6I5aC2b
	UMcfdsDHb3jEFqz110gCTv/WFFATExjm5OfQ+eXdz8eZueyzMAPy
X-Google-Smtp-Source: AGHT+IHuk+bIjnHF/M32DBBym4XM02bSBQeXa2Xi9niRXZxUmLjNJbCmeAfQcyqxYAWLBytnQmudbw==
X-Received: by 2002:a2e:bc09:0:b0:2d8:97f:451e with SMTP id b9-20020a2ebc09000000b002d8097f451emr8116687ljf.37.1713213836997;
        Mon, 15 Apr 2024 13:43:56 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d630b000000b0034659d971a6sm12976964wru.26.2024.04.15.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:43:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 07/35] media: staging: sun6i-isp: Remove redundant printk
Date: Mon, 15 Apr 2024 22:43:54 +0200
Message-ID: <4910185.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_134359_857062_6B59C28C 
X-CRM114-Status: GOOD (  16.12  )
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

Dne ponedeljek, 15. april 2024 ob 21:34:24 GMT +2 je Ricardo Ribalda napisal(a):
> platform_get_irq() already prints an error for us.
> 
> Found by cocci:
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 5c0a45394cba..a6424fe7023b 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
>  
>  	irq = platform_get_irq(platform_dev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get interrupt\n");
>  		ret = -ENXIO;
>  		goto error_clock_rate_exclusive;
>  	}
> 
> 





