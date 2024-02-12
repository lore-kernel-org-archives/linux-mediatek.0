Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C63C48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0UtqZNPFjX5P1BaXNEatWC0qrVo/ZQak0ps1MZWojU=; b=lM3sRt2EMHB4qJ1s0P3exiccEQ
	hoq/fq+3i+9sKRoo+xQ3SpAZLeba+zSWPbklNs/yIU6YcsC0gYe0ZVpkpXkRo0yvlf6WEIE03HWQQ
	TFdIMuNeFk5Jx4QhQwFfY5Q1KiWOBm9GUJrdAm4Rsq4KrIbVhDsNZs7Bp2tTGNOTvUJzdCtURsZt8
	TWXkMkbTOpNlgSqf7h5n0lJbb3/zktytnDKnaOhJBUVMo7ZyfQifaizlpDuqjAPpuBmf6N7bjPpHC
	0pFn3a5bRgQWVmnPl9usEUE7x5pJyYPzFpS3WmuEDvLP2yXaDtT405hkaYlMfXRw1AWbCjY+QP3dJ
	1CnHyjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZQci-00000004UTp-3cQl;
	Mon, 12 Feb 2024 07:21:04 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZQcf-00000004US8-1YgW;
	Mon, 12 Feb 2024 07:21:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so3595350a12.2;
        Sun, 11 Feb 2024 23:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707722459; x=1708327259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0UtqZNPFjX5P1BaXNEatWC0qrVo/ZQak0ps1MZWojU=;
        b=PvqUWdZt9sb1n0IyX1TPRKW1Z7v3CujH+j6TfPAmFdZmMzxsDqAaic21oBVysp6CdU
         6LTwDUv3zWj8H+dYRkfnKZxj0um7ZKoS+1TXNNcMG1oPshbWNAUpXIpj7SdjPBhLvlj7
         THUDdD6TcZ2xVnmFpZfKMpHTGMx05tplCVCUPBcFwIq8bI9g3/PQCdSwYUp/pm3VHmEv
         DaXR+Qio1sYBnFod/AwlPOOhpUbWadFMeC+4pRgjTlTlyFqw5+yEU3oBme8CzcgkN2ts
         WVsHeWZRmqRC023/KgSk6DKAZs0fDmWVVBTKQZdmX48DQk08q+D1OD6+bp1Ug0fvWkmx
         x0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707722459; x=1708327259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0UtqZNPFjX5P1BaXNEatWC0qrVo/ZQak0ps1MZWojU=;
        b=fusiVsF3BIqHNaWCj4dXUg0iDEaF1HlQHivv3Ya9d40TvyKvDS3wl/AMCLy4w3X4rZ
         7NCQWbp+zNEZQK0Sn6rg9mtSrGrfPdNew2YM9tSf1WeG/Smik+Qk4kKaeWrbrVimfue+
         8yGJpbRYDlsXec5/wOCLv6oKLcziP7Nq9ryxAduyeTh86hCC/xcbuxyu54sF8FNp7I9j
         h4o1xD/cCoqEIgJHXX4TfO0YbU2ejTk51nzgMbdAlS0q1k7j09XBiI+TnNDeHGNEQYGk
         hdBVskuguPjcdHKAXsenWweMEhWIs2nn5oIrKaooWLIxP7JgB/+LdAFgLxLvYMdFWL2p
         t+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCU83QrPDdUWeWE8uc2AQ7c/u2uZN4y8HYztTGo+HcWEmmzpOIJtu6+AH8+tIgzVF4SmXOLfz7UuXMhwTISh3CpxTTBbdQN0P5yCJ1bXGnjtlkVoDa+IsRL57T6fguXwb3v51vkqWAMSOXg5DcIp3MtOQHhiSkGxQAI=
X-Gm-Message-State: AOJu0Yx2DHJlS8wWGH0Y3ihwv4YM43bTtzB5WRMUDfSWZv0xJ2Eiuk3Y
	QB3IyJBBLPyBVhxkrde0yX3omBC9qYG9m+6IeUCgyx7IkiBu35my
X-Google-Smtp-Source: AGHT+IHZ2P8Ih/13lnHFKre2syYlUhl7pM3xyfyn9OnVJVxfYD8qQglAWIaM3WtjgQcZRldk2Ek2Xw==
X-Received: by 2002:a05:6402:517c:b0:55f:6a87:8033 with SMTP id d28-20020a056402517c00b0055f6a878033mr4566269ede.31.1707722459326;
        Sun, 11 Feb 2024 23:20:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8th3Enm1hx/qACLL9nXDW24Ejs3sf0lfpr4B4v4p0dcY6z8HEfmx0h3WICip9cK8EWIP7PnkPhm7qzURtKvZxrKHUmKyYTrv+cFzzSIUQXVlQFAfjH5AxXk/Wl9oMVoxYd/lpwH3ODSgG6zxkG9OnNGZYdJG9nAS/Vn/yZc0MMQTttFxfRCPo3C2KT9YpGm6WXjQDQqx2GSSZCc0sao0BN4HEG7GmtkxmREOMDCDHvz6TrpF+JAxCV3dVGSFNHc8IIu0rlGVvk5sJZ5+5Q3UHgv9odyjpPehWXRPEnpd7qgn4dDgzugeRnBuDU55GnXat/PeNjoPOusTmMVzxoPtxj8vhZ4ppQ/yJpz+nJAiAYOmuyWgpbbVFWC2TwfxPneJ1IT4TS5vFSae4PzK3ZilD/xO4crGyoJyDJAuGuoKbI35wWhnQ8vo7jr6Jaq8+AXHgdkNWomUZsq376eZKsuUDYJLvTAdy2Wf0HA45GcCAbkeSnTLpF8dmgGaF1C9PkogSSsJK0KMkSWAdQb2bWLli1AZxtaMZqmmraKRz9syCnmRqRmmZFlpYNij1hAPiihX2zmpzTd0gKvZSgxSDkFYvbxk+JE2YTF8=
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id h9-20020a0564020e0900b0056058f2603asm2525290edh.3.2024.02.11.23.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 23:20:58 -0800 (PST)
Message-ID: <03d80cad-b72b-44d7-b726-cd8e3d4f81a9@gmail.com>
Date: Mon, 12 Feb 2024 08:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: net: wireless: mt76: add interrupts
 description for MT7986
To: Peter Chiu <chui-hao.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231221032648.641-1-chui-hao.chiu@mediatek.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20231221032648.641-1-chui-hao.chiu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_232101_446870_6B10A1B7 
X-CRM114-Status: UNSURE (   7.87  )
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

On 21.12.2023 04:26, Peter Chiu wrote:
> The mt7986 can support four interrupts to distribute the interrupts
> to different CPUs.

Can we have this patch picked up, please? Felix? Kalle?

