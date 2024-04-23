Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5ECC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtCF0d5TRfvf1gJjlek+SkbwLI/L240GdEgYBnOFyEs=; b=jUZb81N4l6UfGf/hrD/RJ04Wko
	JCzdY2lQCZws9oZ9gU8m+yPHQC/aNGvF0W+AD5JZYmfQba0wKsZZk+Tad4zp86PRIwIfqb5Vey1u7
	biCNCMmPJHjsrCPF73KYQUeecNQ0ygH0vCVKPeDxEbAzRoFMXmrnZ0r1TUhNd6+Lf8hu2UtcjHL8p
	0WWYRwMPxMOpmDAMizPbjoolVdLm87jEO1yO0mgMNfXxY37EMtz8Z+ulkmfMruke/VDRrJbVz9DSl
	uCpI93sTIID6qeVh++3jrCR6N77ZHlXIU7ZwQNr2EmjVgGLTzw0qVbaKoIpb8UNsicWOWAQT6wH7M
	F9JNpk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFaJ-0000000HVcX-1m14;
	Tue, 23 Apr 2024 12:49:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFaF-0000000HVZg-2KD8
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 12:49:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-349545c3eb8so4075645f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876553; x=1714481353; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtCF0d5TRfvf1gJjlek+SkbwLI/L240GdEgYBnOFyEs=;
        b=UuY0e7SI031wsPKrA6QskYAVxiHwZJmkKBKS0bkaqXfIWumCyCKVsdKyqCwSq0EMZk
         3NuIoctxUPXFDVW8u+qgMk6AVSexxiFeSVn1mAwwEq/I2hmkbCSp4cmO/ydXP4JEiqdu
         bJh4WbPG96N7Ez9Rm0/ukEk/kVniAwow6f4MVMU0EWfawtXahyob7hpGWPnddCJlcZPZ
         pkJC7Nog5H61qE+veGZbO00/zV0NPobrxytw3lick3uBqIeZZI4OESdufz8hxCMbG5kh
         lys4ki0nn7h0YnrETf7+f7DDNXAFo0/3N7Zz7W5yZKaGzZk6r6qCukrox2nRp2dP8lt+
         eYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876553; x=1714481353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtCF0d5TRfvf1gJjlek+SkbwLI/L240GdEgYBnOFyEs=;
        b=FlBOTxDwXp9zZyDXuLV1YXxxM/9vJV0YcH5cBdmlE0CA49VQE3VKPNcCBx4lr4v4uo
         Zmzr5bfH41YgJ3g8g2JPGKhkE84QcWRygCwKSQVKkOPNF+5cA+obDzl0hUm5WZhdRT5h
         o/p4mXs9vwD5kR23VCFvg24aFu/tZ7ZbEiZffWZMKcj89gF4EFF7MspoPWFL7XGY+7N2
         IU3+FCaPc508LW1HmaxxWoA503ybfr9rwgI+hXAb3ifFhESwDdrUIuLTNCiSyka34vW6
         cCYM+hy5Wmbm49GqaSyeneFwVDP3BnqsqNHFRyXfLq+O3y/M18p8BlcEeCwtOUhKcdxa
         lskA==
X-Forwarded-Encrypted: i=1; AJvYcCVAxUpVUG/mfEEZJBbV3IRTl6tOuJWG4GRTrwoxySpubBZbCXLiM4HeFhyTTmtNoNyE7WD/x8QVp5ryJXCcj6XDVk/6JaRylCJ5Wder4uN3QIvs
X-Gm-Message-State: AOJu0Yxhvz6s4d1RvCqqkRAixTxsqiQYMF7+dVD45tXKeXRWE96iU6w6
	m0ycyssf/5k4Zo6I6+fe0/+Q70xzjfEBGZ5nflooNEO2TWnilXlLvbCbFN+t+Zo=
X-Google-Smtp-Source: AGHT+IFQ/wvfOsFaUdKh98XxWAyZjDTRY072QmJCxCCxJbX9yzwrMnJqlpUXpbY2Dl+AdrwFqOGXDg==
X-Received: by 2002:a05:6000:1e89:b0:34a:9afe:76f with SMTP id dd9-20020a0560001e8900b0034a9afe076fmr5609928wrb.30.1713876553387;
        Tue, 23 Apr 2024 05:49:13 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y18-20020a056000109200b00343300a4eb8sm13594089wrw.49.2024.04.23.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:49:12 -0700 (PDT)
Message-ID: <515e2718-7e1b-42c0-9d61-a10d00f12a31@linaro.org>
Date: Tue, 23 Apr 2024 13:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/35] media: common: saa7146: Use min macro
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054915_603801_3E4C0C5A 
X-CRM114-Status: UNSURE (   6.85  )
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

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code. Found by cocci:
> 
> drivers/media/common/saa7146/saa7146_hlp.c:125:36-37: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:154:41-42: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:286:35-36: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:289:35-36: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

