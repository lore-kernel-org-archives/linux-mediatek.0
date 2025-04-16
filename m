Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94DBC369B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=; b=qn1RgIzfCeKUi17L4OoSjFo3vd
	Ma+ZaxIO/ditrBUrZHW1Oies5DwKmldBYxe+BxBYIJxRCw2gybNuxRrUA+j3UTy9X5xPLwCofNuPI
	f8b2Vfn6sBJSYvmB/VutGTzOvn6BLgQ+gdtIJjQ3bL0gfx1kCXKz8uPaQDIRvsFNrPZhZYukuIlYT
	F73l9MkMyEMH8W0/pWIBF3gAn904M0guhm7VOybTyRwxzkDj4bwqR97WQ4BSRcQ4rSMP+xWTC8FsN
	OKat4qTymsZSt+hk1pkXmVVyFPlTs0ufRLcmm2aSYkNIBRLtp1xcIOttjH7MC/xiCk8bEnxDk5xeU
	S7w7jKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xUr-00000008gPf-3Zgt;
	Wed, 16 Apr 2025 07:47:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xOo-00000008fCx-0Iwk
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 07:41:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so103457866b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789292; x=1745394092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=;
        b=NyBimBmzyeIdChUW7/PYK6nVW0fwvW4HDC0xdUQhnFHeNwqEtLxaoT6EXzOyKBSi10
         ugfymjmJ+9yj/htsV6aaPaMw3e9wHRQ+g/gM41Abgl0+FHrz2dcUP0P4FAEklND8LvVm
         Bhh1RB+Qbtl9ArSanm4RFj5lpeJOOz7nF3OydCUinzXrN1eKS9M0qYj55O60p9jpnBtZ
         myp66vHQACayIzFsaqMviSVgHDo+sWZh55cWocIC6SUDqzF2qwrx93ACCSvO9CmMmNmM
         Ny2d/rSnRabOrYFb/q1YDeap2I4v3MZ/p9Gl3p09bQeepv3snaXkkWp7ytIOMfw9KfZm
         76iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789292; x=1745394092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=;
        b=mu9FADlsM+hPOTygzS963WH7ycd2A855A5ijrO35rPdg5Qi4iWkRcbbR5bodjzHu3H
         Wxh72xix7lT5tmnmj9gVdUkbF5a5Q8cKajoZKc6uqLomaeoKqBuGbJkm8EQQDoAKEo1g
         uO9q4R4FTA4oiUyNC4JlU+L2zirA5uNwT7lENriizIRpZ790vu96FDppIyLMidvHQVcz
         Ggq5pzzGyIbYoZxYMpbpHJcYmc32r+kJAk9qrNVTlKQL8/dFKsdBmOL+6qBH+7eoRB/e
         IaRUU3wkT9ogHZS+IhXMd8cD70sG6+hFfgTbFGhlsNfUP7IgLJcsdrkz/QCAdjYFHIjP
         SIMw==
X-Forwarded-Encrypted: i=1; AJvYcCV6qGYrB1ABeldnO3F6Q9ZN6Z0QpI03ydQHgYTwE8f9i8wYt/icysDEqdBTPygs9Cl8v8sMsWFlCEJAN67ovw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJNeUMbbkjqIl4ukVLtfZfkb0BqpQusoJjRGRMBI74mjFcyVip
	brmhrv2gAnq8AhB70yVW6usjYunRGgC6eluL1/hZgmrbSeuMm7Ryk0RoJ1Cx4yY=
X-Gm-Gg: ASbGncttHnIuaJu9KBLYX2Ua/mrIdcHkBDDrYMkSSLJ/uMiusxjnCfjQ+cL5YYrJK4L
	XWlKnpPra6wVXuc3dj0lc/9j+wIxXBI16G9urB7urc/YIhQfT3hVORHnm/c4lopkWmyeWS6sQj/
	8Pjbn/TqOhmMDr51OWi/QuhHJNyPXgrHyCVUptCYbNBEh0QHHUPCosLjxFM3mYcFxTF+jVDzJ9e
	XkYVKC2yU9A5q6D9JSE9H+yXF173qrfQSs9bIK8qYV0YVlX/0codocblOvXx/SqMD0QmcDqK0s5
	kSaHrB6ctgjDN3O0ruMowriBL7h8imR5O9v4HjYBBosoU6IY4oMktZJ9mU7+KJg9A4/TEwhPcY6
	9E7tUwWcHdDBFC/8=
X-Google-Smtp-Source: AGHT+IE8h6ZIusbOx2fa72lKxk2qdTusNLhfSvFACqZPuu8uuX7bjmdba+8fMR+GvnuolveGcRCPWA==
X-Received: by 2002:a17:907:7e81:b0:ac7:3910:17b9 with SMTP id a640c23a62f3a-acb42c8e771mr17201766b.16.1744789292298;
        Wed, 16 Apr 2025 00:41:32 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1cce01sm74205266b.160.2025.04.16.00.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:41:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
References: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: Align GPIO hog name with
 bindings
Message-Id: <174478929099.20468.14418379313255979226.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:41:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_004134_157199_1C369274 
X-CRM114-Status: UNSURE (   5.97  )
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


On Wed, 15 Jan 2025 22:18:01 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
> 
>   mt7622-bananapi-bpi-r64.dtb: asm_sel: $nodename:0: 'asm_sel' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 
> 

Applied, thanks!

[1/1] arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
      https://git.kernel.org/krzk/linux-dt/c/6e3b067d3c5e00dea2e38c609fcd247baa74dec4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


