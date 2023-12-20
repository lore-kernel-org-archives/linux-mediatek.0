Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4A4C46CD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 23:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqwPaQqmenUw9eRcinVgTHm+ZDOG0CHY3aysuEWfhMk=; b=HnDtLL3vEVZ2lGRvu+jhnNNcPm
	eB3PAD6y3ii1ezyiPnz08dkb9iZo3o8cYVMcD+iv+DNJO2Fk1PykE0+agH9dHeo6vjB9RHskoFPu3
	MZJNPNp1G+e6qsvhLFm0eaenobsfsqJ2GrA0K2pa/NgrHGNfP1mH94I+mMmhIxfMRXnp0ls/qgPQe
	ZVPewwFVa8gZYux7M9Ng2KA51wVusfgd4ZNgvkRoIFvfDIWmRTPzz7EH8Ucv/C0YnZaH6WDy2ujT4
	410eAxE7zswvTdfNYc/BgOxRvXkfy6aeGC5cXASnmHj/r57HVfbWemkrF+73yVJaxed8wtqSrq/WK
	lGioGU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PV-001IU9-24;
	Wed, 20 Dec 2023 23:55:33 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PG-001IN9-1K
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 23:55:19 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7b7a9f90ee9so9151939f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 15:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116517; x=1703721317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqwPaQqmenUw9eRcinVgTHm+ZDOG0CHY3aysuEWfhMk=;
        b=XqVZiuly3no53AoEw37MECn2fPOz7JpK2/YjU1z4vnQDdCfLFiRtM7K1m2FPXBnFfr
         n6l8cDgU9Zc/g2YnIK8zW9qxbONlZ4bC5uZF86loQ9rFCpBwiEPC6P22B5SG2VdI40pd
         AlMiPLnXuc1jcaBvHmqVU6FsrOv5ybE1Tz/hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116517; x=1703721317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqwPaQqmenUw9eRcinVgTHm+ZDOG0CHY3aysuEWfhMk=;
        b=fAPGTTA2Awm+byUmt8e+8JyWyV+A0fSBb6o7amIePyMIUFgKzcB9rjzFf7KDItaorW
         7b6WuJifSTkNoUo+FrkIrlAlIaJYXGW08CGJ43VTv9G7+5SkXSs/Jh6r3mzdGzEIVsuu
         YDD1VLckef2vCCALUW8SfZILNqdfIUxBQBrv97PEgBAiRWKEr1imHbK2uCaU55x6povF
         u6k4MgM0OI3U6LSx5PAfO3ExKbDNdXYJtwfSeFCCquMaKtnYVrCi3SPdFy7vouSt3EjG
         +3QGnPtUHzu5xUHl/c6huWYWx6YRCoLB/YYxUxiIvAdQY+Pg0JK804WqD95wvgdekHqw
         Ji2A==
X-Gm-Message-State: AOJu0YzW2Ol0qlI3lMkd8chDiVBe+nGaLf7awIFLM5kwtlx7etAohURP
	O5rIfTjmD8D5kmfqkLV58jfLlw==
X-Google-Smtp-Source: AGHT+IGMe/Z9RFCpmHfT3jd1XYj7esK25Q3besGk8XDKQEr5sJIDR1GLwrxSPfaU1Eltl1MnNPIZww==
X-Received: by 2002:a5d:8c83:0:b0:7b7:fe6c:e6d3 with SMTP id g3-20020a5d8c83000000b007b7fe6ce6d3mr2659120ion.2.1703116517315;
        Wed, 20 Dec 2023 15:55:17 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:17 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 10/22] arm64: dts: mediatek: mt8192: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:24 -0700
Message-ID: <20231220165423.v2.10.Ibd330d26a00f5e219a7e448452769124833a9762@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_155518_447603_023F0D87 
X-CRM114-Status: GOOD (  10.07  )
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

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to match expected behavior.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index f2281250ac35d..ab44d382f757e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1332,6 +1332,7 @@ cros_ec: ec@0 {
 		spi-max-frequency = <3000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cros_ec_int>;
+		wakeup-source;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.43.0.472.g3155946c3a-goog


