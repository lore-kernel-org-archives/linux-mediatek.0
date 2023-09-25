Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0736BCD3431
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dK9svkzd5BTaKwxJw9fwDjaSrOwG+HEsVIjgOVFtfuE=; b=mlEx8mXuGTI3o9lsF813JLkH4r
	gcYVSz/SD2IjIIwACe7/ueXBnM0VFEtLDmDHCE5GG47OtKxh3pqB8VqSTgYEX+zFs8kpbgJqZJBpi
	srQRklT80IcidrPqd87Q+P74AZNq/7W45pbhHVLhmvYFVD98IwLJS73S/TWyTsKA7rZz4c2mO09AE
	rTLIuZLHs9T6IZjZiU5zWB+9ojN6WsdSsY7RNBJvJGZ59flPIZ30gJf/ZKqIkCOT8UKKc4OvTz4BJ
	JKG7oVrOr+gljfQmIDfYTQSiIuX7tyl5p9d27YCkcGi3Y/2DSsPpMMXTLHHonCg2S5GOEI9WndBLq
	9bLgxDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9X-00Eobv-1k;
	Mon, 25 Sep 2023 18:17:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9S-00EoXO-2v
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:48 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-503065c4b25so11194574e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665864; x=1696270664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dK9svkzd5BTaKwxJw9fwDjaSrOwG+HEsVIjgOVFtfuE=;
        b=dGw09eRlV6t1u0b5ukQVD4/aTVKdRTOA9Zb2AVsrfDKRYXXiLy6W4/ilDwFnoWkjYU
         U0tbvNp5t+Dp1PZ0g7xjbrc9X5Op57P5a+oH5346WVZDbrGGDzuEt8QlRnLI+NbemZyK
         a2YIrtCNoNhjHqzfJhm+TJP4G02Mf60iJoUXJlBzhTqFuO7KJm3U/P8ZebMbTsLr1Gfg
         dtPrbIeDwhSRKNl62dgPHsMUl+z3E99sP+0WOIaBaeZDevwKz4oG5ssv886rznIpK8N9
         W3Z2l6/qep7r3MyEQFb2wV++0ZIqaalI4AAXAaimvoS7gSbeoqdvG5FrucO4bMF2Z7p2
         bb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665864; x=1696270664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dK9svkzd5BTaKwxJw9fwDjaSrOwG+HEsVIjgOVFtfuE=;
        b=lFE3eoYzk1KnJk7EUMcVUqx2j5DNncvFr++YmCQvY0q0mTjTNw17x3l884fbeaNtBO
         xGS6loqRN3RCmqHL/J1Bkc6POtUEn3wPcKvV95xqdd6viMn+6wMDJNOJIkRxBq8/t2fW
         Gp1nls4dap6DFc0gb/TDPlvb+cWDeSUNgAyw0/jmAeya799XV2m3kh+D1A8p5wUpg6DY
         PQjuVxZobintvVeXPVlSVnqmYTjxVtbPP9C9iA9PlYsrdW1ShOq6cyA+PLHAsH+K/UW8
         9TiWEH1igWl3UKTu8rbee05546wYHxj4RNQ0zQH37CnB6JlTKBLAKO383o3ebnkDxONK
         cGIg==
X-Gm-Message-State: AOJu0Yy2LFngidnCovGSC4uBmkvusj9Zmsns2xTQ8Wd09emRWgDZTrL1
	wX6aSVynVzeNYVNrlMNgL9R+AQ==
X-Google-Smtp-Source: AGHT+IH4f3Zy45N7aooSzTaDzz2tjwmrYrkiJtIrcuiwsXrjJTqM/3pRDFGwNrPlGO4oCd1gP3JB9A==
X-Received: by 2002:a19:6746:0:b0:503:35bb:1e74 with SMTP id e6-20020a196746000000b0050335bb1e74mr6085356lfj.61.1695665864466;
        Mon, 25 Sep 2023 11:17:44 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 25 Sep 2023 20:17:35 +0200
Subject: [PATCH v6 1/7] arm64: dts: mediatek: add mmsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v6-1-24453c8625b3@baylibre.com>
References: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
In-Reply-To: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=3xFs1OXjad0XvE1yvI1YsSmmgVc5j01QOJdhl+XL6SI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7FZEar/ON4sXpZXeINtiOHvT/onNcfUSIdLTxU
 fqzezeuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURU3wD/
 0XoPzDUgXjVNvenXE5P7hb9zlHSrFtmlDaKfEWNHzM47z9dKN+JRhCkBjWJmZCTf74kIJkgiOTpHUC
 VGnL9yPp3fTnTlLIh0xYC7Dt0f1vuEWcFDu9WVH8hWGZGDK8jAXi9TYI6nu259zx7Ay7pV4OqK4jQh
 j6K+NnkTuwKB4qy5SGbSDgwLAbsNUx8n6rHCEaJulCr0EGgCLDAXVoQqLL9/ZnfgRMJ0zUvI81rSnN
 PCtvlu2BGrC0i9AMAShgw6JRsVfAUl6awqnJEp+hwQqBFoHQGRH604SSBHX1odm9YULfV0zV+Oc3iF
 xFHqEAWpSMwPjJ/8+EdG+pvEBBeSfy9DhY8fBj4YK5756jmsq4KWdaHPNpWCHdfzTnnfMzv1apcj7k
 wHEoXB7A5NVuRZsCYk2FQUpevCVyLdUsJQc9xomaQqvsl/BArj2nzul0CvlaLySnkaRRkVRyffBLvs
 munBn8Ui7EX+uMKnOX2ItFVQNeNBMqr1XyLYyxKYZyhOX5Qas4V/L2qtEmj4XBxm8G+ES6YipHNj9T
 /YyeYIy9IQ8lKh5LqAqHpGve4b8pBvLwv+OFqm6rFYmKiUIOhJqYBJxfUMdDhrrYc9UfE1CjWofOCP
 C8eiGlfEqsOmO1QpZZrxfxwCoMfDoPxnn77o86u0D4JD7qvNsWXe+gKaxjhg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111746_943529_00004CC9 
X-CRM114-Status: UNSURE (   9.03  )
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

Multimedia subsystem (MMsys) contains multimedia controller, Multimedia
Data Path v2.0 (MDP 2.0) and Display (DISP). The multimedia controller
includes bus fabric control, Smart Memory Interface (SMI) control,
memory access second-level arbiter, and multimedia configuration. It
plays the key role in handling different handshakings between infra
subsystem, video subsystem, image subsystem and G3D subsystem.

For more detail, ask Mediatek for the MT8365 IoT application processor
functional specification.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 413496c92069..bcabc2b89a94 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -603,6 +603,12 @@ u2port1: usb-phy@1000 {
 				#phy-cells = <1>;
 			};
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8365-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


