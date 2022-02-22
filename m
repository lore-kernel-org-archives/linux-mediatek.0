Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2502C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACGcFwaz8wDpUxxnxy/mkFTgkfMT4jsKA2Lof6kQTgY=; b=tnsaAuw1gpD4Q9
	8MMo0lAOtBf3WbsYFjtLwGjqWGN/QvcAnm5q3PxRnH2O0bdh7k4+HFeaU8b++WDt5fdew0VMUMJg2
	1fYo82by8jiAfZl773JnuDB69NlSQA2WhFbb2sPouQHj3M9qpuroI+tqSSh840ey5EkoKCfzxYkxi
	hd8gujslCyeXw9CALqI7f0dPht2p4KujP40iYgPEUVmFd7Nj0YBnbglxT2bt+anBwXlBBfE07M3g5
	+hERm28bxRku1xxqMBRGek/4P0TQJdDyjDRMBwnw5T3ebkJ3Hfg7Fvlkqg7uDehtx1zdpZNMJT7k7
	a5ydWyMELRck3DPUHcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWe9-00A0I5-Lm; Tue, 22 Feb 2022 15:00:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWdr-00A03P-5a
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 14:59:53 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8058D3F1DD
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645541986;
 bh=QS6C0GzUsESFnOlW679wMJjG5Id453GO4JtPx943Lak=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=MVpTjeTFfq2YaJeNybJBjKmcms2z4Y9uqW33q99pgyfvkVVqxC8VqZoS78b2KT7cC
 Q7aA/nerYZRDXv10Oj4qwdEhZAV471yti6bNd9310rVP/TJSfxFDGYmHaN5ioAKfuY
 +PcFkovR9X5mOLU5Lo2kR6OpWcHYI25sMWHhm9c2/Wx0ky+cbYl7vyZBtu8PRJijvc
 gyNe+lNz0ydAyKsskca3EUpXULO+LyP5i2VK6MW2y4JI0sfWZ30uZOi2jbJkD1oi6G
 WEWOjM0m3RIYEzCTtknjygYTbQartZGzOjmw23ZWmnQht5nb/4XJ59nyM+G8XNXh8w
 FA1g4qwhbaZkA==
Received: by mail-ej1-f69.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so5880005eje.6
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 06:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QS6C0GzUsESFnOlW679wMJjG5Id453GO4JtPx943Lak=;
 b=F+8BdNpFqXDzf5zYux3ajJy/hhnhNzBw3EAYSTkIIFqGgGiTV2wtb1MrBottBg5E+y
 Hf9O+sswrmpJtJ4mrpCpKZzhz1E7cBXqxRQ4JR8Sf5mF09HZSfQrWsnbDQYyw655Zr5o
 a7sI+3fiTpeBFSrvqE+ytnQz1eK9O3P8rdE4+FbNUBLCaykYk6IwyPfMWOO4zYjwa0JW
 IedRMdRl0HbXHBDSTVFhQIQSdE6bcO4Od5vsG11GJ7Uos1TdExyuk+6dh7+6H0jLr3tS
 obWkagYo2tVlmJPs3HW9i4R1SCJDqpwLcb5S/jZph4+ThmapWxDaq7a1EZi7KvBjmK43
 nrgA==
X-Gm-Message-State: AOAM533z18+it9vPxxpGnyl/NFSy4W28CRC6d1EPVWXx6Qpg8+/isoPs
 aAyclLFugXzaLDbl8KaU3n7sJWD5iaLQ7ZKjq9MijQtDyVcTNbFOwgnYXk5H4c8KYCpq/jYJrB9
 B3LI0hATvplBIBh55D8xai09NTrnvFhHDPvHQPRmfWWWua51jaA==
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id
 c18-20020aa7df12000000b00410a50bde00mr26955899edy.2.1645541986229; 
 Tue, 22 Feb 2022 06:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLhBfWrLlHym0osIm6uJ6NjAAfcWJy5tog0t5Nfvn14lcOwLiw9f5Pm3zKcbnRxuKypKbKmg==
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id
 c18-20020aa7df12000000b00410a50bde00mr26955872edy.2.1645541986043; 
 Tue, 22 Feb 2022 06:59:46 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 04/15] dt-bindings: ufs: drop unused/old ufs-qcom PHY
 bindings
