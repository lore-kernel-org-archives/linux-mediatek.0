Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E69C83F1B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XnqCTUVDxXqLw605VpQiOmmAr4VEm5DLMnQo1CAZWc=; b=eCUK9O5jSl+dsXlH5ZEbk7GeHM
	1qZAJiRdSWWQe4THMK4zw2u0M1t3O2gwFAWyjaN5TqaN1pyXTzwa9313xonr884G5A0JeWDLc0nex
	k8lSUp0OT5orVFAK/izPnyTjCcZwF+qYVV0hC998lbH54sZa4RYaSjmrYm1glE97YTptiyL+5ILMp
	GCLFkZyMsPzqksuOBy27dLl9p+06LWXvc2kBYuzqXN4NC14jdDRjjDxBX3nDPwUtP7bnO9K9ZJk/n
	UkjceAL/WSu8j3c/0TPWcDZ2ssF7HoX2J2NSBaHbjbZVNUXNTvyhiKxXWBiqxVKAdPF5NUb/0N3t8
	9bPPLHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzs0-00000007UY0-3CjM;
	Wed, 16 Jul 2025 11:00:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzP6-00000007QXx-2NV4
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 10:30:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b60565d5f4so301275f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Jul 2025 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752661823; x=1753266623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6XnqCTUVDxXqLw605VpQiOmmAr4VEm5DLMnQo1CAZWc=;
        b=layoGBbGTrwbwKnS6o+jQHZTfDkXUISgDNyZMa/EYnVgERTXRsHT5ZaHXBWen9iqQg
         NYr2wQL8LPOIwW3l1G2RDwwn3tCVxRZzid0ipP66OdqE9Nzo11gzWSDL7dQ08d4gbqS3
         V1inJouPCq3dVFxKL9Mr42uejdOJi0dbAKszctA5ixgfOVY9htonWBCd0linK+mCFO/b
         Aque96MncjdGDDcHfqjjtHGdeNf/ytAO7/HVO0WO45gSoGPr5FjcTTJz8nmivhQsWIzi
         4w+iOp9JOSuYDK+EO9w+BIleD2ELcNIyZaLUkjvIQSGApqMtRi374c1gaTtd2F27s4jy
         1X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661823; x=1753266623;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XnqCTUVDxXqLw605VpQiOmmAr4VEm5DLMnQo1CAZWc=;
        b=AtbKdbPTJdjyqupRygKZLFD4kBfi2U58ajp2H7FvscQxuRLvSWIx1JVcuWWAShmRh3
         S6jhuFa2SvOfOUAA31yPSn930euUeBcay4FrAEoUAdvGl2Hj3nmUcWeK7XpUwDNEiEd3
         vDg9QQ0bqvL/MvZg0WtTrCts7eKz7b0XVS4LCk9U3KaiZ4tcWmi4/9qVlrljvBcLOkXI
         G9SDys/LKAB5Q4363MRi9AK0rWBjx8HgJDuGn2Jppx7ZpGraEhqcNgZ6njb4sb6NTZ8M
         uTnalNX5kUSWrgV1gV18iVZ5lB9+jlRWM5KsMvpaJR2hiQync0/w1PnXVJVZ3BhN+Ua9
         XOiw==
X-Forwarded-Encrypted: i=1; AJvYcCUUzAlf0et9x4DCIcwRhIECt+xG+GXt1Cs97BZ7VzxwOX1HUCUhwiGvwnBHsmXSEkAKTzdEsU++8ax3Y9OtQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4+87ujGIMg1rCjM2+ouDQUHwJ7Woq4kiBLGN3qwpTt/VpWY91
	QIg3CJb09J+5f3eepewj2Nnxs5I1MpzM4AEQZnskyXKgtvZXOzSoEd0aQc39iUq8aG0=
X-Gm-Gg: ASbGncsHva5FRF26Ty4vXFGIve6yRocbUNFp6CWYn6Ji8n1Y2Shm1pW9mBQZo86Tkd3
	+oBKuoz1ynIcrjUR/X51uXQVPUxzoU1MFiSaCi+jw2lI/2NAKvEH7XlTwrrj+jYLDpGL71NtkTy
	aa0I7JJzLK6+TXZkiYGY0+8Vg1p8wMv8BKqf+OQH+rjTQHpttIogkf6H3U4hAm/ZexN6qAVChw6
	ub1E+FUryqLre1POa1y59a5RVdqRiUUSjXAFVpaKeR73MLZEAMghzALItu1zLLYhu33ByTuL3c1
	su64AN/9gs3u3PJ3oo/4Tf0f9/rMfxk6xFGsM35Ge13rg3/kccg2zzm+LY/LNp6w1MhCLjZ6bam
	cnClOq1vsXF5GFCmRBxPMzTWj6nChzaN7JlVPkjjymg==
X-Google-Smtp-Source: AGHT+IEWEOxnRmsY7CW6qzxqOxUEAfhDQBThVtGYsxYdHnrMvbBgNTYPuxWQrQr9DcPA8NVplhCfqg==
X-Received: by 2002:a05:6000:40dc:b0:3a5:3369:52f3 with SMTP id ffacd0b85a97d-3b60dd4a834mr810416f8f.3.1752661822704;
        Wed, 16 Jul 2025 03:30:22 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd15bfsm17790152f8f.19.2025.07.16.03.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:30:22 -0700 (PDT)
Message-ID: <8698f842-a464-47b8-8c47-97cda016e227@linaro.org>
Date: Wed, 16 Jul 2025 12:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 2/2] arm64: defconfig: enable Maxim TCPCI driver
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 openembedded-core@lists.openembedded.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sasha Levin <sashal@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>
References: <20250716102854.4012956-1-macpaul.lin@mediatek.com>
 <20250716102854.4012956-2-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250716102854.4012956-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_033024_631234_F1922329 
X-CRM114-Status: UNSURE (   7.65  )
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

On 16/07/2025 12:28, Macpaul Lin wrote:
> From: André Draszik <andre.draszik@linaro.org>
> 
> [ Upstream commit d2ca319822e071423ab883bc8493053320b8e52c ]
> 
> Enable the Maxim max33359 as this is used by the gs101-oriole (Google
> Pixel 6) board.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Link: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://lore.kernel.org/r/20241231131742.134329-1-krzysztof.kozlowski@linaro.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

No, that's not a fix.

Best regards,
Krzysztof

