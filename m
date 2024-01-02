Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66348C47255
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kv/aa+b9yoEdKvBahkqrw433Fqiy1xO+ioSsYaTJvb4=; b=h1u8BnowILpz1qP4wa/29iD+Ro
	ALq+QPw0D/YbFh60feZHBPKSichLTc4LkuMtGLtSvIaCLlJoKQA4hD0gKe43OAANMRGLKk0hK24PH
	tJzXDWIqgLehrS1Gtupj7ztK92S0HZs93+9yw3P6lhvVdTHX220cupYCtdQhlbR6kkdD/Hzf7OJgq
	Fb79xjWvePtKqtDL0bQYTDYHWGIKHqmDCsbdesHsmY5KyJoOesSM85CWO1MmkL4mPLJJLk299+h8T
	aTQ8KitJTJv9FObo/QCQiCHIC9Br3+Y+yAvbmvnxxiSSX3CMG1a1WrNhtM9RH6P8uPLFouVPfFtXv
	VM6kMEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0U-008znq-0n;
	Tue, 02 Jan 2024 21:09:02 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKm0M-008zgn-1A
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 21:08:56 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-35fd902c6b5so82499085ab.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 13:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229733; x=1704834533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv/aa+b9yoEdKvBahkqrw433Fqiy1xO+ioSsYaTJvb4=;
        b=Jh5FM7A4L1XDJMXfnqOmEp3HZJOkQIx7yqgrEHjJ8GkBxdlldPqvYYIvI9AMPfYasM
         Z+UGj8lbZbPnbCDbF2AoUymaX1RQqwTXpekpJGVfQCeCIPoV5WuWoteL6ZGB+ecNoRT3
         z+f073DJ9LipZA4grtdgtBfpEjRPZAC4Yy9kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229733; x=1704834533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kv/aa+b9yoEdKvBahkqrw433Fqiy1xO+ioSsYaTJvb4=;
        b=jB1A4e90laglU5ayiVRJcGYq42d481dhzH2eYUtsmkbd4NEq8hqdir7xrXL3tgQ7Pr
         4clqAJHsj3Usi6htoZL38fXRO3iUpQt/wr42qmn8I1jF/Stc6P6RBKWkAkmSqK1O4WdN
         S4/GGKYQ6RXosx2LMwF0pkST5KVoXAU5RCJ+CmXPsHEjXlEulpiaj0RrPd7lV+MnjJVT
         cO7L9aA7pH5W/4i5d5eSvfXEeILFb3w4wuKO8weI2EDI11eQSG/n1nyiODcNNL+PI6YL
         mlSpRFVTFjlRyjBeB4u69glFjOBF90qwK6cz0pdgqr+fAMulmVd0V9Tpizo220SIO+lS
         xpDw==
X-Gm-Message-State: AOJu0YwUYqv+nVpVcyI+48F0TFAmplwbMk4HQG2fSNC7FfAja47z0qST
	WGAr6rL1nciRu4F0u+KmjsErH4JoRJj+
X-Google-Smtp-Source: AGHT+IHHN3TbtDEmyfVNFzxMQSipzvaGMekbOIDXc3JT0zP9D5s4Ute8SBzjxYwpVjI4JooHeisxkw==
X-Received: by 2002:a05:6e02:1a88:b0:35f:a4b2:7018 with SMTP id k8-20020a056e021a8800b0035fa4b27018mr27509779ilv.29.1704229733266;
        Tue, 02 Jan 2024 13:08:53 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:53 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Subject: [PATCH v4 11/24] arm64: dts: mediatek: mt8192: Enable cros-ec-spi as wake source
Date: Tue,  2 Jan 2024 14:07:35 -0700
Message-ID: <20240102140734.v4.11.Ibd330d26a00f5e219a7e448452769124833a9762@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_130854_926548_A74D865D 
X-CRM114-Status: GOOD (  13.14  )
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

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v3)

Changes in v3:
-Update commit message to provide details of the motivation behind the
change

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


