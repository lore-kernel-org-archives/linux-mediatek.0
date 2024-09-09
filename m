Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D0FECE57B
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5LY8dASkk+dg4PZXFjTnI2q2Y9JwOZ8jAo1izlcgUA4=; b=V4IGey5VBs/gtX
	dU2zxqYWbtKMoxybFo8s/Mim5/AQisR0krs96kjZwgt53hBasAAzI4fXaEaDfsRGGIZh1iqPSmBhe
	MSJSR33vXjVJ4yN+/n2g87a+ilWpMIPxpORUG6Ouq7PDx6UxXVO/NfJTqUu+K1qCrKQkmpJWG0/vE
	VA0+e/hGkRtabI80BEvrPUFCrKPnA32+k3sS2v9rlMhvPf+Ikh8nCHhw5JZFq8X5D9mPKlvcEuVT1
	AyISLzU6xx0VzqX7ShTdG2MLa/oNEX3HdMm46DyEUBYC2fRtuRxOVgFd2X9rlyXjaRnWUuM8AiW64
	BdmKkgzkQLUD+aa5HTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZrN-0000000183j-3CK6;
	Mon, 09 Sep 2024 08:34:57 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZqK-000000017kL-1zUm
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 08:33:54 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71798661a52so2355586b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 01:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725870831; x=1726475631; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LY8dASkk+dg4PZXFjTnI2q2Y9JwOZ8jAo1izlcgUA4=;
        b=FIHUizi6o8QkiUC6cAmEilUiw0Pi/lzit5lkA2T9ZY8FVyPysy8qlCWyNYplSx3ZEi
         vukadCrS74JzDsUgCJ+gfo1nuHwjxsrChITff26aUNM63AFWJQV/ZZv7p03ezBpPfaVY
         13ooXotiwpitxscrZfOjAuTolQk31ZV8+V+qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725870831; x=1726475631;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LY8dASkk+dg4PZXFjTnI2q2Y9JwOZ8jAo1izlcgUA4=;
        b=t3eABnrWG/CNUBN90SpjgoH3qoGrqdLxwBpn50/UFICx4azRpP73d3jMmRa/N23QxL
         6BfbTpv+SRDme6djcRpAhKmOwAmAskSYGU/9CuOL5XySz5qCGSJKxJ3feL+CNTyjtKDl
         2AkCLmjVsSrlLibVbkUQ3TppTIAM4krMeWp0Ri/9LoCvnmOfAL2xu6ooynKUUsZiIxGF
         Dy/wxNuEJt6la3+IyFvz3Q46wbpCodOJ3X41DrUTF9qmAecLkkFFiNKVhO830/J8vGKn
         kI/hlReLg8LrM7n7WrCr1fnAHJvXLzHDSi2jcfvv6MFrMrXWhA/ISPLpw4C95rd73Nm4
         IrMw==
X-Forwarded-Encrypted: i=1; AJvYcCUQjGBBfRmS4jcyZp7EkzdJVrtkbNQhfFviklnqdkhwdUIcvX36QARU9VozDD/NoAXr8Ke6wegjFFkwLQ1HGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl8/ST3Q/7wnNvcMYPzE2F1TIIJKIs1t6+za9Y9FqosPSszBLf
	t5l5CnReJb6UULga0ckEf6yLMC/tQOpEJH3y16wrNOiXM81V4nmnsT8xExgXQg==
X-Google-Smtp-Source: AGHT+IEmLIcE8qMaxnnv2zZLscrUPbDYWU+TokeaZ0hiGU1HDPHBrhYfK1sSLklczfLbwhjaCOSjjw==
X-Received: by 2002:a05:6a00:99f:b0:706:aa39:d5c1 with SMTP id d2e1a72fcca58-718d546b387mr17613344b3a.8.1725870831080;
        Mon, 09 Sep 2024 01:33:51 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5982103sm3153558b3a.142.2024.09.09.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:33:50 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH 0/2] Fix the address of eeprom of mt8183-kukui
Date: Mon, 09 Sep 2024 08:33:45 +0000
Message-Id: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqy3mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNL3dTUgqL8XF0Dg5QUC6Nk8ySTxEQloOKCotS0zAqwQdGxtbUAfn4
 XUlgAAAA=
X-Change-ID: 20240909-eeprom-00dd82c7b4aa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, Ben Ho <Ben.Ho@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_013352_575587_2C89E676 
X-CRM114-Status: UNSURE (   9.36  )
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

The address of eeprom should be 50. The fixed commit in krane one is
older than the rest, so split it for backporting.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Hsin-Te Yuan (2):
      arm64: dts: mt8183: krane: Fix the address of eeprom at i2c4
      arm64: dts: mt8183: kukui: Fix the address of eeprom at i2c4

 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
change-id: 20240909-eeprom-00dd82c7b4aa

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


