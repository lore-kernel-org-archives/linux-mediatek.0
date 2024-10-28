Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B47D3399B
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=; b=3MEJAvGjE+gKDFfe5oFcv4isWP
	SEmEYru2SvYmv03fp6GHlJxisOAOOg0q/XhY6BX2IzuJe7qSvO/wKbAiF6fFizH6tyyrK9Bw3cQT5
	aH538Jjc0ism9B2KXpD2hhAmZuIzibfwRm1T7WZmgL884IAGsFDe4+IKI3tXG76vH81RWmTRLww5u
	DPA5ODhJiE5jABWxwvHA/eSeOLaiFHo5uOkGs4zn626IaUj/vnQKHkKgXISFOZs0Vl/OOsWIPO4sN
	tGfF46ewNstNi6VAeB2Wpd+95Vwbytlf3uA2QwXIPb35J0SEYo+yQBym3v7lzN2zYG0rgAJFI26ix
	92qma8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5T1L-0000000BaDW-2lSh;
	Mon, 28 Oct 2024 16:55:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SnV-0000000BXV7-2hNK
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 16:40:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso46257755e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730133652; x=1730738452; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=;
        b=fpA9JZgfg248bk+6RtPYOerCgQ+clOBNxKoKqEePJ/YxRCHjxhw1l63F4U6Ody1j3+
         ho2yMnEJ0IibqhmHRzM1RyF3tMXsTg3M6IZ/GgLOiYJAeVaxTRCwYC0IneqEyXM/dIG6
         rByXZH2oZFJPytr8X8TkIXUOBYmJEE7yFCXGQsjNIJmxwt49WR9kypFT0Y98T491fvDS
         lnxHxfhnsqqh2y/seAwTq1C8YNV1WtPh04x87L8lpDbtAm1gqeXjFdYUiRZoOM9gN8Gg
         tnWchHA1zELxoWaRdAQnroVWUc+gC51VCxlITiWRP8r6f4Z2cuO7sK6Pb0FtNBqN8ZFd
         seYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133652; x=1730738452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=;
        b=YkMUi02fngV6sy+c8NyvLQgZQOoM+bcSELor7/e1EJ3yW1VcUyQVvchdENQZ2gEzCU
         yOZ1wrNkKAbZAppQB9CtUBwAuYIjwoIvAIcnGnalVCaARjijNrBDUBqlJfLVEj55ZuVr
         OCHxRfZlYrxW/DaNtqVE2x2xku3F7p//Hvfgy/eQB+03g4Gmw/c3taGtev8ZAtcdWbON
         nznXvcqAoWvDW0SqZ8Ge7/hwe+MTAGMKgJ6bt6q+Rie87scTwDiLg2iXKrWz7rAiGLLa
         obVk7mzq8+ETM35dJQtdrlBcZnPcm6VIEPZUvHTT0buHeHYrFZyR9gFenI/PEhF2Ehju
         898g==
X-Forwarded-Encrypted: i=1; AJvYcCWkUxBPlBJK+yu498LHhX1bnLrvd0aH5C8z+QQN0CVu4FjXHBC4aCOWenq5Op5KrQJpuGnEh5CSALaurcLimw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy66veF0F0dvkjisnxOL3UDakgducThrWWb1Wpz71jtMJ1zw8M
	fo78jWq0kLtS0yRvufIp5thGbq0jINCdeJVkPTVH20KtfEl64v/mb8NZNyjacPI=
X-Google-Smtp-Source: AGHT+IHD7ecehSeRSersefttuZxWWc/yvJLPk3kslyGa7nuUur+ExAiKbF2BIlY7ADLI6KIVbs9TAw==
X-Received: by 2002:a05:600c:4fce:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-4319ad20fb6mr68256455e9.30.1730133651812;
        Mon, 28 Oct 2024 09:40:51 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4318b5433f2sm146420585e9.1.2024.10.28.09.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 09:40:50 -0700 (PDT)
Message-ID: <0f626477-7af1-4f8e-a770-39f69d9b6cbb@linaro.org>
Date: Mon, 28 Oct 2024 17:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] thermal/drivers/mediatek/lvts_thermal: make
 read-only arrays static const
To: Colin Ian King <colin.i.king@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241022184622.1296044-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241022184622.1296044-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_094053_687940_D29DCC1F 
X-CRM114-Status: UNSURE (   5.78  )
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

On 22/10/2024 20:46, Colin Ian King wrote:
> Don't populate the read-only arrays on the stack at run time, instead
> make them static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

