Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA44C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 23:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGItW2tX+Z99WO9rLTZWRRLNJGNHjPVu0HpOP7a3OKs=; b=B0Km809GFd8ddLPQ+/0mPLViwf
	YEmJ52DOsHFsThZJcewdaZudT4f8qz1uBJ9G7SLb11JcfUhSlTVKTIjZ51RxCtC+m0gxj7fqevgeK
	thGrYS9GSWIiFj9r6VHdHq2sIe6/pUWdGHa/H+0IeT2mgcsb9Z7OBSsfAXzRj6tNXsKPPHyO5NbXd
	PyCCSdofTSxz6w1p0Cru4wSzzNvzZeJ3tUnkP7HdQDH6kQ5eohCAwhii052z5ymvRNN862BnN2+Ws
	2q3QP33jbnxnShPyEtmdiFnZzdc6Xb4wUDCIwncSsE45rS+bCv1sokgLK8atA8+jNucr+ICS+qE/y
	/wVvb6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PW-001IV6-1x;
	Wed, 20 Dec 2023 23:55:34 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PH-001INi-0i
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 23:55:20 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-35fd0154368so943025ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 15:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116518; x=1703721318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGItW2tX+Z99WO9rLTZWRRLNJGNHjPVu0HpOP7a3OKs=;
        b=hY1lz8aKqKy1HvMoik6gz8MEhTz3DlRsWoritinZemVFUCoKG4/djAjYaHEVrxq3EL
         a9buhEvSDPf+GM3jtDPTKCERbnLKvmr/AXN8+xDAXBz3Ugq8ReCCtNYLh/pZ+oAcQaAR
         DcKdcuvhJNTvlrGrPFQ6z5J+45VL5FjPFxgh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116518; x=1703721318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGItW2tX+Z99WO9rLTZWRRLNJGNHjPVu0HpOP7a3OKs=;
        b=SPxsxg3bU8z1suKcWVvLQZSKZWw0ru5WSfFyE10rtekSiKcwm4SCw+Q/5giu+RKaTn
         Fh1lMlAIPW3aXgU+a29apjQHyxfRqFZtz/ZrLfmLFTPaHtP7Tjt+UqNqHKFOF7sb12XP
         RSmVn3u+AsN4VC8n7kkCAa1oPYFYdloAQpnXPyGYWSpQNBppcovccSf0ycrAYiWNIoMy
         N9d7erRl3sRFw+sdmFyHbXghL8CoQBTRV0BfawwHaGDJYF3nwG9WSHeeMZt2rj6P4lap
         W5iqye1/EGVJrgh7uswoo8pKvwZOFhQE17Nwdonw2xf/BeSTw6D35aEj3xWLC8ZXQvl8
         Q8bg==
X-Gm-Message-State: AOJu0Ywm5qbOebPvMNl/sS1okkq9H625u+cniEv4TjTANPfB963L4Jgh
	6QQ+cKsi/HTIcDnULGd4gMdEVA==
X-Google-Smtp-Source: AGHT+IEeTSi14BnWNyhDnJXCHg/iyGa81oQJSiNqZOmCD0hxTMyfI0gkwqEmm1ElucJzYwa6n9C2iA==
X-Received: by 2002:a05:6e02:3892:b0:35f:b4ef:ff2d with SMTP id cn18-20020a056e02389200b0035fb4efff2dmr5733161ilb.18.1703116518133;
        Wed, 20 Dec 2023 15:55:18 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.17
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
Subject: [PATCH v2 11/22] arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:25 -0700
Message-ID: <20231220165423.v2.11.Iee33a7f1f991408cef372744199026f936bf54e2@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_155519_264460_DF78419B 
X-CRM114-Status: UNSURE (   9.95  )
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

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to match expected behavior.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 5a7cab489ff3a..4292b72566bcf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1067,6 +1067,7 @@ cros_ec: ec@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cros_ec_int>;
 		spi-max-frequency = <3000000>;
+		wakeup-source;
 
 		keyboard-backlight {
 			compatible = "google,cros-kbd-led-backlight";
-- 
2.43.0.472.g3155946c3a-goog


