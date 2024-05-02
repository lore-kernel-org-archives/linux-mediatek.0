Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D24C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlYIl4QUqH+L8aj9RvYS0t2bm4V+sO0EPOMcAswsROE=; b=If5gTKwKboJP8m/7y+DkxekJzn
	7U02w45sajQWz/GCz0OWarCKn5JMJomGvESp3aN3iTcDqMRYaFqo5xw1JSFQYftqmTnclz2JTAExu
	Ye+1d7pyUMNEuJcFfLcdcNlQxdh8U1xvBRrfO5KvyItfiINQ5vAjQZi5K26LmFn6gI4Z6a8fk9IJb
	IVqk7YJcabrMZM0z0fdVlpBNT+p1u8fuRyC9nOMeqgE/rwuUb3gtHYzVuiwJtiJWE1BPllXWVgk1k
	NaWRI9f+GyCJfJZyvUef+Ap0rBiGlWLJ2yjb8HyQLhspce6AdQpTpUbIiBQrLjY8wo54UPjVHQLdc
	cQUVjl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WwY-0000000CrME-05Yd;
	Thu, 02 May 2024 13:57:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WwV-0000000CrLA-0khc
	for linux-mediatek@lists.infradead.org;
	Thu, 02 May 2024 13:57:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-34db6a299b2so1554250f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 02 May 2024 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714658265; x=1715263065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlYIl4QUqH+L8aj9RvYS0t2bm4V+sO0EPOMcAswsROE=;
        b=SHyFqV6NGB8B9ykgxEFqjuBAyN1PzTdrexn1BQ0u4LeY4sh+A4OkKxuyv4GGaZFhSe
         kmbEp3YwMuAtoAaS/O8Ys3kNnjseyXedW/080fq0eKqv17qy3nUPe6Q5/L47swbytZd4
         lSzpHRQoli04K4A4YM6nBbHZNIA8SxfOXA96PzbnLuSIpDD/79nymoL2BMbV+mTS0Ed2
         W7kW1RgBReZc9sVBHK/RPtcOPutOwyD3xhmBz9Hh4Xn1eYGlm4bWG+IW1VMH0pxFiRw8
         C2QuCq0JkDO70rXjkE5mhHSJDKfH0y2ay6FHiX3ohQtF2Tig38ys8AbgtDC2nVOKou2O
         eSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714658265; x=1715263065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlYIl4QUqH+L8aj9RvYS0t2bm4V+sO0EPOMcAswsROE=;
        b=EfWXLo/I6Muq7gk1kClqHxMiWqhVs8tyzM75YUf7EtDaXBKj2LM+NCG/5OZhhvU/uw
         4vgbhn29y3nMa+aVh7K8lw2W0fgK4hbhMpHCPDapH/mnIW0ypfwJj99VbCWI1921gOum
         N73kbkj81U+44bQS7raRK3HfpbvxYy8sG2FITjJBHhmOm9cW22NXX64498QO7v7MUDVd
         imeq23XFu0fyUCEeac7eyDD2DQ5l/30IHVX3L4xpcuvBMs0SEJEqWSu/bQm1hVSpJ1pT
         8rK5z2vFnrvrDakp11ea+xQtnlvdwm217XndqjC7dD+o1B8Xg+2OKVDpfgKK5cloKCT/
         LU+A==
X-Forwarded-Encrypted: i=1; AJvYcCXkSvL5MdXf+rg5ayl6g+hceIktp8bGoxGFeMGg3bEgh3DRyZ5isPGbvnnZEviTIDU86fN7HwoPxvUWxfvSDkPBWwXxodaKgKy/fXeTrQhcVg4C
X-Gm-Message-State: AOJu0YwFhmFKpveKDQMP6ioj+t5QFHd18wL1Qn6WQEDAXCOX2thnj4vB
	nR8NIEGr2dQKQxg/KfHpa362UDWqg/dqrUfbEWCqzFeq0tf7wdz26I2crsI17ek=
X-Google-Smtp-Source: AGHT+IGhNquSlVMoOQFiHQHlaLnh4HUaJZiqdBcphg6JrG5dgU2hqq9lotGnLRJR4+p88MqH31hAOg==
X-Received: by 2002:a5d:4c82:0:b0:34c:a95f:1114 with SMTP id z2-20020a5d4c82000000b0034ca95f1114mr3385145wrs.40.1714658264640;
        Thu, 02 May 2024 06:57:44 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g1-20020a5d6981000000b0034d8b0b5329sm1326508wru.87.2024.05.02.06.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 06:57:44 -0700 (PDT)
Message-ID: <63cb0058-0222-40e4-aa55-6fa59e0196c8@linaro.org>
Date: Thu, 2 May 2024 15:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Check NULL ptr on
 lvts_data
Content-Language: en-US
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240502-mtk-thermal-lvts-data-v1-1-65f1b0bfad37@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240502-mtk-thermal-lvts-data-v1-1-65f1b0bfad37@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_065747_247434_2EF561D3 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

On 02/05/2024 15:46, Julien Panis wrote:
> Verify that lvts_data is not NULL before using it.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
> At probe, verify that lvts_data is not NULL before using it.
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


