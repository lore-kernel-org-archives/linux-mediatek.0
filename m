Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C06C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MOqLq0lZ0i7PXhp3YLh0UdxAncxBGq3YXZCOMwkygc4=; b=Vdu7+tC1ZybozL81ViXoHy+BoN
	qVRebj7naOcgGTy8hMppB5GkIDz41r6x7ewrpUlxhO2HSLh47XMg9otuzFnwfvl+E4oFlsWTaLf65
	GWLJXPO87x4CY7NafntZfnDpRtvSy1RVAWEX7c3n0xkCTBaoFlxWXcpX+RsqRy7OUlzF5uAoLAkvU
	Pg42PXDhNiR3vC5bxrRXCUw7+xqoJT/RIHXQzwW7EotSBoPnwh1NK1KSN44yY5GmmxGlno3XXdm04
	ZUA+bhWww3uw/9tPe8UB4jdAtn9p1bYwm/n7ai6KeZVFgcPX0hlZ2hCb4cVlUt6EfjIvtfMqiAzUL
	LbFIklQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YcO-0000000DAQm-2GV6;
	Thu, 02 May 2024 15:45:08 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YcM-0000000DAPT-0kjj
	for linux-mediatek@lists.infradead.org;
	Thu, 02 May 2024 15:45:07 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ed627829e6so9464208b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 May 2024 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714664704; x=1715269504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOqLq0lZ0i7PXhp3YLh0UdxAncxBGq3YXZCOMwkygc4=;
        b=UBcMWVcNdP9trpfr19V+9K2meUZCFof4OXSURTtkRLsfLnRQKhZBHF4i4ebtg+momA
         gj2o4EvnMMMIf3sPAEOQ5qZ6LP+MEiKP0k77ofCf/JOUFoKCaS7k+ZvLcJpezb+mXEcD
         00UUYa5Ct9dpG9yeGo1kNKmqeHv9EMgnX91JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714664704; x=1715269504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOqLq0lZ0i7PXhp3YLh0UdxAncxBGq3YXZCOMwkygc4=;
        b=hIDvtlH8WQ7mV2uIYZ+kV9JZwUcQ3BMW6xr06PaOdnRrGRJw6un58QAvZGD49NAOr7
         /VEvni3r9Gm6jIghQEmow663uflpOGBCbF6/+KWtK0fc72Pd9PhL7QBzTJ0+l7W4STML
         v0ZwJFBtNnAEIkmECFUgkYBzRP7dxWfUbK/QnjokIVI+LtzsfKKqnDYoRH8cd/7aE8Uu
         jwmDgeefddwkU3yeQgJAdvDC0yrMOUwNlkLKjNiwLTWDmQb91/xlKqZup3Zb4CHIbepa
         hdqLN4uCv2n4mI8sFcI4uQF4bHiGvQzBs67uUNgOWu+Wqx6d7S3Vh7GKZqGmqjjFB/ju
         GKzA==
X-Forwarded-Encrypted: i=1; AJvYcCVTzUSUm0gb+h9HX32xUe7k7rM5dIal3qMggQR0K/EARGNjWpy82keJd6fdT3hL5Q2NqBvm83PhdHatnUNqqUhUQtt6LVOsfeR0uL0brWfsT9v4
X-Gm-Message-State: AOJu0YyEDhBcdVXbx94htklTlgHybJkMOYpIT1xlYUtJgLmwZbDZ7LbS
	5vJe5zPl/GS5HIFxE/w2xYfjzwELagQoSTrRrI9v5c+f0E+dscPCvuu69zhe1A==
X-Google-Smtp-Source: AGHT+IH+DKW/P1R56uRTZhYtqEUAHiBxc+2IZYShyGS2YIDsx+eMU2ct2kjiiYu7bnTgUSejCrtSrw==
X-Received: by 2002:a05:6a00:2ea6:b0:6ed:1c7:8c65 with SMTP id fd38-20020a056a002ea600b006ed01c78c65mr7064701pfb.10.1714664704045;
        Thu, 02 May 2024 08:45:04 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8191:2b1f:c04b:51ab])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a00218400b006f3e3d928fesm1387660pfi.220.2024.05.02.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 08:45:03 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2] arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us for pp3300_mipibrdg
Date: Thu,  2 May 2024 23:39:51 +0800
Message-ID: <20240502154455.3427793-1-treapking@chromium.org>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_084506_409223_3ECDB697 
X-CRM114-Status: GOOD (  12.92  )
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

Set off-on-delay-us to 500000 us for pp3300_mipibrdg to make sure it
complies with the panel's unprepare delay (the time to power down
completely) of the power sequence. Explicit configuration on the
regulator node is required because mt8192-asurada uses the same power
supply for the panel and the anx7625 DP bridge.

For example, the power sequence could be violated in this sequence:
1. Bridge on: panel goes off, but regulator doesn't turn off (refcount=1).
2. Bridge off: regulator turns off (refcount=0).
3. Bridge resume -> regulator turns on but the bridge driver doesn't
   check the delay.

Or in this sequence:
1. Bridge on: panel goes off. The regulator doesn't turn off (refcount=1),
   but the .unprepared_time in panel_edp is still updated.
2. Bridge off, regulator goes off (refcount=0).
3. Panel on, but the panel driver uses the wrong .unprepared_time to check
   the unprepare delay.

Fixes: f9f00b1f6b9b ("arm64: dts: mediatek: asurada: Add display regulators")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v2:
- Update the commit message
- Collect review tag

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 7a704246678f..08d71ddf3668 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -147,6 +147,7 @@ pp3300_mipibrdg: regulator-3v3-mipibrdg {
 		regulator-boot-on;
 		gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&pp3300_g>;
+		off-on-delay-us = <500000>;
 	};
 
 	/* separately switched 3.3V power rail */
-- 
2.45.0.rc0.197.gbae5840b3b-goog


