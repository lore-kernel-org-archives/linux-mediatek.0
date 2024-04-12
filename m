Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C26EC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uxWqscFAwOXHq3LZxwoyO2yB+rY65Bz7waDbYHO6nwc=; b=y135ly+twMP96v+lezayxaZ1mm
	5NW9AKEDbhh9MY98z4J2WTzr5qhsbw6b5LDHGmUSdGiB9QYx6uHXtNIHxbAeesjV6cAR++ZbHvcta
	K5X+ncKcnA36HW6QK2SPtrLP+swCiPyJQQHvN5/tSjvFtPHAlBBc0ZwhPwteJKgAFuMcIE0J2d4nN
	jTe+FOnsKtLuhXVUwLU7X6Q7iyQXGIAKDVzj/x0UN3Y7dL7C+rMoDTtzCYNZmjGVAsGAZIydFQtiD
	QVflDqj+6iPwyA2WhGVMjG2oTgLAoLw8VkEZtGziy9vSliv/lDmTMtabfb/144pFxZWtzq5R9kpfS
	z6NSVGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBlp-0000000FwjS-04fk;
	Fri, 12 Apr 2024 07:56:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBlj-0000000FwhR-1giv
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 07:56:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ecec796323so688323b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 00:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712908578; x=1713513378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uxWqscFAwOXHq3LZxwoyO2yB+rY65Bz7waDbYHO6nwc=;
        b=QqLR+tjT9l+nNHi9HLqguS8TnjLWnleG6WPAXMGx5KHGOTCoE23Ikox8M5rbLKTh0K
         Fka7mwa8ZzcoYITds17UQE+MzBCt6RPcDbexGL0xR3VqW7kbGqbrYK4Wp9E/ehTflckF
         TMlw4rMq8PhwkhdHxdy2+RvSnMCQxa4gOkaII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908578; x=1713513378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxWqscFAwOXHq3LZxwoyO2yB+rY65Bz7waDbYHO6nwc=;
        b=NpVbIKzsY6NwtNuwZinhTVbMKqvzksh4JVhcnRdFOpYv0Gp7cPKnCKpQPqIkWHFDH0
         OVacXIfjO6lZBfkjx6LmxwrkyYP76Mcotfq6ggW3d7hA4h8HV0hoSi7V4LYd9nzMFh63
         rjDLjIua7FMR367J6MPB1kqFYGjwVip1zM2hmddqRimQAp3X1NDALBUZnKhhScEwfpKu
         Vj3oDOkrISPUJzlFq05z9KiztrxsBlXzQk5blAcZcW1nKl/SkYrcDWcoEBE2MTvjXubf
         HqeVIDhnP1o8gCEQdLtBEQAZPsTH+s6Kt60cdEJYkwGvd2UgKqfVb/0Zi+wMcc5o048+
         X19w==
X-Forwarded-Encrypted: i=1; AJvYcCWbHzfRqJkGsy4ZMDpLZfa/1f26WdYTQ73KwqNj5U8/0YT8MiTEH9i3KY1nAXqwIvUrneMg92BXmcu5kvwuPxr3eZ2QSFGy6lGHo+1HyMt29+jW
X-Gm-Message-State: AOJu0Yyki0FX4/EUQnaz6ppZC2ljKsoos8BPJbscNwQTraGH/1ve35ny
	PmEAyEucYjet3YCJ0cQsNfAMTTq4IkndEgdIfyZZOz7BlrJQZ+BTAK/cG+Pugw==
X-Google-Smtp-Source: AGHT+IG0DmvzYgyMD+UbukYpONvIvOQUtcBV4koLz8bJwFW8nLfKTZSqtZ4kjpkCtUaJ4FQxsGFS1Q==
X-Received: by 2002:a05:6a20:2450:b0:1a7:136c:c940 with SMTP id t16-20020a056a20245000b001a7136cc940mr2635499pzc.17.1712908578374;
        Fri, 12 Apr 2024 00:56:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e3c8:6e1:dcfa:3e8c])
        by smtp.gmail.com with ESMTPSA id c6-20020a170903234600b001e0c91d448fsm1229006plh.112.2024.04.12.00.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 00:56:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: Drop bogus output-enable property
Date: Fri, 12 Apr 2024 15:56:12 +0800
Message-ID: <20240412075613.1200048-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_005619_528313_4DDFE02B 
X-CRM114-Status: GOOD (  11.81  )
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

The "output-enable" property is set on uart1's RTS pin. This is bogus
because the hardware does not actually have a controllable output
buffer. Secondly, the implementation incorrectly treats this property
as a request to switch the pin to GPIO output. This does not fit the
intended semantic of "output-enable" and it does not have any affect
either because the pin is muxed to the UART function, not the GPIO
function.

Drop the property.

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index f934b8aad3ed..75c799a6adb4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -797,7 +797,6 @@ pins-tx {
 		};
 		pins-rts {
 			pinmux = <PINMUX_GPIO47__FUNC_URTS1>;
-			output-enable;
 		};
 		pins-cts {
 			pinmux = <PINMUX_GPIO46__FUNC_UCTS1>;
@@ -816,7 +815,6 @@ pins-tx {
 		};
 		pins-rts {
 			pinmux = <PINMUX_GPIO47__FUNC_URTS1>;
-			output-enable;
 		};
 		pins-cts {
 			pinmux = <PINMUX_GPIO46__FUNC_UCTS1>;
-- 
2.44.0.683.g7961c838ac-goog


