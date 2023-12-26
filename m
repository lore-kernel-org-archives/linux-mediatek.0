Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69106C46CD3
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Dec 2023 19:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7Ja8Mbk0Dn0paAcqtccJazS/+ZwMfvgkX5xOL8nKJI=; b=4WRDIuGqpjdjXiOoYKTxUNB6V6
	gJQxROrQlySAcikkvbq70b+LMOgHzo19ERsIZve3f/VdKESCQl8K72BnsBSI5id8Il5sSq5pHX815
	Er2fK4fDG57oe5Af3lwDWbdciajgIHjpg2ElSMYIE5jhH3JtnHRZXjPjq319MIVbCFf/8AgHRcDx2
	yl0aFnWn++gOt31i48JB5D16OmyQAX+MYfNNvvjGBoVh2wcazm4PY93FCZh7DNSylFR7Cz7LIDVoz
	5rWUvrIqv117iMxaObkQP5hYW2SMsKRfdH33z2JhfIYxTJywJD3TfHHQEFIgmMQlmuByABdpUtJVJ
	zbRHV+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rID0S-00DPuJ-1R;
	Tue, 26 Dec 2023 19:22:24 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rID0F-00DPja-0m
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Dec 2023 19:22:12 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7b3708b3eacso211665139f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Dec 2023 11:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618530; x=1704223330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7Ja8Mbk0Dn0paAcqtccJazS/+ZwMfvgkX5xOL8nKJI=;
        b=H1DauJUMC3Gh9rYUBbcV2phHhOxzUC3pf+1qVDrTgLCGwsdCSnuKv+/Us1ofqcc8wn
         Pmlu1Mnz/At3zC2Yyny7/Fnsx2FNlHQddVH6ih0nbFSWhiQV0sJhMJJDKbO+CjisCFbz
         BI+EmJEoFb4Hw0wirbHNmc2oyFK4XXL7ak7d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618530; x=1704223330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7Ja8Mbk0Dn0paAcqtccJazS/+ZwMfvgkX5xOL8nKJI=;
        b=UvT67jbvzn6JVFi6UlOLR5yssvN9UDmTz8daPr95b5Jso/PBAo2flfpusj1ylWWIiX
         Pf7EGTplr9j0T+HsCAAEa7R6yxNeWjvuNlvnSizqm+accwc+ph4kgCKfUI1jxNBpUU0L
         kQ7Vyy9E2uMTn/Ckv/zAHbY/dQDSyTD6HuKADkjSoijmN8QCLnFByFH7RCTtDBK14Pmj
         epHCoZQV9gTeRzWjztxxzQk+LXuxvYC3sB3XZACRAc7tVgnOdto+4DVcIPV/yDUDwOsH
         hjbOBKlqx+5Mv5PuOz9P1U7cNW+opneYjgy28NauA/yc8womyju+cv8M5DYHiks9PC3q
         Ttkw==
X-Gm-Message-State: AOJu0YzJF9O+DHbTaTEXYrpk//7HCTu7Uw7bU+ldfu8HecMb5xO+/8o/
	M6jNWSlM8ogTqMiqFGREXRE7G38i8f8f
X-Google-Smtp-Source: AGHT+IG8helE4u9r3GeIgnMcwM3YERloc3FZd47BOCTyom2igtFIusFh5HNKk7KvOaUbVJAxoSn/Dw==
X-Received: by 2002:a05:6602:3e8b:b0:7ba:a650:13d1 with SMTP id el11-20020a0566023e8b00b007baa65013d1mr9133258iob.10.1703618530770;
        Tue, 26 Dec 2023 11:22:10 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 11:22:10 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 10/24] arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
Date: Tue, 26 Dec 2023 12:21:14 -0700
Message-ID: <20231226122113.v3.10.Iba4a8b7e908989e57f7838a80013a4062be5e614@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>
References: <20231226192149.1830592-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_112211_279006_8BD6F512 
X-CRM114-Status: GOOD (  12.57  )
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

Some Chromebooks use a separate wake pin, while others overload the
interrupt for wake and IO. With the current assumption, spurious wakes
can occur on systems that use a separate wake pin. It is planned to
update the driver to no longer assume that the EC interrupt pin should
be enabled for wake.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to signify to the driver that they should still be a valid wakeup
source.

-Commit-changes: 3
-Update commit message to provide details of the motivation behind the
change

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v2)

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 5506de83f61d4..08261164ab18d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -924,6 +924,7 @@ cros_ec: cros-ec@0 {
 		interrupts-extended = <&pio 151 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&ec_ap_int_odl>;
+		wakeup-source;
 
 		i2c_tunnel: i2c-tunnel {
 			compatible = "google,cros-ec-i2c-tunnel";
-- 
2.43.0.472.g3155946c3a-goog


