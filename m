Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96866C04A68
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arcDIDfy5I5th71PH563xn2qw+sBX2iGRhddOYupYGc=; b=F9cnxPiWqZhtv8rcW0I/1wImNg
	51bcN9QPOiTh0KT/68exbfU6yHyKdlj8lZwZceGL/Gf1ko8uM6fm+gyrA7BN5/duZBCt8EgMnfL97
	oyqw9wtV9psX469wHmPC6CTybM5cXfBr2terdf9nCwGcfCkZxB5u6a42/uRbCPTEYCVRZXvzrB4pm
	GZWOwuhOlVNVREG192iw7PzPcDh4NfjRPsRgenlAJIl8Z6iXjPl0/V5RTvWGnZoqfNVAFMbXHOQ89
	NP7wPclDzaaXPpMtNzkOUw+bFn2EpBP81oYa1bD/+iUDhg5IEa6vcafxwY+bIXdbLKqlyZRdYQN0S
	uymGg44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL3Z-00HZRl-8u; Tue, 26 Jul 2022 13:57:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL1w-00HYX7-8a
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 13:55:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id k12so2536243wrm.13
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=arcDIDfy5I5th71PH563xn2qw+sBX2iGRhddOYupYGc=;
        b=Nczm1R1XnknpSY0bhLJ9KIkhC1wp9zY92E1LUSJDTjPlVoeFq+Xg97vBajvhRhTo8Z
         N20OvREyvOccKItTtlaDCzvW7vcr0v9vKGWDy8QMQfXtxXS3/0YHe9vXfSeTSb8zI2pm
         o1aNe5bDuoYgyelDEKcKs4g+RHjZRsMP3kHhwFcJFC7AKwpLmWyabClTtmB/skANAem0
         cvTVTTiDRzghJ+AOizkC2yl/dxwJ7cJ+q/7ngpZRljRvcEIEORNUpuqz7xiGFdAmhM4A
         apT3uub8L83Uh6ZKdcfbPFZwMtXB3ine/8OdPInKZzzlkg0Zk413VLOGglzOKnDg/Pjc
         N3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=arcDIDfy5I5th71PH563xn2qw+sBX2iGRhddOYupYGc=;
        b=wxFJszjPtnXdxyotXFflSDO9sBqcYG749oyGGcxduYOPAqxXVcF6ozveI/MT6NQwts
         Lta36OhJabdqBTadG/OYdBShXxlbZkNIysLlvNiDZ3naGrucLtGsAkpirrncDESxHnMg
         0shtjROcG3mtVi5oAX0Uer2J5VnjEJTVb1SW7ECbrLV+PV5vsu4wZ9bZShFqcNKFu+0s
         zETn1Ma9JlaSWxNH1W2IQMnMaRFwbnn2mCNFxrGtxPwcnEulEfoR4U50wyCiIi6fDfLm
         rHQEcmkYJbJdzEs/bs+eqfveiAOEUvSRwSH94mzj+97Wjeljqs1i6kWA1q7di3GS+x8M
         UgXw==
X-Gm-Message-State: AJIora9wJrkdHlXBJJnsp7tFTRXyqOOaKrAqy3eB30XvbI4BSJ0IfbaN
	qvtVLp/xTFaFzxStvyl7Xkwk1A==
X-Google-Smtp-Source: AGRyM1uecOH3mUxHbaHJqNjbrf59fJByRJT0NxFXJuNtt4FJ/G7iD7mFvvj5CrduipHAxcN2k3c0gQ==
X-Received: by 2002:a5d:6c62:0:b0:21d:c697:87f2 with SMTP id r2-20020a5d6c62000000b0021dc69787f2mr10463196wrz.283.1658843722014;
        Tue, 26 Jul 2022 06:55:22 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d13-20020adf9c8d000000b0021e4c3b2967sm15244670wre.65.2022.07.26.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:55:21 -0700 (PDT)
From: Balsam CHIHI <bchihi@baylibre.com>
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v8 5/6] arm64: dts: mt8195: Add efuse node to mt8195
Date: Tue, 26 Jul 2022 15:55:05 +0200
Message-Id: <20220726135506.485108-6-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726135506.485108-1-bchihi@baylibre.com>
References: <20220726135506.485108-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_065524_351990_AE4AC392 
X-CRM114-Status: UNSURE (   9.47  )
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

This adds the efuse node. This will be required by the thermal driver
to get the calibration data.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 0ff34edcf8c8..4fbf24b5d202 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1236,6 +1236,22 @@ nor_flash: spi@1132c000 {
 			status = "disabled";
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,efuse";
+			reg = <0 0x11c10000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			lvts_efuse_data1: lvts1-calib@1bc {
+				reg = <0x1bc 0x14>;
+			};
+			lvts_efuse_data2: lvts2-calib@1d0 {
+				reg = <0x1d0 0x38>;
+			};
+			svs_calibration: calib@580 {
+				reg = <0x580 0x64>;
+			};
+		};
+
 		u3phy2: t-phy@11c40000 {
 			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
 			#address-cells = <1>;
-- 
2.34.1


