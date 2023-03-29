Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890ABC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KweLqeTYS2Ohdp0JXAvcBR+AYZD2Iz+VUWSRR2JWGMw=; b=LnH8d6KyM2T6KOsU1cPUS0Vf9j
	Xh8dlU2xEFAKaX2rw/hDCzqHPYYhO38HeX+dABXqQKwmikNwZ3fp/+lONs+7rrPW4OCPHwxprrpIB
	5Ad6JFoD3WrUqhIYGWzkhTjWNBeIJ+OMjYAsXGLxHk82x2lSRcVKF/TuzvJWHrR5MNIDjbK/VW4Co
	ntR2TR4uB2t/5gGm/hLwvHcnkUjuqEA9aRTuEA2suVmST/7wr1ZqwvfRsIlLGw3Pkm+oTwEm7F8Ig
	qHLq6sgnxfvWWfHYomTl8yJOw+wIH1zt41cd/DJM/2XMVds7uQw2VdcNL7bg6F3twPnTi7Kxxaqiq
	HpDRUR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTJC-00HVNL-0I;
	Wed, 29 Mar 2023 10:45:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTJ1-00HVLP-2y
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 Mar 2023 10:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KweLqeTYS2Ohdp0JXAvcBR+AYZD2Iz+VUWSRR2JWGMw=; b=dpdHMDJQ4e9tRg95xNOi3XCwHs
	U7zXF67aL61OYFtU6oJCiV74VarSURA9xA9kMw3O7aRc2YZKP5UDLgRrmmiKO5F827UTFCcWXdlbu
	ARYHHz0t6R+Fe0CSgCelmv4On1Tmfojgn2cb0kMWnZMcqAIbrtEWmJbjhzGKpoCjdo9bKIosNmVgY
	JYYYH9KFqVSziX4C34lrhScB7dABw1XdpnmeHiBqIlUPMW2FV0+HKyOHeru7ExLbQgPMUXFDp9zs8
	4uTMBjt80FMGYkVtoVDh9nrMctmUvJ+HutJfURwqVzzgTM0NmOmzG83kE+e8WFUp72GuW0UlHg8oy
	sd/7BAcQ==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSTv-006orj-1R
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 09:52:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v1so15020348wrv.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 02:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680083557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KweLqeTYS2Ohdp0JXAvcBR+AYZD2Iz+VUWSRR2JWGMw=;
        b=HqlZ9sMRyHoUrBFh0KoCVRzDqCmYNLcwoluVryjlRCLLEh1v9Bsj8dwlzExbNulINa
         yO4mF5JmUHrNy32vFA7Ty7skQ/WMgOb/ZGYoHwAHbZ3y6DFJHWpgE+V/l6Xgm/0E2ae5
         BUQc5T7UUoID+gpIfNNEQ9wjzyrPw6/mAHBYSva7NI8fda4jLJ1P5euLL2WW9kYRBfgd
         6zuWzH4XKN/wiNdfk+gQUcoaljLauRZSeSvuWg25cWrWD6J9z2MHIUVT5VF7EfCN/dc5
         C+Ai95JF/y5bGg5ruxAoAzIP9IojESpOpSvWINRwtZ8kI0/FdQqUdl0x6RM6b59tjhfy
         MwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680083557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KweLqeTYS2Ohdp0JXAvcBR+AYZD2Iz+VUWSRR2JWGMw=;
        b=nQOu4CHRYeOWGzUu3lZo5EGRAUUAWJTcPhGuMndHN/cvEpPATb28BDVi/NUhKQmxKL
         dRT3AuzqQ16f9CMs9FYYp9xZayjXcZvG296jDKgj5U38A3Q14/0GcEp3LoIkBGsDknSz
         dxSL+nIYLzyKkjL/1r91RNvKwFPVmmxuayb27b1FH/RY8HKOe97xRsDWPTEtKvUWFs4U
         zdBnUrggcZkDYrPse1KQA+VqXuuqdkzNVKu918gP+mBYkQykuJfLcZ9v1JcHc4mKKxaK
         xw7f95O4n16fXDziKqS9iYI/s6BIYARRPjkn0SqGyTZYq3vCP63H44jcaRNVjern67/0
         gwpw==
