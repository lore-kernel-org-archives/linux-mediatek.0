Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748E6C55184
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 04:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=; b=w1eZ5/JjwprbiFIjvczM+VQeAF
	nJfu1JHqixyZP/4yhs87v08BdYmixflMIgy7oxIS8OwGft3fSQgFI9jC5U5pxRcdPFekqat/k+CUZ
	/Xu4855g+uCQxTuafQvZL72nR0qfzT3kNdUouEEfiThjcBTzyeDHsursCDPwhaLRWRiG2h+A492Rj
	tuLa9UVMbtYrhfvEE697aUTzY54pwv6d73WuZMq5W8YUqOPizefXqN/evHtPRjcba+9PiyP21NhtQ
	1bJso/668LdroePtBQ7SqzHbqBE51jxmzFv/y7Tlq/tnLq9/GYeYgCtp64S/ypOvWSa0uesb0hT+N
	nRO7blGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6eb-00000000yhQ-2y6M;
	Tue, 04 Aug 2026 04:21:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6eZ-00000000ygL-08VD
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 04:21:24 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3811f512167so4195266a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 21:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785817282; x=1786422082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=Ofc6sUoU1vvQ2mWE3A68da9sQlaiAxpZVSK/KLtqxq53xVtu9vWvbI0HfmJ1FU35WK
         8a9tlvsgyEecLXmxwzq/42+ZfUU06xKOnuqnLhRcq6KIAU6TeFz8YDjJwImqFof0BRdg
         vEtBkrV5sWKLzHRVcxUVbWRZV7PVpF0txiwuB2OfCDJKi+CNdRYvUYVcz9Q1Q7DAX0hs
         n5qCA+jpjH2UKyxwF8ZDgdh8ARIrGieYug5f9Ug8S3GvGNI3+/Q0Vg6PPYDGyDgO1Q5q
         RHEznHJ7wieIr5K5BTQrpnAJy1oI/EZChy22b9zKAI6hP5OvdKiZl1iL/eQibKq99sga
         bxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817282; x=1786422082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=J02XzgI5tnGXphUoo5quHHyK41IJr0Ew/V0RaZV7A3wWt3nO7F9+zY55mNB+9xUlxm
         peaDva1XdQCuDjSv7s8YOw3j2A+nTbG0Y1bv4CuQeCJpktfITaeA9DANzqLEui6ePuWv
         d4qIFbdskWsf1RKXFs4jTIXl2wZ1HwlNA+UFaKesZUwAGll3CuEQrQrse30vxhpiHAsD
         i++fBxcLm8YT9iBbkGUJvseGYtx43NWkB44p1Qm2G5b6y4Qzg/bL44/hrEEtOv+2+FD5
         HG5d/Q25sSOsH61dPjVn99iykKYE20jANpWsd4V20LSeoS2cMJ/Sm82+Upe0SlcHhL+r
         kzmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rra2J7PguCUnUkRGc59yaLLQDkxI4kww5+B26XEICmz9DhhPWR0+E9LZXVvLohjJ0wFuMhhYJWcI42i3eRUEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsbDn5mlNF83kFTcHY8+GZ6ffA+pAIzOeGXi5535dlpdxeU1l4
	hAv1o+57fulo1vBrceoCVtq1w/TjJJ6ePvAIlNardSHPVW3X/dVuSy9MIfZ+eUG+4ow=
X-Gm-Gg: AR+sD11kbugNwwibpecmsCuR2Gw1aiNMTArbd6XK0Z4Ac/RSMmpk25bUNNA8NDL6Zz8
	gjc8w3UYC/W/aFY5EbX44SUmpVJK0l/9s+s6E6AO3aAfGvhPZG8X/bKzHwNR48U4CFTX+uWiV0G
	42Cod1Oa6jqoLH3VdV8SQQvWu+FMByM7du281ENopFyowYVhlh/5QA8PB5DzrPpWpfyY307pV7J
	c8kbvHoOmf+A+zU3ULJh8WALW7AHiSzjzGDzRqscmM00j1BC/OsoyBLc2Lm7XTvfSnZpud+NYtl
	cngCQ9UvqBE8wS9DUr/c8H3j+dmpDji9kIXBDx+5ufBbmYP9c/UWLi2Zblz4nLM+J41ZGzlgZNS
	9zn4IpXrfUAH6+zYvYAvvHgaWSqlpGd6v/2+4h6A3x7tHZR7ENofu0mnV5+oaA7tXRMkDyO+YiK
	6U9Nic8VRigH2k6nFRC8fU7DrcJFyquH0XMA35I5ULP08DjTqZ6KPZ/Y4HLGsI
X-Received: by 2002:a17:90b:4a09:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38fbc60c7femr11264577a91.43.1785817281575;
        Mon, 03 Aug 2026 21:21:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm64394331eec.3.2026.08.03.21.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:21:20 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:51:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
Message-ID: <mre6ggyfjxo5dgvtrp3nsrbxngenw4r2eb6nygi4ybs5zsefyq@kcu6u33q3ien>
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_212123_066236_BCD87277 
X-CRM114-Status: GOOD (  11.11  )
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

On 02-08-26, 19:35, Maulik Shah wrote:
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 1ec22010a3f9..5fcbea32089d 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
>  	if (plgpio->regs.eit == -1)
>  		supported_type = IRQ_TYPE_LEVEL_HIGH;
>  	else
> -		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		supported_type = IRQ_TYPE_EDGE_BOTH;
>  
>  	if (!(trigger & supported_type))
>  		return -EINVAL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

