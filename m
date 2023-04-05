Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42666C76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHYOqnIdeZEQQSsG6kV/waTEgcH9AADMsfaYGJviNTM=; b=SBY4wDqenO2mviWq+100q4B3LL
	nRp9wPjoJRbVfSNt1WTYtQqj4ZpPem29BbS2Pf3u7hL+CdA4OzdPuk+4DQqZqKjLo+lLM5vvJqPlZ
	A1gYr24aysKDLsi5GZyHh8IMta4BpYWUK8TW/L/ra0UMuAivAL0Vy/KI/Mq7u2prKEwyBHakzep2W
	NgR6Xy3oJQ2Mr2uWCOiVf4/jVKVRXK3ADhmYrPzVOChMnuZVunRxpzlQBc/DXGDN1+KKHMoB2WJl1
	lAaPqRFCpJFoaYw14LuZWlPzF9Jz0bIUOPxKRNV8LrM1XecNIXpw7r3KfQB/dbCP5es+ci2p5O4Og
	9MKWTCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBm-003j72-3D;
	Wed, 05 Apr 2023 08:08:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBf-003ivB-2Q
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so17742735wms.5
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHYOqnIdeZEQQSsG6kV/waTEgcH9AADMsfaYGJviNTM=;
        b=NJfcutidJRL0Sd3UR57Ek+M52rh4V6u7JmlddIraBxi0Ju8z6MMFEiXv/qhhQB2BNI
         4UPVf5jK3Cnnyvt4oDkJ8HPVZj65Q5w/1knZiegA5nGwbzsxeUUOZ6rQEYqEhl93W5Iw
         vNH41L1bzc87PA/UU3BPX1H86617Q4X2YobQfrVvVkX2VNWL9qCNXZ+bqlWuKFu2zYwX
         XsjjNOMhzkmMShFCrfTuraEo37xMjXiGPIxXClHb3V5MOvD8FpUI2w+YI/R3+sE3Rsd+
         KXRyJunXqTU5j58GF2OEdbIw4PozkAybpnTQJyt+RwrFwEK2jYwy8V75CXcr8BuccXWE
         2JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHYOqnIdeZEQQSsG6kV/waTEgcH9AADMsfaYGJviNTM=;
        b=BO2pm5CdeW1jczGqm7CbRUwAywHBG1fMF6xE8+BefqOLj0ivFFF0v7+R1kgq/u5nak
         w3ALAYKtJqvD9Z+tLvcnYGLpJQ71A77TVKVTLmzLcl23eLuaEThxf9hku14+X029qpdN
         nMV5WxWkju3E11GO1Z+4eCo2EbfkvId0SMt85VFGQI/d0pZwkum4LObMZZom58bNNjz9
         Zreng8hPtlBuefNapU9xE+40Z+D2Mcn68rHWndDDsjVczcg/b9dGpnBrSEyZ3MulWiWf
         Pr6Y1uMu6x0ogNSNZ978BNViDRSj4dWMzAObA5pkyJE/ZPI2eU5F0ApwNitnHMDAh8ai
         FF7Q==
X-Gm-Message-State: AAQBX9eEeXc/uRT/EF4iqdsznRysySoHEdj6bl1EUWZOeXXw8U5skZPM
	1nUa/5JOdl62MDZASGr1TR4bdg==
X-Google-Smtp-Source: AKy350afhnXLFxOrvlN1LNxxMmwnjjQmvnePT+4/CSqlxZZACPhRmxLnohdtgvRvanOoVXFaqemCGA==
X-Received: by 2002:a05:600c:21a:b0:3f0:46cd:c9d2 with SMTP id 26-20020a05600c021a00b003f046cdc9d2mr4031545wmi.16.1680682072601;
        Wed, 05 Apr 2023 01:07:52 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:46 +0200
Subject: [PATCH v2 04/10] arm64: dts: mediatek: add camsys support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-4-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=x/wu+Gg/Z7J2I0F/gXx6zOm7KvojSbz4OytIRAJsBIw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxSYZTPbIPS2/RCyC2YT1QrM5a0tSocLwa/6I6a
 I/vATOaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUgAKCRArRkmdfjHURUYRD/
 4rzPcpgK0AM0J6vKogWpVZJVU8nLPcCX2gZDw6MpNBtn/HRHxrMJJ9Ycp8s8pXAVlBlJSwJuKlCTpk
 b3SNROUmWXhYGTSExf0GPi0tW01Q0BYWnttAJxc+q6aMfu6wq367G5MupOYsySE9llF4hTUIfOeRPV
 GcBXa4jSXwL5o/7fX8S7LFI6x9wI3sOLywwopcfJ++mFDtOA0uD7YkiUHy/z0+LcWcuZsAPs36Z2lb
 nUnD/DwMQ+6z4Voa4UX3lPipNee5vVw6SkpvyLUERlgrUiSnhyOCXVUffK+KzS1jb51JorzQz8VJVW
 3+xJdhjyb59iKWp4Wde6o1IaiLQJ/QG8/XmSwxmCfpg3LsDmQSkQqpTDqBjleBTTF5Z+z6rj+rPOqH
 ejeUBG9bXbZOcCsTfR6Bhj9dTIJyN52m2aHV8SyHYFvfreDE5UmegdFAfKF/sTnFTZnBn/ABeKuYi1
 4N6LauFAlwkd6l53tsz913CmdA6AQyoECWQt3tyPQbOyVElMkK1XULPqyejmmstKjc5av5B3Z5tIki
 OIDdtt0seOt8npl6mp2aMF0EcJfwcjm3EO73PiElvRGyVSZxjrmBdGHnWkMk8lxBdLD/5TAM4QUZe3
 LYZRStwSGXcxC9dh9MRtp8ebf8o/LzhZicGsi7n8V0I5HSMk23rK5UJ/yZxg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_010811_868518_EA035D24 
X-CRM114-Status: UNSURE (   9.48  )
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

Camera System (CamSys) incorporates an enhanced feature based image
signal processor to connect a variety of image sensor components. This
processor consists of timing generated unit (TG), lens/sensor
compensation unit and image process unit.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index db9ab538c34d..73cb10d296fa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -598,6 +598,12 @@ mmsys: syscon@14000000 {
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		camsys: syscon@15000000 {
+			compatible = "mediatek,mt8365-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


