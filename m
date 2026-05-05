Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0346CD342F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=; b=kcex22LJuxn6nEM748XS7lTfpt
	ub1c+JkiwlA/TLtB+8kTrBrkgLLMdBAhmnsqhuR43wvRXPVdu/1zwgcRa9ua2QPtIzON55npcSdMk
	gNfgby1SsUDH4ujhLyOjCVpeDIOQmSISw8vqgx30ukA/KiaoiqvFV65Hf1UC26OKa424x+Ot+lmbl
	GLLMlnNzvTCNNtuClRP+pvwmicWOjHv+eLKZZWTNW8+/KAlNfH5XfNHKB5BiJYWsyWe9SveLOK4dP
	7kddT+zusDUTTjhQ3RWESfgb07UeLwO8azfX9NfwDNUDJbe+ow3s+PJq8GEWbfonEI1JG9k7GmK8e
	aTQCqKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCna-0000000Fr1q-3Sjw;
	Tue, 05 May 2026 10:14:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnZ-0000000FqyL-1ciX
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=; b=CtsYA/ndRlnOL6AD5bPkvBGP3P
	pFmSfThVEn7tyVsoJjFuzNMgwYWtLJcVWppIFxAYBfNw1LsZwEgGmoikihk0J8mX2ulx9hPav5sVt
	PzH1VQR7cT1sR2wRN9MtfMPR4uVg+txQtCBVeWP8tNigVhpflfDmPvyePwEQ0v7uwjGqDAALKku9Y
	NN90HcKPcdTwyyi6XlUkdJBJbdGFkC5QwfJhOONxnXn+ysZHpvrBuf/4Ebws34zU/jj8aBbD5jVlr
	ufcfDYCPgAVyK3QgbnEPbGEj9lAC5JFUbsCzmtJSbhKzlsDkPgtvW0rGr1Xm7180ZIG6RpLwe/B3i
	6QrpOO5Q==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnW-0000000D9Yj-2SFw
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82418b0178cso2411810b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976077; x=1778580877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=;
        b=B3uGuhce/yPxg5vbTzKgqCLZzLVLKWo/P2uyeifm12G3UF54/1vPzJJiU3MEcD9Wqp
         JFWiKuMiEsOzmKXN1ibreca/Wl7QvdYAoqY+lqEq8L8iFQoCANGPJNSVWIcHKMps8fcd
         L4jRVLBsOsCqysS0WkOB5hB7BOzGXJC15cTLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976077; x=1778580877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=;
        b=OFo0evqdKtWdTjHl8jUL3MkW29lqNDpaSVtdoqW7bLtLRfTCPKx98ESRwzsCBPxOvc
         zvFXzGbH80omST2UEfXf4tEvIovOE7ZcaQJo4178vaJR3XD9GzCbshNYuhND6khXgycK
         z5pj3L4q5mwwzWQOmpjzlaZq2ywFjkc898OYihqWqyIQuSJHrsPKM6IKFAxNgO/38qeM
         I99QHV0ZT7YWjdY3f4HWC7kLb4L8MqbWwCHniq6MmT8kcPAh7e834wYbN/QeI9SdrQwh
         OSoG+FxB811OHYwPC1rvFrmLt/X/7NlwvI7EZ4538KTIrSW3ZiASkXJ7MhyE+M0FgbCa
         gVsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fasSwXScYnTuRVrr/o4MA+L/sdkDUDv5Z6D6+3R36Cok2/T0I+Yydygm0CLVMlOKF/qq1ZAS0rnfLRvQKNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7WKhy2ZFP5V4s5n5BYQ2n3TjFNLJO/oI5qyVJyDWlsn0RTvpq
	V1WWzWraPuCsh411NFiyqODk/wvoMZazjdeqAcJijBD8FUrBnjrvn5qItSExefhC1Q==
X-Gm-Gg: AeBDietoEzixpILlo8YIu1G2IoFhucS+DxycT3Wk0VMyept+ieUQNXNtxE3VSFzwCaY
	23ow6iLDFMseZosvTtdsmNyEcepXnNcaXELyDaNEYRlpS0T2pK7DjoziEa/9nwEoe/vRoA1tNeh
	FwjvyCpDHOu63M1qCpMfuNpj20zCbOBjTUrzTP25uVyKXmzC+9UOHoFTcskgVq77cf/4nLUsasI
	zGkjU+BEgf20M2HkyCdcMJ3Z4A0UQNnbn9Z2uXvgWvEC63vYGsoHqg9PpiFsbQ/nRKkjCLA+BY1
	7tgq1f8rq6DRUWYcx7W15/klFO6YTMMPQv7oIOipsDFHiWi49fxoaLzUiXXDnNzqRBcnE3xP5Ip
	91+oy083kN9ctf+tEeOBcejTbOPK8TUDlPFKUoTu/xcBAkRUasCcK1CE5YwYXrANsWkys/gIsMU
	lwMKdtr99FB7ToliVXIQZlRccKZVQazIU2AqR5wmLbrQ2inFI35nt6621lC06gnue63qq3tY7oL
	/B8qupMqHIyFTtk4nI=
X-Received: by 2002:a05:6a00:8c2:b0:837:666f:8fcb with SMTP id d2e1a72fcca58-837667f0d5dmr8094589b3a.5.1777976077208;
        Tue, 05 May 2026 03:14:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/16] arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
Date: Tue,  5 May 2026 18:13:57 +0800
Message-ID: <20260505101408.1796563-8-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111438_668523_06B76FFF 
X-CRM114-Status: GOOD (  10.71  )
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

The device tree for the MT8192 Asurada is missing a power supply for
the SPI NOR flash chip.

Add the supply for the SPI NOR flash chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index a6543bbcbfd0..aae9d5ccca13 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -637,6 +637,7 @@ flash@0 {
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&mt6359_vio18_ldo_reg>;
 	};
 };
 
-- 
2.54.0.545.g6539524ca2-goog


