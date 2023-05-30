Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F72C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6A+xXqLFRW5fPXvfVtMkX6LKKLoRKsjcMfJO7DhUdik=; b=ZrEnCt4/yGSHC3H14BgsQ1irwn
	R7fZwAwjcNV4Spj820yLuTmqkgpSAt38u7bbZPbN62J0DzHN2YYxe4wZDfAuEmUOzg1NPy+bKy05f
	DnoZhc+4v8F9bfK+4WixtXvfbXcjAachGLIfDhlQckjiCj92Bd8RJ5vSAsTrPloEvRg7DSK3ToITy
	IDSQeUhDp9wqx5ubaY7BsT3nrIAKdoTIbJ+WfYnTxaFfOelUFK6+1UrjUEiBjy6QTNZr1InMWEgGD
	bnm/3vwd24AXhZKHl3kq2SXe5A4HnM7mfQbS0NnaJzDX5z8IKSwQCcBw1L+MbpujzKVIKaBbE/go6
	q+/cjPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zP6-00E2jK-2z;
	Tue, 30 May 2023 13:28:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zP2-00E2hB-1N
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 13:28:45 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f850b32caso862534066b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685453320; x=1688045320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6A+xXqLFRW5fPXvfVtMkX6LKKLoRKsjcMfJO7DhUdik=;
        b=rGjo7SPzrKSY6EqsgQVRt48TIldoTaPYWqJ4d8AGd3N/7kXcz3IVtfw90c0acOKck1
         geEzvO4vKhrbosBH9t63C/h+4PL7LLjLpAwiaYpvbzOBVYhrLk4dCH6Vs2pBKgdb/Sab
         owcB4U6XZjeVvPzSJaKDXrTbYY6wEI0JbKtutAu/SARMLZES4bPop97ma5vG2Ou5/2WJ
         B6HnwEqrZP3i28mC2ZvmLDEJyBSAaXiLwcoNvq12sRCoKV+iLRuuPL4xgQ2QnEuPNJu3
         EYrNOYTSY7pbMBiglG+Ab8iR5J0RPhV/8q7Qe1JUoTHWrZXMY9CV7U1tEJsYDAEs6LQs
         45hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685453320; x=1688045320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6A+xXqLFRW5fPXvfVtMkX6LKKLoRKsjcMfJO7DhUdik=;
        b=I/kPYwN/lRcgn8/ldhYyvaTSTnykslkBiO+7hbp5NVQmn5XYnxwb46HE6E8sBDNq/1
         fmg9bI65xwHtuY0U+Z/rvTdTywLKLwqFnZPKAuJDIeEtBVvTQneg9cnNAIY0qlTDgxKP
         z3zW1Lc4+CdEf3QsyJOjNjqknyAWGTakHLcqU6o401wAYQMW5Kxa5A4/fQ81rfhyljZy
         2FKaub+W/DsdlNdAuD3iVi+dcJy9/d5+S+IuQMAstiy9glCi0SvFcw45cHycrZ1vTM+r
         2J+d5mDgRVePF3j/DqG3/YJls9ddGGDnmJAvTwmpSUdpyWybFU2mz1a1gU+pdbGlAVy/
         a+KQ==
X-Gm-Message-State: AC+VfDxx7T5cyJfCleqtcgnJESvlkI+SkFC2pW80OD3ipHPapJN4X+22
	JCFY9j5CzBD08Gt+AfnK+1lw6Q==
X-Google-Smtp-Source: ACHHUZ5uWXFecH4hpqdfYXssIU+Y9H1eIyhmt9oBeAgqCNlcWe46eAJq7azf0oz4fVbkd7+2dwimlg==
X-Received: by 2002:a17:907:720c:b0:96f:a190:8381 with SMTP id dr12-20020a170907720c00b0096fa1908381mr2171472ejc.10.1685453319750;
        Tue, 30 May 2023 06:28:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id b11-20020a170906490b00b00965cfc209d5sm7329293ejq.8.2023.05.30.06.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:28:39 -0700 (PDT)
Message-ID: <0ef5b9dc-0c01-2a36-533f-4959e2e870ca@linaro.org>
Date: Tue, 30 May 2023 15:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 01/10] arm64: defconfig: enable MT6357 regulator
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
 <20230203-evk-board-support-v8-1-7019f3fd0adf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v8-1-7019f3fd0adf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_062844_467514_38F26917 
X-CRM114-Status: GOOD (  10.63  )
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

On 25/05/2023 10:33, Alexandre Mergnat wrote:
> Enable the power regulator support of MediaTek MT6357 PMIC. This driver
> supports the control of different power rails of device through
> regulator interface.
> 

It's nice to say which boards/SoCs use it which would justify why we
want it in defconfig.

Your last sentence brings no new information - it's kind of obvious for
every PMIC. Instead of redundant information add something actually
missing - why do we need it in defconfig, IOW, what platform needs it?

Best regards,
Krzysztof


