Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED3FC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lurBxqDpxMBXgjCUwkAWYVwgxRmMWi6DcwImW1j6GKg=; b=CO5ab6xChtR7ZhF+KV/Ek86L/Q
	Dv1UxhpdGlQ2+Gjo5blHsTGrBQoQN88H5ddC02rCTsCUU7xwHOTRyGGIGEnbV3Yi2d+kX1iE8ZIX9
	Hjvp505wJqjIvt/ZuA+alHyN9xjuIXNg0/yiTgKrvtVq+sua0EFfyANDq2pj0BOAtzHVhHiBT6dTa
	cUgrPmjOHH4xC3uTkt/NhVFKz/HmrzxxK/U5yhpWw/L9wVdCAGcnG1UFr/iL7lSGaLEODfsqFLrVB
	n7eKYLCZFNkLa/KSzLUXwOQaqJepIqRbfFWfq3YjTdtmiyZuZ3yOsS4stB9gtSk7YzqOuD4REqG7y
	nCtWpUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGI3-00000003HB6-01jU;
	Mon, 01 Jul 2024 12:37:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG8M-00000003Bzi-1Yz9
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jul 2024 12:27:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-36743abace4so2561900f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jul 2024 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719836869; x=1720441669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lurBxqDpxMBXgjCUwkAWYVwgxRmMWi6DcwImW1j6GKg=;
        b=dsZJ23Jg0JujS2wp//tOyovO1Vtwsourszarz9G6lIlcW2bIx8MyCGi5OOp0w/Ueiy
         cdFsIkOr4VCBEpWFcXFDa2FhRuZZiYOLcfcrWZUoWje67AtINONPwwlLJQu5M4mQ9R6O
         Wl3PBZUjhOR80qKJjQn+feRnhjX9QfJbTCcRSgxbhScRDT3R9Bb+L51Mjz19Pl5I6U3Y
         toa/a009p8i0T2led/ERB+PM5zK2SDSrNJ6ZPu9KAhuU5Ol8tM5Mk48KJEsi4HOHQfuU
         LEkFp35CtM4QH66QLFyzKGwVWj0P5VqAtclbljPuxe33Xc/D1i+qLh+9Mgo1FMOvVjaz
         e6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836869; x=1720441669;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lurBxqDpxMBXgjCUwkAWYVwgxRmMWi6DcwImW1j6GKg=;
        b=QxR+tojK1nQzMjbS6aPsiQLFLq55DChJHx7Vfpz7gn3ExaxbK7NM+LjU1yAVUl7K7G
         jEhKnqSGPxebCUSaEYE0CtYoKtiXF/nxIajA/motnTrurlogRgbE155yrGSfbcbRqaN8
         FhB7/mJY0tH4G1Ugg8Z2Jvkf0Huye1TkV2LRhTQwI9qR3TNOIzrlSdKwK+CiLdkswFDc
         9Zv4ocf3heGX1lJu3KY9dXtPS/CL7qlgwzNQASnUWJlPHvTMVw3CERXX+66XdZE0QRk4
         ZihEAMm4Q3W/AAdh5nYDmn+qT7MMKt4cC1zAMMDLFprgruK/jd4ltKoiK7Kj0RhZdqbg
         TshQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPtr/5H8rsDcHKV7jBdIhB+n0dddBiO36zVEUDRymds3oDWaBhTrtI3bG0ik0tq91AMEg3syaiLAlu2MyDMrX72nXt+rG+1l3NZx1dudFsnpA7
X-Gm-Message-State: AOJu0YwdXX6V0sG5SmABDupKjsuwmQ0B6C6BFlu5G7u8Gof2HKQJr4TN
	U2UNsvo16BV0o2XIk0FA9KXSlXSF6NRLVaJ+EWk9bDWsHnDwzMtQUnXzKEOfVd8=
X-Google-Smtp-Source: AGHT+IHjC0WpYQaSlJUoHZlk3/t38DJxLAEEJ+bp94YFsESKz3yiXg1R4f6nMTM3n8jGrrFYpWWkpg==
X-Received: by 2002:adf:e58c:0:b0:362:5f91:901a with SMTP id ffacd0b85a97d-36760ab62a5mr7278194f8f.31.1719836868836;
        Mon, 01 Jul 2024 05:27:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0642acsm156924245e9.25.2024.07.01.05.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:27:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-8-aaf996e2313a@linaro.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
 <20240519-dt-bindings-mfd-syscon-split-v1-8-aaf996e2313a@linaro.org>
Subject: Re: (subset) [PATCH 8/8] arm64: dts: apm: Add dedicated syscon
 poweroff compatibles
Message-Id: <171983686696.414714.11113016468220652079.b4-ty@linaro.org>
Date: Mon, 01 Jul 2024 14:27:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052750_454529_CD57EDC6 
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


On Sun, 19 May 2024 20:42:23 +0200, Krzysztof Kozlowski wrote:
> syscon nodes should always have dedicated compatible for full/accurate
> hardware description.
> 
> 

Applied, thanks!

[8/8] arm64: dts: apm: Add dedicated syscon poweroff compatibles
      https://git.kernel.org/krzk/linux-dt/c/c0304446611536a771462f27d98db6775d222b38

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


