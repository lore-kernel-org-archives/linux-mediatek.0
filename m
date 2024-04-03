Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02330CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAUWnoAjK4f4N8u2nRlqABDVBizkq6YQK37LOUpzcxM=; b=ur5szMIAHJ8nT5/AT8j6SWgZ09
	WHfyR6FX12KCAuiYQCq0DoavMBTQhKBvd/Tbkz//OayQBN3eqqEAzVSk61J/wanm8vD/uv0CILhKD
	QJbb53TaMVJ6fTJwz3aDjgcTU4NzBiuuVTFOAWVcYgnNWiLMd4bk9+VE+W2e9MV1wMajbpDZCX/Br
	ceIsrtZFA1RsKpxracX9vH+eo/0G2VvGRjGoReMg9tnl6+lmcJUlxX7Lr7t0pK1kgJIVsyFurQ3CF
	aUVrRdxCbmerXnz+rvtQoHwW/PftI0CFOeSkxjx/nXQWVbU2NsOc+zK7fiBTh+9Oiy80NaipfN55B
	21wKc2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtUX-0000000EAXv-1wMb;
	Wed, 03 Apr 2024 05:48:57 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrsQr-0000000Dyrs-2XOu;
	Wed, 03 Apr 2024 04:41:07 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so864352a12.1;
        Tue, 02 Apr 2024 21:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712119262; x=1712724062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAUWnoAjK4f4N8u2nRlqABDVBizkq6YQK37LOUpzcxM=;
        b=W7HDOb7B90u4ChxX1MV6cAH9ol98BJym8U0E5q5aKgt12LLlML42lGpwFRa8tSrSM/
         z3o7P7zLTV9Tuh5wV5AJfNDI30PMuR5TG2G+hcjdNBnn8WHlRu3hWo9dIgN9GveqJjhr
         1fzdjMB+hZIFl4nW8ScawqZ5NVaNwG9aSMUjOwWpIUaO7pREUIPwTOUby37G5qierbj6
         IC9S2+FXM5EJK8+u6by0xDKNYswNttwyfQwRUNZ50Aim6eh4J7T2fNrSgF/GHflWbCwy
         2TEWmCbWisUEt7X6E1qktpLcqdvPqHtlm65CL+svkZhdpNXh8NxEfbdbaBLkn3dvxmqP
         LXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712119262; x=1712724062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAUWnoAjK4f4N8u2nRlqABDVBizkq6YQK37LOUpzcxM=;
        b=EHQk2Xs4blfVZlhn4sTpRQ8+SZaW65zS73obx1Mc9pE260uEKDcJZNo7LdcWiiQ+8w
         m9jcSw1OIuCsKiRTMj0uixqlSL6KqdkaxGMDpfAkdFg6AR5WE0jIoEsBkxxACFCmi5Ff
         LxONBwBbgB/EKsuK90bWdptkG25Ymfq6OLRGaMbDBGXUKsTcJuSZqVzPV/9SPOnjyVOp
         6G2iUuZFW7XGZ/++O5Gj280NN9xsT3JMy81T9Jv+n+/uh5gsLksdfYNrICxWesiEFZlT
         UC1WimT5gYrm10uS6xxMdmjueURgb4a6mkEuRvKZpZXddyIJNYHgKf//QhN5kFKjXZjH
         CzFw==
X-Forwarded-Encrypted: i=1; AJvYcCWlEMf1y8lY7CwswjJ814wMQfc8U86tu+naL0Fjo+3NUgUCqMmNCKFqQerYBvuqarg25yP9d7gRC8wRahUYHc8REAyLik6cM9Bt8BjfuuyK5xUsMcVTCCO720EBHo0TUB2EprTP/XAatoIrGDKbpmBuxnTOTmp9aIM=
X-Gm-Message-State: AOJu0YzMjnqzTtbQH665emsNdKchkQXI6HmxZ3pdFaEbczVeqG8T6VaX
	boOjiFRo5ZHL7CCD7xNypSd6X4Z7yhT8JxfxBzZ/a1ontmqIeGv9
X-Google-Smtp-Source: AGHT+IFoJ2ZN+EBh+8WDL27sAlKM9SycR+TnpzMf5hWL69IYYFEe66Y6nzAwIDJ4LDuPXAQIOLHuRA==
X-Received: by 2002:a50:d59c:0:b0:56d:fbe4:aeba with SMTP id v28-20020a50d59c000000b0056dfbe4aebamr1157828edi.21.1712119261721;
        Tue, 02 Apr 2024 21:41:01 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id e5-20020a056402104500b0056dbd754811sm5250095edu.40.2024.04.02.21.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 21:41:01 -0700 (PDT)
Message-ID: <954572ee-1f8f-43b6-a8b7-93a3608c84d6@gmail.com>
Date: Wed, 3 Apr 2024 06:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7603: add debugfs attr for disabling frames
 buffering
Content-Language: en-US
To: Shengyu Qu <wiagn233@outlook.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240325223319.30125-1-zajec5@gmail.com>
 <TY3P286MB261180E5A3A3A11351441DEC983E2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <TY3P286MB261180E5A3A3A11351441DEC983E2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_214105_682836_57CBB212 
X-CRM114-Status: UNSURE (   9.59  )
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

On 2.04.2024 18:54, Shengyu Qu wrote:

 > Maybe we could disable frames buffering by default until it is fixed?

Please check commit description:

"If this solution yields a success we can make this feature disabled by default."


 > Also, maybe we could do more tests on newer models such as mt7986/81 to
 > make this patch benefit more models?

Can you point me to the mt7915 driver buffering code? I clearly missed that.

