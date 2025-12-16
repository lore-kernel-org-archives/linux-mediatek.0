Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B788D64060
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 22:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ooOYMKF+H2KmYqWB5Ili55QDSI+uZ+QcC5rU+1Qm5GE=; b=DsV3Pc2uZ83n9Ww8zadVfTvG60
	rjeVrpHYUK6e2NCHRMmdZ4+4I0y4+DKkWUDWiK3ZB7+JZDivdK5eX0JvDnFalo2kgkozjELvi6pVj
	kGrb4rNIzsTuJt/LTyt3crJSCxHLrlbRisPw1EH1YgAGsSzPQ6uSu82YMCU1x2Hh6h9HOed7cImxS
	DxJzL072Mi1o4gqRmvSOzGPuVfF/5oHHz6ttDPIwLRLxAkke5+aDoaWIDThH5W+/UkwXPXLZAn/7f
	btA0x2X6yAsknYcAASmPwkYdBavTm9P811yCMRwtYpF5kDnGlX6aQJ9gAqqHA+CVuMKXk8PySoQPd
	Djgz+jWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdzg-00000005vB6-1zEi;
	Tue, 16 Dec 2025 22:58:12 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdzd-00000005vAN-0sPn
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 22:58:11 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-45391956bfcso4200850b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 14:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765925887; x=1766530687; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooOYMKF+H2KmYqWB5Ili55QDSI+uZ+QcC5rU+1Qm5GE=;
        b=1u21u3cyVxS4qms3CBT07jenk+J7FuBxWg9EG+kKvCx0ps2VEfQsIu60uBpHr4uQyd
         EtzG1fNMohh2qUvNYmqkiGhDwrIobVQXkwNX2VWcYzeEGJlgFZaH/eJIInMIRwGkDtgm
         +b3R1pzf3ppYrUnq4FBfY+5wFC1QITHvmHuqRkCKigHrSSV70rJtTithKitxx7CjmCb0
         7/bzoeZJ1Vu/R/72+56NxY0UQofvxjzwmeDYkynawTMTuP6sRd4A7PZtZOQdCwHU4lUn
         58KbP39Aj8fXMnqGRHZuQEMCmbixAkAdjGJdWp1Bk1yJux7G8mRs0fi7luMOFKo7ol2r
         8zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925887; x=1766530687;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooOYMKF+H2KmYqWB5Ili55QDSI+uZ+QcC5rU+1Qm5GE=;
        b=xMbX52n3YBVypADuHgO+COVdu0nLJXFjzCD3PlDXs0fMZklqxBTeLT2iRdBLDtpN8E
         5K6mvjGmAIKkNlRWvuFBn89XlTbbPFyGy6Hnc+AwbR7dFF1WPNrfl5svcpeBBl3NPxsN
         LJUKuxswQ4Ik7VzdleH343bwPU47Lvu6FSXQe78W4Y1n3CAPzN7iogZrpbfD41oEJjZ/
         bphVTC2E+6tpPSl38flnKOsQKy8VuGvgFrQ5ARFQzcQqgNYoEaQBRsWlWB5M/qwQM67B
         +gsj4dhtg9voCIY0+pjkAFKXFKW3Chxv3e1/SCKc7zA8xFqcT2LNUCLs7DhIX4B0TW1g
         pGGg==
X-Forwarded-Encrypted: i=1; AJvYcCXK8z2sDfNtuf0ZnkPJGJTrnjdEUeY5q83w0uSvA2oCEZMconfIUnMz7M5oAR8p9wTymiVtM+J9iixeA+lHaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq5i0H+ww2Eqc1PDiSFf8AL44VF4JbwsdK/B3bmEhObN9Yhlvw
	o/G04Y1+HnK2Fx42DkLNFZI19zQiD7peLTu7DzGgtUvspO0FnQGdHxyBQKjoSeGJAbU=
