Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06118C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:19:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CAEA20874
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flGWNGWp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oLs10Xyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CAEA20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d8Byvilc5hAXPhtX2Ei8Wy7mQv4ulkjYMggrIGYQwKg=; b=flGWNGWpsPX0KFDxVgbQfOeo+
	hxzfteIO16jzNVOLwCiedc1BVJn2Q/OkWPETeUj9jnKAMLCkbnN6PTmTwmieSPYxl6cTTxXIp0Yo5
	fXkKHZNYPpioCe2M7ftp6tIwamc3U6Nv2HIrHFV0tzvjMKgAQxzFgPNBt0egJbRPqY3ZsWtMHbKOs
	HGTeZ1/Fv4b4YPcjxZB3DezlW7IYyzLRBd5HwWxJMzjKO04BKN9g0e7VSyKItpne4oiNUcadZQ+yj
	tu4EbeW72U5dAHeGLqL6cuGAFo7NRdeuwoYj5jzt8z1NWYjsdxJJfkZcYQT4IHIcZ6iHT/3XnxPt/
	nSqWQzlZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTNV-00066X-Mn; Fri, 16 Oct 2020 17:18:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTNO-00063U-Jq
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 17:18:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id h7so3805513wre.4
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2020 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8fZ83rbItOfrAada4wAXII59ZJKaeD2CQLTNkxUviM=;
 b=oLs10XygoSh32dfOJxiPNMoPVi77vIwMWuVXgMucmKTPoqmhNFLucdxygXGUWgDGfS
 pD2syNepnLwR/xMzjhvePY8UStVkv+XhBG9LBrMj6isWIQQWkeA4gYIDGhdgEdt/YlIS
 LRP9Q4dplPZe/qZNT7pJnzJAMCYZdCT0yUeIj7ZtDmDqR9eeKlwo3d3kRrJEOsPsDAzv
 p+ArSc+26s3TvZ3iC9MxeM1tmHIqvqMQixwelvS1IRNixA7fE0ySdn7jPNDcKPWbVCcM
 IhEsNuKvp6n8WrmsX762gQ2AjHHl6e87f5YO2/zcn1GIVE/VlBGlPBF2IF5ApxOsAj1D
 NFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8fZ83rbItOfrAada4wAXII59ZJKaeD2CQLTNkxUviM=;
 b=ptT3cN2y79nLPAWlixlBKMqrdqJxp9Qz5fopJxDDpklclX0JiUHObBzeSE/4AhMgwM
 A3uhfs5AOvDQJCCNSbHmBODqN17QT5XZCPBOSqbRrAxeAqh+UsGQA9g8wc11t8vuNVZw
 qd6D0If9xmC1OS+dAmF4yFeDVc798c0qsdBPcCNcPTRlZa2DTVrvz5rboKCyy1FvI4Gv
 urB0y419OP6PoRWU0QH4PDRk/Zuyu+I5UpdM4LNSb3DQh67uJ0iDI/WCWp3LYIZAc7XD
 zgseEafcjF7ZP6kx/gqJ0+G613gCvjOTcI44zdC7OUxXfH3zwVuySmpGSHU24ODBdphS
 ihYQ==
X-Gm-Message-State: AOAM533Oioqo8JaJMqZrOYrZd0lN2dLhUnzDJo4Gm1WzhOu3Kl+pKebP
 jqk3dJMqj6BNbeSA5BQG6xXWMw==
X-Google-Smtp-Source: ABdhPJzPV3iRxfbKZraJ0ZboKhAt324/xKTA7kt0xT/xD9dy/6SQ2FuelwK9uOcH8pouDe5RN1iUUQ==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr4993707wrq.129.1602868724237; 
 Fri, 16 Oct 2020 10:18:44 -0700 (PDT)
Received: from localhost.localdomain (211.163.185.81.rev.sfr.net.
 [81.185.163.211])
 by smtp.gmail.com with ESMTPSA id o6sm4177162wrm.69.2020.10.16.10.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:18:43 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8516: add efuse node
Date: Fri, 16 Oct 2020 19:18:37 +0200
Message-Id: <20201016171837.3261310-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016171837.3261310-1-fparent@baylibre.com>
References: <20201016171837.3261310-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_131846_676727_000EBEE1 
X-CRM114-Status: GOOD (  10.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add node to support e-fuses on MT8516

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 89af661e7f63..18ddea519be2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -237,6 +237,13 @@ pio: pinctrl@1000b000 {
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		efuse: efuse@10009000 {
+			compatible = "mediatek,mt8516-efuse", "mediatek,efuse";
+			reg = <0 0x10009000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		pwrap: pwrap@1000f000 {
 			compatible = "mediatek,mt8516-pwrap";
 			reg = <0 0x1000f000 0 0x1000>;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
