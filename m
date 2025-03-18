Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CB3C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/kMEtnLyb8AyAlIdR8Vfey/k/x3qRsK7DrvrL59MMs=; b=itZ4eCQ3/QJGqUWCjnBplyg1tm
	C17jwE50CYICuYfNYbW4B/yzbcOvuE7XKmVJZEodjBRqZ2hGPhY33cybV8zDEg3uu+/FkUElOf8Lo
	QGzJmJf+GyUODSwVZ6CJKKGFJPaES141NveUR7+9vTXWi6MBU61eCun8CVYF1yaJ48LeMrVQpg7Uc
	xc0TqhPy3K9DANgXnI9uaG8TUi0yDQZeLMOeylXQhuNt6XwT99q7MMMfGiTpxH09lNGcroF8yj1Jk
	++5V2d38X2PPoWF1JkcouDaUE1jMSETHq3nVgMGDolzicnQTICUn9ZlbFT2IRC9itL1T71rJTk84w
	Y7TLpV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUBZ-00000005VX6-2q7e;
	Tue, 18 Mar 2025 10:28:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU6Z-00000005UKE-29t4;
	Tue, 18 Mar 2025 10:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742293404;
	bh=+wbnDO1Pqe10oOmycZARCAUSDWGZz6dvqzpBhlHSIvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mY6PtpEjVeZ8GPVcNf/GEFUg+ElLuY0lhio+IPbUtzIMkQL0i32Bc86SdIXKG5L6P
	 5T9vJvNFnRwtOqGGxRT6Egi3BQWwDmaSPjCCw/aOf+PGK9+EuzClWiYyIVC9UzrWHH
	 mkziT0mvvGqcCVoqt3IR+wTLkGfbNm51ET8GgvoGGbLde/9KHK8UAQW4YHuEm5F5L1
	 1xYDkw8s+l8+K6yq4Bv8DvlWbBfgkHESxFJR5IA+fRKbQl3QRNQVFG0ShLtZ6ZAXry
	 8qBbH5XLVd3Hpa7s7JMEEsV3BZcug8z1C7OeWSvZLjF2JX8ihLRJUsV1B7gD4RF2kf
	 Y+iP2JUsRfSbw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:79a1:e959:3816:993])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E960017E05A6;
	Tue, 18 Mar 2025 11:23:23 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bleung@chromium.org,
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	nfraprado@collabora.com,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 1/2] platform/chrome: Add support for Google Spherion in HW prober
Date: Tue, 18 Mar 2025 11:22:58 +0100
Message-Id: <20250318102259.189289-2-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318102259.189289-1-laura.nao@collabora.com>
References: <20250318102259.189289-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032327_726688_08A03ACE 
X-CRM114-Status: GOOD (  10.40  )
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

Add a new compatible entry for "google,spherion" to the hardware prober
platform list, using the same I2C component prober and trackpad data as
"google,hana".

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index c6992f5cdc76..019578bc7ad0 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -84,6 +84,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,hana",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,spherion",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_hana_trackpad,
 	},
 };
 
-- 
2.39.5


