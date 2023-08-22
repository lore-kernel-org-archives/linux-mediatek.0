Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DCBEE49B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaXLuaQsLsLn1fI/Z5qiRRQya9b8DYm/ma/PDKi8BUA=; b=PRBulyTcXtXxfcpHPL5sL0ouQQ
	6yYUmMg0PQIlYDgIPU6cNrYZ8pCDTY+xKvFtUv6T8LD/ts58rn/MylaQncbR3uYOPNbGtN5gKeE1Q
	Ov0lPmIHvIxn0QAIlREV/0uHdAokqJSwjiOBdOkOMer3o7UAKtN049rgNkxTpqR8FLM1cVD5DFNXh
	Edjc3rDZLF7nSSApoRNBtHmQBk6tSez1vyX+nQ4CsHugLkfFkl7ruz8Xg09OALyp3KpCzP+snf4Ec
	lfyUUXKCxiE9p/m/SZzNnhYkUsic3AVtS7DDCcs8G9RT4LUxutwq14CSQ4Vj62X8GYPvePoAxwsO5
	BYi/XV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYXBm-00GiYM-1f;
	Tue, 22 Aug 2023 19:37:18 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYXBk-00GiXJ-0G
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 19:37:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-525bd0b2b48so6149192a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692733034; x=1693337834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yaXLuaQsLsLn1fI/Z5qiRRQya9b8DYm/ma/PDKi8BUA=;
        b=waXr5YRjxLCJ4DuKTagGAPB8uYsMyWMtAkZ0dOWMgVTpoIL/D8gyCURlAwzCU0xtqR
         LkwKf7YZDPV1I/AvYLLWpSDWK+M0d0KSIRG9Wdy6Y4ZGnF2fRAiSz2NgQLw4T+9x0Po6
         lbOfvQhDm4EyMQqhZt8So5FEzl2r8kjN+Q8YmK2aa3lU60nfPSRBYf6KDr0TTjNrz7Dp
         WBGwpRK6mPl9kxJIziQDVq9S5Rzj6XGUIlYm8sWl9XCBJiI/147GMNrf7MvGj8Zs4nGS
         dz9C7n9XGWE7o/8hNJiWJg3FNswb7tvu5LoHAjUyYIRb4bfThtQIa5NljtMGvbeiK3NJ
         m1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692733034; x=1693337834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yaXLuaQsLsLn1fI/Z5qiRRQya9b8DYm/ma/PDKi8BUA=;
        b=NpHFgC97DT9xSCJjz8745Kj+Frkp2TWjxMWBcFcU1Ac3GOT0mITL8f+3usVRyW3gA7
         dYecdyc99XCC6cBTfQMssSV5NFG8Y0HiX1XqPftP25H/h3toEqCz20+yWH3Z57kL7J/c
         ItC3IwrOCw8qjK/56YayWIJ2YugG4j+w1Tly+AIAUgb+g0OOBmsrDxsrZq3p7SNGVLbI
         mMnqvzB0xpsFg2AKTHvaGa86DA54U8w60AUOYAvAoapmWJ3tgeBgB79/OfrhcFq5WfNN
         raNHJL2oMHU0KipJUsefYXHYA4b+eLc7QF6DgZTyg3qJ3PMXnMY0jsst1PHr3B60+JHU
         LqJw==
X-Gm-Message-State: AOJu0YzZMorwOUezeEmXyiYtwyn1+gg5rfSKmBz/IufDqTrZYNwoCfb+
	qL7Ub8s0bcANzfdF5VJ/cz42Pw==
X-Google-Smtp-Source: AGHT+IHVRDr/DoYKAhd5b7mN6cX8JmGPhZhnUhp3v75kVNz5lbWCQBjSJ5EaHTl3ael1rocmrA1+iQ==
X-Received: by 2002:aa7:da18:0:b0:523:1901:d19c with SMTP id r24-20020aa7da18000000b005231901d19cmr8652948eds.24.1692733033996;
        Tue, 22 Aug 2023 12:37:13 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id c15-20020a056402100f00b0052545dbfdbasm8043271edu.48.2023.08.22.12.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 12:37:13 -0700 (PDT)
Message-ID: <7fc1f405-a026-deff-18bd-308dae393542@linaro.org>
Date: Tue, 22 Aug 2023 21:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 02/11] mfd: mt6358: Add registers for MT6366 specific
 regulators
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230822084520.564937-1-wenst@chromium.org>
 <20230822084520.564937-3-wenst@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822084520.564937-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_123716_122644_4A766FBE 
X-CRM114-Status: GOOD (  13.23  )
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

On 22/08/2023 10:45, Chen-Yu Tsai wrote:
> The MT6366 PMIC, compared to the MT6358, does away with the VCAM*
> regulators. Two regulators VM18 and VMDDR reuse their register space.
> There's also a VSRAM type regulator VSRAM_CORE thats' split between
> the VCAM* register space and other parts.
> 
> Add register address macros for these MT6366 specific regulators.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  include/linux/mfd/mt6358/registers.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Adding few defines without any code using it barely fits one logical
change. It's just not a change, even if AMD tells you otherwise with
their autogenerated headers. I think this should be squashed with its user.

Best regards,
Krzysztof