X-Gm-Gg: AY/fxX6H2pBbFr2auco3HiCMi5/9btY7xL84OmWFk18Uk6XLEsXeZLQz7OHc195oeXV
	nxBUP1VOh6RHa2lvZvNLqWfgl31Ladvb5KxlpDwuBPk4Vy4TN+vpYfDt8HWm6ODJ5YAMTgKJhtU
	wGwXXbPAI1vpUGew2UvlMqlVoRs4cvzEQUecUUCKnzRVsSMkvRNggFNcM3h4HgR3JPn39sBqbDX
	alyXr22RBNvFJYvHeZfoDi9Abayyt/t4EKkGQR/PsXZb5+Va6UDRSPZKtyaVTvKyf3rVThjm+M8
	1zsbKS/771v9Qcqn3oMxVV2ATEg3t/dwnLiSNpn4wf/vSbp82ENpSN8FWyBj8D7CQVPs1WD/Igh
	V9vkl2lhEaDDeBh99f9LphYhMBcc1ZiWwiVAwxszaLO1PmRC5Mj+vJUilKfPLvBnVqmQ26/0F5x
	8jGCt3C3bjikc2zw==
X-Google-Smtp-Source: AGHT+IGvIl3sZdeYyABXtNkH9gms15ySp/W+3mzb7VAalGLpvvkhDucsn104GfSkCZW78M7CnCL4DA==
X-Received: by 2002:a05:6808:4a54:10b0:455:eba2:9ede with SMTP id 5614622812f47-455eba2a67emr991795b6e.23.1765925887473;
        Tue, 16 Dec 2025 14:58:07 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:11a:676d:852f:9349])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598cf191dsm8806668b6e.10.2025.12.16.14.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:58:06 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 16 Dec 2025 16:57:53 -0600
Subject: [PATCH] arm64: dts: mediatek: mt8365: fix infracfg_nao node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBAAvyJ77oKJxqJfKSKbdKNLNZFESkH8u
 6HHgWHmhMxJOMNQnZD4K1liKKAeFbiFwswo78Kga22UVh1uxwe9/FCCT+T8PAWK6OK20yFWVkZ
 Lpm2eXe+N7aFk9sTF/y9e43XdpmBIOnIAAAA=
X-Change-ID: 20251216-mtk-fix-infracfg_nao-compatibile-ba543769f5b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: Fabien Parent <fparent@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3b4ENHu/9j5dLIMx7Lb7rEQYQt3l9o0AQcUszqUwcQQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpQeP20JBd34+C400NYEMIY1MHpeh3e2Evyq63J
 dFtNazIPwqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaUHj9gAKCRDCzCAB/wGP
 wEWKCACNVAHidpy4BANZQcTr0S0Ws/oeGNHfWiH//n3PQZYZz7A0JeiGQEkUGjzS7EblzCkq/tg
 2RXNOhWTEb0b6E403ut78HghMj33dyOV+7yZU/gRKOu9Uus6VHMYkhgGV6aBNSivgdiaxF99SXW
 uwznzsHOAGISWnQ/zFuQPPvGaD1EGUY+TM9g2S0Kh3IQ6CBHg2K6n4ANRy9BQ2Yc93XAPyaET8U
 WqC89plhJkAlMlNaHSRhbHj2nPwuop8+6AxJoauJoqmHrXgvpKOd5CGq5fzJUEo9LJMedkz4x1l
 izZLPPFKx8EaI0Ey31Uo94B7iiygFnM47riGfvju5inPBm5m
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_145809_534061_25207808 
X-CRM114-Status: GOOD (  10.45  )
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

Use correct compatible string for the infracfg_nao: node and remove
the #clock-cells property.

Likely this was copied from the similar infracfg: node. However,
infracfg_nao: is just a syscon node with it's own register definitions
and is not a clock provider.

Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a5ca3cda6ef3..4116f96c81a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -537,9 +537,8 @@ iommu: iommu@10205000 {
 		};
 
 		infracfg_nao: infracfg@1020e000 {
-			compatible = "mediatek,mt8365-infracfg", "syscon";
+			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;
-			#clock-cells = <1>;
 		};
 
 		rng: rng@1020f000 {

---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251216-mtk-fix-infracfg_nao-compatibile-ba543769f5b9

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


