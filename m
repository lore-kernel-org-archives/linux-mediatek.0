Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D24C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEZ62LqDvDzX1VguBPg2bF9iW8q30+KnwJCoYFfoSfE=; b=doouisd1T0FwCjRqBL3bmklirS
	V4jDfuwsWH9UDr80kD/PZtWcLb4Xcm4Z2mYhIteIUfj48fGreWJi+AaslQwstTBqljnJyMqK6AJOb
	KLZe/kHG76nITrUI9zMef2N/Gi0MZFGicYzu6lxj0H4C3SDy2hA/Pzrq8VPWZIJw5XjqPbPwUa0te
	FvQquiHk8fgTPfSVcosc8BtPIDGegkYnyIIhUMTX7IcIlxnWwm8lEWWbuqkeZZKTUhja5qXq9DcY+
	Tq2OsJJxFFb5f16WaTPOoAMHOsxKi380UZBf26VjekDOkvXHiyzGL8gKfJe7mG2HGcXctbc9O3L3i
	nYLikRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNjq-00CD2Y-B2; Tue, 07 Feb 2023 13:10:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNjY-00CCuS-Tx
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 13:10:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so13142187wmb.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 05:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEZ62LqDvDzX1VguBPg2bF9iW8q30+KnwJCoYFfoSfE=;
        b=HZLccW93Ea9VpcjJ8rUdS91FX1dJE90KE5ylp3upj3AhKDndLy+svyKHyOxct5xT/I
         ye4BZlHwANYP9K8hR9AoEit9zS3zIYRtNk+8KaZ+CwLWDRGmGES2qNzl4x0Tptd8/vbJ
         s68mX5t1nF1J5hFFLWPCu5Y9P0sWtwMqV2TmYf0T23HzbocV0Ect2GKhDAkwYA0ojyl7
         4i6h5AVU5C4VLJx3WnfFHJQYTc1CJ/DwVTh0VrzE++qJ3+dikR+iZp7kH8zC+5DN6JjZ
         50TN9pCMwFdKlvePN+Dzy8xdaZIT83h+cuis06B1Vvm/238q3nsLxHo849s1JKhGrg1Q
         jz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEZ62LqDvDzX1VguBPg2bF9iW8q30+KnwJCoYFfoSfE=;
        b=qH7AmSNM89pSZqDkW6ii4XTXE1HbhqS1wYdZdnaq+gGHdhOcLtmMesCquYxFOFO+4h
         62Yf+/YHTISdxkJ8mYEeKUum1U/UZIDTf4McocfQJTt8hJg99eGusXT1P7zlaYjGfo4K
         uZT1J4LEsJME+cuvKR6UrKLSKd0NRr8Kq/XcaMhJweAlFRf3hHOz/Binqva/z3CwQ740
         Nk3UdEm3gXqdxzFzq00nergmbMIQOZU+qzNgN7Fmt6wK5Xb0G4ZVmMpswEFh/41zjY1z
         A21FODqN/xv7yNJV2tFpjZxBJoLYaHk+1irAXuav7uj8P0QQeo8T/wEPXgrUbc8hg7K3
         MDhw==
X-Gm-Message-State: AO0yUKUpN4qAjKx4TGUNSfvk4ccOqaOZN61hy5nlmSTL0ylMWoT+yFPU
	QSLv0HOR9oRPvRVubnK1WyZkow==
X-Google-Smtp-Source: AK7set8/kziMcUYX6ThGKn0ND5WTsk1Xc6t8EQEjkj2EEnSOpANJAHf7t89xlR5rt5EhQwVLYIhujg==
X-Received: by 2002:a05:600c:3296:b0:3dd:dd46:1274 with SMTP id t22-20020a05600c329600b003dddd461274mr3071054wmp.4.1675775403813;
        Tue, 07 Feb 2023 05:10:03 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm17987385wmk.25.2023.02.07.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:10:03 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v13 3/6] arm64: dts: mt8195: Add efuse node to mt8195
Date: Tue,  7 Feb 2023 14:09:55 +0100
Message-Id: <20230207130958.608305-4-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207130958.608305-1-bchihi@baylibre.com>
References: <20230207130958.608305-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_051005_174392_7D358F9A 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add efuse node.
This will be required by the thermal driver to get the calibration data.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20230124131717.128660-4-bchihi@baylibre.com
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
no changes.
---
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..09df105f4606 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1380,6 +1380,12 @@ pciephy_glb_intr: pciephy-glb-intr@193 {
 			dp_calibration: dp-data@1ac {
 				reg = <0x1ac 0x10>;
 			};
+			lvts_efuse_data1: lvts1-calib@1bc {
+				reg = <0x1bc 0x14>;
+			};
+			lvts_efuse_data2: lvts2-calib@1d0 {
+				reg = <0x1d0 0x38>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.34.1


