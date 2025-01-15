Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4DBC02180
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YFdfy+1xjTxfVlkEQhDUp9pn/DCv3HCHlGHCvqvBZtA=; b=43XDl/I5kwXcwe
	smGQ855SfKmhHTYsVHrmFNQkIrT+BbTEn6ZyLduaHBxFjJL+p+sdo7AnWALXzNXj8Se7ER2SfuFIL
	JxmRjDk7Fl2wCzIOPPmJWZEkQ6OMEhzOY8UDlubpmsf4/4xw7LJNHlBe1INv8+Hc0DubjFWx2vnG5
	ruL86764pJCICl6Xvutb3mWTORLLG1/RPX4sBgEyV1G55SdadkvsMt/XiKT8mnaLuyKSFDuVoNIwA
	X7UPhPgPkU+RMK8FHiIKiY0ye6USXAjnVRNTL98Qjx66y7hCMuaSGP+jKrJ40HeiBzgLYdDibK+OD
	gygr8fhwIa7zSZYJZ7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXy5V-0000000Ayfd-0seY;
	Wed, 15 Jan 2025 07:45:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXy4C-0000000AyS1-3uBL
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jan 2025 07:43:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2165448243fso139600175ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2025 23:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1736927036; x=1737531836; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFdfy+1xjTxfVlkEQhDUp9pn/DCv3HCHlGHCvqvBZtA=;
        b=wxMYuMARtmwpaeGLBd8GIYILS5Jp3o7ZmTDb3x7g027EGXIPrI45VQMNonR0mqof6b
         hDYLGG9psRR1VM6FPLVAll8dk0ev6WxNZQTbZxkb1sFQF3+NXEdgCjbTBF8c/YKeclpK
         995DNA2e1KjZDuMe7ADaGFqjNyPhHkVCWBnYrZu8L1F+T++7h7vu//3J9GkXLHwfRDE/
         FAgmGunt3vWzviiKMrUbF3QIoalagNXHvDuFch16slAGzJwW+TKHPGoehVFgg1s/eq6o
         ooxuXa2Z2tXGDGfihwO4Ua2WaClpbuTOeynWQYQ3YbxnvuuEVWgf15buw3JJSG2gtFkY
         jSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736927036; x=1737531836;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFdfy+1xjTxfVlkEQhDUp9pn/DCv3HCHlGHCvqvBZtA=;
        b=n2VrCwN6h6ZL2+NTNcOPZQBM0EEXIaX+RvS29w4v97OtZQUpnWamWf2zQflXNiyfJR
         VaYL1V5jT9DEOg+qjhBSpmELUomR4kUol1xiTBy0yWfeGNvDNDhV1kfzCIV5Qfgde00t
         6K30yLUYFgCK2fqG2T3/v5TB7R5fxNA8XogtpVAaeJoCO2BiOe45jeHMGWHTOpyMWsua
         3VPSM44I1E57SjmHB7wcAtvK3N98V/yYuTX13ZxvwiUIuSyJuoVKW6KeSVAH1358dSyV
         qhXnC8EoImE0d4HOBY6lzgHzTynktf07jMFCdYyH6RVympKmUgWDV+vzP8eWaAfuY2aw
         BZsw==
X-Forwarded-Encrypted: i=1; AJvYcCWrvdx+Ki9uIpky+khqIKfzvv0U3lkGpiGBiet9Ep4uXvLr17ZReLlxKX1mVGEL0Gor5eRQlSX2UaUiNIt0Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeMytpwBCutntZ0FeEacrczbRuAukdreOAZ79mzigeOHt2wcup
	0K8+Yly4JtgaO/SzjKCPvUaIyvqdRnFyT4jG1Qu5VoVXaO1pw7WVsCcxn46+7w3U4ZuF3w+w0iv
	/
