Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF207C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkBpPkBgBA3ODAja8zGIcwpt50GSoIUtolN0QhQXZcQ=; b=AWHApiVDKGiq5QCiwFbqiZpDG9
	QwNRyeXabagXBnXEg3qKWqQT+cuLJ7jcKQNLpNBtDVLltl+LDXsfWtMvSTo9bUQzGgS09jFFyu69W
	5FF9vquiiBfLzndlDJOhIJtt9F3q/mo+27S1Qs0IpYhE+dVDFaaXGyhmbCBsIshaK0zeyc+jOWwDj
	zqSZeCZZsPkAFStrjqel0bfgxZqGjnSXKkjmi++p6GN7KejWPDqu2QvjRf9tAPZCV7+MiBvBb57qp
	sSsTKfiCsrGT/5bBWHxwcvZxU3QyWZJcnsb9G2vGaop7d9FtYWO2jL0MvVfPP9mVZRm54lki5hUi5
	5aFgrL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2y-00000009eu8-2LM3;
	Thu, 27 Jun 2024 08:00:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2f-00000009epk-1bW3
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 07:59:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-711b1512aeaso5924882a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bade.nz; s=google; t=1719475180; x=1720079980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkBpPkBgBA3ODAja8zGIcwpt50GSoIUtolN0QhQXZcQ=;
        b=cSkM3OqX5+tCsQWTgXqKv9xVMv/c8Vt33Z0kkgiy+pHLLC+cgKHaqk6iQToyGG/0o2
         1Uj7Hq1f44DTSt8BGl63shuMbLDJN84w/g+pe1oXKnKloz1G5JPR9Gemj6n3lL7Bsn/P
         YGxybvcpcKVKUpr1JraGFH35x8pRvRKLsD7gLIVmyLl0jIhgtJYUCkjlrMSnuG9+hZvz
         0PyYON+ct5cmDG1lGIQwJeuSjNWkFuhj8fJxNSH0WhSyJTbS2mr95vF3u+enWIooiMjv
         j9VdY3FM3pnzgfBqWDK/IwiCmYGndfWQHVMh/8FYHedw6V3gggjAnOpoELm7bqAqNfEq
         E/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475180; x=1720079980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkBpPkBgBA3ODAja8zGIcwpt50GSoIUtolN0QhQXZcQ=;
        b=O49WSvytWY6s1JphzOEfCbLywJw8zIexqVGzs+n2+0s3dWJUyuA5T6g7xlElpE/n0Q
         145D1FeUEC3wEQZiEuLSGJOTN66ppoAPm1MgLgvohTGBKsYZ2y5/QgO7JQIz56bFUNFw
         W1OuwRwkRzGDP5/nUZcO4noEtw4r/zU7dhcKm1305UTv0AWM3PyLh8CP4lgkUzSnjEKj
         qQpw+lPFedNXA/u7flxyOuu9O9JowCwniz/c4vdF20/LJGMPWXe5Ov2wVoyO4Svtsj28
         1BSihr1oTOBiCH/EtenYi6ZLvcnc7BihWoS+KQGGUOWfc3ygNZojNXsku+W1Pl+Cl4r6
         U3DA==
X-Forwarded-Encrypted: i=1; AJvYcCVq738WPRSA3ESilIKz5Quh/6+mLgvGGf5VGfIlOAjVHHRMYhEQLPEczqQ68Eam+FriavCD+x7xLMilWE9ayFpgiMlBBYkSjrch/Dm5lmIrBgSE
X-Gm-Message-State: AOJu0YzrJsWZvf71iCxA9sVa+X2XDKAAtopEhcrGf4y1uGWoMoMBuyzk
	CRHlpJnP5FWQXefaMQ6mxGxo3cJA8OdGH8UyDBeFTvMRMdVVHTTFYi0WiN03Qw==
X-Google-Smtp-Source: AGHT+IEXToHGxpVGoEz8ifOQW7GTguBEcp/knYddtQGBeIRtKWqgX5quU9fqgATZlNifTQih+UOzCA==
X-Received: by 2002:a05:6a20:b2a9:b0:1be:c2af:5626 with SMTP id adf61e73a8af0-1bec2af566dmr2984750637.4.1719475179932;
        Thu, 27 Jun 2024 00:59:39 -0700 (PDT)
Received: from localhost.localdomain ([2403:5816:cd6c:0:6d45:ae2f:1ead:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9c4cf4sm7181895ad.290.2024.06.27.00.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:59:39 -0700 (PDT)
From: Leith Bade <leith@bade.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	frank-w@public-files.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	didi.debian@cknow.org,
	Leith Bade <leith@bade.nz>
Subject: [PATCH 1/4] arm64: dts: mediatek: mt7986: fix the switch reset line on BPI-R3
Date: Thu, 27 Jun 2024 17:58:53 +1000
Message-Id: <20240627075856.2314804-2-leith@bade.nz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627075856.2314804-1-leith@bade.nz>
References: <20240627075856.2314804-1-leith@bade.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_005945_896811_B6AE2EB3 
X-CRM114-Status: GOOD (  11.59  )
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

The current GPIO definition for the MT7531 switch reset line incorrectly
specifies a pin GPIO_0 (GPIO5) that is connected to the boot mode
selection DIP switch (SW1).

In the public schematic for the BPI-R3 (titled "BPI-R3-MT7986A",
revision "V1.1", sheet 4), the SPI1_CS (GPIO32) pin of the MT7986 (U1E)
is connected to the GbE_RESET net.

Frank Wunderlich has told me, via the Banana Pi forum, that this GbE_RESET
net connects to the MT7531 reset line in the private part of the shematic
he has a copy of.

Signed-off-by: Leith Bade <leith@bade.nz>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..951612ea1e66 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -206,7 +206,7 @@ switch: switch@31 {
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		interrupts-extended = <&pio 66 IRQ_TYPE_LEVEL_HIGH>;
-		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 32 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.25.1