X-Gm-Message-State: AAQBX9cvfPsUhWUxwd8lc65zt772oGt+aQKyL2UxgFcVOqGZGCclBF6o
	zHoGtp+OXC3Rw6jzLGZLlyc0wg==
X-Google-Smtp-Source: AKy350YoxMUJF5MkGRYy9jG13/cYrGjkvHSJkFdz+xhnZvN3qTnjr/up4aM/z3jWL72ETzzkpgXkWA==
X-Received: by 2002:adf:db0a:0:b0:2df:7c0a:df33 with SMTP id s10-20020adfdb0a000000b002df7c0adf33mr9995255wri.30.1680083557649;
        Wed, 29 Mar 2023 02:52:37 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a18-20020a5d4d52000000b002d1e49cff35sm29667158wru.40.2023.03.29.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 02:52:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 11:52:25 +0200
Subject: [PATCH RESEND 6/6] arm64: dts: mediatek: add iommu support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v1-6-4a902f9aa412@baylibre.com>
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=nW+TPcLBymBQumCyH7WLeKWdyOoyUYLYkL7HqpljFxc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJApfW1/fAC/a3iYXOsk9RlBGKnGk0HAwAjRg6xvk
 hYEdgMSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCQKXwAKCRArRkmdfjHURQqyEA
 CvE6mTUTCNWwjiA70MqDxweWMM/VPe2qK6QHZGay3IFpYohw1Z5F04gtPUJsecxo0gCwGZERF26YMo
 +pZCs3d2+bVfxztMABmi7B4AGQcXpNISVGseGoyVNMVS8Dqd5RoIzl5vVA/vTKpwCPxWaxxuzBtLKT
 dSYTe5I6LK0jBbCzOw/VuJptjQUY6yX5eYUMNsW58ecrVWFsR72ZTSgiTCHdWBSrNeKFQI57W0yhXA
 4jYf8PUNp2nJhwlapg7QIOueAaJynx9Xra5N17+jk0rVl2/rI3n3RsspgflsrWcOEuijUOcNCE7tYF
 DYGILJecNpQekLdvfjUW0QumB2teAHOk6iTg6hkwsN4TrjddhwvgFMbcK5YrBPyfkFZqLjMRPbSPyu
 SpW13uNZ6B1rSKpNlrDEseKj/ZX1mKxOrfZJIcxyz2AMW4gOlwynnD4Ry9rcdlmQJ8rhf9AgzMfwaP
 cUEpwnti33jNP1tlZrjZhnhiks3vxz4cED4nlyPUdpY9rVDimi+J2rgYejDmv66Q5kWyC+yfT/g1Ez
 aRDFtF4Mxamljws1Rr6xWldfSfurQ1rXxW+J4exwcrs0WVGH5LXS0TXqMxhAdTWx6sNJETzxqak7uV
 9MbPXIrCMGpQMST4WJWhu8ioojdCaexIp7p2tgYEVerXHMe5arDLtq1XPSGg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_105239_710228_83E76C96 
X-CRM114-Status: GOOD (  10.03  )
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

Add iommu support in the SoC DTS using the 4 local arbiters (LARBs)

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index db0b897f58bb..c713471c59dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -456,6 +456,14 @@ sysirq: interrupt-controller@10200a80 {
 			reg = <0 0x10200a80 0 0x20>;
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8365-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>, <&larb3>;
+			#iommu-cells = <1>;
+		};
+
 		infracfg_nao: infracfg@1020e000 {
 			compatible = "mediatek,mt8365-infracfg", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;

-- 
2.25.1


