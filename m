Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D908C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VU0RyBXOqlpTpKYlaoLqo3MIOwYAIU5hns0W0yY/vXM=; b=xX9Jc1DbjagV4T
	FtM8awxZ1DBb+gFt9ZaJ0KgLB1O+izwVzdbYrKQnCnXCoQ6jZ1gZrMCem+ptxfzIaDkagXOWjudwX
	gEWvIiPY2AMiD9GSL3TfaAGUESf+ykWFgACAsVRdqqD8SXXrJCbQIQbj8vW/unXphLaVe2TO01vs2
	49X00gykIFYS0qmOwdqGi1Gp7NtBoFUgcy11UIM7kLB61+wyWiVeM6V1sJrL0PJaA7B2yYbY0UnuX
	0apQNHFFqsYORRiBKpoU1sqU+n3LsY0FONolDa7bD50m8cWVYaBnNX9rvz/vcltX+Pc5boGmWMMHQ
	6m5vAJTXtktHMEaA5Jrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njOMY-00FPXU-W7; Tue, 26 Apr 2022 16:48:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njOMK-00FPQZ-NM
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 16:48:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id d5so11098839wrb.6
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4ciD6HIPd+5KM3dYGEOIb5g49z+4yJDjMPc1UvrfkU=;
 b=IJZs0rJxdFFgeK0qhrf9rXUqCycI5k/9aihNZmVD0Pm7hmJYgN98EhRFb8/56KGxsW
 CmQ5FLvhRT4+RAs64ooR2h5jeA/sWjQd/rmBfezKcTvUEIrNPcxYGtb8HYbbwPrK3LYD
 Yr7ZgIq2JOarZPyr9GVegHztUbpfnLqoABb3C/ZOaC376RFckBFWhGra/jOo8/25KYwX
 ipklu/+JHJHG15T+ehqtCqTvzkbDJQvlrFRjEJokElNDaeLVCTfowAlwUaaeEa4xNdzO
 kUNbuBJ5j5knBsDJwIROJHpa5v/PYiYNACjfXHM/1lUsbWYOHqnUz0kffnT2idz5N2LI
 YsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4ciD6HIPd+5KM3dYGEOIb5g49z+4yJDjMPc1UvrfkU=;
 b=PtSlN1EP+S8IRprPPFg310T2cQhjSQD/t0Anh7pjXgNfaD3IMnLedb98guXPewaroK
 a084cs/LCba8K3Wn3gL9KIr8Nh3STAw/qeLZeoa75YriN/QyZSMTZOZ6s2Lu9INrDBfs
 dSAXGIz1VuPu8DhOVLZRSwonG9FUedRmzWhgdPuLnyEi9AHlBFevYyJy4Bpikud5lxzO
 aEzSUAbjyaHvQGRWqqYvucPI4qvyS11HlyilNjbkaAepsF72lxwXIPzQT95EAZqoyhls
 t2MaCCiy3W7bnREoimuINpSuzZK67Yo6oh32gmJU6xM/zrSXwHDma2xYAb5gESUfoRrp
 uBqA==
X-Gm-Message-State: AOAM533CuSDnyX+PNNUSX3JXZiX+uo1+OBiU+mZlKGIobK4lLN+7kNBF
 Q3GtQt9fu5sICOHhkOf55aC3WQ==
X-Google-Smtp-Source: ABdhPJxxUshafCrpaa0LIgdqChjnIZ0fYu0cr2UYUDQ5TDdi5wXwhZ8aLoRJtA4XGbiS68e8+yiZFQ==
X-Received: by 2002:a5d:6752:0:b0:20a:ce1f:2ceb with SMTP id
 l18-20020a5d6752000000b0020ace1f2cebmr16099080wrw.715.1650991691348; 
 Tue, 26 Apr 2022 09:48:11 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a1c6a01000000b0038c9f6a3634sm14012661wmc.7.2022.04.26.09.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:48:10 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-pumpkin: fix bad thermistor node
 name
Date: Tue, 26 Apr 2022 18:47:55 +0200
Message-Id: <20220426164755.435372-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_094816_822311_5F26CF24 
X-CRM114-Status: GOOD (  10.58  )
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

Fix the following dtbs_check error by using the correct node name:
/home/fabo/build/linux/mt8183-pumpkin/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: ntc: $nodename:0: 'ntc' does not match '^thermistor(.*)?$'
	From schema: /home/fabo/devel/baylibre/linux-mainline/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 10b2c0500219..3d6da7efe31b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -55,7 +55,7 @@ led-green {
 		};
 	};
 
-	ntc {
+	thermistor {
 		compatible = "murata,ncp03wf104";
 		pullup-uv = <1800000>;
 		pullup-ohm = <390000>;
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
