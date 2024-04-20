Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E2EC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 23:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=; b=nNoCORpmt3CsCxzVgsWbbZ7RIl
	m46nq60x62S00B44wLhE+u5kkNbjClPXV787diA2XeRbDjDIy4UyPkwWUiKAoWUGQH8ntn9qMv3ng
	auSBk6fJljG9eNvgURvq1dq2SzarIVaYejJR9GhaFGcbz+yo8H0ZjE78kePk62CF2uA59uzfF1VcJ
	PWCPJSknvaKdjkGVJ6oLCv2++PC1wbSt6hFpfbfrUbEsBNb/FatCVpJa+Ty/G4i32B8D48u7i4dOs
	Po+TxWYzFaF+LCy652o03Q5ogTaXfPKUU7dYA3sED8K9sxdGCbRKeKZ8EAHFDebrxp2XdJ4C6mnYV
	pSOVhrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJwA-00000009Na8-1qMZ;
	Sat, 20 Apr 2024 23:16:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJw7-00000009NZd-0KEd
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Apr 2024 23:16:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so2959424f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 16:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654957; x=1714259757; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
        b=aB/CANg57JGDN1F4xSnzpeM/xwUXJAga8bCY0CsE3mG9eomPbifUW7Wp0BylM3/E+6
         soBca6mJcAXpPeWdhhwPnVUE3fb3lL42VWWEpTvmkmJh5hx5BEQ9WDfD6GogPbSHcK1E
         Tld3qxnA12absp8J2kaaQGWgMwiu7V2YaJ+4kUC1kRg4mqsfkjPzynxvjhPIyTcY8zE8
         AButT1EnI1XrLcYxPYR82Y+xEcgI6BOgfG3o83dAZDrrWuknBPjs2koUiSKQ3YhhqzK7
         IiM44Gadpz6BcNeQsEPJsNTC+fba1LGputGrwv6qketEvBQX7VK7yyEb8fvG15wq8J3B
         UBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654957; x=1714259757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
        b=qW9MT7iflCxH37NKd6MhrGZQVWEcmXgY6+sRTasetKgEV3BkW9j5Hr4PJYDG4n5Tox
         L+lqwLK2xMuE/ZEFnAf6tC1UQ+2mQ0SnfdSTaJdqUWIx3lPZOM1dVFFZILy8PKJYc0S2
         Ae0yfrop48pcqGs2xagSTQEF6Agoq98Hsd1wsnDxrItKSOOKVD9nvM7uGTSloy5jFVx4
         7gqU2ZJID2sPBCL0UoR/WBDCMoJKPtS7GQOoWDa5JQWTdSD5a0SMVb7TWD1k8jFZmyGk
         gOnIi+IqeGXI66rcLSpNrloM6qMBgef3Q6dj+LbZg13QgroYzL8A94rdiY8tukZIs2Ir
         J/gg==
X-Forwarded-Encrypted: i=1; AJvYcCXWMCAeMgaNFEVVk0uqrIbJt7zSf/Koky2m1MiUFJstQxiJHoEbpai8pNMtuGytaCA7AEYm+YnvumOFPGaZnoIRTJguTgJQ88FUrruWWAsiHQ+o
X-Gm-Message-State: AOJu0YyPNNHOlZeMvdLD1uubK/3HeWKeFs0W6FiojMTFwY9VQSNNl2tb
	hBXGM0ZGQBgIzloSoILmewre4QAX5IVd4dI6MzCb7UnOJ3JDKs9U7aB4ciwqNlM=
X-Google-Smtp-Source: AGHT+IEJ0pmo+Vbh8mjcD98mOO7pRnAuIGNTQ6Q1qc2nTTg8q3KESPbMSdkxwInYUTYo3kcHGC3OsQ==
X-Received: by 2002:a05:600c:5486:b0:419:f497:632f with SMTP id iv6-20020a05600c548600b00419f497632fmr1710464wmb.29.1713654957220;
        Sat, 20 Apr 2024 16:15:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b00349d8717feasm7913040wrc.56.2024.04.20.16.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:15:56 -0700 (PDT)
Message-ID: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
Date: Sun, 21 Apr 2024 00:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_161559_212607_5F1287B3 
X-CRM114-Status: UNSURE (   6.14  )
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

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> -	if (irq <= 0) {
<snip>
> -		return irq ? irq : -ENXIO;
> -	}

You're dropping the original intent of the driver author there no ? when 
irq == 0 they want to return -ENXIO.

---
bod