X-Gm-Gg: ASbGncuNiHARVfR/6gzlVREtjaGYhp+vrAXqp1+BdUEVEYq8Om85EhfBI1u5PtuXwSG
	/p2T/IqgE4SUmvBTHGH0/nALvtNnqqJ38gq3LCJ6LVU4iRF6RmmAe5LaI+PQc8U+mHuu8ksetKi
	N78wTIHTX2n1w/r8ZtIIyIQa63hziACw/XHO6uUwyPtuJxqDyGvKUt1qZG0XciERobvgTCaY/lT
	8874MKcJoVqnIP+9dWCfCtko2EGYWJ/ijWgADZf9W7+qY45T/QEA+SNlc3YIV/sDR6d53zg4W6v
	LnadAKdTOFbNo23k509my8jzuzj/xhPoajD8FYf9Z/Gq6XoEmy6ORDP1q428rTSGgw2G6s+3eEX
	J/yvZjYl4hExTmfES
X-Google-Smtp-Source: AGHT+IHRN+bPuv53sQRVCdT8bOyRQsVcd7XdkoTww3PedpE8oGS5o/Jnv0ml8LdStXcOalfS26Un6w==
X-Received: by 2002:a05:6a21:38b:b0:1e0:c50c:9842 with SMTP id adf61e73a8af0-1e88d361a43mr51144117637.31.1736927035895;
        Tue, 14 Jan 2025 23:43:55 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e25f-ed65-f855-8c86-b103-448b.emome-ip6.hinet.net. [2001:b400:e25f:ed65:f855:8c86:b103:448b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047ea0sm9335482a12.58.2025.01.14.23.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:43:55 -0800 (PST)
From: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Subject: [PATCH 0/2] EDITME: cover title for skitty_kernel
Date: Wed, 15 Jan 2025 15:43:42 +0800
Message-Id: <20250115-skitty_kernel-v1-0-6ef2086858ba@pegatron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC5nh2cC/x3MQQqAIBBA0avIrBNU0KirRETkWINhoRGFePek5
 Vv8nyFhJEzQswwRb0p0hArZMFi2OazIyVaDEkoLKTVPnq7rnTzGgDvvRGuc0doqtFCbM6Kj5/8
 NYykfoWAi418AAAA=
X-Change-ID: 20250115-skitty_kernel-9076f655d2ed
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 herbert1_wu@pegatron.corp-partner.google.com, 
 Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736927028; l=912;
 i=geoffrey_chien@pegatron.corp-partner.google.com; s=20241216;
 h=from:subject:message-id; bh=/+Z8KHUk8nxKTdR7QqzSkQ25mOSdeiem6+Sovxdi8D0=;
 b=E80o+hiJ6quRwt12oN2OEIzPHAHmB8oXQUkBYK/7jHHv2xx3TS9h/D+9MCn7GGpKdJxyPBlxr
 wx5fXB7E56vAUgnMi5jDRZA7JSG396+S358Q3SYk1wOYray5qBQjhdH
X-Developer-Key: i=geoffrey_chien@pegatron.corp-partner.google.com; a=ed25519;
 pk=P8X+ifKsuR9w8T8cIa35nudXKmZX6qk0iS+5EcuwtrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_234357_180052_590554F7 
X-CRM114-Status: UNSURE (   6.16  )
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

Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
---
Geoffrey Chien (2):
      dt-bindings: arm: mediatek: Add MT8186 Skitty Chromebooks
      arm64: dts: mt8186: Add MT8186 Krabby platform based Skitty

 .../devicetree/bindings/arm/mediatek.yaml          |  8 ++
 arch/arm64/boot/dts/mediatek/Makefile              |  4 +
 .../dts/mediatek/mt8186-corsola-skitty-sku1.dts    | 92 +++++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku2.dts    | 82 +++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku3.dts    | 93 ++++++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku4.dts    | 83 +++++++++++++++++++
 6 files changed, 362 insertions(+)
---
base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
change-id: 20250115-skitty_kernel-9076f655d2ed

Best regards,
-- 
Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>


