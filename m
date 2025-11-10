Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ACACCFA13
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 11:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=; b=DmX30978JppeBPZWUXIWzTQCEW
	1V8lXSu3qjLKhH0zpiDmIf7YGkgSI0bmhgjNdDRMvESqJDD1QDiWBcM7fOKcKWFxNHeOmo7JlCSk7
	Nk44L6yjoWlseSWrB+DRBlns/BoYqZOyDCAMpiNo8Mjcc62EGbAmO4auBys8dv1F4Qy0kciWHCpHf
	DoJkymX9U9W1kK4sqqkvXxQofzJtOwIrzyEJmUBNKInf49nv8S9lmBgzEobcbYHx7FxxEIwvmymnL
	cOpANsnLyjXBFwx84N+0cZ/EqClNosBTFavrYKHhJYCXItWJU2iQfSlBgTb34YH++YS2shzO6lp0Q
	y4URXjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPke-00000005GZY-3iir;
	Mon, 10 Nov 2025 11:08:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPkc-00000005GY1-1EpB
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 11:07:59 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-781997d195aso1800488b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 03:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772877; x=1763377677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=SH/3n36O27tBeQ7b+Y6wNUrbXqHuX+VCbf5qXGTMdBCt9j1P5OOLU5e9MLW3apLOk5
         S+Cd2bBYqNYCUBpP8wi6Y6hGSYNyH/W1QbXZWNK+mDKihLxbE2+0CntbYGaX8znIMyv9
         TcUVx9OV3uRdEltvX+Eh9NCma8kWyf25Q2evEnNJ0To4c4FRbwl3776L8w1Vy2NmW1sT
         EQ9FfV0Z9WAych8uMRbxkrD3IBFUAhAKWfzIvz8VGJZDy9a2qbClVWBv3xfxsiCDlZuz
         yZXz0AmqvoroEJcBaxnL3xA3cd0PehlCuSdSHjAQrVynYEo8Uqprhxj5HXAh95+4QIqd
         HX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772877; x=1763377677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=RCK8E5w+QJxnIJ4OcmokEsxCfBI2qgKlm0GuUM+rDdrVwT27qMs5bUVxvHsiVvaN/A
         LwSGH4cUSSM7GDVxCaXqkHHNyZReA3uFLBYDZIj++UbfvwIeJspXdmq2c5rUNahp71z0
         7q1K+xATy83QKtoansqECrxb4K+V8yTti2KVtVsoAcyOWbKcqyV90T3ndnh7nPIAQlAu
         gzSByyYHPpMTTctyo0eNz9hpdymqgUcxUdPCQsqDZKgA/1yCMA+G+4DtwuK48GDd0dWy
         M7diDa42V81SkQKfvREl4QmzmiNATS+incbnF+eSbXKa7gjAT+BQQAURn/Dz8ZDeV8V6
         468g==
X-Forwarded-Encrypted: i=1; AJvYcCW0yMk/Hk5DFaqV6HeN2q3iF9mxXgpr7hglFNHTPhZHdBY4T4I5r4bi4iPOfH3c9m9heJtVWYfXg6k24QOBpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzda6v2GZPbTxCMBssChp5UoscXAH4gm3XnPEBQdXfSOswxB71L
	y3nlw4d/7cM+Wn6KeS5ww3cvUeF1zeodWFX0zEQSp61cnF1Uj9dbKx6qOCo+ZBox9CU=
X-Gm-Gg: ASbGncu6r3T5bopEZCd9hI+Eb5GVbHG4z5U5J9PClUC0NDwAxn+83whluIz//l04CeK
	6FtBvMsXuUgsSmESctEouWb9lvd/vIAh2VBzrTasYwGOeOkrzHwJf8LDMpV8pqSpEIefKX/wAIK
	MqJWIL+7qmeK/8r4nlX67yoG/YUx1o/wtTpAvKyRXnXu2Na0KHhNKyv9gEUvBkC22dsv2ncqI0B
	ya2rDNj6kZLWxwK6RyIx7ag4+dk4lyrW2pZ4sPg3LUA8KvK8I2u97o+a09C6CshPfq1edS4A/7c
	/votbIpUA+q6AtHMUTHd+hxxrn+AKAx+Kin8DEYB68xWjmZqeacjsFX7khOECEuwtYg1D1cSJwl
	oBojLvtVhyAxMjJbq9FePjijdWKszoXja1nhyDuLgsaQvQUmD5m/qSV9OTidi1wfGfgS7GZ3xDA
	uWyB3e3jgAPnk=
X-Google-Smtp-Source: AGHT+IEI5dvtjpf7UreD77ujcsma8Qc91uG0xXgrZUKvQ1Ri3S/fmPHsBQ3EzHdR5mFgTf1mYnto9Q==
X-Received: by 2002:a05:6a00:1990:b0:7aa:2d04:ccf6 with SMTP id d2e1a72fcca58-7b2232f8c80mr9070041b3a.0.1762772877004;
        Mon, 10 Nov 2025 03:07:57 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09cd6sm11397368b3a.23.2025.11.10.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:56 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/13] cpufreq: sun50i: Simplify with
 of_machine_device_match()
Message-ID: <awphoxojc3benzdam47mcx7pqty26ohrwpgv46kimg7nl53rqc@szq3aqjqsbrc>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030758_333765_60F46DB0 
X-CRM114-Status: UNSURE (   7.54  )
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

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