Date: Tue, 22 Feb 2022 15:58:43 +0100
Message-Id: <20220222145854.358646-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_065951_371699_EF766C64 
X-CRM114-Status: GOOD (  15.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Qualcomm UFS PHY bindings are documented in
bindings/phy/qcom,qmp-phy.yaml and the compatibles from separate file
bindings/ufs/ufs-qcom.txt are not used at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/ufs-qcom.txt      | 63 -------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt

diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
deleted file mode 100644
index fd59f93e9556..000000000000
--- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-* Qualcomm Technologies Inc Universal Flash Storage (UFS) PHY
-
-UFSPHY nodes are defined to describe on-chip UFS PHY hardware macro.
-Each UFS PHY node should have its own node.
-
-To bind UFS PHY with UFS host controller, the controller node should
-contain a phandle reference to UFS PHY node.
-
-Required properties:
-- compatible        : compatible list, contains one of the following -
-			"qcom,ufs-phy-qmp-20nm" for 20nm ufs phy,
-			"qcom,ufs-phy-qmp-14nm" for legacy 14nm ufs phy,
-			"qcom,msm8996-ufs-phy-qmp-14nm" for 14nm ufs phy
-			 present on MSM8996 chipset.
-- reg               : should contain PHY register address space (mandatory),
-- reg-names         : indicates various resources passed to driver (via reg proptery) by name.
-                      Required "reg-names" is "phy_mem".
-- #phy-cells        : This property shall be set to 0
-- vdda-phy-supply   : phandle to main PHY supply for analog domain
-- vdda-pll-supply   : phandle to PHY PLL and Power-Gen block power supply
-- clocks	    : List of phandle and clock specifier pairs
-- clock-names       : List of clock input name strings sorted in the same
-		      order as the clocks property. "ref_clk_src", "ref_clk",
-		      "tx_iface_clk" & "rx_iface_clk" are mandatory but
-		      "ref_clk_parent" is optional
-
-Optional properties:
-- vdda-phy-max-microamp : specifies max. load that can be drawn from phy supply
-- vdda-pll-max-microamp : specifies max. load that can be drawn from pll supply
-- vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
-- vddp-ref-clk-max-microamp : specifies max. load that can be drawn from this supply
-- resets : specifies the PHY reset in the UFS controller
-
-Example:
-
-	ufsphy1: ufsphy@fc597000 {
-		compatible = "qcom,ufs-phy-qmp-20nm";
-		reg = <0xfc597000 0x800>;
-		reg-names = "phy_mem";
-		#phy-cells = <0>;
-		vdda-phy-supply = <&pma8084_l4>;
-		vdda-pll-supply = <&pma8084_l12>;
-		vdda-phy-max-microamp = <50000>;
-		vdda-pll-max-microamp = <1000>;
-		clock-names = "ref_clk_src",
-			"ref_clk_parent",
-			"ref_clk",
-			"tx_iface_clk",
-			"rx_iface_clk";
-		clocks = <&clock_rpm clk_ln_bb_clk>,
-			<&clock_gcc clk_pcie_1_phy_ldo >,
-			<&clock_gcc clk_ufs_phy_ldo>,
-			<&clock_gcc clk_gcc_ufs_tx_cfg_clk>,
-			<&clock_gcc clk_gcc_ufs_rx_cfg_clk>;
-		resets = <&ufshc 0>;
-	};
-
-	ufshc: ufshc@fc598000 {
-		#reset-cells = <1>;
-		...
-		phys = <&ufsphy1>;
-		phy-names = "ufsphy";
-	};
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
